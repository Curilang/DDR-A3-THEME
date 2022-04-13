local t = LoadFallbackB();

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","ModDate"));
	
	LoadActor(THEME:GetPathS("Profile","In"))..{
		OnCommand=cmd(play);
	};
	
	LoadActor(THEME:GetPathS("","Profile Load"))..{
		OnCommand=cmd(sleep,0.35;queuecommand,"Play");
		PlayCommand=cmd(play);
	};

};

return t
