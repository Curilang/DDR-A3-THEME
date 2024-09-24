local pn = ...

return Def.ActorFrame{
	Def.Sprite{
		InitCommand=function(self)
			if #(GAMESTATE:GetHumanPlayers()) == 2 then
				if pn == PLAYER_1 then
					self:cropright(0.5);
				elseif pn == PLAYER_2 then
					self:cropleft(0.5);
				end;
			end;
		end;
		SetCommand=function(self,param)
			self.cur_course = param.Course;
			self:queuecommand "DiffChange";
		end;
		DiffChangeCommand=function(self)
			if self.cur_course then
				local trail = GAMESTATE:GetCurrentTrail(pn)
				if trail then
					local profile
					if PROFILEMAN:IsPersistentProfile(pn) then
						profile = PROFILEMAN:GetProfile(pn);
					else
						profile = PROFILEMAN:GetMachineProfile();
					end;
					local scorelist = profile:GetHighScoreList(self.cur_course,trail);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[1] then
						topscore = scores[1];
						assert(topscore);
						local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")
									  +topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
									  +topscore:GetTapNoteScore("TapNoteScore_HitMine")
									  +topscore:GetTapNoteScore("TapNoteScore_W5")
						local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
						local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
						local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
						local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
						local hasUsedBattery = string.find(topscore:GetModifiers(),"Lives")
						if (misses) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 then
							if (greats+perfects) == 0 then
								self:Load(THEME:GetPathG("MusicWheelItem Course NormalPart/lamp/ClearedMark","MFC"))
								self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.75")):effectperiod(0.1)
							elseif greats == 0 then
								self:Load(THEME:GetPathG("MusicWheelItem Course NormalPart/lamp/ClearedMark","PFC"))
								self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.75")):effectperiod(0.1)
							elseif (misses+goods) == 0 then
								self:Load(THEME:GetPathG("MusicWheelItem Course NormalPart/lamp/ClearedMark","GreatFC"))
								self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.75")):effectperiod(0.1)
							elseif (misses) == 0 then
								self:Load(THEME:GetPathG("MusicWheelItem Course NormalPart/lamp/ClearedMark","GoodFC"))
								self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.75")):effectperiod(0.1)
							end;
							self:visible(true)
						else
							if topscore:GetGrade() ~= 'Grade_Failed' then
								if hasUsedBattery then
									self:visible(true)
									self:Load(THEME:GetPathG("MusicWheelItem Course NormalPart/lamp/ClearedMark","Risky"))
									self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,1")):effectperiod(1.1)
								else
									self:visible(true)
									self:Load(THEME:GetPathG("MusicWheelItem Course NormalPart/lamp/ClearedMark","LifeBar"))
									self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,1")):effectperiod(1.1)
								end
							else
								self:visible(true)
								self:Load(THEME:GetPathG("MusicWheelItem Course NormalPart/lamp/ClearedMark","Failed"))
								self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,1")):effectperiod(1.1)
							end
						end;
					else
						self:visible(false)
					end;
                else
					self:visible(false)
				end;
            else
                self:visible(false)
            end;
        end;
    };
};