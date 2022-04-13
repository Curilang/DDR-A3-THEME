local t = Def.ActorFrame{};

Character_1 = GAMESTATE:GetCharacter(PLAYER_1):GetDisplayName()
Character_2 = GAMESTATE:GetCharacter(PLAYER_2):GetDisplayName()



function CharacterInfo(Read,pn)
	local CharaCfg = GAMESTATE:GetCharacter(pn):GetCharacterDir().."CharacterInfo.cfg";
	local Info = Config.Load(Read,CharaCfg)
	return Info
end

	
function CharaCfg(player)
	if FILEMAN:DoesFileExist(GAMESTATE:GetCharacter(player):GetCharacterDir().."CharacterInfo.cfg") then
		return true
	else
		return false
	end
end


------- CHARACTER SIZE & GENRE-------


if CharaCfg(PLAYER_1) then
	CharacterSize1=tonumber(CharacterInfo("Size",PLAYER_1))
	Char1_Gen=CharacterInfo("Genre",PLAYER_1)
else
	CharacterSize1=0.81
end

	
if CharaCfg(PLAYER_2) then
	CharacterSize2=tonumber(CharacterInfo("Size",PLAYER_2))
	Char2_Gen=CharacterInfo("Genre",PLAYER_2)
else
	CharacterSize2=0.81
end

------- DANCEROUTINE LOADER -------

t[#t+1] = LoadActor("/Characters/DanceRepo/DanceRoutines.lua")

------- CHARACTER LOAD -------	

if AnyoneHasChar() then
	for player in ivalues(PlayerNumber) do
		if CharaCfg(PLAYER_1) and CharaCfg(PLAYER_2) 
		then
			BonesToLoad1=GAMESTATE:GetCharacter(player):GetCharacterDir().."Dance/"..Char1_Gen.." "..Choreo..".redir"
			BonesToLoad2=GAMESTATE:GetCharacter(player):GetCharacterDir().."Dance/"..Char2_Gen.." "..Choreo..".redir"
		else
			BonesToLoad1=GAMESTATE:GetCharacter(player):GetDanceAnimationPath()
			BonesToLoad2=GAMESTATE:GetCharacter(player):GetDanceAnimationPath()
		end
		
		------- MODEL LOAD -------

		if GAMESTATE:IsPlayerEnabled(player) and GAMESTATE:GetCharacter(player):GetDisplayName() ~= "default" then
			t[#t+1] = Def.Model {
				Meshes=GAMESTATE:GetCharacter(player):GetModelPath(),
				Materials=GAMESTATE:GetCharacter(player):GetModelPath(),
				Bones=(player == PLAYER_1 and BonesToLoad1) or BonesToLoad2,
					OnCommand=function(self)
						self:cullmode("CullMode_None")
						if BothPlayersEnabled() then 
							self:x( (player == PLAYER_1 and 7) or -7 )
							:zoom( (player == PLAYER_1 and CharacterSize1) or CharacterSize2)
							:queuecommand("UpdateRate")
						else
							self:x(0):zoom( (player == PLAYER_1 and CharacterSize1) or CharacterSize2)
							self:queuecommand("UpdateRate")
						end
					end,
			};
		end
	end
end


return t;