local t = LoadFallbackB();


t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathS("","Profile In"))..{
		OnCommand=cmd(play);
	};
	
	LoadActor(THEME:GetPathS("","Profile Load"))..{
		OnCommand=cmd(sleep,0.35;queuecommand,"Play");
		PlayCommand=cmd(play);
	};

	LoadActor( THEME:GetPathS("","Profile Start") )..{
		OffCommand=cmd(play);
	};
	
	LoadActor("_bluebg");

};
  
return t