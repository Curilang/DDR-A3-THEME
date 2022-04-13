local SBG = GAMESTATE:GetSongOptionsObject("ModsLevel_Preferred")
PREFSMAN:SetPreference('SongBackgrounds', true)
SBG:RandomBGOnly(false)

return Def.ActorFrame{};