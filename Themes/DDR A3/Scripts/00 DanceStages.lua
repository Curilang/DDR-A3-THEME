--Thank you for using this project.
--Please consider all the effort that has been made, so remember to play fair.
--Enjoy! See you later alligator.
--Author: Enciso0720
--Last Update: 20220126

function HasAnyCharacters(pn)
	return GAMESTATE:IsPlayerEnabled(pn) and GAMESTATE:GetCharacter(pn):GetDisplayName() ~= "default"
end

function AnyoneHasChar()
	return (HasAnyCharacters(PLAYER_1) or HasAnyCharacters(PLAYER_2))
end

function BothPlayersEnabled()
	return GAMESTATE:IsPlayerEnabled(PLAYER_1) and GAMESTATE:IsPlayerEnabled(PLAYER_2)
end

function DancerMateEnabled()
	if GAMESTATE:IsPlayerEnabled(PLAYER_1) and GetUserPref("DancerMate") ~= "None" then
		return true
	else
		return false
	end
end

function gFOV()
	if THEME:GetMetric("Common", "ScreenHeight") >= 480 then
		return 88.8
	elseif THEME:GetMetric("Common", "ScreenHeight") >= 720 then
		return 90
	elseif THEME:GetMetric("Common", "ScreenHeight") >= 1080 then
		return 91.3
	end
end

function ResetCamera()
    return Camera:fov(gFOV()):rotationy(180):rotationx(0):rotationz(0):Center():z(WideScale(300,400)):addy(10):stopeffect()
end

DEDICHAR = {};

function DEDICHAR:SetTimingData()
	setenv("song", 	GAMESTATE:GetCurrentSong() )
	setenv("start", getenv("song"):GetFirstBeat() )
	setenv("now",	GAMESTATE:GetSongBeat() )
end

Config = {};

function Config.Load(key,file)
	if not FILEMAN:DoesFileExist(file) then return false end
	
	local Container = {}

	local configfile = RageFileUtil.CreateRageFile()
	configfile:Open(file, 1)
	
	local configcontent = configfile:Read()
	
	configfile:Close()
	configfile:destroy()
	
	for line in string.gmatch(configcontent.."\n", "(.-)\n") do
		for KeyVal, Val in string.gmatch(line, "(.-)=(.+)") do
			if key == KeyVal then return Val end
		end		
	end
end


function SlowMotion(self)
	local SPos = GAMESTATE:GetSongPosition()
	
	if not SPos:GetFreeze() and not SPos:GetDelay() then
		self:SetUpdateRate(1)
	else
		self:SetUpdateRate(0.1)
	end
end

function setenv(name,value) GAMESTATE:Env()[name] = value end
function getenv(name) return GAMESTATE:Env()[name] end

function HasVideo()
	VideoFileType = {"mp4","avi","mov","m2ts","m2v","wmv","mpg","mpeg"}
	Z=0
	for i=1,#VideoFileType do
		if FILEMAN:DoesFileExist(GAMESTATE:GetCurrentSong():GetMusicPath():sub(1, -4)..VideoFileType[i]) then
			Z=Z+1
		end
	end
	if Z > 0 then
		return true
	else
		return false
	end
end

