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
					Texture=Model()..ToEnumShortString(diff);
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
									s:Load(THEME:GetPathG("_shared/grade hex/Cleared","MarvelousFC"))
									s:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.7")):effectperiod(0.09)
								elseif greats == 0 then
									s:Load(THEME:GetPathG("_shared/grade hex/Cleared","PerfectFC"))
									s:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.7")):effectperiod(0.09)
								elseif (misses+boos+goods) == 0 then
									s:Load(THEME:GetPathG("_shared/grade hex/Cleared","GreatFC"))
									s:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.7")):effectperiod(0.09)
								elseif (misses+boos) == 0 then
									s:Load(THEME:GetPathG("_shared/grade hex/Cleared","GoodFC"))
									s:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.7")):effectperiod(0.09)
								end
								s:visible(true)
							else
								if topscore:GetGrade() ~= 'Grade_Failed' then
									s:visible(true)
									s:Load(THEME:GetPathG("_shared/grade hex/Cleared","Cleared"))
								else
									s:visible(true)
									s:Load(THEME:GetPathG("_shared/grade hex/Cleared","Failed"))
								end
							end
						else
							s:visible(false)
						end
					end
				};
			};
			Def.Sprite{
				Texture="flash",
				InitCommand=function(s) s:diffusealpha(0):y(-2) end,
				StartSelectingStepsMessageCommand=function(s) s:sleep(0.3):linear(0.05):diffusealpha(1):sleep(0.05):linear(0.1):diffusealpha(0) end,
			};
			Def.ActorFrame{
			InitCommand=function(s) s:visible(false):queuecommand("Set") end,
				SetCommand=function(s)
					local song = GAMESTATE:GetCurrentSong()
					local st = GAMESTATE:GetCurrentStyle():GetStepsType()
					if song then
						local steps = song:GetOneSteps(st,diff)
						if steps then
							if steps:GetRadarValues(player):GetValue('RadarCategory_Mines') >= 1 then
								s:visible(true)
							else
								s:visible(false)
							end
						else
							s:visible(false)
						end
					else
						s:visible(false)
					end
				end,
				Def.Sprite{ Texture=THEME:GetPathB("ScreenSelectMusic","overlay/ShockArrows/base"),
					InitCommand=function(s) s:xy(103,55):zoom(0.867) end,
				};
				Def.Sprite{ Texture=THEME:GetPathB("ScreenSelectMusic","overlay/ShockArrows/title"),
					InitCommand=function(s) s:xy(99,55):zoom(0.507) end,
				};
				Def.Sprite{ Texture=THEME:GetPathB("ScreenSelectMusic","overlay/ShockArrows/shock"),
					InitCommand=function(s) s:xy(143,46):zoom(0.767) end,
				};
				Def.Sprite{ Texture=THEME:GetPathB("ScreenSelectMusic","overlay/ShockArrows/eff"),
					InitCommand=function(s) s:xy(143,46):zoom(0.767):diffuseshift()
						s:effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.8"))
						s:effectperiod(0.15) 
					end,
				};
				
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
