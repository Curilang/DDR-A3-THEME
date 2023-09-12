return Def.ActorFrame {	
	Def.ActorFrame{
		InitCommand=function(s) s:x(_screen.cx):y(SCREEN_TOP-30) end,
		OnCommand=function(s) s:linear(0.3):y(SCREEN_TOP+15):sleep(44):linear(0.3):y(SCREEN_TOP-30) end,
		LoadActor(THEME:GetPathG("ScreenWithMenuElements","header/"..Model().."base"))..{
			InitCommand=function(s) s:zoom(0.667):y(2) end,
		};
		LoadActor(THEME:GetPathG("ScreenWithMenuElements","header/"..Model().."DEMONSTRATION"))..{
			InitCommand=function(s) s:setsize(340,27) end,
		};
	};
	Def.ActorFrame{
		InitCommand=function(s) s:y(_screen.cy+125):linear(0.34):y(0):sleep(44):linear(0.34):y(_screen.cy+125) end,
		LoadActor(Model().."demo")..{
			InitCommand=function(s) s:xy(_screen.cx+254,_screen.cy+9):zoom(0.68) end,
		};
		Def.Sprite{
			InitCommand=function(s) 
				s:x(_screen.cx+254):y(_screen.cy-11)
				s:Load(GetJacketPath(GAMESTATE:GetCurrentSong())):setsize(205,205)
			end,
		};
		LoadFont("SongNames") .. {
			InitCommand=function(s) 
				s:zoom(0.7):maxwidth(280):x(_screen.cx+253.5):y(_screen.cy+114)
				s:settext(GetSongName(GAMESTATE:GetCurrentSong()))
			end,
		};
		LoadFont("SongNames") .. {
			InitCommand=function(s) 
				s:zoom(0.5):maxwidth(420):x(_screen.cx+253.5):y(_screen.cy+131)
				s:settext(GetArtistName(GAMESTATE:GetCurrentSong()))
			end,
		};
	};
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffusealpha(1) end,
		OnCommand=function(s) s:linear(0.5):diffusealpha(0):sleep(44):linear(0.5):diffusealpha(1) end,
	};
	LoadActor(THEME:GetPathG("","ArcadeDecorations"));
};