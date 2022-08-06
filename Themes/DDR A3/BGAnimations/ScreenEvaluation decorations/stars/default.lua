local t = Def.ActorFrame{};

if not GAMESTATE:IsEventMode() then
	t[#t+1] = Def.ActorFrame{
	InitCommand=function(s) s:xy(-2.16,1) end,
		LoadActor(THEME:GetPathB("ScreenEvaluation","decorations/stars/"..Model().."three"))..{
		};
		LoadActor("stars") ..{
			InitCommand=cmd(diffusealpha,1);
		};
		LoadActor("stars") ..{
			InitCommand=cmd(blend,Blend.Add;diffusealpha,0;diffusealpha,0;linear,0.01;smooth,0.3;diffusealpha,1;diffuseramp;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,1");effectperiod,0.70);
		};
	};
end;

return t;