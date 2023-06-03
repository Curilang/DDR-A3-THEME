local player = Var "Player"

return Def.ActorFrame{
	-- RISKY 
	LoadActor(THEME:GetPathB("ScreenGameplay","decorations/lifeframe/stream/danger"))..{
		InitCommand=function(self)
			self:texcoordvelocity(-0.6,0)
			self:zoomto(296,20)
		end;
	};
	-- LIFE 2-3
	LoadActor(THEME:GetPathB("ScreenGameplay","decorations/lifeframe/stream/normal"))..{
		InitCommand=function(self)
			self:texcoordvelocity(-0.6,0)
			self:zoomto(296,20)
			self:visible(false)
		end;
		LifeChangedMessageCommand=function(self,params)
			if params.Player == player then
				if params.LivesLeft >= 2 then
					self:visible(true)
				else
					self:visible(false)
				end
			end
		end;
	};
	-- LIFE4
	LoadActor(THEME:GetPathB("ScreenGameplay","decorations/lifeframe/stream/full"))..{
		InitCommand=function(self)
			self:texcoordvelocity(-0.6,0)
			self:zoomto(296,20)
			self:draworder(99)
		end;
		BeginCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			assert(glifemeter);
			if glifemeter:GetTotalLives() == 1 then
				self:visible(false)
			else
				self:visible(true)
			end
		end;
		LifeChangedMessageCommand=function(self,params)
			local screen = SCREENMAN:GetTopScreen();
			if screen then
				if screen:GetNextScreenName() ~= "ScreenGameplay" then --Make sure Screen="ScreenGameplay"
					local glifemeter = screen:GetLifeMeter(player);
					if params.Player == player then
						if GAMESTATE:IsCourseMode() then
							if glifemeter:GetTotalLives() == 1 then
								self:visible(false)
							else
								if	GAMESTATE:IsPlayerEnabled(player) then
									if 	GAMESTATE:GetCurrentTrail(player):GetDifficulty() == "Difficulty_Hard"  then
										if params.LivesLeft >= 4 then
											self:visible(true);
										else
											self:visible(false);
										end
									else
										if params.LivesLeft >= 8 then
											self:visible(true);
										else
											self:visible(false);
										end
									end
								end
							end
						else
							if glifemeter:GetTotalLives() == 1 then
								self:visible(false)
							elseif params.LivesLeft == glifemeter:GetTotalLives() then
								self:visible(true)
							else
								self:visible(false)
							end
						end
					
						
					end
				end
			end
		end;
		

	};
	-- LifeMetterBar under
	LoadActor(THEME:GetPathB("ScreenGameplay","decorations/lifeframe/stream/base"))..{
		InitCommand=cmd(horizalign,right;x,149);
		BeginCommand=function(self,params)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			assert(glifemeter);
			if glifemeter:GetTotalLives() == 4 then
				self:zoomto(0,20);
			elseif glifemeter:GetTotalLives() == 1 then
				self:zoomto(228,20);
			end
		end;
		LifeChangedMessageCommand=function(self,params)
		if params.Player ~= player then return end;
			self:finishtweening();
			if params.LivesLeft == 4 then 
				self:zoomto(0,20);
			elseif params.LivesLeft == 3 then
				self:zoomto(77,20);
			elseif params.LivesLeft == 2 then
				self:zoomto(152,20);
			elseif params.LivesLeft == 1 then
				self:zoomto(228,20);
			elseif params.LivesLeft == 0 then
				self:zoomto(296,20);
			end;
		end;
	};
};