return Def.ActorFrame{
	Condition=not GAMESTATE:IsEventMode();
	LoadActor(THEME:GetPathB("ScreenEvaluation","decorations/stars/"..Model().."base"))..{
		InitCommand=function(s) s:xy(-2.16,1) end,
	};
	Def.ActorFrame{
		InitCommand=function(s) s:xy(-1.8,1.4) end,
		LoadActor("stars") ..{
			InitCommand=function(s) s:diffusealpha(1) end,
		};
		LoadActor("stars") ..{
			InitCommand=function(s) 
				s:blend(Blend.Add):diffusealpha(0):linear(0.01):smooth(0.3):diffusealpha(1)
				s:diffuseramp():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,1")):effectperiod(0.70) 
			end,
		};
	};
};