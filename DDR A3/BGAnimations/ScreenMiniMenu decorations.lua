return Def.ActorFrame {
	Def.Quad{
		InitCommand=function(s) s:Center():zoomto(SCREEN_WIDTH+1000,SCREEN_HEIGHT+1000):diffuse(color("0,0,0,0.8")) end,
	};
};