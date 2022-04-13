return Def.ActorFrame {
	-- LoadActor(THEME:GetPathG("OptionRowExit","frame")) .. {
		-- InitCommand=cmd(diffusebottomedge,Color("Orange"));
	-- };
	LoadActor(THEME:GetPathG("_icon","Sort")) .. {
		InitCommand=cmd(x,-60;zoom,0.5;shadowlength,1;diffuse,Color("Orange");diffusetopedge,Color("Yellow"));
	};
};