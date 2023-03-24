local t = Def.ActorFrame {};


t[#t+1] = Def.ActorFrame{
	OnCommand=function(s) s:sleep(0.27):queuecommand("Play") end,
	PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("ScreenSelectMusic","swoosh")) end,
};

if(GAMESTATE:GetCurrentStage()=='Stage_1st') or GAMESTATE:GetCurrentStageIndex()==0 then
	t[#t+1] = LoadActor(THEME:GetPathB("","_doors open"));
end;

return t;