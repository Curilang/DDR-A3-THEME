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

for i = 1, mStages do
	local sStats = STATSMAN:GetPlayedStageStats(i)
	local CenterCommand=function(self) self:Center():zoom(0.667) end
	local SpaceCommand=function(self) 
		if mStages ~= 1 then 
			self:addy(-155+((mStages-i)*55)) 
		else 
			self:addy(((mStages-i)*59)) 
		end 
	end
	t[#t+1] = Def.ActorFrame{
		InitCommand=CenterCommand;
		BeginCommand=SpaceCommand;
			LoadActor("BannerCenter")..{
				InitCommand=function(s) s:y(10) end,
				OnCommand=function(s) s:zoomy(0):sleep(0.25+(i-mStages)*-0.1):linear(0.2):zoomy(1) end,
				OffCommand=function(s) s:diffusealpha(0) end,
			};	
			Def.Quad {
				InitCommand=function(s) s:xy(-173,9.5):diffuse(color("#000000")):setsize(50,50) end,
				OnCommand=function(s) s:zoomy(0):sleep(0.25+(i-mStages)*-0.1):linear(0.2):zoomy(1) end,
				OffCommand=function(s) s:linear(0.25):zoomy(0) end,						
			};
			Def.Banner {
				InitCommand=function(s) s:xy(-173,9.5)
					local sssong = sStats:GetPlayedSongs()[1]
					s:Load(GetJacketPath(sssong)):setsize(48,48)
				end,
				OnCommand=function(s) s:zoomy(0):sleep(0.25+(i-mStages)*-0.1):linear(0.2):zoomy(1) end,
				OffCommand=function(s) s:linear(0.25):zoomy(0) end,
			};
			LoadFont("_swis721 blk bt 28px")..{
				InitCommand=function(s) s:zoomx(0.7):maxwidth(463):diffuse(color("#ffffff")) end,
				BeginCommand=function(s) s:x(26):y(0):addy(8)
					local sssong = sStats:GetPlayedSongs()[1]
					s:settext(GetSongName(sssong))
				end,
				OnCommand=function(s) s:zoomy(0):sleep(0.25+(i-mStages)*-0.1):linear(0.2):zoomy(0.7) end,
				OffCommand=function(s) s:diffusealpha(0) end,	
			};
		};
	for pn in ivalues(PlayerNumber) do
	if GAMESTATE:IsPlayerEnabled(pn) == true then
		local pStats = sStats:GetPlayerStageStats(pn)
		t[#t+1] = Def.ActorFrame {
			InitCommand=CenterCommand;
			BeginCommand=SpaceCommand;
			OffCommand=function(s) s:linear(0.4):addx(pn == PLAYER_1 and -SCREEN_WIDTH or SCREEN_WIDTH) end,
			Def.Sprite{
				Texture=THEME:GetPathG("", "_shared/Style"),
				InitCommand=function(s) s:horizalign(right):x(pn==PLAYER_1 and -212 or 332):zoom(1):y(-31):pause():queuecommand("Set") end,
				OnCommand=function(s) s:zoomy(0):sleep(0.45+(i-mStages)*-0.1):linear(0.4):zoomy(1) end,
				SetCommand=function(s)
					local style = GAMESTATE:GetCurrentStyle()
						if style:GetStyleType() == "StyleType_OnePlayerOneSide" then
							s:setstate(0);
						elseif style:GetStyleType() == "StyleType_TwoPlayersTwoSides" then
							s:setstate(1);
						elseif style:GetStyleType() == "StyleType_OnePlayerTwoSides" then
							s:setstate(2);
						end;
					end;
				};
				LoadActor( "BannerCenter" ) .. {
					InitCommand=function(s) s:horizalign(right):setsize(250,45):fadeleft(0.3) end,
					OnCommand=function(s) s:rotationy(pn==PLAYER_1 and 0 or 180):x(pn==PLAYER_1 and -SCREEN_WIDTH or SCREEN_WIDTH):sleep(0.05+(i-mStages)*-0.1):linear(0.4):x(pn==PLAYER_1 and -225 or 225):y(10):zoomy(1.37) end,
				};
				LoadActor("label_color") .. {
					InitCommand=function(s) s:horizalign(right) end,
					BeginCommand=function(s)
						local step = pStats:GetPlayedSteps();
						local diff = step[1]:GetDifficulty();
						local color = DifficultyToFrame[diff];
						if sStats then
							s:diffuse(color):visible(true)	
						else
							s:visible(false)
						end
					end,
					OnCommand=function(s) s:rotationy(pn==PLAYER_1 and 0 or 180):x(pn==PLAYER_1 and -SCREEN_WIDTH or SCREEN_WIDTH):sleep(0.05+(i-mStages)*-0.1):linear(0.4):x(pn==PLAYER_1 and -220 or 220):y(10):zoomy(1.37):zoomx(1.4) end,
				};
				Def.ActorFrame{
					Def.Sprite{
						InitCommand=function(s) s:xy(pn==PLAYER_1 and -248 or 300,18):spin():effectmagnitude(0,0,170) end,
						BeginCommand=function(s)
							local grade = pStats:GetGrade();
							if grade ~= "Grade_Tier08" then
								if pStats:FullComboOfScore('TapNoteScore_W1') then
									s:Load(THEME:GetPathG("","Grade/MarvelousFullcombo_ring"))
								elseif pStats:FullComboOfScore('TapNoteScore_W2') then
									s:Load(THEME:GetPathG("","Grade/PerfectFullcombo_ring"))
								elseif pStats:FullComboOfScore('TapNoteScore_W3') then
									s:Load(THEME:GetPathG("","Grade/GreatFullcombo_ring"))
								elseif pStats:FullComboOfScore('TapNoteScore_W4') then
									s:Load(THEME:GetPathG("","Grade/GoodFullcombo_ring"))
								else
									s:visible(false);
								end
							end
						end,
						OnCommand=function(s) s:zoom(0):sleep(0.45+(i-mStages)*-0.1):linear(0.4):zoom(0.4) end,
					};
				};

				-- grade
				Def.Sprite {
					InitCommand=function(s) s:zoom(0.45):y(10) end,
					BeginCommand=function(s) s:addx(pn == PLAYER_1 and -278 or 270)
						local Grade = pStats:GetGrade();
						s:LoadBackground(THEME:GetPathG("","Grade/Grade_"..ToEnumShortString(Grade)));
						
					end;
					OnCommand=function(s) s:zoomy(0):sleep(0.45+(i-mStages)*-0.1):linear(0.4):zoomy(0.45) end,
				};
			
				-- stage
				LoadFont("_impact 32px")..{
					InitCommand=cmd(zoom,0.72;diffuse,color("#ffffff");strokecolor,color("#333333");maxwidth,160);
					BeginCommand=function(s)
						local pStage = sStats:GetStage();
						local stageText = StageToLocalizedString(pStage).." STAGE";
						if pn == PLAYER_1 then
							s:addx(-203-160);
							s:horizalign(left);
						else
							s:addx(203+24);
							s:horizalign(left);
						end
						s:addy(-12);
						s:settext(stageText);
					end;
					OnCommand=function(s) 
						if pn == PLAYER_1 then
							s:x(-SCREEN_WIDTH);
							s:sleep(0.05+(i-mStages)*-0.1);
							s:linear(0.4); 
							s:x(-310-160);
							s:y(0);
						else
							s:x(SCREEN_WIDTH);
							s:sleep(0.05+(i-mStages)*-0.1);
							s:linear(0.4); 
							s:x(310+24);
							s:y(0);
						end
					end;
				};
				
				-- Score
				Def.RollingNumbers {
					File=THEME:GetPathF("_itc avant garde pro","20px");
					InitCommand=cmd(Load,"RollingNumbersScore";zoom,1.2;diffusealpha,0;diffuse,color("#ffffff");strokecolor,color("#000000"));
					BeginCommand=function(s)
						-- local sStats = STATSMAN:GetPlayedStageStats(i);
						local pss = sStats:GetPlayerStageStats(pn);-------------------------------
						local song = sStats:GetPlayedSongs()[1];
						local diff = pss:GetPlayedSteps()[1]:GetDifficulty();
						local steps = song:GetOneSteps( st, diff );
						local radar = steps:GetRadarValues(pn);
						local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);
						s:targetnumber(GetEvaScore(maxsteps,pss,pn));
						if pn == PLAYER_1 then
							s:horizalign(right);
							s:x(-204-20);
						else
							s:horizalign(left);
							s:x(204+24);
						end
						s:y(8);
					end;
					OnCommand=function(s)
						if pn == PLAYER_1 then
							s:x(-SCREEN_WIDTH);
							s:sleep(0.05+(i-mStages)*-0.1);
							s:linear(0.4); 
							s:x(-310-20);
							s:y(23);
						else
							s:x(SCREEN_WIDTH);
							s:sleep(0.05+(i-mStages)*-0.1);
							s:linear(0.4); 
							s:x(310+24);
							s:y(23);
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
			Texture=THEME:GetPathG("","_shared/"..Model().."player"),
			InitCommand=function(s) 
			s:xy(pn==PLAYER_1 and SCREEN_LEFT-60 or SCREEN_RIGHT+60,_screen.cy-181):zoom(0.667):rotationy(pn==PLAYER_1 and 0 or 180) end,
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