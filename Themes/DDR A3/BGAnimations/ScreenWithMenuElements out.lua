local fTileSize = 32;
local iTilesX = math.ceil( SCREEN_WIDTH/fTileSize );
local iTilesY = math.ceil( SCREEN_HEIGHT/fTileSize );
local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenOutDelay");

local t = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	OnCommand=cmd(sleep,fSleepTime);
};

t[#t+1] = Def.Quad {
	InitCommand=cmd(zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT);
	OnCommand=cmd(diffuse,color("0,0,0,0");sleep,0.0325 + fSleepTime;linear,0.15;diffusealpha,1);
};

return t