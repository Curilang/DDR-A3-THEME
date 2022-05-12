--Thank you for using this project.
--Please consider all the effort that has been made, so remember to play fair.
--Enjoy! See you later alligator.
--Author: Enciso0720
--Last Update: 20220126

------- CHARACTER BPM SYNC -------

local function CharaAnimRate(self)
	local SPos = GAMESTATE:GetSongPosition()
	local mRate = GAMESTATE:GetSongOptionsObject("ModsLevel_Current"):MusicRate()
	local bpm = round(GAMESTATE:GetSongBPS() * 60 * mRate, 3)
	local spdRate = 1
	
	if bpm <= 130 and GetUserPref("CharacterSync") == "BPM Sync" then
		spdRate = (0.00388*bpm)+0.400
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

------- READ SELECTED CHARACTER -------
local CharaRandom = GetAllCharacterNames()
table.remove(CharaRandom,IndexKey(CharaRandom,"Random"))
table.remove(CharaRandom,IndexKey(CharaRandom,"None"))

for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
    if GetUserPref("SelectCharacter"..pn) == "Random" then
        WritePrefToFile("CharaRandom"..pn,CharaRandom[math.random(#CharaRandom)]);
    end
end


for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
	if not GAMESTATE:IsDemonstration() then
		if GetUserPref("SelectCharacter"..pn) == "Random" then
			GAMESTATE:SetCharacter(pn,GetUserPref("CharaRandom"..pn))
		else
			GAMESTATE:SetCharacter(pn,GetUserPref("SelectCharacter"..pn))
		end
	else
		local DemoChara = GetAllCharacterNames()
		table.remove(DemoChara,IndexKey(DemoChara,"Random"))
		table.remove(DemoChara,IndexKey(DemoChara,"None"))
		GAMESTATE:SetCharacter(pn,DemoChara[math.random(#DemoChara)])
	end
end

------- CHARACTER ORDER -------

Listed = {
	GAMESTATE:GetCharacter(PLAYER_1):GetDisplayName(),
	GAMESTATE:GetCharacter(PLAYER_2):GetDisplayName(),
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

Gender = {}
Size = {}

for i=1,#Listed do
	Gender[i]=CharacterInfoo(Listed[i],"Genre")
	Size[i]=CharacterInfoo(Listed[i],"Size")
end

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

local SongLength = GAMESTATE:GetCurrentSong():MusicLengthSeconds()
local MotionLength = MotionsLenght[IndexKey(MotionsLenght,Motion)+1]
if MotionLength ~= nil and (MotionLength-2) > SongLength then
	Delta = MotionLength - SongLength
	Position=(math.random(0,Delta)/math.random(1,3))
else
	Position = 0
end

------- MODEL LOAD -------

for i=1,#Listed do

	if tonumber(CharacterInfoo(Listed[i],"Size")) <= 0.5 then
		ShadowModel = "Model_Small.txt"
	else
		ShadowModel = "Model.txt"
	end

	t[#t + 1] =	Def.ActorFrame {
		OnCommand = function(self)
			self:queuecommand('Animate')
		end,
		AnimateCommand = function(self)
			self:SetUpdateFunction(CharaAnimRate)
		end,
		Def.Model {
			Meshes="/Characters/"..Listed[i].."/model.txt",
			Materials="/Characters/"..Listed[i].."/model.txt",
			Bones="/Characters/DanceRepo/"..Gender[i].." "..Motion..".txt",
				OnCommand=function(self)
					self:cullmode("CullMode_None")
						:zoom(Size[i])
						:x(PositionX[i]):z(PositionZ[i])
						:position(Position)
				end,
		};
		Def.Model {
			Meshes="/Characters/DanceRepo/Shadow/"..ShadowModel,
			Materials="/Characters/DanceRepo/Shadow/Model.txt",
			Bones="/Characters/DanceRepo/Shadow/Dance/"..Gender[i].." "..Motion..".txt",
				OnCommand=function(self)
					self:cullmode("CullMode_None")
						:zoom(Size[i])
						:x(PositionX[i]):z(PositionZ[i])
						:position(Position)
				end,
		};
	}

end

return t;