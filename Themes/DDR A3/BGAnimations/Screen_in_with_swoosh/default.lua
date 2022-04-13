local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenInDelay");
return Def.ActorFrame {
	OnCommand=cmd(sleep,0.15+fSleepTime);
	Def.Quad {
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("0,0,0,1");sleep,fSleepTime;linear,0.15;diffusealpha,0);

	};
	LoadActor("../_swoosh_in")..{
		OnCommand=cmd(play);
	};
};