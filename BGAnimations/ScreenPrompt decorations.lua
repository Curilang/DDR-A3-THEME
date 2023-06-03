return Def.ActorFrame {
	Def.Quad{
		InitCommand=function(s) s:Center():zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):diffuse(color("0,0,0,0.8")) end,
	};
};