-- Base from CyberiaStyle 7 by gl_yukt
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local mStages = STATSMAN:GetStagesPlayed();
local i = 0;

local DifficultyToFrame = {
	Difficulty_Beginner	= color("#1cd8ff"),
	Difficulty_Easy		= color("#ffaa19"),
	Difficulty_Medium	= color("#ff1e3c"),
	Difficulty_Hard		= color("#32eb19"),
	Difficulty_Challenge	= color("#eb1eff"),
	Difficulty_Edit 	= color("#afafaf"),
	Difficulty_None		= color("#000000"),
};

local t = Def.ActorFrame {};  



-- Center
for i = 1, mStages do
	local ssStats = STATSMAN:GetPlayedStageStats( i );
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(Center;zoom,0.667);
		BeginCommand=function(self)
			if mStages == 1 then
				self:addy(-100 + ((mStages - i) * 59));
			elseif mStages == 2 then
				self:addy(-100 + ((mStages - i) * 59));
			elseif mStages == 3 then
				self:addy(-100 + ((mStages - i) * 59));
			elseif mStages == 4 then
				self:addy(-100 + ((mStages - i) * 59));
			elseif mStages == 5 then
				self:addy(-100 + ((mStages - i) * 59));
			elseif mStages == 6 then
				self:addy(-100 + ((mStages - i) * 59));
			elseif mStages == 7 then
				self:addy(-150 + ((mStages - i) * 55));
			else
				self:addy(((mStages - i) * 59));
			end;
		end;

		LoadActor( "BannerCenter" ) .. {
			InitCommand=cmd(y,10);
			OnCommand=function(self) 
				self:zoomy(0);
				self:sleep(0.25+(i-mStages)*-0.1);
				self:linear(0.2); 
				self:zoomy(1);
			end;
			OffCommand=cmd(diffusealpha,0);
		};
		
		-- banner line
		Def.Quad {
			InitCommand=function(self)
				self:xy(-173,9.5):diffuse(color("#000000")):setsize(50,50)
			end;
			OnCommand=function(self) 
				self:zoomy(0);
				self:sleep(0.25+(i-mStages)*-0.1);
				self:linear(0.2); 
				self:zoomy(1);
			end;
			OffCommand=cmd(linear,0.25;zoomy,0);						
		};
		
		-- banner
		Def.Banner {
			InitCommand=function(self) 
				local sssong = ssStats:GetPlayedSongs()[1];
				self:xy(-173,9.5):Load(GetJacketPath(sssong)):setsize(48,48) 
			end;
			OnCommand=function(self) 
				self:zoomy(0);
				self:sleep(0.25+(i-mStages)*-0.1);
				self:linear(0.2);
				self:zoomy(1);
			end;
			OffCommand=cmd(linear,0.25;zoomy,0);						
		};
		
		-- Title
		LoadFont("_arial black 28px")..{
			InitCommand=cmd(zoomx,0.7;maxwidth,463;diffuse,color("#ffffff"));
			BeginCommand=function(self)
				local sssong = ssStats:GetPlayedSongs()[1];
				local sssmaint = sssong:GetDisplayFullTitle();
				self:x(26);
				self:settext(GetSongName(sssong));
				self:y(0);
				self:addy(8);
			end;
			OnCommand=function(self) 
				self:zoomy(0);
				self:sleep(0.25+(i-mStages)*-0.1);
				self:linear(0.2); 
				self:zoomy(0.7);
			end;
			OffCommand=cmd(diffusealpha,0);	
		};
	};
end;

