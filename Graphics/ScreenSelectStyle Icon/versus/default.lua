local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,SCREEN_CENTER_X+362,SCREEN_CENTER_Y+10);
  Def.ActorFrame{
    LoadActor(THEME:GetPathG("ScreenSelectStyle","icon/infomiddle"))..{
      OnCommand=function(self)
        if GAMESTATE:GetNumPlayersEnabled() == 2 then
          self:queuecommand("On2");
        else
          self:diffusealpha(0);
        end;
      end;
      On2Command=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1.1;diffusealpha,1);
      OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
      GainFocusCommand=function(self)
        setenv("SelVers",1)
        self:finishtweening():diffusealpha(0):zoomy(0):sleep(0.2):smooth(0.1):zoomy(1.5):diffusealpha(1):smooth(0.05):zoomy(1.1)
      end;
      LoseFocusCommand=function(self)
        setenv("SelVers",0)
        self:finishtweening():queuecommand("Off")
      end;
    };
    LoadActor(Language().."text")..{
      OnCommand=function(self)
        if GAMESTATE:GetNumPlayersEnabled() == 2 then
          self:queuecommand("On2");
        else
          self:diffusealpha(0);
        end;
      end;
      On2Command=cmd(diffusealpha,0;sleep,0.55;smooth,0.2;diffusealpha,1);
      OffCommand=cmd(smooth,0.1;diffusealpha,0);
      GainFocusCommand=cmd(finishtweening;diffusealpha,0;sleep,0.1;smooth,0.2;diffusealpha,1);
      LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    };
    LoadActor(Model().."pad")..{
      InitCommand=cmd(xy,166,34);
      OnCommand=function(self)
        if GAMESTATE:GetNumPlayersEnabled() == 2 then
          self:queuecommand("On2");
        else
          self:diffusealpha(0);
        end;
      end;
      On2Command=cmd(diffusealpha,0;sleep,0.55;smooth,0.2;diffusealpha,1);
      OffCommand=cmd(smooth,0.1;diffusealpha,0);
      GainFocusCommand=cmd(finishtweening;diffusealpha,0;sleep,0.1;smooth,0.2;diffusealpha,1);
      LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(y,-94);
    OnCommand=function(self)
      if GAMESTATE:GetNumPlayersEnabled() == 2 then
        self:queuecommand("On2");
      else
        self:diffusealpha(0);
      end;
    end;
    On2Command=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,-92;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
    GainFocusCommand=cmd(finishtweening;diffusealpha,0;y,0;sleep,0.1;smooth,0.2;y,-100;diffusealpha,1;smooth,0.05;y,-92);
    LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    LoadActor(THEME:GetPathG("ScreenSelectStyle","icon/"..Model().."top"));
    LoadActor(Language().."title")..{
		InitCommand=cmd(x,10);
	};
  };
  LoadActor(THEME:GetPathG("ScreenSelectStyle","icon/"..Model().."bottom"))..{
    InitCommand=cmd(zoom,0.996;y,86);
    OnCommand=function(self)
      if GAMESTATE:GetNumPlayersEnabled() == 2 then
        self:queuecommand("On2");
      else
        self:diffusealpha(0);
      end;
    end;
    On2Command=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,88;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
    GainFocusCommand=cmd(finishtweening;diffusealpha,0;y,0;sleep,0.1;smooth,0.2;y,100;diffusealpha,1;smooth,0.05;y,88);
    LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
  };
};

return t;