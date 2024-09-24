local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
	OnCommand=function(s) s:sleep(0.27):queuecommand("Play") end,
	PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("ScreenSelectMusic","swoosh")) end,
};

if(GAMESTATE:GetCurrentStage()=='Stage_1st') or GAMESTATE:GetCurrentStageIndex()==0 then
	t[#t+1] = loadfile(THEME:GetPathB("","_normaldoors"))()..{
		StartTransitioningCommand=function(s) s:playcommand("AnimOpen") end,
	};
end;

return t;