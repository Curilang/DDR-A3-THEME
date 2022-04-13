return Def.ActorFrame {
 	LoadFont("_helvetica-bold 24px") .. {
		Name="TextTitle";
		InitCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				(cmd(y,0;zoom,0.575;maxwidth,256/0.775;diffuse,color("0.2,0.2,0.2,1");strokecolor,Color("White")))(self);
			else 
				(cmd(y,-16.5;zoom,0.575;maxwidth,256/0.775;diffuse,color("0.2,0.2,0.2,1");strokecolor,Color("White")))(self);
			end
		end;
		OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.2;diffusealpha,1);
		OffCommand=cmd(sleep,0.333;decelerate,0.066;diffusealpha,0);
-- 		TickCommand=cmd(finishtweening;diffusealpha,0;addx,-10;zoomx,1.25;zoomy,0;decelerate,0.25;diffusealpha,1;addx,10;zoom,1;sleep,0;glow,Color("White");decelerate,0.275;glow,Color("Invisible"));
	};
 	LoadFont("_helvetica-bold 24px") .. {
		Name="TextSubtitle";
		InitCommand=cmd(zoom,0.5;maxwidth,256/0.5;diffuse,color("0.2,0.2,0.2,1");strokecolor,Color("White"));
		OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.2;diffusealpha,1);
		OffCommand=cmd(sleep,0.333;decelerate,0.066;diffusealpha,0);
-- 		TickCommand=cmd(finishtweening;diffusealpha,0;addy,-10;addx,10;decelerate,0.25;diffusealpha,1;addy,10;addx,-10);
	};
	LoadFont("_helvetica-bold 24px") .. {
		Name="TextArtist";
		InitCommand=cmd(y,18;zoom,0.45;maxwidth,256/0.75;diffuse,color("0.2,0.2,0.2,1");strokecolor,Color("White"));
		OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.2;diffusealpha,1);
		OffCommand=cmd(sleep,0.333;decelerate,0.066;diffusealpha,0);
-- 		TickCommand=cmd(finishtweening;diffusealpha,0;addy,10;addx,10;decelerate,0.25;diffusealpha,1;addy,-10;addx,-10);
	};
};