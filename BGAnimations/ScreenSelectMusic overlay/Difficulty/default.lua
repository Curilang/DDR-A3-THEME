local pn = ...
local yspacing = 31;
local DiffList = Def.ActorFrame{};

local function DrawDiffListItem(diff)
  local DifficultyListItem = Def.ActorFrame{
    InitCommand=function(s)
      s:xy(pn==PLAYER_1 and -3 or 3,(Difficulty:Reverse()[diff] * yspacing)-80)
    end,
    SetCommand=function(self)
      local st=GAMESTATE:GetCurrentStyle():GetStepsType()
      local song=GAMESTATE:GetCurrentSong()
      if song then
        if song:HasStepsTypeAndDifficulty( st, diff ) then
          local steps = song:GetOneSteps( st, diff )
          self:visible(true)
        else
            self:visible(false)
        end
      else
        self:visible(false)
      end;
    end;
    Def.BitmapText{
      Font="_dispatrox 32px",
      Name="DiffLabel";
      InitCommand=function(self)
        self:halign(pn=='pnNumber_P2' and 1 or 0):draworder(99):diffuse(Color.White):zoomx(0.5):zoomy(0.6):maxwidth(150)
        self:x(-119)
        self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff)))
      end;
    };
    Def.ActorFrame{
      InitCommand=function(s) s:x(pn==pn_2 and 26 or -26) end,
      Def.Quad{
        InitCommand=function(s) s:setsize(26,25):diffuse(CustomDifficultyToColor(diff)) end,
      };
      Def.BitmapText{
        Font="_impact 32px",
        Name="Meter";
        InitCommand=function(s) s:draworder(99):strokecolor(Color.Black):zoom(0.75) end,
        SetCommand=function(self)
          self:settext("")
          local st=GAMESTATE:GetCurrentStyle():GetStepsType()
          local song=GAMESTATE:GetCurrentSong()
          if song then
            if song:HasStepsTypeAndDifficulty( st, diff ) then
              local steps = song:GetOneSteps( st, diff )
              self:settext( steps:GetMeter() )
            end
          end;
        end;
      };
    };
    Def.BitmapText{
      Font="_geo 957 Bold",
      Name="Score";
      InitCommand=function(s) s:draworder(5):diffuse(Color.White):xy(80,-1):zoom(1.1):halign(1):maxwidth(80) end,
      SetCommand=function(self)
        self:settext("")

        local st=GAMESTATE:GetCurrentStyle():GetStepsType()
        local song=GAMESTATE:GetCurrentSong()
        if song then
          if song:HasStepsTypeAndDifficulty(st,diff) then
            local steps = song:GetOneSteps(st,diff)

            if PROFILEMAN:IsPersistentProfile(pn) then
              profile = PROFILEMAN:GetProfile(pn)
            else
              profile = PROFILEMAN:GetMachineProfile()
            end;

            scorelist = profile:GetHighScoreList(song,steps)
            local scores = scorelist:GetHighScores()
            local topscore = 0

            if scores[1] then
                topscore = scores[1]:GetScore()
            end;
            self:diffusealpha(1)

            if topscore ~= 0 then
                self:settext(commify(topscore))
            end;
          end;
        end;
      end;
    };
	Def.ActorFrame{
		InitCommand=function(s) s:x(90) end,
		Def.Sprite{
			InitCommand=function(s) s:xy(24,2) end,
			SetCommand=function(self)
				local st = GAMESTATE:GetCurrentStyle():GetStepsType();
				local song = GAMESTATE:GetCurrentSong();
				local profile = MachineOrProfile(pn)
				if song then
					if song:HasStepsTypeAndDifficulty(st,diff) then
						local steps = song:GetOneSteps( st, diff );
						local scorelist = profile:GetHighScoreList(song,steps);
							assert(scorelist);
						local scores = scorelist:GetHighScores();
							assert(scores);
						local topscore;
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
									self:Load(THEME:GetPathG("","ScreenSelectMusic/MarvelousFullCombo_ring"))
								elseif greats == 0 then
									self:Load(THEME:GetPathG("","ScreenSelectMusic/PerfectFullCombo_ring"))
								elseif (misses+boos+goods) == 0 then
									self:Load(THEME:GetPathG("","ScreenSelectMusic/GreatFullCombo_ring"))
								elseif (misses+boos) == 0 then
									self:Load(THEME:GetPathG("","ScreenSelectMusic/GoodFullCombo_ring"))
								end;
								self:visible(true):zoom(0.66):spin():effectmagnitude(0,0,170)
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
		end
      };
      Def.Quad{
        Name="Grade";
      InitCommand=function(s) s:draworder(5):visible(false):zoom(1.1):x(8) end,
      SetCommand=function(self)
        local st=GAMESTATE:GetCurrentStyle():GetStepsType();
        local song=GAMESTATE:GetCurrentSong();
        if song then
          if song:HasStepsTypeAndDifficulty(st,diff) then
            local steps = song:GetOneSteps(st, diff)
            if PROFILEMAN:IsPersistentProfile(pn) then
              profile = PROFILEMAN:GetProfile(pn)
            else
              profile = PROFILEMAN:GetMachineProfile()
            end
  
            scorelist = profile:GetHighScoreList(song,steps)
            local scores = scorelist:GetHighScores()
  
            local topscore=0
            if scores[1] then
              topscore = scores[1]:GetScore()
            end
  
            local topgrade
            if scores[1] then
              topgrade = scores[1]:GetGrade();
              assert(topgrade)
              local tier = topgrade
              if scores[1]:GetScore()>1  then
                if topgrade == 'Grade_Failed' then
                  self:LoadBackground(THEME:GetPathG("","ScreenSelectMusic/Grade Failed"));
                else
                  self:LoadBackground(THEME:GetPathG("ScreenSelectMusic/Grade",ToEnumShortString(tier)));
                end;
                self:visible(true)
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
    };
  };
  return DifficultyListItem
