local t = Def.ActorFrame{};

t[#t+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToSave() then self:sleep(0); end;
			self:queuecommand("Load");
		end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};
 
return t;