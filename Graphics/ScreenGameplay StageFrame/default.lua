return Def.ActorFrame {
	LoadActor(Model().."frame")..{
		InitCommand=function(s) s:x(SCREEN_CENTER_X):y(SCREEN_TOP+30):zoom(0.33) end,
	};
};