return Def.ActorFrame { 
	LoadActor("logo")..{
		InitCommand=function(s) s:x(_screen.cx-13):y(_screen.cy-22):zoom(0.667) end,
	};
};