local Door
if (STATSMAN:GetCurStageStats():AllFailed()) then
	Door = THEME:GetPathB("ScreenEvaluation","in/Failed")
else
	Door = THEME:GetPathB("ScreenEvaluation","in/Cleared")
end

return Def.ActorFrame {
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorOpen")) end,
	};
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("ScreenEvaluation","Swoosh")) end,
	};
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) 
			local sound = THEME:GetPathS("ScreenEvaluation","Score")
			SOUND:PlayOnce(StreamingSound(sound)) 
		end,
	};
	LoadActor(Door);
};