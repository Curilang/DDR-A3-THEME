------- DANCESTAGE SELECTION -------

local DanceStagesDir = GetAllDanceStagesNames()
table.remove(DanceStagesDir,IndexKey(DanceStagesDir,"DEFAULT"))
table.remove(DanceStagesDir,IndexKey(DanceStagesDir,"RANDOM"))
local DanceStageSelected = GetUserPref("SelectDanceStage")

if not GAMESTATE:IsDemonstration() then
	if DanceStageSelected == "DEFAULT" then
		DanceStage = DanceStageSong()
	elseif DanceStageSelected == "RANDOM" then
		DanceStage = DanceStagesDir[math.random(#DanceStagesDir)]
	else
		DanceStage = GetUserPref("SelectDanceStage")
	end;
else
	DanceStage = DanceStageSong()
end

------- VIDEO/BACKGROUND VS STAGE  -------

local SBG = GAMESTATE:GetSongOptionsObject("ModsLevel_Preferred")
if VideoStage() then
  PREFSMAN:SetPreference('SongBackgrounds', false)
else
	PREFSMAN:SetPreference('SongBackgrounds', true)
end
SBG:RandomBGOnly(false)


------- RANDOM CHARACTER -------

local CharaRandom = GetAllCharacterNames()
table.remove(CharaRandom,IndexKey(CharaRandom,"Random"))
table.remove(CharaRandom,IndexKey(CharaRandom,"None"))

for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
    if GetUserPref("SelectCharacter"..pn) == "Random" then
        WritePrefToFile("CharaRandom"..pn,CharaRandom[math.random(#CharaRandom)]);
    end
end