local t = Def.ActorFrame {
	LoadActor("WhiteFullcombo_ring")..{
		InitCommand=cmd(zoom,0);
		OnCommand=function(self)
			(cmd(linear,0.2;zoom,0.65;spin;effectmagnitude,0,0,170))(self);
		end;
	};
	LoadActor("WhiteFullcombo_lines")..{
		InitCommand=cmd(zoom,0);
		OnCommand=function(self)
				(cmd(linear,0.2;zoom,1;spin;effectmagnitude,0,0,-170))(self);
		end;
	};
		
}

return t;