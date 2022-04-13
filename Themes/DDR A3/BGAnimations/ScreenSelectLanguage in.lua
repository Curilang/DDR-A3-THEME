local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffuse(Alpha(Color.Black,0)) end,
	};
};

return t;