for pn in ivalues(PlayerNumber) do
	for i = 1, mStages do
		if GAMESTATE:IsPlayerEnabled(pn) == true then
			local sStats = STATSMAN:GetPlayedStageStats( i );
			local pStageStats = sStats:GetPlayerStageStats( pn );
			local function GetFullComboEffectColor(pStageStats)
				local r;
					if pStageStats:FullComboOfScore('TapNoteScore_W1') then
						r=color("#fefed0");
					elseif pStageStats:FullComboOfScore('TapNoteScore_W2') then
						r=color("#f8fd6d");
					elseif pStageStats:FullComboOfScore('TapNoteScore_W3') then
						r=color("#01e603");
					elseif pStageStats:FullComboOfScore('TapNoteScore_W4') then
						r=color("#10e0f1");
					end;
				return r;
			end;
			t[#t+1] = Def.ActorFrame {
				InitCommand=cmd(player,pn;Center;zoom,0.667);
				BeginCommand=function(self) 
					if mStages == 1 then
						self:addy(-100 + ((mStages - i) * 59));
					elseif mStages == 2 then
						self:addy(-100 + ((mStages - i) * 59));
					elseif mStages == 3 then
						self:addy(-100 + ((mStages - i) * 59));
					elseif mStages == 4 then
						self:addy(-100 + ((mStages - i) * 59));
					elseif mStages == 5 then
						self:addy(-100 + ((mStages - i) * 59));
					elseif mStages == 6 then
						self:addy(-100 + ((mStages - i) * 59));
					elseif mStages == 7 then
						self:addy(-150 + ((mStages - i) * 55));
					else
						self:addy(-100 + ((mStages - i) * 59));
					end;
				end;
				OffCommand=function(self) 
					if pn == PLAYER_1 then
						self:linear(0.4); 
						self:addx(-SCREEN_WIDTH);
					else
						self:linear(0.4); 
						self:addx(SCREEN_WIDTH);
					end
					
				end;
				
				Def.Sprite{
					Texture=THEME:GetPathG("", "_shared/Style"),
					InitCommand=function(s) s:horizalign(right):x(pn==PLAYER_1 and -212 or 332):zoom(0.5):y(-33):pause():queuecommand("Set") end,
					OnCommand=function(s)
						s:zoomy(0);
						s:sleep(0.45+(i-mStages)*-0.1);
						s:linear(0.4); 
						s:zoomy(0.5);
					end,
					SetCommand=function(self)
					local style = GAMESTATE:GetCurrentStyle()
						if style:GetStyleType() == "StyleType_OnePlayerOneSide" then
							self:setstate(0);
						elseif style:GetStyleType() == "StyleType_TwoPlayersTwoSides" then
							self:setstate(1);
						elseif style:GetStyleType() == "StyleType_OnePlayerTwoSides" then
							self:setstate(2);
						end;
					end;
				};
				-- Def.BitmapText{
					-- Font="_impact 32px",
					-- InitCommand=function(s) s:horizalign(right):x(pn==PLAYER_1 and -220 or 297):zoom(0.72):y(-32)
						-- local style = GAMESTATE:GetCurrentStyle()
						-- if style:GetStyleType() == "StyleType_OnePlayerTwoSides" then
							-- s:settext("DOUBLE")
						-- elseif style:GetStyleType() == "StyleType_OnePlayerOneSide" then
							-- s:settext("SINGLE")
						-- elseif style:GetStyleType() == "StyleType_TwoPlayersTwoSides" then
							-- s:settext("VERSUS")
						-- end
					-- end,
					-- OnCommand=function(s)
						-- s:zoomy(0);
						-- s:sleep(0.45+(i-mStages)*-0.1);
						-- s:linear(0.4); 
						-- s:zoomy(0.72);
					-- end,
				-- };
				-- Label
				LoadActor( "BannerCenter" ) .. {
					InitCommand=function(s) s:horizalign(right):setsize(250,45):fadeleft(0.3) end,
					OnCommand=function(self) 
						if pn == PLAYER_1 then
							self:x(-SCREEN_WIDTH);
							self:sleep(0.05+(i-mStages)*-0.1);
							self:linear(0.4); 
							self:x(-225);
							self:y(10);
							self:zoomy(1.37);
						else
							self:rotationy(180);
							self:x(SCREEN_WIDTH);
							self:sleep(0.05+(i-mStages)*-0.1);
							self:linear(0.4); 
							self:x(225);
							self:y(10);
							self:zoomy(1.37);
						end
					end;
				};
				
				-- difficulty
				LoadActor("label_color") .. {
					InitCommand=cmd(horizalign,right);
					BeginCommand=function(self)
					------------------------------
					
						local p1ssstats = sStats:GetPlayerStageStats(pn);
						local diff1 = STATSMAN:GetPlayedStageStats(i):GetPlayerStageStats(pn):GetPlayedSteps();
						local p1ssstep = diff1[1]:GetDifficulty();
						local p1statediff = DifficultyToFrame[p1ssstep];
						if sStats then
							self:diffuse(p1statediff);
							self:visible(true);	
						else
							self:visible(false);
						end
						self:x(-146);
					end;
					OnCommand=function(self) 
						if pn == PLAYER_1 then
							self:x(-SCREEN_WIDTH);
							self:sleep(0.05+(i-mStages)*-0.1);
							self:linear(0.4); 
							self:x(-220);
							self:y(10);
							self:zoomy(1.37);
							self:zoomx(1.4);
						else
							self:rotationy(180);
							self:x(SCREEN_WIDTH);
							self:sleep(0.05+(i-mStages)*-0.1);
							self:linear(0.4); 
							self:x(220);
							self:y(10);
							self:zoomy(1.37);
							self:zoomx(1.4);
						end
					end;
				};

				-- fullcombo
				LoadActor(THEME:GetPathB("ScreenEvaluationSummary","overlay/FullCombo")) .. {
					InitCommand=cmd();
					BeginCommand=function(self)
						if pn == PLAYER_1 then
							self:x(-248);
						else
							self:x(300);
						end
						self:y(18);
						local grade = pStageStats:GetGrade();
						if grade ~= "Grade_Tier08" then
							if pStageStats:FullComboOfScore('TapNoteScore_W1') or pStageStats:FullComboOfScore('TapNoteScore_W2') or pStageStats:FullComboOfScore('TapNoteScore_W3') or pStageStats:FullComboOfScore('TapNoteScore_W4') then
								self:diffuse(GetFullComboEffectColor(pStageStats)); 
								self:visible(true);
							else
								self:visible(false);
							end
						else
							self:visible(false);
						end;
					end;
					OnCommand=function(self) 
						self:zoom(0);
						self:sleep(0.45+(i-mStages)*-0.1);
						self:linear(0.4); 
						self:zoom(0.4);
					end;
				};

				-- grade
				Def.Sprite {
					InitCommand=cmd(zoom,0.45;y,10);
					BeginCommand=function(self) 
						local Grade = pStageStats:GetGrade();
						self:LoadBackground(THEME:GetPathG("Grade/Grade",ToEnumShortString(Grade)));
						if pn == PLAYER_1 then
							self:addx(-290);
						
						else
							self:addx(270);
							
						end
					end;
					OnCommand=function(self) 
						self:zoomy(0);
						self:sleep(0.45+(i-mStages)*-0.1);
						self:linear(0.4); 
						self:zoomy(0.45);
						
					end;
				};
			
				-- stage
				LoadFont("_impact 32px")..{
					InitCommand=cmd(zoom,0.72;diffuse,color("#ffffff");strokecolor,color("#333333");maxwidth,160);
					BeginCommand=function(self)
						local pStage = sStats:GetStage();
						local stageText = StageToLocalizedString(pStage).." STAGE";
						if pn == PLAYER_1 then
							self:addx(-203-160);
							self:horizalign(left);
						else
							self:addx(203+24);
							self:horizalign(left);
						end
						self:addy(-12);
						self:settext(stageText);
					end;
					OnCommand=function(self) 
						if pn == PLAYER_1 then
							self:x(-SCREEN_WIDTH);
							self:sleep(0.05+(i-mStages)*-0.1);
							self:linear(0.4); 
							self:x(-310-160);
							self:y(0);
						else
							self:x(SCREEN_WIDTH);
							self:sleep(0.05+(i-mStages)*-0.1);
							self:linear(0.4); 
							self:x(310+24);
							self:y(0);
						end
					end;
				};
				
				-- Score
				Def.RollingNumbers {
					File=THEME:GetPathF("_itc avant garde pro","20px");
					InitCommand=cmd(Load,"RollingNumbersScore";zoom,1.2;diffusealpha,0;diffuse,color("#ffffff");strokecolor,color("#000000"));
					BeginCommand=function(self)
						-- local sStats = STATSMAN:GetPlayedStageStats(i);
						local pss = sStats:GetPlayerStageStats(pn);-------------------------------
						local song = sStats:GetPlayedSongs()[1];
						local diff = pss:GetPlayedSteps()[1]:GetDifficulty();
						local steps = song:GetOneSteps( st, diff );
						local radar = steps:GetRadarValues(pn);
						local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);
						self:targetnumber(GetEvaScore(maxsteps,pss,pn));
						if pn == PLAYER_1 then
							self:horizalign(right);
							self:x(-204-20);
						else
							self:horizalign(left);
							self:x(204+24);
						end
						self:y(8);
					end;
					OnCommand=function(self)
						if pn == PLAYER_1 then
							self:x(-SCREEN_WIDTH);
							self:sleep(0.05+(i-mStages)*-0.1);
							self:linear(0.4); 
							self:x(-310-20);
							self:y(23);
						else
							self:x(SCREEN_WIDTH);
							self:sleep(0.05+(i-mStages)*-0.1);
							self:linear(0.4); 
							self:x(310+24);
							self:y(23);
						end
					end;
				};
			};
		end;
	end;
