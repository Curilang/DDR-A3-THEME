return Def.ActorFrame{
	Def.ActorFrame{
	InitCommand=function(s) s:xy(_screen.cx+362,_screen.cy+20) end,
		LoadActor(THEME:GetPathG("","_shared/infomiddle"))..{
			InitCommand=function(s) s:diffusealpha(0):zoomy(0) end,
			GainFocusCommand=function(s) setenv("SelDoub",1) s:stoptweening():sleep(0.1):queuecommand("Anim") end,
			AnimCommand=function(s)
				s:smooth(0.2):zoomy(1.4):diffusealpha(1)
				s:smooth(0.1):zoomy(1.1) 
			end,
			LoseFocusCommand=function(s) setenv("SelDoub",0) s:queuecommand("Off") end,
			OffCommand=function(s) s:stoptweening():smooth(0.2):zoomy(0):diffusealpha(0) end,
		};
		Def.ActorFrame{
			InitCommand=function(s) s:diffusealpha(0) end,
			GainFocusCommand=function(s) s:stoptweening():sleep(0.2):queuecommand("Anim") end,
			AnimCommand=function(s) s:smooth(0.2):diffusealpha(1) end,
			LoseFocusCommand=function(s) s:queuecommand("Off") end,
			OffCommand=function(s) s:stoptweening():smooth(0.07):diffusealpha(0) end,
			LoadActor(THEME:GetPathG("ScreenSelectStyle","Icon/Double/"..Language().."text"));
			LoadActor(THEME:GetPathG("ScreenSelectStyle","Icon/Double/"..Model().."pad"))..{
				InitCommand=function(s) s:xy(166,34) end,
			};
		};
		Def.ActorFrame{
			InitCommand=function(s) s:diffusealpha(0) end,
			GainFocusCommand=function(s) s:stoptweening():sleep(0.1):queuecommand("Anim") end,
			AnimCommand=function(s) s:y(0):smooth(0.2):y(-100):diffusealpha(1):smooth(0.1):y(-92) end, 
			LoseFocusCommand=function(s) s:queuecommand("Off") end,
			OffCommand=function(s) s:stoptweening():smooth(0.2):y(0):diffusealpha(0) end,
			LoadActor(THEME:GetPathG("","_shared/"..Model().."infotop"));
			LoadActor(Language().."title");
		};
		LoadActor(THEME:GetPathG("","_shared/"..Model().."infobottom"))..{
			InitCommand=function(s) s:diffusealpha(0) end,
			GainFocusCommand=function(s) s:stoptweening():sleep(0.1):queuecommand("Anim") end,
			AnimCommand=function(s) s:y(0):smooth(0.2):y(100):diffusealpha(1):smooth(0.1):y(88) end,
			LoseFocusCommand=function(s) s:queuecommand("Off") end,
			OffCommand=function(s) s:stoptweening():smooth(0.2):y(0):diffusealpha(0) end,
		};
	};
};