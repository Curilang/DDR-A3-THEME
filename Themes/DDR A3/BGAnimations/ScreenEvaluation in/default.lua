local Door
if (STATSMAN:GetCurStageStats():AllFailed()) then
	Door = THEME:GetPathB("ScreenEvaluation","in/Failed")
else
	Door = THEME:GetPathB("ScreenEvaluation","in/Cleared")
end

return Def.ActorFrame {
	LoadActor(THEME:GetPathS("ScreenEvaluation","Swoosh"))..{
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
	LoadActor(THEME:GetPathS("ScreenEvaluation","Score"))..{
		StartTransitioningCommand=cmd(stop;sleep,0.5;play);
	};
	LoadActor(Door);
};