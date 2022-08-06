return Def.ActorFrame {
	Def.ActorFrame{
		InitCommand=function(s) s:x(_screen.cx):y(-7) end,
		OnCommand=function(s) s:linear(0.25):y(15) end,
		OffCommand=function(s) s:linear(0.25):y(-7) end,
		LoadActor(THEME:GetPathG("ScreenWithMenuElements","header/"..GetCurrentModel().."/base"))..{
			InitCommand=function(s) s:zoom(0.667):y(2) end,
		};
		LoadActor(THEME:GetPathG("ScreenWithMenuElements","header/"..GetCurrentModel().."/OPTIONS"))..{
			InitCommand=function(s) s:setsize(340,27):y(-0.5) end,
		};
	};
	LoadActor(THEME:GetPathB("ScreenOptionsServiceChild","underlay/"..Model().."Back")) .. {
		InitCommand=function(s) 
			if IsOptionService() then
				s:xy(_screen.cx+10,_screen.cy-24):setsize(500,400)
			else
				s:xy(_screen.cx,_screen.cy-9):setsize(720,430)
			end
		end,
		OnCommand=function(s) s:zoomx(0):linear(0.25):zoomx(1) end,
		OffCommand=function(s) s:sleep(0.3):linear(0.25):zoomx(0) end,
	};
	LoadActor(THEME:GetPathG("","ScreenSelectProfile/"..Model().."bottom")) .. {
		InitCommand=function(s) s:x(_screen.cx):setsize(400,59)
			if IsOptionService() then
				s:y(SCREEN_BOTTOM-86)
			else
				s:y(SCREEN_BOTTOM-60) 
			end
		end,
		OnCommand=function(s) s:zoomx(0):linear(0.25):zoomx(1) end,
		OffCommand=function(s) s:sleep(0.3):linear(0.25):zoomx(0) end,
	};
};







