return Def.ActorFrame {
	OnCommand=cmd(sleep,1);
	LoadActor(THEME:GetPathS("","_silent"))..{
		OffCommand=cmd(play);
	};
};