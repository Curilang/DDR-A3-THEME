return Def.ActorFrame{	
	LoadActor(Model().."logo")..{
		InitCommand=function(s) s:x(_screen.cx):y(_screen.cy-14):zoom(0.667) end,
	};
};