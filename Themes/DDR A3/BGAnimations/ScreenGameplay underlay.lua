local SBG = GAMESTATE:GetSongOptionsObject("ModsLevel_Preferred")

if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
	if VideoStage() then
		PREFSMAN:SetPreference('SongBackgrounds', false)
	else
		PREFSMAN:SetPreference('SongBackgrounds', true)
	end
	SBG:RandomBGOnly(false)
else
	PREFSMAN:SetPreference('SongBackgrounds', true)
	SBG:RandomBGOnly(false)
end

return Def.ActorFrame {};