end;

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
t[#t+1] = Def.ActorFrame{ 
		Def.Sprite{
			Texture=THEME:GetPathB("ScreenEvaluation","decorations/"..Model().."player"),
			InitCommand=function(s) 
			s:xy(pn==PLAYER_1 and SCREEN_LEFT-60 or SCREEN_RIGHT+60,_screen.cy-181):zoom(0.35):rotationy(pn==PLAYER_1 and 0 or 180) end,
			OnCommand=function(s) s:linear(0.25):x(pn==PLAYER_1 and SCREEN_LEFT+52 or SCREEN_RIGHT-52) end,
			OffCommand=function(s) s:linear(0.25):addx(pn==PLAYER_1 and -300 or 300) end,
		};
		Def.BitmapText{
			Font="_dispatrox 32px",
			InitCommand=function(s) 
				s:xy(pn==PLAYER_1 and SCREEN_LEFT-8 or SCREEN_RIGHT+8,_screen.cy-180)
				s:horizalign(pn==PLAYER_1 and right or left)
					if PROFILEMAN:GetNumLocalProfiles() >= 1 then
						s:settext(string.upper(PROFILEMAN:GetPlayerName(pn)))
					else
						s:settext(pn==PLAYER_1 and "PLAYER 1" or "PLAYER 2")
					end
				s:draworder(50):maxwidth(150):diffuse(color("#feec0a")):zoomx(0.53):zoomy(0.52);
			end,
			OnCommand=function(s) s:linear(0.25):x(pn==PLAYER_1 and SCREEN_LEFT+100 or SCREEN_RIGHT-100) end,
			OffCommand=function(s) s:linear(0.25):addx(pn==PLAYER_1 and -300 or 300) end,
        };
	};
end;

return t