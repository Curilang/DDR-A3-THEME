local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("music_in")..{
		OnCommand=cmd(play);
	};	
	
};
if(GAMESTATE:GetCurrentStage()=='Stage_1st') or GAMESTATE:GetCurrentStageIndex()==0 then
	t[#t+1] = LoadActor(THEME:GetPathB("","_doors open.lua"));
end;

return t;