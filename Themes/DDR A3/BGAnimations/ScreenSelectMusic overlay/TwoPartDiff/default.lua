--This file uses AddChildFromPath since I need to load as many actors as there are steps
--Thus there are no constructors, it will just take the current song and display for as many
--joined players. And do a lot of crazy stuff to handle two actorframes.
local X_SPACING, Y_SPACING = 25,139;
local X_SPACING = 5,134;
local function getXSpacing(pn)
	return pn == PLAYER_1 and X_SPACING*-1 or X_SPACING
end;


--local song = SONGMAN:FindSong("Ace For Aces")
local song = GAMESTATE:GetCurrentSong()
local songSteps = SongUtil.GetPlayableSteps(song)
assert(#songSteps>0,"Hey idiot, this song has no steps for your game mode")
local numDiffs = #songSteps
--Is defining this even necessary?
local center = math.ceil(numDiffs/2)

--This is the variable for holding the frame after it's compiled
local frame = {
	["PlayerNumber_P1"] = nil,
	["PlayerNumber_P2"] = nil
}
--Take a wild guess.
local selection = {
	["PlayerNumber_P1"] = 1,
	["PlayerNumber_P2"] = 1
}



for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
	local foundDiff = false
	if GAMESTATE:GetPreferredDifficulty(pn) then
	--SOUND:PlayOnce(THEME:GetPathS("ScreenSelectMusic","Select Level "..RSL));
		for i,steps in ipairs(songSteps) do
			if steps:GetDifficulty() == GAMESTATE:GetPreferredDifficulty(pn) then
				selection[pn] = i
				GAMESTATE:SetCurrentSteps(pn,steps)
				foundDiff = true
			end;
		end;
	end;
	if not foundDiff then
		GAMESTATE:SetCurrentSteps(pn,songSteps[1])
	end;
end;


local function adjustScrollerFrame(pn)
	for i=1,numDiffs do
		local is_focus = (i == selection[pn])
		frame[pn]:GetChild(i):stoptweening():decelerate(.2):zoom(is_focus and 1 or 0.7):xy(math.abs(i-selection[pn])*getXSpacing(pn),(i-selection[pn])*Y_SPACING):GetChild("Highlight"):visible(is_focus)
	end;
end;

local outdelay = 1

local function genScrollerFrame(player)
	local f = Def.ActorFrame{};
	for i,steps in ipairs(songSteps) do
		local diff = steps:GetDifficulty();
		f[i] = Def.ActorFrame{
			InitCommand=cmd(xy,math.abs(i-center)*getXSpacing(player),(i-center)*Y_SPACING);
			["OK"..player.."MessageCommand"]=function(s)
				s:queuecommand("Out")
			end,
			OffCommand=function(s) s:playcommand("OK"..player) end,
			Name=i;
			Def.ActorFrame{
				StartSelectingStepsMessageCommand=function(s) s:diffusealpha(0):sleep(0.5):linear(0.1):diffusealpha(1) end,
				OffCommand=function(s)
					s:sleep(outdelay):linear(0.2):diffusealpha(0)
				end,
				Def.Sprite{
					Texture=GetCurrentModel().."/diff "..ToEnumShortString(diff);
					InitCommand=cmd(zoom,1;y,-2)
				};
			};
			Def.Sprite{
				StartSelectingStepsMessageCommand=function(s) s:diffusealpha(0):sleep(0.5):linear(0.1):diffusealpha(1) end,
				Texture="line";
				Name="Highlight";
				InitCommand=cmd(y,-2;visible,i==selection[player];diffuseramp;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,1");effectperiod,.5);
			};
			Def.ActorFrame{
				Name="Ok",
				InitCommand=function(s) s:xy(-77,8) end,
				Def.Sprite{
					Texture="eff",
					InitCommand=function(s) s:diffusealpha(0) end,
					OutCommand=function(s)
						if i == selection[player] then
							s:diffusealpha(1):linear(0.3):zoom(1):diffusealpha(0)
						end
					end,
				};
				Def.Sprite{
					Texture="ok",
					InitCommand=function(s) s:diffusealpha(0):rotationy(-90):zoom(1.3):x(0):y(2) end,
					OutCommand=function(s)
						if i == selection[player] then
							s:diffusealpha(1):linear(0.1):zoom(0.9):rotationy(0)
						end
					end,
				};

                Def.Sprite{
					Texture="wait",
					InitCommand=function(s) s:diffusealpha(0):rotationy(-90):zoom(1.2):y(48) end,
					OutCommand=function(s)
						if i == selection[player] then
							s:diffusealpha(1):linear(0.1):zoom(0.8):rotationy(0)
						end
					end,
				};
				Def.Sprite{
					Texture="dot",
					InitCommand=function(s) s:diffusealpha(0):zoom(1):y(56):x(75) end,
					AnimateCommand=function(s) s:sleep(0.2):diffusealpha(0):sleep(0.1):diffusealpha(1):sleep(0.1):queuecommand("Animate") end,
					OutCommand=function(s)
						if i == selection[player] then
							s:sleep(0.2):diffusealpha(1):playcommand("Animate")
						end
					end,
				};
				Def.Sprite{
					Texture="dot",
					InitCommand=function(s) s:diffusealpha(0):zoom(1):y(56):x(85) end,
					AnimateCommand=function(s) s:sleep(0.1):diffusealpha(0):sleep(0.2):diffusealpha(1):sleep(0.1):queuecommand("Animate") end,
					OutCommand=function(s)
						if i == selection[player] then
							s:sleep(0.3):diffusealpha(1):playcommand("Animate")
						
						end
					end,
				};
				Def.Sprite{
					Texture="dot",
					InitCommand=function(s) s:diffusealpha(0):zoom(1):y(56):x(95) end,
					AnimateCommand=function(s) s:diffusealpha(0):sleep(0.3):diffusealpha(1):sleep(0.1):queuecommand("Animate") end,
					OutCommand=function(s)
						if i == selection[player] then
							s:sleep(0.4):diffusealpha(1):playcommand("Animate")
						
						end
					end,
				};
			};
			LoadFont("difficulty numbers")..{
				StartSelectingStepsMessageCommand=function(s) s:diffusealpha(0):sleep(0.5):linear(0.1):diffusealpha(1) end,
				Text=steps:GetMeter();
				InitCommand=cmd(xy,62,-17);
				OffCommand=function(s)
					s:sleep(outdelay):linear(0.2):x(40):diffusealpha(0)
				end,
			};
			Def.ActorFrame{
				InitCommand=function(s) s:xy(84.6,-59):zoom(0.75) end,
				StartSelectingStepsMessageCommand=function(s) s:diffusealpha(0):sleep(0.5):linear(0.1):diffusealpha(1) end,
				Def.Sprite{
					InitCommand=function(s) s:queuecommand("Set"):xy(29,13):zoom(1.2) end,
					SetCommand=function(s)
						local ClearedRank = 0;
						local FullComboRank = 0;
						local profile;
						local st = GAMESTATE:GetCurrentStyle():GetStepsType()
						local steps = song:GetOneSteps(st,diff)
	
						if PROFILEMAN:IsPersistentProfile(player) then
							profile = PROFILEMAN:GetProfile(player)
						else
							profile = PROFILEMAN:GetMachineProfile()
						end
						
						local scorelist = profile:GetHighScoreList(song,steps)
						local scores = scorelist:GetHighScores()
						local topscore=0;
						local topgrade;
						local temp=#scores;
	
						if scores[1] then
							topscore = scores[1]:GetScore()
							for i=1,temp do
								topgrade = scores[1]:GetGrade()
								curgrade = scores[i]:GetGrade()
								if scores[1]:GetScore()>1 then
									if scores[1]:GetScore()>=1000000 and topgrade == "Grade_Tier07" then
										ClearedRank = 7;
										break;
									else
										if ToEnumShortString(curgrade) ~= "Failed" then
											local gradenum = tonumber(string.sub(curgrade,-2,-1));
											ClearedRank = gradenum;
											break
										else
											if i == temp then
												ClearedRank = 7;
												break
											end
										end
									end
								else
									ClearedRank = 0;
								end
							end
							local scoresHasUsedBatterAndCleared = false;
		
							for i=1,temp do
								if scores[i] then
									topscore=scores[i]
									assert(topscore)
									local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
									+topscore:GetTapNoteScore("TapNoteScore_HitMine")+topscore:GetHoldNoteScore("HoldNoteScore_LetGo")
									local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
									local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
									local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
									local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
									local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
									local hasUsedLittle = string.find(topscore:GetModifiers(),"Little")
									local hasUsedBattery = string.find(topscore:GetModifiers(),"Lives")
		
									if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 and (not hasUsedLittle) and topscore:GetGrade()~="Grade_Failed"  then
										if (goods+greats+perfects) == 0 then
												FullComboRank = 1;
												break;
										elseif goods+greats == 0 then
												FullComboRank = 2;
												break;
										elseif (misses+boos+goods) == 0 then
												FullComboRank = 4;
												if i==1 then
													FullComboRank = 3;
												end;
												break;
										elseif (misses+boos) == 0 then
												FullComboRank = 6;
												if i==1 then
													FullComboRank = 5;
												end;
												break;
										end;
									else
										if topscore:GetGrade()~="Grade_Failed" then
											if hasUsedBattery  then
												scoresHasUsedBatteryAndCleared = true;
												FullComboRank = 7;
											else 
												scoresHasUsedBatteryAndCleared = scoresHasUsedBatteryAndCleared or false;
												FullComboRank = 8;
											end
										end
									end;
								end
							end;
						
							if scoresHasUsedBatteryAndCleared and FullComboRank == 8 then
								FullComboRank = 7;
							end  
						end
					local effecttime = 0.09
					if ClearedRank == 0 then --NoPlayed
						s:LoadBackground(THEME:GetPathG("_shared/grade hex/Cleared","MarvelousFC"));
						(cmd(diffuseshift;effectcolor1,1,1,1,0;effectcolor2,1,1,1,0;effectperiod,effecttime))(s);
					elseif ClearedRank == 7 then --E
						s:LoadBackground(THEME:GetPathG("_shared/grade hex/Cleared","Failed"));
						(cmd(diffuseshift;effectcolor1,1,1,1,0.65;effectcolor2,1,1,1,1;effectperiod,1.1))(s);
					elseif FullComboRank == 8 then -- 8=NoFCWithLifeBar
						s:LoadBackground(THEME:GetPathG("_shared/grade hex/Cleared","NoFCLifeBar"));
						(cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,1;effectperiod,effecttime))(s);
					elseif FullComboRank == 7 then --7=NoFCWithBatteryLives
						s:LoadBackground(THEME:GetPathG("_shared/grade hex/Cleared","NoFCBatteryLives"));
						(cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,1;effectperiod,effecttime))(s);
					elseif FullComboRank == 6 or FullComboRank == 5 then --6=GoodOldFC
						s:LoadBackground(THEME:GetPathG("_shared/grade hex/Cleared","GoodFC"));
						(cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.6;effectperiod,effecttime))(s);
					elseif FullComboRank == 4 or FullComboRank == 3 then -- 4=GreatOldFC
						s:LoadBackground(THEME:GetPathG("_shared/grade hex/Cleared","GreatFC"));
						(cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.6;effectperiod,effecttime))(s);
					elseif FullComboRank == 2 then --2 = PFC
						s:LoadBackground(THEME:GetPathG("_shared/grade hex/Cleared","PerfectFC"));
						(cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.70;effectperiod,effecttime))(s);
					elseif FullComboRank == 1 then --1 = MFC
						s:LoadBackground(THEME:GetPathG("_shared/grade hex/Cleared","MarvelousFC"));
						(cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.70;effectperiod,effecttime))(s);
					end
				end
				};
			};
			Def.Sprite{
				Texture="flash",
				InitCommand=function(s) s:diffusealpha(0):y(-2) end,
				StartSelectingStepsMessageCommand=function(s) s:sleep(0.3):linear(0.05):diffusealpha(1):sleep(0.05):linear(0.1):diffusealpha(0) end,
			};
		};
	end;
	return f;
