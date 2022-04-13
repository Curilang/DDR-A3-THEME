return Def.ActorFrame {
	LoadActor("ScreenCompany music.ogg") .. {
		OnCommand=cmd(play);
	};
    Def.Quad{
		InitCommand=cmd(diffuse,Color("White");setsize,SCREEN_WIDTH,SCREEN_HEIGHT;Center;sleep,1;linear,0.25;diffusealpha,1;);
	};
	Def.Quad{
		InitCommand=cmd(diffuse,color("#CC0000");setsize,SCREEN_WIDTH,SCREEN_HEIGHT;Center;sleep,1;linear,0.25;diffusealpha,0;);
	};
	LoadActor("konami") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;linear,0.5;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0);
	};
	LoadActor("bemani") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,3;linear,0.5;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0);
	};
	LoadActor("e-amusement") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,6;linear,0.5;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0);
	};
	LoadActor("rsa") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,9;linear,0.5;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0);
	};
	LoadActor("1.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,12;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("2.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,13;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("3.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,14;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("4.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,15;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};	
	LoadActor("5.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,16;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("6.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,17;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("7.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,18;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("8.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,19;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("9.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,20;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("10.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,21;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("11.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,22;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("12.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,23;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("13.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,24;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
	};
	LoadActor("thanks.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,25;linear,0.25;diffusealpha,1;sleep,3;linear,0.25;diffusealpha,0);
	};
};