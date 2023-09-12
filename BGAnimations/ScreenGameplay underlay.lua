local SBG = GAMESTATE:GetSongOptionsObject("ModsLevel_Preferred")

if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
	
	if (not HasVideo() and PotentialModSong()) then
	--SBG:StaticBackground(false)
	PREFSMAN:SetPreference('SongBackgrounds', true)
	elseif (HasVideo() and not VideoStage() and VoverS()) then
	--SBG:StaticBackground(false)
	PREFSMAN:SetPreference('SongBackgrounds', true)
	elseif (HasVideo() and not VideoStage() and not VoverS()) then
	--SBG:StaticBackground(true)
	PREFSMAN:SetPreference('SongBackgrounds', false)
	else
	--SBG:StaticBackground(true)
	PREFSMAN:SetPreference('SongBackgrounds', false)
	end
else
	PREFSMAN:SetPreference('SongBackgrounds', true)
end
SBG:RandomBGOnly(false)

return Def.ActorFrame {};