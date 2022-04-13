local t = Def.ActorFrame{
	StartTransitioningCommand=function(s) s:sleep(2) end,
};

return t;
