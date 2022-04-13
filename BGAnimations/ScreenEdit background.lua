local SBG = GAMESTATE:GetSongOptionsObject("ModsLevel_Preferred")
PREFSMAN:SetPreference('SongBackgrounds', true)
SBG:RandomBGOnly(false)

return Def.ActorFrame{	
	Def.Sprite {
		OnCommand=function(s)
			if GAMESTATE:GetCurrentSong() then	
				if GAMESTATE:GetCurrentSong():HasBackground() then
					s:LoadFromSongBackground(GAMESTATE:GetCurrentSong())
				else
					s:Load(THEME:GetPathG("Common", "fallback background"))
				end;
			end;
		s:Center()
		s:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
		end,
	};
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffuse(color("0,0,0,0.5")) end,
	};
};