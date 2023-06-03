return Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx+10,_screen.cy+187) end,
		Def.Sprite{
			Texture=Model().."base",
		};
		Def.Sprite{
			Texture=Model().."high",
			InitCommand=function(s) s:diffuseramp():effectcolor1(color("1,1,1,0.2")):effectcolor2(color("1,1,1,1")):effectperiod(0.5) end,
			GainFocusCommand=function(s) s:linear(0.09):zoom(1):diffusealpha(1) end,
			LoseFocusCommand=function(s) s:linear(0.09):zoom(0.9):diffusealpha(0) end,
		};	
		Def.BitmapText{
			Font="ScreenTitleMenu Title",
			InitCommand=function(s) s:settext(Var("GameCommand"):GetText()):maxwidth(180) end,
			GainFocusCommand=function(s) s:linear(0.09):zoom(0.85):diffusealpha(1) end,
			LoseFocusCommand=function(s) s:linear(0.09):zoom(0.8):diffusealpha(1) end,
		};
	};
};
