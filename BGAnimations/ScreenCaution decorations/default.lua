local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center;zoom,0.667);
  Def.Quad{
    InitCommand=cmd(diffusealpha,0;setsize,900,385;diffuse,color("#dddfe0"));
    OnCommand=cmd(zoomy,0;sleep,0.6;linear,0.1;zoomy,1;diffusealpha,1;linear,0.1;diffusealpha,0.75;linear,0.1;diffuse,color("0.25,0.25,0.35,0.25");blend,Blend.Multiply;sleep,6.8;queuecommand,"GoOff");
    GoOffCommand=cmd(linear,0.1;blend,Blend.Normal;zoomx,2;zoomy,0;diffuse,color("#dddfe0");diffusealpha,1);
  };
  LoadActor(Language().."txt.png")..{
    InitCommand=cmd(diffusealpha,0);
    OnCommand=cmd(zoomy,0;sleep,0.6;diffusealpha,1;linear,0.1;zoomy,1;sleep,7;linear,0.1;zoomx,1.5;zoomy,0;sleep,0;diffusealpha,0);
  };
  Def.ActorFrame{
    OnCommand=cmd(sleep,7;queuecommand,"Stop");
    StopCommand=cmd(stoptweening;diffusealpha,0);
    LoadActor("header eff.png")..{
      InitCommand=cmd(y,-214;diffusealpha,0;zoomx,0.94);
      OnCommand=cmd(sleep,0.7;queuecommand,"Anim");
      AnimCommand=cmd(zoomy,1;sleep,0.2;linear,0.4;diffusealpha,1;linear,0.7;zoomy,1.3;diffusealpha,0;queuecommand,"Anim");
    };
    LoadActor("header eff.png")..{
      InitCommand=cmd(y,214;diffusealpha,0;zoomx,0.94;);
      OnCommand=cmd(sleep,0.7;queuecommand,"Anim");
      AnimCommand=cmd(zoomy,-1;sleep,0.2;linear,0.4;diffusealpha,1;linear,0.7;zoomy,-1.3;diffusealpha,0;queuecommand,"Anim");
    };
  };
  LoadActor("footer.png")..{
    InitCommand=cmd(diffusealpha,0);
    OnCommand=cmd(y,0;zoomx,2;sleep,0.5;diffusealpha,1;linear,0.1;zoomx,1;linear,0.1;y,214;sleep,7;linear,0.1;zoomx,2;y,0;sleep,0.05;diffusealpha,0);
  };
  LoadActor("header.png")..{
    InitCommand=cmd(diffusealpha,0);
    OnCommand=cmd(y,0;zoomx,2;sleep,0.5;diffusealpha,1;linear,0.1;zoomx,1;linear,0.1;y,-214;sleep,7;linear,0.1;zoomx,2;y,0;sleep,0.05;diffusealpha,0);
  };
};

return t;
