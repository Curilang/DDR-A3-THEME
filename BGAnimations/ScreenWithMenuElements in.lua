local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenInDelay");

local t = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	OnCommand=cmd(sleep,fSleepTime);
};

t[#t+1] = Def.Quad {
	InitCommand=cmd(zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT);
	OnCommand=cmd(diffuse,color("0,0,0,1");sleep,0.0325 + fSleepTime;linear,0.15;diffusealpha,0);
};

return t