end

local difficulties = {"Difficulty_Beginner", "Difficulty_Easy", "Difficulty_Medium", "Difficulty_Hard", "Difficulty_Challenge", "Difficulty_Edit"}

for diff in ivalues(difficulties) do
  DiffList[#DiffList+1] = DrawDiffListItem(diff)
end


return Def.ActorFrame{
  CurrentSongChangedMessageCommand=function(s) s:finishtweening():queuecommand("Set") end,
    ["CurrentSteps" .. ToEnumShortString(pn) .. "ChangedMessageCommand"]=function(s) s:finishtweening():queuecommand("Set") end,
	Def.Sprite{
		Texture=Model().."frame",
		InitCommand=function(s) s:xy(pn==PLAYER_1 and 36 or -36,-17):rotationy(pn==PLAYER_1 and 0 or 180) end,
		OnCommand=function(s) s:diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
	};
	Def.Sprite{
		Texture=Model()..Language().."text",
		InitCommand=function(s) s:xy(20,-112) end,
		OnCommand=function(s) s:diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
	};
    DiffList..{
		InitCommand=function(s) s:x(pn==PLAYER_1 and 0 or -14) end,
      OnCommand=function(s) s:diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
    };
	LoadActor(Model().."line")..{
		InitCommand=function(s) s:x(pn==PLAYER_1 and 0 or -9)
			s:setsize(246,25):diffusealpha(0)
			s:diffuseshift():effectcolor1(color("1,1,1,0.7")):effectcolor2(color("1,1,1,0.2")):effectperiod(0.8):visible(false) 
		end,
		OnCommand=function(s) s:diffusealpha(0):sleep(0.8):diffusealpha(0.7) end,
		SetCommand=function(s)
			local song=GAMESTATE:GetCurrentSong()
			if song then
				s:visible(true)
				local steps = GAMESTATE:GetCurrentSteps(pn)
					if steps then
					local diff = steps:GetDifficulty();
					local st=GAMESTATE:GetCurrentStyle():GetStepsType();
						s:y((Difficulty:Reverse()[diff] * yspacing)-80)
					end;
			else
				s:visible(false)
			end;
		end,
	};
}