function PotentialModSong()
	local folder = FILEMAN:GetDirListing(GAMESTATE:GetCurrentSong():GetSongDir(),false,false)
	local bgchanges = GAMESTATE:GetCurrentSong():GetBGChanges()
	local attacks = GAMESTATE:GetCurrentSong():HasAttacks()

	for i=1,#folder do
		if string.match(folder[i],"lua") or (#bgchanges>2) or attacks then
			return true
		end
	end
	return false
end

function VideoStage ()
	if string.match(DanceStage, "MOVIE") or 
	string.match(DanceStage, "REPLICANT") or 
	string.match(DanceStage, "CAPTURE ME")
	then
		return true
	end
	return false
end

------------------------


function IndexKey(tab,el)
	for index, value in pairs(tab) do
	    if value == el then
	        return index
	    end
	end
end

function Contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

function SortList(list1,list2,value)
    for index, x in pairs(list1) do
        if string.match(x,value) then
            table.insert(list2,list1[index])
        end
    end
end

function ReFillList(list1,list2)
    for index, x in pairs(list1) do
        if not Contains(list2,list1[index]) then
            table.insert(list2,#list2+1,list1[index])
        end
    end
end

function GetAllCharacterNames()
    local chars = {}
    local _chars = FILEMAN:GetDirListing("/Characters/", true, false)
    SortList(_chars,chars,"%(A%)")
    SortList(_chars,chars,"%(X2%)")
    SortList(_chars,chars,"%(X%)")
    SortList(_chars,chars,"%(SN2%)")
    SortList(_chars,chars,"%(SN%)")
    SortList(_chars,chars,"%[PiX%]")
    SortList(_chars,chars,"%[JB%]")
    SortList(_chars,chars,"%[DW%]")
	SortList(_chars,chars,"%[DDRII%]")
    SortList(_chars,chars,"%[HP4%]")
    SortList(_chars,chars,"%[HP3%]")
    SortList(_chars,chars,"%[HP2%]")
    SortList(_chars,chars,"%[HP1%]")
    SortList(_chars,chars,"%(5th%)")
    SortList(_chars,chars,"%(4th%)")
    SortList(_chars,chars,"%(3rd%)")
    SortList(_chars,chars,"%(2nd%)")
    SortList(_chars,chars,"%(1st%)")
    ReFillList(_chars,chars)
    table.remove(chars,IndexKey(chars,"DanceRepo"))
    table.remove(chars,IndexKey(chars,"default"))
    table.insert(chars,1,"Random")
    return chars
end

function SelectCharacter()
	local choiceList = GetAllCharacterNames()
	local t = {
		Name = "Characters";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = false;
		ExportOnChange = false;
		Choices = choiceList;

		LoadSelections = 
		function(self, list, pn)
			if GetUserPref("SelectCharacter"..pn) == nil or tonumber(GetUserPref("SelectCharacter"..pn)) then
				SetUserPref("SelectCharacter"..pn,"Random")
			end
			local Load=GetUserPref("SelectCharacter"..pn)
			list[IndexKey(choiceList,Load)]=true
		end;

		SaveSelections = 
		function(self, list, pn)
			for number=0,999 do
				if list[number] then
					WritePrefToFile("SelectCharacter"..pn,choiceList[number]);
					break;
				end;
			end;
		end;
	};        
setmetatable( t, t );
return t;
end;

function ResolveCharacterName(pn)
    local name = GetUserPref("SelectCharacter"..pn)
    return name
end

function RandomCharacter(pn)
    if ResolveCharacterName(pn) == "Random" then
        ChoiceList = GetAllCharacterNames()
        table.remove(ChoiceList,IndexKey(ChoiceList,"default"))
        table.remove(ChoiceList,IndexKey(ChoiceList,"None"))
        setenv("ChoiceRandom"..pn,ChoiceList[math.random(#ChoiceList)])
    end
end

function WhichRead(pn)
	if GetUserPref("SelectCharacter"..pn) == "Random" then
		return GetUserPref("CharaRandom"..pn)
	else
		return GetUserPref("SelectCharacter"..pn)
	end
end

function GetAllDanceStagesNames()
    local DanceStagesList = {}
    local _DanceStagesList = FILEMAN:GetDirListing("/DanceStages/", true, false)
    table.remove(_DanceStagesList,IndexKey(_DanceStagesList,"StageMovies"))
    SortList(_DanceStagesList,DanceStagesList,"%(A%)")
    SortList(_DanceStagesList,DanceStagesList,"%(X2%)")
    SortList(_DanceStagesList,DanceStagesList,"%(X%)")
    SortList(_DanceStagesList,DanceStagesList,"%(REPLICANT%)")
    SortList(_DanceStagesList,DanceStagesList,"%(2014%)")
    SortList(_DanceStagesList,DanceStagesList,"%(SN%)")
    SortList(_DanceStagesList,DanceStagesList,"%(DDRII%)")
    SortList(_DanceStagesList,DanceStagesList,"%(HP%)")
    table.insert(DanceStagesList,1,"DEFAULT")
    table.insert(DanceStagesList,2,"RANDOM")
    return DanceStagesList
end

function SelectDanceStage()
        local choiceListDS = GetAllDanceStagesNames()
        local t = {
            Name = "DanceStage";
            LayoutType = "ShowAllInRow";
            SelectType = "SelectOne";
            OneChoiceForAllPlayers = true;
            ExportOnChange = false;
            Choices = choiceListDS;

            LoadSelections = 
            function(self, list, pn)
				local DScfg = GetUserPref("SelectDanceStage") 
                if DScfg == nil or tonumber(DScfg) then
                    SetUserPref("SelectDanceStage","DEFAULT")
                end
                local DSLoad=GetUserPref("SelectDanceStage")
                list[IndexKey(choiceListDS,DSLoad)]=true
            end;
    
            SaveSelections = 
            function(self, list, pn)
                for number=0,999 do
                    if list[number] then WritePrefToFile("SelectDanceStage",choiceListDS[number]);
                    end;
                end;
            end;
        };        
    setmetatable( t, t );
    return t;
end;


function BoomSync()
	local t = {
		Name = "BoomSync";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {"Normal", "BPM Sync" };
		LoadSelections = 
		function(self, list, pn)
			if ReadPrefFromFile("BoomSync") ~= nil then
				if GetUserPref("BoomSync")=='Normal' then
					list[1] = true
				elseif GetUserPref("BoomSync")=='BPM Sync' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("BoomSync",'Normal');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("BoomSync",'Normal');
			elseif list[2] then
				WritePrefToFile("BoomSync",'BPM Sync');
			else
				WritePrefToFile("BoomSync",'Normal');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end


function CharacterSync()
	local t = {
		Name = "CharacterSync";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {"Normal", "BPM Sync" };
		LoadSelections = 
		function(self, list, pn)
			if ReadPrefFromFile("CharacterSync") ~= nil then
				if GetUserPref("CharacterSync")=='Normal' then
					list[1] = true
				elseif GetUserPref("CharacterSync")=='BPM Sync' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("CharacterSync",'Normal');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("CharacterSync",'Normal');
			elseif list[2] then
				WritePrefToFile("CharacterSync",'BPM Sync');
			else
				WritePrefToFile("CharacterSync",'Normal');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end

function DiscoStars()
	local t = {
		Name = "DiscoStars";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {"Normal", "A few", "None"};
		LoadSelections = 
		function(self, list, pn)
			if ReadPrefFromFile("DiscoStars") ~= nil then
				if GetUserPref("DiscoStars")=='Normal' then
					list[1] = true
				elseif GetUserPref("DiscoStars")=='A few' then
					list[2] = true
				elseif GetUserPref("DiscoStars")=='None' then
					list[3] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("DiscoStars",'Normal');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("DiscoStars",'Normal');
			elseif list[2] then
				WritePrefToFile("DiscoStars",'A few');
			elseif list[3] then
				WritePrefToFile("DiscoStars",'None');
			else
				WritePrefToFile("DiscoStars",'Normal');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end

function RMStage()
	local t = {
		Name = "RMStage";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {"Random Movies", "Jacket" };
		LoadSelections = 
		function(self, list, pn)
			if ReadPrefFromFile("RMStage") ~= nil then
				if GetUserPref("RMStage")=='Random Movies' then
					list[1] = true
				elseif GetUserPref("RMStage")=='Jacket' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("RMStage",'Jacket');
				list[2] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("RMStage",'Random Movies');
			elseif list[2] then
				WritePrefToFile("RMStage",'Jacket');
			else
				WritePrefToFile("RMStage",'Random Movies');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end

--------------------

function Mate1()
	local choiceList = GetAllCharacterNames()
	local t = {
		Name = "Mate1";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = choiceList;

		LoadSelections = 
		function(self, list, pn)
			if GetUserPref("Mate1") == nil then
				SetUserPref("Mate1","None")
			end
			local DMLoad=GetUserPref("Mate1")
			list[IndexKey(choiceList,DMLoad)]=true
		end;

		SaveSelections = 
		function(self, list, pn)
			for number=0,999 do
				if list[number] then WritePrefToFile("Mate1",choiceList[number]);
				end;
			end;
		end;
	};        
setmetatable( t, t );
return t;
end;


function Mate2()
	local choiceList = GetAllCharacterNames()
	local t = {
		Name = "Mate2";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = choiceList;

		LoadSelections = 
		function(self, list, pn)
			if GetUserPref("Mate2") == nil then
				SetUserPref("Mate2","None")
			end
			local DMLoad=GetUserPref("Mate2")
			list[IndexKey(choiceList,DMLoad)]=true
		end;

		SaveSelections = 
		function(self, list, pn)
			for number=0,999 do
				if list[number] then WritePrefToFile("Mate2",choiceList[number]);
				end;
			end;
		end;
	};        
setmetatable( t, t );
return t;
end;

function Mate3()
	local choiceList = GetAllCharacterNames()
	local t = {
		Name = "Mate3";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = choiceList;

		LoadSelections = 
		function(self, list, pn)
			if GetUserPref("Mate3") == nil then
				SetUserPref("Mate3","None")
			end
			local DMLoad=GetUserPref("Mate3")
			list[IndexKey(choiceList,DMLoad)]=true
		end;

		SaveSelections = 
		function(self, list, pn)
			for number=0,999 do
				if list[number] then WritePrefToFile("Mate3",choiceList[number]);
				end;
			end;
		end;
	};        
setmetatable( t, t );
return t;
end;

function CharactersOption()
	if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
		return "lua,SelectCharacter()"
	elseif GetUserPref("OptionRowGameplayBackground")=='SNCharacters' then
		return "lua,OptionRowCharacters()"
	end
end

function SelectStage()
	return "lua,SelectDanceStage()"
end

function ThemeNumber()
	if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
		return "ST,SM,JA,SS,FS,CU,SA,GD,BM,SP,MD,GL,BS,CS,DS,RM,C1,C2,C3"
	else
		return "ST,SM,JA,SS,FS,CU,SA,GD,BM,SP,MD,GL" 
	end
end