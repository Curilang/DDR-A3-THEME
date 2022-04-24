local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,SCREEN_CENTER_X+362,SCREEN_CENTER_Y+10);
  Def.ActorFrame{
   LoadActor(THEME:GetPathG("ScreenSelectStyle","icon/infomiddle"))..{
      OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
      GainFocusCommand=function(self)
        setenv("SelDoub",1)
        self:finishtweening():diffusealpha(0):zoomy(0):sleep(0.2):smooth(0.1):zoomy(1.5):diffusealpha(1):smooth(0.05):zoomy(1.1)
      end;
      LoseFocusCommand=function(self)
        setenv("SelDoub",0)
        self:finishtweening():queuecommand("Off")
      end;
    };
    LoadActor(Language().."text")..{
      OffCommand=cmd(smooth,0.1;diffusealpha,0);
      GainFocusCommand=cmd(finishtweening;diffusealpha,0;sleep,0.1;sleep,0.1;smooth,0.2;diffusealpha,1);
      LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    };
    LoadActor(Model().."pad")..{
      InitCommand=cmd(xy,166,34);
      OffCommand=cmd(smooth,0.1;diffusealpha,0);
      GainFocusCommand=cmd(finishtweening;diffusealpha,0;sleep,0.1;sleep,0.1;smooth,0.2;diffusealpha,1);
      LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    };
  };
	Def.ActorFrame{
    InitCommand=cmd(y,-94);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
    GainFocusCommand=cmd(finishtweening;diffusealpha,0;y,0;sleep,0.1;smooth,0.2;y,-100;diffusealpha,1;smooth,0.05;y,-92);
    LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    LoadActor(THEME:GetPathG("ScreenSelectStyle","icon/"..Model().."top"))..{
		InitCommand=function(s) s:zoom(0.5) end,
	};
	LoadActor(Language().."title")..{
		InitCommand=cmd(x,10);
	};
	Def.Sprite{
		Texture=THEME:GetPathG("", "_shared/Style"),
		InitCommand=function(s) s:x(120):zoom(0.667):pause():setstate(2) end,
	};
	};
  LoadActor(THEME:GetPathG("ScreenSelectStyle","icon/"..Model().."bottom"))..{
    InitCommand=cmd(zoom,0.5;y,86);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
    GainFocusCommand=cmd(finishtweening;diffusealpha,0;y,0;sleep,0.1;smooth,0.2;y,100;diffusealpha,1;smooth,0.05;y,88);
    LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
  };
};

return t;
