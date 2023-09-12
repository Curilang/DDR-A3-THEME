local t = Def.ActorFrame{};
local SleepOffset = 0.3;
local cx = 640
local ox = 450

function StageTopRecord(pn) --�^�ǳ̰��������Ӭ���
	local SongOrCourse, StepsOrTrail;
	local myScoreSet = {
		["HasScore"] = 0;
		["SongOrCourse"] =0;
		["topscore"] = 0;
		["topW1"]=0;
		["topW2"]=0;
		["topW3"]=0;
		["topW4"]=0;
		["topW5"]=0;
		["topMiss"]=0;
		["topOK"]=0;
		["topEXScore"]=0;
		["topMAXCombo"]=0;
		["topDate"]=0;
		};
		
	if GAMESTATE:IsCourseMode() then
		SongOrCourse = GAMESTATE:GetCurrentCourse();
		StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
	else
		SongOrCourse = GAMESTATE:GetCurrentSong();
		StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
	end;

	local profile, scorelist;
	
	if SongOrCourse and StepsOrTrail then
		local st = StepsOrTrail:GetStepsType();
		local diff = StepsOrTrail:GetDifficulty();
		local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

		if PROFILEMAN:IsPersistentProfile(pn) then
			-- player profile
			profile = PROFILEMAN:GetProfile(pn);
		else
			-- machine profile
			profile = PROFILEMAN:GetMachineProfile();
		end;

		scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
		assert(scorelist);
		local scores = scorelist:GetHighScores();
		assert(scores);
		if scores[1] then
			myScoreSet["SongOrCourse"]=1;
			myScoreSet["HasScore"] = 1;
			myScoreSet["topscore"] = scores[1]:GetScore();
			myScoreSet["topW1"]  = scores[1]:GetTapNoteScore("TapNoteScore_W1");
			myScoreSet["topW2"]  = scores[1]:GetTapNoteScore("TapNoteScore_W2");
			myScoreSet["topW3"]  = scores[1]:GetTapNoteScore("TapNoteScore_W3");
			myScoreSet["topW4"]  = scores[1]:GetTapNoteScore("TapNoteScore_W4");
			myScoreSet["topW5"]  = scores[1]:GetTapNoteScore("TapNoteScore_W5");
			myScoreSet["topMiss"]  = scores[1]:GetTapNoteScore("TapNoteScore_W5")+scores[1]:GetTapNoteScore("TapNoteScore_Miss");
			myScoreSet["topOK"]  = scores[1]:GetHoldNoteScore("HoldNoteScore_Held");
			--myScoreSet["topEXScore"]  = scores[1]:GetTapNoteScore("TapNoteScore_W1")*3+scores[1]:GetTapNoteScore("TapNoteScore_W2")*2+scores[1]:GetTapNoteScore("TapNoteScore_W3")+scores[1]:GetHoldNoteScore("HoldNoteScore_Held")*3;
			if (StepsOrTrail:GetRadarValues( pn ):GetValue( "RadarCategory_TapsAndHolds" ) >=0) then --If it is not a random course
				if scores[1]:GetGrade() ~= "Grade_Failed" then
					myScoreSet["topEXScore"] = scores[1]:GetTapNoteScore("TapNoteScore_W1")*3+scores[1]:GetTapNoteScore("TapNoteScore_W2")*2+scores[1]:GetTapNoteScore("TapNoteScore_W3")+scores[1]:GetHoldNoteScore("HoldNoteScore_Held")*3;
				else
					myScoreSet["topEXScore"] = (StepsOrTrail:GetRadarValues( pn ):GetValue( "RadarCategory_TapsAndHolds" )*3+StepsOrTrail:GetRadarValues( pn ):GetValue( "RadarCategory_Holds" )*3)*scores[1]:GetPercentDP();
				end
			else --If it is Random Course then the scores[1]:GetPercentDP() value will be -1
				if scores[1]:GetGrade() ~= "Grade_Failed" then
					myScoreSet["topEXScore"]  = scores[1]:GetTapNoteScore("TapNoteScore_W1")*3+scores[1]:GetTapNoteScore("TapNoteScore_W2")*2+scores[1]:GetTapNoteScore("TapNoteScore_W3")+scores[1]:GetHoldNoteScore("HoldNoteScore_Held")*3;
				else
					myScoreSet["topEXScore"]  = 0;
				end
			end
			myScoreSet["topMAXCombo"]  = scores[1]:GetMaxCombo();
			myScoreSet["topDate"]  = scores[1]:GetDate() ;
		else
			myScoreSet["SongOrCourse"]=1;
			myScoreSet["HasScore"] = 0;
		end;
	else
		myScoreSet["HasScore"] = 0;
		myScoreSet["SongOrCourse"]=0;
		
	end
	return myScoreSet;

