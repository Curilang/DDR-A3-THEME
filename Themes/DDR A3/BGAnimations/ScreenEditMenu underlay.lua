return Def.ActorFrame {
	LoadActor(THEME:GetPathB("ScreenOptionsServiceChild","underlay/"..Model().."Back")) .. {
		InitCommand=function(s) s:xy(_screen.cx+10,_screen.cy-10):setsize(650,430) end,
		OnCommand=function(s) s:zoomx(0):linear(0.25):zoomx(1) end,
		OffCommand=function(s) s:sleep(0.3):linear(0.25):zoomx(0) end,
	};
	LoadActor(THEME:GetPathG("","ScreenSelectProfile/"..Model().."bottom")) .. {
		InitCommand=function(s) s:xy(_screen.cx,SCREEN_BOTTOM-60):setsize(400,55) end,
		OnCommand=function(s) s:zoomx(0):linear(0.25):zoomx(1) end,
		OffCommand=function(s) s:sleep(0.3):linear(0.25):zoomx(0) end,
	};
};
