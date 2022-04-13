local out = 230

return Def.ActorFrame {
	
	Def.ActorFrame{
		InitCommand=function(s) s:x(_screen.cx):y(SCREEN_TOP-30) end,
		OnCommand=function(s) s:linear(0.3):y(SCREEN_TOP+15):sleep(44):linear(0.3):y(SCREEN_TOP-30) end,
		LoadActor(THEME:GetPathG("ScreenWithMenuElements","header/"..GetCurrentModel().."/base"))..{
			InitCommand=function(s) s:zoom(0.445) end,
		};
		LoadActor(THEME:GetPathG("ScreenWithMenuElements","header/"..GetCurrentModel().."/DEMONSTRATION"))..{
			InitCommand=function(s) s:setsize(340,27) end,
		};
	};
	LoadActor(Model().."base")..{
		InitCommand=function(s) s:xy(_screen.cx+254,_screen.cy+123+out):zoom(0.335) end,
		OnCommand=function(s) s:linear(0.3):y(_screen.cy+10):sleep(44):linear(0.3):y(_screen.cy+123+out) end,
	};
	Def.Sprite {
		InitCommand=function(s) s:x(_screen.cx+254):y(_screen.cy+110+out) end,
		OnCommand=function(s) s:linear(0.3):y(_screen.cy-11):sleep(44):linear(0.3):y(_screen.cy+110+out)
		local song = GAMESTATE:GetCurrentSong()
			if song then
				s:Load(GetJacketPath(song))
			end
			s:setsize(205,205)
		end,
	};
	LoadFont("_arial black 28px") .. {
		InitCommand=function(s) s:zoom(0.7):maxwidth(280):x(_screen.cx+253.5):y(_screen.cy+227+out) end,
		OnCommand=function(s) s:linear(0.3):y(_screen.cy+114):sleep(44):linear(0.3):y(_screen.cy+227+out) end,
		CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
		RefreshCommand=function(s)
		local song = GAMESTATE:GetCurrentSong()
			s:settext(GetSongName(song))
		end;
	};
	LoadFont("_arial black 28px") .. {
		InitCommand=function(s) s:zoom(0.5):maxwidth(290):x(_screen.cx+253.5):y(_screen.cy+243+out) end,
		OnCommand=function(s) s:linear(0.3):y(_screen.cy+132):sleep(44):linear(0.3):y(_screen.cy+243+out) end,
		CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
		RefreshCommand=function(s)
		local song = GAMESTATE:GetCurrentSong()
			s:settext(GetArtistName(song))
		end;
	};
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffusealpha(1) end,
		OnCommand=function(s) s:linear(0.5):diffusealpha(0):sleep(44):linear(0.5):diffusealpha(1) end,
	};
	LoadActor(THEME:GetPathB("","_Arcade Decorations"));
};