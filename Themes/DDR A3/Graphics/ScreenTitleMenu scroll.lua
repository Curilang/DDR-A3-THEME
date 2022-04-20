local gc = Var("GameCommand");

return Def.ActorFrame {
	LoadFont("_arial_black 18px") .. {
		Text=gc:GetText();
		InitCommand=cmd(y,100;uppercase,true;shadowlength,2;strokecolor,Color("Black");zoom,1.5);
		OnCommand=cmd();
		GainFocusCommand=cmd(stoptweening;linear,0.1;zoom,1.5;diffusealpha,1;);
		LoseFocusCommand=cmd(stopeffect;linear,0.1;zoom,1;diffusealpha,0;);
	};

};
