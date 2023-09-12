local pn = ...
local offsetx = -404

function TopRecord(pn) --�^�ǳ̰��������Ӭ���
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
			myScoreSet["topEXScore"]  = scores[1]:GetTapNoteScore("TapNoteScore_W1")*3+scores[1]:GetTapNoteScore("TapNoteScore_W2")*2+scores[1]:GetTapNoteScore("TapNoteScore_W3")+scores[1]:GetHoldNoteScore("HoldNoteScore_Held")*3;
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

return Def.ActorFrame{
    CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
    ["CurrentSteps" .. ToEnumShortString(pn) .. "ChangedMessageCommand"]=function(s) s:finishtweening():queuecommand("Set") end,
    Def.Sprite{
        Texture="grade",
        InitCommand=function(s) s:zoom(0.5) end,
		SetCommand=function(s)
            myScoreSet = TopRecord(pn);
			if (myScoreSet["SongOrCourse"]==1) then
				if (myScoreSet["HasScore"]==1) then
					s:diffusealpha(1);
				else
					s:diffusealpha(1);
				end
			else
				s:diffusealpha(0);
             end
        end,
    };
	Def.Sprite{
        Texture=Model().."frame",
        InitCommand=function(s) s:zoom(0.32):x(3):y(-64) end,
		SetCommand=function(s)
            myScoreSet = TopRecord(pn);
			if (myScoreSet["SongOrCourse"]==1) then
				if (myScoreSet["HasScore"]==1) then
					s:diffusealpha(1);
				else
					s:diffusealpha(1);
				end
			else
				s:diffusealpha(0);
             end
        end,
    };
    Def.Sprite{
		InitCommand=function(s) s:zoom(0.38):xy(98,-49) end,
        SetCommand=function(self)
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
								self:Load(THEME:GetPathG("","Grade/MarvelousFullcombo_ring"))
							elseif greats == 0 then
								self:Load(THEME:GetPathG("","Grade/PerfectFullcombo_ring"))
							elseif (misses+boos+goods) == 0 then
								self:Load(THEME:GetPathG("","Grade/GreatFullcombo_ring"))
							elseif (misses+boos) == 0 then
								self:Load(THEME:GetPathG("","Grade/GoodFullcombo_ring"))
							end;
							self:visible(true):spin():effectmagnitude(0,0,170)
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
        Name="Grades",
        InitCommand=function(s) s:zoomx(0.4):zoomy(0.35):xy(70,-58) end,
        SetCommand=function(self)
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
                    --player profile
                    profile = PROFILEMAN:GetProfile(pn);
                else
                    --machine profile
                    profile = PROFILEMAN:GetMachineProfile();
                end;
    
                scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
                    
                assert(scorelist);
                local scores = scorelist:GetHighScores();
                assert(scores);
                local temp=#scores;
                local topscore=0;
                if scores[1] then
                    topscore = scores[1]:GetScore();
                end;
                assert(topscore);
                local topgrade;
                if scores[1] then
                    for i=1,temp do 
                        topgrade = scores[1]:GetGrade();
                        curgrade = scores[i]:GetGrade();
                        assert(topgrade);
                        if scores[1]:GetScore()>1 then
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
                            self:diffusealpha(0)
                        end
                    end
                else
                    self:diffusealpha(0)
                end
            else
                self:diffusealpha(0)
            end
        end;
    };
    Def.BitmapText{
        Name="Date",
        Font="_helvetica-condensed-light 24px",
        InitCommand=function(s) s:zoom(0.48):xy(40,-80):halign(1):strokecolor(Color.Outline) end,
        SetCommand=function(self)
            self:diffuse(color("1,1,1,1"));
            self:strokecolor(color("0.1,0.1,0.3,1"));
            myScoreSet = TopRecord(pn);
            local temp = myScoreSet["topDate"];
            if (myScoreSet["SongOrCourse"]==1) then
                if (myScoreSet["HasScore"]==1) then
                    self:settext( temp);
                    self:diffusealpha(1);
                else
                    self:diffusealpha(0);
                end
            else
                self:diffusealpha(0);
            end
        end;
    };
    Def.RollingNumbers{
        Name="Score",
        File = THEME:GetPathF("_itc avant garde pro","20px"),
        InitCommand=function(s) s:zoom(1.12):maxwidth(240):xy(38,-62):halign(1) end,
        SetCommand=function(self)
            if GAMESTATE:IsCourseMode() then
                self:Load("RollingNumbersCourseData");
            else
                self:Load("RollingNumbersSongData");
            end
            self:strokecolor(color("0.1,0.1,0.3,1"));
            myScoreSet = TopRecord(pn);
            
            if (myScoreSet["SongOrCourse"]==1) then
                if (myScoreSet["HasScore"]==1) then
                
                    local topscore = myScoreSet["topscore"];
                    
                    self:diffusealpha(1);
                    
                    self:targetnumber(topscore);
                else
                    self:diffusealpha(1);
                    self:targetnumber(0);
                end
            else
                self:diffusealpha(0);
            end
        end;
    };
    --MEJOR EL EX
	Def.BitmapText{
        Font="_itc avant garde pro md 16px",
        InitCommand=function(s) s:xy(-20,-44):zoom(0.8):halign(1) end,
        SetCommand=function(self)
            self:diffuse(color("1,1,0,1"));
            self:strokecolor(color("0.1,0.1,0.3,1"));
            myScoreSet = TopRecord(pn);
            self:settext("EX SCORE:");
            if (myScoreSet["SongOrCourse"]==1) then
                if (myScoreSet["HasScore"]==1) then
                    self:diffusealpha(1);
                else
                    self:diffusealpha(1);
                end
            else
                self:diffusealpha(0);
            end
        end;
    };
    Def.RollingNumbers{
        File = THEME:GetPathF("_itc avant garde pro bk","20px");
        InitCommand=function(s) s:xy(38,-44):zoom(0.92):halign(1):maxwidth(130) end,
        SetCommand=function(self)
            if GAMESTATE:IsCourseMode() then
                self:Load("RollingNumbersEXScoreSong");
            else
                self:Load("RollingNumbersEXScoreSong");
            end
            self:diffuse(color("1,1,0,1"));
            self:strokecolor(color("0.1,0.1,0.3,1"));
            myScoreSet = TopRecord(pn);
            
            if (myScoreSet["SongOrCourse"]==1) then
                if (myScoreSet["HasScore"]==1) then
                
                    local topscore = myScoreSet["topEXScore"];
                    
                    self:diffusealpha(1);
                    
                    self:targetnumber(topscore);
                else
                    self:diffusealpha(1);
                    self:targetnumber(0);
                end
            else
                self:diffusealpha(0);
            end
        end;
    };
    Def.RollingNumbers{
        Name="W1",
        File = THEME:GetPathF("_itc avant garde pro","20px");
        InitCommand=function(s) s:xy(94,-14):halign(1):zoom(0.92) end,
        SetCommand=function(self)
            if GAMESTATE:IsCourseMode() then
                self:Load("RollingNumbersJudgment");
            else
                self:Load("RollingNumbersJudgment");
            end
            self:diffuse(color("1,1,1,1"));
            self:strokecolor(color("0.1,0.1,0.3,1"));
            myScoreSet = TopRecord(pn);
            
            if (myScoreSet["SongOrCourse"]==1) then
                if (myScoreSet["HasScore"]==1) then
                
                    local topscore = myScoreSet["topW1"];
                    
                    self:diffusealpha(1);
                    
                    self:targetnumber(topscore);
                else
                    self:diffusealpha(1);
                    self:targetnumber(0);
                end
            else
                self:diffusealpha(0);
            end
        end;
    };
    Def.RollingNumbers{
        Name="W2",
        File = THEME:GetPathF("_itc avant garde pro","20px");
        InitCommand=function(s) s:xy(94,6):halign(1):zoom(0.92) end,
        SetCommand=function(self)
            if GAMESTATE:IsCourseMode() then
                self:Load("RollingNumbersJudgment");
            else
                self:Load("RollingNumbersJudgment");
            end
            self:diffuse(color("1,1,1,1"));
            self:strokecolor(color("0.1,0.1,0.3,1"));
            myScoreSet = TopRecord(pn);
            
            if (myScoreSet["SongOrCourse"]==1) then
                if (myScoreSet["HasScore"]==1) then
                
                    local topscore = myScoreSet["topW2"];
                    
                    self:diffusealpha(1);
                    
                    self:targetnumber(topscore);
                else
                    self:diffusealpha(1);
                    self:targetnumber(0);
                end
            else
                self:diffusealpha(0);
            end
        end;
    };
    Def.RollingNumbers{
        Name="W3",
        File = THEME:GetPathF("_itc avant garde pro","20px");
        InitCommand=function(s) s:xy(94,26):halign(1):zoom(0.92) end,
        SetCommand=function(self)
            if GAMESTATE:IsCourseMode() then
                self:Load("RollingNumbersJudgment");
            else
                self:Load("RollingNumbersJudgment");
            end
            self:diffuse(color("1,1,1,1"));
            self:strokecolor(color("0.1,0.1,0.3,1"));
            myScoreSet = TopRecord(pn);
            
            if (myScoreSet["SongOrCourse"]==1) then
                if (myScoreSet["HasScore"]==1) then
                
                    local topscore = myScoreSet["topW3"];
                    
                    self:diffusealpha(1);
                    
                    self:targetnumber(topscore);
                else
                    self:diffusealpha(1);
                    self:targetnumber(0);
                end
            else
                self:diffusealpha(0);
            end
        end;
    };
    Def.RollingNumbers{
        Name="W4",
        File = THEME:GetPathF("_itc avant garde pro","20px");
        InitCommand=function(s) s:xy(94,48):halign(1):zoom(0.92) end,
        SetCommand=function(self)
            if GAMESTATE:IsCourseMode() then
                self:Load("RollingNumbersJudgment");
            else
                self:Load("RollingNumbersJudgment");
            end
            self:diffuse(color("1,1,1,1"));
            self:strokecolor(color("0.1,0.1,0.3,1"));
            myScoreSet = TopRecord(pn);
            
            if (myScoreSet["SongOrCourse"]==1) then
                if (myScoreSet["HasScore"]==1) then
                
                    local topscore = myScoreSet["topW4"];
                    
                    self:diffusealpha(1);
                    
                    self:targetnumber(topscore);
                else
                    self:diffusealpha(1);
                    self:targetnumber(0);
                end
            else
                self:diffusealpha(0);
            end
        end;
    };
    Def.RollingNumbers{
        Name="OK",
        File = THEME:GetPathF("_itc avant garde pro","20px");
        InitCommand=function(s) s:xy(94,66):halign(1):zoom(0.92) end,
        SetCommand=function(self)
            if GAMESTATE:IsCourseMode() then
                self:Load("RollingNumbersJudgment");
            else
                self:Load("RollingNumbersJudgment");
            end
            self:diffuse(color("1,1,1,1"));
            self:strokecolor(color("0.1,0.1,0.3,1"));
            myScoreSet = TopRecord(pn);
            
            if (myScoreSet["SongOrCourse"]==1) then
                if (myScoreSet["HasScore"]==1) then
                
                    local topscore = myScoreSet["topOK"];
                    
                    self:diffusealpha(1);
                    
                    self:targetnumber(topscore);
                else
                    self:diffusealpha(1);
                    self:targetnumber(0);
                end
            else
                self:diffusealpha(0);
            end
        end;
    };
    Def.RollingNumbers{
        Name="Miss",
        File = THEME:GetPathF("_itc avant garde pro","20px");
        InitCommand=function(s) s:xy(94,88):halign(1):zoom(0.92) end,
        SetCommand=function(self)
            if GAMESTATE:IsCourseMode() then
                self:Load("RollingNumbersJudgment");
            else
                self:Load("RollingNumbersJudgment");
            end
            self:diffuse(color("1,1,1,1"));
            self:strokecolor(color("0.1,0.1,0.3,1"));
            myScoreSet = TopRecord(pn);
            
            if (myScoreSet["SongOrCourse"]==1) then
                if (myScoreSet["HasScore"]==1) then
                
                    local topscore = myScoreSet["topMiss"];
                    
                    self:diffusealpha(1);
                    
                    self:targetnumber(topscore);
                else
                    self:diffusealpha(1);
                    self:targetnumber(0);
                end
            else
                self:diffusealpha(0);
            end
        end;
    };
}