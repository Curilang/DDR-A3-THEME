local Sound

if (GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage()) then
	Sound = THEME:GetPathS("ScreenEvaluation","Final")
else	
	Sound = THEME:GetPathS("ScreenEvaluation","Normal")
end

return Def.ActorFrame {
	
	Def.Sound{
		File=Sound,
		OnCommand=function(s) s:sleep(2.4) end,
		OffCommand=function(s) s:play() end,
	};
	
	-- LoadActor(THEME:GetPathS("","_silent"))..{
		-- OnCommand=cmd(sleep,1);
		-- OffCommand=cmd(play);
	-- };
};