end;

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
t[#t+1]=Def.ActorFrame{
	LoadActor(Model().."diff")..{
		InitCommand=function(self)
			self:x(pn == PLAYER_1 and cx-434-ox or cx+434+ox);
			self:y(SCREEN_BOTTOM+37)
			self:zoomx(pn == PLAYER_1 and 1 or -1)
		end;
		OnCommand=function(self)
			self:sleep(SleepOffset+0.2):linear(0.05)
			self:x(pn == PLAYER_1 and cx-434 or cx+434);
		end;
	};
	Def.Sprite{
		Texture ="diff 1x6",
		InitCommand=function(s) s:y(SCREEN_BOTTOM+36)
		s:x(pn == PLAYER_1 and cx-546-ox or cx+546+ox)
		s:draworder(110):pause():queuecommand("Set") end,
		SetCommand=function(self)
			local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty();
			local sDifficulty = ToEnumShortString(diff);	
				if sDifficulty == 'Beginner' then
					self:setstate(0);
				elseif sDifficulty == 'Easy' then
					self:setstate(1);
				elseif sDifficulty == 'Medium' then
					self:setstate(2);
				elseif sDifficulty == 'Hard' then
					self:setstate(3);
				elseif sDifficulty == 'Challenge' then
					self:setstate(4);
				elseif sDifficulty == 'Edit' then
					self:setstate(5);
				end;
		end;
		OnCommand=function(s)
			s:sleep(SleepOffset+0.2):linear(0.05)
			s:x(pn == PLAYER_1 and cx-546 or cx+546) end,
	};
	LoadActor(Model().."best")..{
		InitCommand=function(self)
			self:x(pn == PLAYER_1 and cx-436-ox or cx+436+ox);
			self:y(SCREEN_BOTTOM+86)
		end;
		OnCommand=function(self)
			self:sleep(SleepOffset+0.2):linear(0.05)
			self:x(pn == PLAYER_1 and cx-436 or cx+436);
		end;
	};
	Def.Sprite{
	InitCommand=function(s) s:zoom(0.27):shadowlength(1)
	s:x(pn == PLAYER_1 and cx-268-ox or cx+603+ox)
	s:y(SCREEN_BOTTOM+78):horizalign(center):draworder(2) end,
	OnCommand=function(self) self:sleep(SleepOffset+0.2):linear(0.05):x(pn == PLAYER_1 and cx-268 or cx+603)
            local song = GAMESTATE:GetCurrentSong();
			local st = GAMESTATE:GetCurrentStyle():GetStepsType();
			local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty();
			if song then
				if song:HasStepsTypeAndDifficulty(st,diff) then
					local steps = song:GetOneSteps( st, diff );
					local profile = MachineOrProfile(pn)
					local scorelist = profile:GetHighScoreList(song,steps);
						assert(scorelist);
					local scores = scorelist:GetHighScores();
						assert(scores);
					local topscore=0;
					if scores[1] then
						topscore = scores[1];
							assert(topscore);
						local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
						local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
						local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
						local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
						local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
						local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
						if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 then
							if (greats+perfects) == 0 then
								self:Load(THEME:GetPathG("","ScreenSelectMusic/MarvelousFullcombo_ring"))
							elseif greats == 0 then
								self:Load(THEME:GetPathG("","ScreenSelectMusic/PerfectFullcombo_ring"))
							elseif (misses+boos+goods) == 0 then
								self:Load(THEME:GetPathG("","ScreenSelectMusic/GreatFullcombo_ring"))
							elseif (misses+boos) == 0 then
								self:Load(THEME:GetPathG("","ScreenSelectMusic/GoodFullcombo_ring"))
							end;
							self:visible(true):spin():zoom(1):effectmagnitude(0,0,170)
						else
							self:visible(false)
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
	Def.Quad{
	InitCommand=function(s) s:zoom(0.29):shadowlength(1)
	s:x(pn == PLAYER_1 and cx-288-ox or cx+576+ox)
	s:y(SCREEN_BOTTOM+76):horizalign(center):draworder(2) end,

		OnCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
			end;
			local profile, scorelist;
			local text = "";
			if SongOrCourse and StepsOrTrail then
				local st = StepsOrTrail:GetStepsType();
				local diff = StepsOrTrail:GetDifficulty();
				local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				if PROFILEMAN:IsPersistentProfile(pn) then
					-- player profile
					profile = PROFILEMAN:GetProfile(pn);
				else
					-- machine profile
					profile = PROFILEMAN:GetMachineProfile();
				end;

				scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
				assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[1] then
						topscore = scores[1]:GetScore();
					end;
					assert(topscore);
					local topgrade;
					local temp=#scores;
						if scores[1] then
							for i=1,temp do 
								topgrade = scores[1]:GetGrade();
								curgrade = scores[i]:GetGrade();
								assert(topgrade);
								if scores[1]:GetScore()>1  then
									if scores[1]:GetScore()==1000000 and scores[1]:GetGrade() =="Grade_Tier17" then --AutoPlayHack
                                self:LoadBackground(THEME:GetPathG("","Grade/Grade_Tier01"));
                                self:diffusealpha(1);
                                break;
                            else --Normal
                                if ToEnumShortString(curgrade) ~= "Failed" then --current Rank is not Failed
                                    self:LoadBackground(THEME:GetPathG("","Grade/Grade_"..ToEnumShortString(curgrade)));
                                    self:diffusealpha(1);
                                    break;
                                else --current Rank is Failed
                                    if i == temp then
                                        self:LoadBackground(THEME:GetPathG("","Grade/Grade_"..ToEnumShortString(curgrade)));
                                        self:diffusealpha(1);
                                        break;
                                    end;
                                end;
                            end;
								else
									self:diffusealpha(0);
								end;
							end;
						else
							self:diffusealpha(0);
						end;
			else
				self:diffusealpha(0);
			end;
			self:sleep(SleepOffset+0.2):linear(0.05)
			self:x(pn == PLAYER_1 and cx-288 or cx+576);
		end;
	};
	
	scstring="";
	
	Def.RollingNumbers { -- Topscore
			File = THEME:GetPathF("_helveticaneuelt pro 65 md","24px");
			InitCommand=function(s) s:shadowlength(0):zoomy(0.80):zoomx(1.85):maxwidth(240)
			s:x(pn == PLAYER_1 and cx-475-ox or cx+395+ox)
			s:y(SCREEN_BOTTOM+80) end,
			OnCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					self:Load("RollingNumbersCourseData");
				else
					--self:Load("RollingNumbersSongData");
					self:Load("RollingNumbersStageInScore");
				end
				self:diffuse(color("1,1,0.38,1"));
				self:strokecolor(color("0.0,0.0,0.0,1"));
				myScoreSet = StageTopRecord(pn);
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
					
						local topscore = myScoreSet["topscore"];
						
						self:diffusealpha(1);
						
						self:targetnumber(topscore);
						scstring = topscore;
					else
						self:diffusealpha(1);

						self:targetnumber(0);
						scstring = 0;
					end
				else
					self:diffusealpha(0);
				end
				self:sleep(SleepOffset+0.2):linear(0.05)
				self:x(pn == PLAYER_1 and cx-475 or cx+395);
			end;
	};
	

	--[[--Topscore mod P1
	LoadFont("_helveticaneuelt pro 65 md 24px") .. {
		Text = scstring;
		InitCommand=function(s) s:shadowlength(0):zoomy(0.80):zoomx(1.85):maxwidth(240)
			s:x(pn == PLAYER_1 and SCREEN_LEFT-OffsetX-40 or SCREEN_RIGHT+OffsetX-40)
			s:y(_screen.cy+280):horizalign(center) end,
		OnCommand=function(self)
			self:diffuse(color("1,1,0.28,1"));
			self:strokecolor(color("0.0,0.0,0.0,1"));
			self:sleep(SleepOffset+0.2):linear(0.05)
			self:x(pn == PLAYER_1 and SCREEN_LEFT+OffsetX-40 or SCREEN_RIGHT-OffsetX-40);
		end;
	};]]

	
	--Name
	LoadFont("_helveticaneuelt pro 65 md 24px") .. {
		Text=PROFILEMAN:GetProfile(pn):GetDisplayName();
		InitCommand=function(s) s:maxwidth(180):zoomy(0.8):zoomx(1.4)
			s:x(pn == PLAYER_1 and cx-527-ox or cx+342+ox)
			s:y(SCREEN_BOTTOM+110):strokecolor(Color("Outline")):maxwidth(120) end,
		OnCommand=function(self)
			self:sleep(SleepOffset+0.2):linear(0.05)
			self:x(pn == PLAYER_1 and cx-527 or cx+342);
		end;
	};
};
end;
	
return t;