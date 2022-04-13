local t = Def.ActorFrame {
	Def.ActorFrame {
		InitCommand=cmd(pulse;effectperiod,2;effectmagnitude,0.9,1,0;zoom,0.65);
		OffCommand=cmd(bouncebegin,0.25;zoom,0);
		LoadActor("../ScreenGameplay overlay/FullCombo/Fullcombo01") .. {
			InitCommand=cmd(spin;effectmagnitude,0,0,-150);
			OffCommand=cmd(spin;effectmagnitude,0,0,-300);
		};
	};
	Def.ActorFrame {
		InitCommand=cmd(pulse;effectperiod,1;effectmagnitude,0.9,1,0;zoom,0.7);
		OffCommand=cmd(bouncebegin,0.25;zoom,0);
		LoadActor("../ScreenGameplay overlay/FullCombo/Fullcombo02") .. {
			InitCommand=cmd(spin;effectmagnitude,0,0,-150);
			OffCommand=cmd(spin;effectmagnitude,0,0,-300);
		};
	};
};

return t;