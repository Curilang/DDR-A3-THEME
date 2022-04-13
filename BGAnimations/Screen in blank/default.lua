local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenInDelay");
return Def.ActorFrame {
	OnCommand=cmd(sleep,fSleepTime);
};