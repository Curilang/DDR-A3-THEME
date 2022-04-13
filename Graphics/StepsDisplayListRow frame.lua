return Def.ActorFrame{
	LoadActor("_blank")..{
		InitCommand=cmd();	
	};
};

