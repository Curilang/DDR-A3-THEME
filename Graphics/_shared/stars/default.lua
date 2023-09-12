return Def.ActorFrame{
	Condition=not GAMESTATE:IsEventMode();
	LoadActor(Model().."nine");
	LoadActor("stars");
	LoadActor("stars")..{
		InitCommand=function(s) 
			s:blend(Blend.Add):diffusealpha(0):linear(0.01):smooth(0.3):diffusealpha(1)
			s:diffuseramp():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,1")):effectperiod(0.70) 
		end,
	};
};