return Def.ActorFrame {
	InitCommand=function(self)
		self:x(6);
		self:y(17);
		self:zoom(0.627)
	end;
	LoadActor(Model().."base")..{
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};
	LoadActor(Model().."line")..{
		InitCommand=function(s) s:xy(2,-1) end,
		OnCommand=cmd(playcommand,"Animate");
		AnimateCommand=cmd(zoom,0.75;diffusealpha,1;linear,0.2;zoom,1;diffusealpha,1;linear,0.2;diffusealpha,0;sleep,0.6;queuecommand,"Animate");
		OffCommand=cmd(stoptweening,linear,0.25;zoom,1.15;diffusealpha,0);
	};
}