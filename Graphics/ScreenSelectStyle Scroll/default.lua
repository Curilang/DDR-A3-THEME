local Style = Var("GameCommand"):GetName()

return Def.ActorFrame{
	LoadActor(Style)..{
		OffCommand=function(self, param)
			self:smooth(0.1):zoom(0):diffusealpha(0)
		end;
	};
};