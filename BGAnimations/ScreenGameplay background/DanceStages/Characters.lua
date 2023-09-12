-- Original Author:Jose_Varela
-- Editor:Enciso0720
-- Last Update:20230813
local DanceStage = DanceStageLoader()

------- CHARACTER BPM SYNC -------

local function CharaAnimRate(self)
	local SPos = GAMESTATE:GetSongPosition()
	local mRate = GAMESTATE:GetSongOptionsObject("ModsLevel_Current"):MusicRate()
	local bpm = round(GAMESTATE:GetSongBPS() * 60 * mRate, 3)
	local spdRate = 1

	if GetUserPref("CharacterSync") == "BPM Sync" then
		if bpm <= 130 then
			spdRate = (0.004*bpm)+0.4
		elseif bpm >= 250 then
			spdRate = ((1/750)*bpm)+(2/3)
		elseif bpm >= 400 then
			spdRate = 1.2
		end
	end

	if _VERSION ~= 5.3 and HasVideo() and VideoStage() then
		if not SPos:GetFreeze() and not SPos:GetDelay() then
			spdRate = spdRate
		else
			spdRate = 0.1
		end
	end
		
	self:SetUpdateRate(spdRate)
end

local t = Def.ActorFrame{};

------- DEMONSTRATION CHARACTERS -------

if GAMESTATE:IsDemonstration() then
	for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
		local CharaRandom = GetAllCharacterNames()
			table.remove(CharaRandom,IndexKey(CharaRandom,"Random"))
			table.remove(CharaRandom,IndexKey(CharaRandom,"None"))
		if GetUserPref("SelectCharacter"..pn) == "Random" then
			WritePrefToFile("CharaRandom"..pn,CharaRandom[math.random(#CharaRandom)]);
		end
		GAMESTATE:SetCharacter(pn,CharaRandom[math.random(#CharaRandom)])
	end
end

------- CHARACTER ORDER -------

Listed = {
	GetCharacter(PLAYER_1),
	GetCharacter(PLAYER_2),
	GetUserPref("Mate1"),
	GetUserPref("Mate2"),
	GetUserPref("Mate3"),
}

	if (GAMESTATE:IsPlayerEnabled(PLAYER_1)) and (not BothPlayersEnabled()) then
		table.remove(Listed,2)
	elseif (GAMESTATE:IsPlayerEnabled(PLAYER_2)) and (not BothPlayersEnabled()) then
		table.remove(Listed,1)
	end
	
	for i=1,#Listed do
		for i=1,#Listed do
			if Listed[i] == "None" then
				table.remove(Listed,IndexKey(Listed,"None"))
			end
			if Listed[i] == "Random" then
				local CharaRandom = GetAllCharacterNames()
				table.remove(CharaRandom,IndexKey(CharaRandom,"Random"))
				table.remove(CharaRandom,IndexKey(CharaRandom,"None"))
				Listed[i]=CharaRandom[math.random(#CharaRandom)]
			end
		end
	end

------- GENDER AND SIZE CHECK -------

function CharacterInfoo(Chara,Read)
	local CharaCfg = "/Characters/"..Chara.."/character.ini";
	local Info = Config.Load(Read,CharaCfg)
	return Info
end

function NewChara(Chara)
	if CharacterInfoo("Size",Chara) ~= nil then
		return true
	else
		return false
	end
end

local Size = {}
Gender = {}

for i=1,#Listed do
	Gender[i]=CharacterInfoo(Listed[i],"Genre")
	Size[i]=CharacterInfoo(Listed[i],"Size")
end

if #Listed > 0 then

	------- DANCEROUTINES-------

	t[#t+1] = LoadActor("/Characters/DanceRepo/DRoutines.lua")

	------- CHARACTER POSITION -------

	if #Listed == 1 then
		PositionX={0}
		PositionZ={0}
	elseif #Listed == 2 then
		PositionX={7,-7}
		PositionZ={0,0}
	elseif #Listed == 3 and BothPlayersEnabled() then
		PositionX={10,-10,0}
		PositionZ={-2,-2,6}
	elseif #Listed == 3 and not BothPlayersEnabled() then
		PositionX={0,10,-10}
		PositionZ={-2,6,6}
	elseif #Listed == 4 then
		PositionX={7,-7,15,-15}
		PositionZ={-2,-2,9,9}
	elseif #Listed == 5 then
		PositionX={8,-8,17,0,-17}
		PositionZ={-2,-2,9,9,9}
	end

	------- ... JUST BECAUSE XD -------

	function GetMotionLength()
		local index = IndexKey(MotionsLenght, Motion)
		local success, result = pcall(function() return MotionsLenght[index + 1] end)
		if success then
			return result
		else
			return 0
		end
	end

	local SongLength = GAMESTATE:GetCurrentSong():MusicLengthSeconds()
	local MotionLength = GetMotionLength()
	if MotionLength ~= nil and (MotionLength-2) > SongLength then
		Delta = MotionLength - SongLength
		Position=(math.random(0,Delta))
	else
		Position = 0
	end
	
	------- MODEL LOAD -------

	for i=1,#Listed do
		if tonumber(CharacterInfoo(Listed[i],"Size")) <= 0.5 then
			ShadowModel = "Model_Small.txt"
		elseif tonumber(CharacterInfoo(Listed[i],"Size")) == 0 then
			ShadowModel = "None.txt"
		else
			ShadowModel = "Model.txt"
		end
	------- NORMAL -------

		t[#t+1] =	Def.ActorFrame {
			OnCommand = function(s) s:queuecommand('Animate') end,
			AnimateCommand = function(s) s:SetUpdateFunction(CharaAnimRate) end,
			Def.Model {
				Meshes="/Characters/"..Listed[i].."/model.txt",
				Materials="/Characters/"..Listed[i].."/model.txt",
				Bones="/Characters/DanceRepo/"..Gender[i].."/"..Gender[i].." "..Motion..".txt",
					OnCommand=function(s) s:cullmode("CullMode_None")
						s:zoom(Size[i]):x(PositionX[i]):z(PositionZ[i]):position(Position)
					end,
			};
		};
	------- SHADOW -------
		t[#t+1] = Def.ActorFrame {
			Condition=GetUserPref("CharaShadow") == "ON",
			OnCommand=function(s) s:queuecommand('Animate') end,
			AnimateCommand=function(s) s:SetUpdateFunction(CharaAnimRate) end,
			Def.Model{
				Meshes="/Characters/DanceRepo/Shadow/"..ShadowModel,
				Materials="/Characters/DanceRepo/Shadow/Model.txt",
				Bones="/Characters/DanceRepo/Shadow/Dance/"..Gender[i].." "..Motion..".txt",
				OnCommand=function(s)
					s:cullmode("CullMode_None")
					s:zoom(Size[i]):x(PositionX[i]):z(PositionZ[i]):position(Position)
				end,
			};
		};
	end
end

return t;