end;

local keyset={0,0}

local function DiffInputHandler(event)
	local pn= event.PlayerNumber
	local button = event.button
	if event.type == "InputEventType_Release" then return end
	--SOUND:PlayOnce(THEME:GetPathS("_MusicWheel","Change"),true)
	if (button == "MenuUp" or button == "MenuLeft") and selection[pn] > 1 and GAMESTATE:IsPlayerEnabled(pn) and keyset[pn] ~= 1 then
		SOUND:PlayOnce(THEME:GetPathS("","ScreenSelectMusic difficulty harder"));
		selection[pn] = selection[pn] - 1
		GAMESTATE:SetCurrentSteps(pn,songSteps[selection[pn]])
		GAMESTATE:SetPreferredDifficulty(pn,songSteps[selection[pn]]:GetDifficulty())
		adjustScrollerFrame(pn)
		MESSAGEMAN:Broadcast("TwoDiffLeft"..pn)
		return false;
	elseif (button == "MenuDown" or button == "MenuRight") and selection[pn] < numDiffs and GAMESTATE:IsPlayerEnabled(pn) and keyset[pn] ~= 1 then
		SOUND:PlayOnce(THEME:GetPathS("","ScreenSelectMusic difficulty harder"));
		selection[pn] = selection[pn] + 1
		GAMESTATE:SetCurrentSteps(pn,songSteps[selection[pn]])
		GAMESTATE:SetPreferredDifficulty(pn,songSteps[selection[pn]]:GetDifficulty())
		MESSAGEMAN:Broadcast("TwoDiffRight"..pn)
		adjustScrollerFrame(pn)
		return true;
	elseif (button == "Start") and GAMESTATE:IsPlayerEnabled(pn) then
		keyset[pn] = 1
		MESSAGEMAN:Broadcast("OK"..pn)
	else
	end;
