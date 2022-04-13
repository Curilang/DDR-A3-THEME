return Def.ActorFrame {
	OnCommand=cmd(sleep,0);
	Def.Quad {
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("0,0,0,0");sleep,0;linear,0.9;diffusealpha,0);
	};
	LoadActor("../_swoosh_out")..{
		OffCommand=cmd(play);
	};
};