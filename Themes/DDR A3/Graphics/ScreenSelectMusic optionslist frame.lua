local t = Def.ActorFrame {}

for pn in ivalues(PlayerNumber) do
t[#t+1] = Def.ActorFrame {
	LoadActor("optionslist frame")..{
		InitCommand=cmd(diffusealpha,.8;visible,false);
		OptionsListOpenedMessageCommand=function(self,params)
			if params.Player == pn then
				if pn == PLAYER_1 then
					self:x(120)
				elseif pn == PLAYER_2 then
					self:x(SCREEN_WIDTH-120)
				end
				self:visible(true)
			end
		end;
		OptionsListClosedMessageCommand=function(self,params)
			if params.Player == pn then
				self:visible(false)
			end
		end;
	};
}
end

return t