end;

local t = Def.ActorFrame{
	InitCommand=function(s)
		s:sleep(0.5):queuecommand("Add")
	end,
	AddCommand=function(s)
		SCREENMAN:GetTopScreen():AddInputCallback(DiffInputHandler)
	end,
	SongUnchosenMessageCommand=function(s) 
		SCREENMAN:GetTopScreen():RemoveInputCallback(DiffInputHandler) 
		s:sleep(0.1):linear(0.2):diffusealpha(0) 
	end,
	OffCommand=function(s)
		SCREENMAN:GetTopScreen():RemoveInputCallback(DiffInputHandler)
		s:sleep(outdelay):diffusealpha(1):sleep(0.05):diffusealpha(0):sleep(0.05):diffusealpha(0.5):sleep(0.05):diffusealpha(0):sleep(0.05):diffusealpha(0.25):sleep(0.05):linear(0.05):diffusealpha(0)
	end,
	genScrollerFrame(PLAYER_1)..{
		Condition=GAMESTATE:IsSideJoined(PLAYER_1);
		InitCommand=function(self)
			frame[PLAYER_1] = self;
			adjustScrollerFrame(PLAYER_1)
			self:xy(SCREEN_LEFT+302,SCREEN_CENTER_Y-10);
			self:zoom(0.667);
		end;
	};
	genScrollerFrame(PLAYER_2)..{
		Condition=GAMESTATE:IsSideJoined(PLAYER_2);
		InitCommand=function(self)
			frame[PLAYER_2] = self;
			adjustScrollerFrame(PLAYER_2)
			self:xy(SCREEN_RIGHT-302,SCREEN_CENTER_Y-10)
			self:zoom(0.667);
		end;
	};
	SOUND:PlayAnnouncer("select level")
}
return t;
