local Door
if (STATSMAN:GetCurStageStats():AllFailed()) then
	Door = THEME:GetPathB("ScreenEvaluation","in/Failed")
else
	Door = THEME:GetPathB("ScreenEvaluation","in/Cleared")
end
local st = STATSMAN:GetCurStageStats()
local pss_p1 = st:GetPlayerStageStats(PLAYER_1)
local pss_p2 = st:GetPlayerStageStats(PLAYER_2)

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
		Condition=pss_p1:GetScore() > 0 or pss_p2:GetScore() > 0;
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) 
			local sound = THEME:GetPathS("ScreenEvaluation","Score")
			SOUND:PlayOnce(StreamingSound(sound)) 
		end,
	};
	LoadActor(Door);
};