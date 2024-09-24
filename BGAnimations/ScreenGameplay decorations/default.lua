local t = Def.ActorFrame{};
local lastAnnouncer = ANNOUNCER:GetCurrentAnnouncer()

t[#t+1] = StatsEngine()

t[#t+1] = Def.Actor{
    AfterStatsEngineMessageCommand = function(_,params)
        local pn = params.Player
        local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)

        local aScore = params.Data.AScoring
		pss:SetScore(aScore.Score)
		pss:SetCurMaxScore(aScore.MaxScore)

        local fast, slow = 0, 0

        local fastSlow = params.Data.FastSlowRecord
			if fastSlow then
				fast = fastSlow.Fast
				slow = fastSlow.Slow
			end

        local short = ToEnumShortString(pn)
			setenv("numFast"..short, fast)
		setenv("numSlow"..short, slow)
	end,
};


t[#t+1] = Def.ActorFrame {
	Def.Actor {
		OffCommand=function(s)
			ANNOUNCER:SetCurrentAnnouncer('')
			s:sleep(BeginOutDelay()):queuecommand('Play')
		end,
		PlayCommand=function()
			local st = STATSMAN:GetCurStageStats()
			if lastAnnouncer then
				ANNOUNCER:SetCurrentAnnouncer(lastAnnouncer)
			end
			
			if st:AllFailed() then
				SOUND:PlayAnnouncer('gameplay failed')
			else
				SOUND:PlayAnnouncer('gameplay cleared')
			end
		end,
	},
	Def.Actor {
		NextCourseSongMessageCommand=function(s) s:stoptweening() end,
		CurrentSongChangedMessageCommand=function(s)
			if GAMESTATE:IsCourseMode() then
				local curStage = GAMESTATE:GetLoadingCourseSongIndex()+1
				if curStage > 1 then
					s:sleep(BeginReadyDelay()):queuecommand('Play')
				end
			end
		end,
		PlayCommand=function(s) SOUND:PlayAnnouncer('gameplay ready') end,
	},
	Def.Actor{
		NextCourseSongMessageCommand=function(s) s:sleep(2):queuecommand('Play') end,
		PlayCommand=function(s)
			local curStage = GAMESTATE:GetLoadingCourseSongIndex()+1
			local stageName = 'stage ' .. curStage
			local maxStages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages()
		
			if curStage == maxStages then
				stageName = 'stage final'
			end
			
			SOUND:PlayAnnouncer(stageName)
		end,
	},
};

for _, pn in ipairs(GAMESTATE:GetEnabledPlayers()) do	
	t[#t+1] = LoadActor("ScreenFilter",pn);	
end;

t[#t+1] = LoadActor("ScreenGameplay Danger");
t[#t+1] = LoadActor("Speed-Appearance")..{ InitCommand=function(s) s:draworder(1) end, };
t[#t+1] = LoadActor("StageFrame")..{ InitCommand=function(s) s:draworder(1) end, };

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("lifeframe",pn);
	t[#t+1] = LoadActor(THEME:GetPathG("","OptionIcon"),pn)..{
		InitCommand=function(s) 
			s:zoomx(0.64):zoomy(0.63):draworder(1):x(pn==PLAYER_1 and _screen.cx-296 or _screen.cx+318)
			s:y(IsReverse(pn) and _screen.cy-178 or _screen.cy+161)
		end,
	};
	t[#t+1] = Def.Sprite{
	Condition=GAMESTATE:GetNumPlayersEnabled() == 2 and GAMESTATE:PlayerIsUsingModifier(pn,'battery'),
	Texture="GameOver"..ToEnumShortString(pn);
	InitCommand=function(s) s:visible(false):zoom(0.667) end,
	BobCommand=function(s) s:bob():effectmagnitude(0,10,0):effectperiod(1) end,
	HealthStateChangedMessageCommand= function(self, param)
		if param.PlayerNumber == pn then
			if param.HealthState == 'HealthState_Dead' then 
				if GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):FailSetting() == 'FailType_Immediate' then
					if PREFSMAN:GetPreference("Center1Player") and GAMESTATE:GetNumPlayersEnabled() == 1 then
						self:x(_screen.cx)
					else
						self:x(pn == PLAYER_1 and ScreenGameplay_P1X() or ScreenGameplay_P2X())
					end
					self:y(_screen.cy)
				else
					self:xy(pn == PLAYER_1 and ScreenGameplay_P1X() or ScreenGameplay_P2X(),SCREEN_TOP+60)
				end
				self:visible(true):rotationz(360):linear(0.2):rotationz(0):queuecommand("Bob")
			end
		end
	end,
	NextCourseSongDelayMessageCommand=function(s)
		s:sleep(BeginOutDelay()):linear(0.2):diffusealpha(0)
	end,
	OffCommand=function(s)
		s:sleep(BeginOutDelay()):linear(0.2):diffusealpha(0)
	end,
};
end

t[#t+1] = LoadActor("ScoreFrame")..{ InitCommand=function(s) s:draworder(99) end, };


if not GAMESTATE:IsDemonstration() then
	t[#t+1] = LoadActor("message")..{ InitCommand=function(s) s:draworder(99) end, };

	t[#t+1] = loadfile(THEME:GetPathB("ScreenGameplay","out/_doors"))() .. {
		InitCommand=function(s) s:draworder(99) end,
		OffCommand=function(s)
		local st = STATSMAN:GetCurStageStats()
			-- delay before shutter close
			s:sleep(BeginOutDelay())
			if st:AllFailed() then
				s:queuecommand("AnimFailedClose")
			else
				s:queuecommand("AnimClose")
			end
		end,
	};
	t[#t+1] = loadfile(THEME:GetPathB("ScreenStageInformation","decorations/_doors"))()..{
		InitCommand=function(s) s:draworder(99) end,
		NextCourseSongMessageCommand=function(s) s:playcommand("AnimClose") end,
		CurrentSongChangedMessageCommand=function(s) s:playcommand("AnimOpen") end,
	};
	t[#t+1] = Def.ActorFrame{
		InitCommand=function(s) s:setsize(300,300):xy(_screen.cx,_screen.cy+12):draworder(99) end,
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/jacket frame"),
			InitCommand=function(s) s:diffusealpha(0) end,
			NextCourseSongMessageCommand=function(s) 
				s:zoomy(0.0129):zoomx(1.3):diffusealpha(0)
				:sleep(1.2):diffusealpha(1)
				:sleep(0.017):diffusealpha(0):zoomy(0.0645)
				:sleep(0.017):diffusealpha(1)
				:sleep(0.017):diffusealpha(0):zoomy(0.1741)
				:sleep(0.033):diffusealpha(1)
				:sleep(0.017):diffusealpha(0):zoomy(0.2806):zoomx(1.265)
				:sleep(0.017):diffusealpha(1)
				:sleep(0.017):diffusealpha(0):zoomy(0.407):zoomx(1.245)
				:sleep(0.017):diffusealpha(1)
				:sleep(0.017):diffusealpha(0):zoomy(0.527):zoomx(1.201)
				:sleep(0.017):diffusealpha(1)
				:sleep(0.017):diffusealpha(0):zoomy(0.7):zoomx(1.126)
				:sleep(0.017):diffusealpha(1)
				:sleep(0.017):diffusealpha(0):zoomy(0.790):zoomx(1.116)
				:sleep(0.017):diffusealpha(1)
				:sleep(0.017):diffusealpha(0):zoomy(0.952):zoomx(1.066)
				:sleep(0.017):diffusealpha(1)
				:sleep(0.017):diffusealpha(0)
			end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/jacket frame"),
			InitCommand=function(s) s:diffusealpha(0) end,
			NextCourseSongMessageCommand=function(s)
				s:sleep(1.5):zoomy(1.033):zoomx(1.033)
				:sleep(0.034):diffusealpha(1)
				:sleep(0.017):diffusealpha(0)
				:sleep(0.016):diffusealpha(1)
				:sleep(0.018):diffusealpha(0)
				:sleep(0.017):diffusealpha(1)
				:sleep(0.016):diffusealpha(0)
				:sleep(0.018):diffusealpha(1)
				:sleep(0.017):diffusealpha(0)
				:sleep(0.016):diffusealpha(1)
				:sleep(0.018):diffusealpha(0)
				:sleep(0.150):diffusealpha(1)
				:sleep(0.017):diffusealpha(0)
			end,
		};
	};
	t[#t+1] = Def.ActorFrame {
		InitCommand=function(s) s:x(_screen.cx):y(_screen.cy+12):draworder(99) end,
		Def.ActorFrame {
			BeginCommand=function(s)
				s:GetChild('Actual Jacket'):Load(GetJacketPath(GetSong())):setsize(300,300)
			end,
			NextCourseSongMessageCommand=function(s)
				s:GetChild('Actual Jacket'):Load(GetJacketPath(GetSong())):setsize(300,300)
				s:finishtweening():diffusealpha(0):zoom(1):sleep(1.85):linear(0.2):diffusealpha(1)
			end,
			CurrentSongChangedMessageCommand=function(s)
				s:sleep(BeginReadyDelay()):linear(0.06):zoom(1.5):diffusealpha(0)
			end,
			Def.Sprite { Name='Actual Jacket', },
		},
	};
	
	t[#t+1] = Def.ActorFrame {
		InitCommand=function(s) s:Center():draworder(99) end,
		Def.Sprite {
			InitCommand=function(s) s:diffusealpha(0):blend(('BlendMode_Add')) end,
			OffCommand=function(s)
				if not STATSMAN:GetCurStageStats():AllFailed() then
					s:Load(THEME:GetPathG("","_shared/message/BLUE"))
					s:sleep(BeginOutDelay())
				else
					s:Load(THEME:GetPathG("","_shared/message/RED"))
				end
				s:queuecommand('Animate')
			end,
			AnimateCommand=function(s) 
				s:zoom(1):linear(0.264):diffusealpha(1):zoom(0.667) 
			end,
		};
		Def.Sprite {
			InitCommand=function(s) s:diffusealpha(0) end,
			OffCommand=function(s)
				if not STATSMAN:GetCurStageStats():AllFailed() then
					s:Load(THEME:GetPathG("","_shared/message/"..ClearedToLoad()))
					s:sleep(BeginOutDelay())
				else
					s:Load(THEME:GetPathG("","_shared/message/FAILED"))
				end
				s:queuecommand('Animate')
			end,
			AnimateCommand=function(s)
				s:diffusealpha(1):zoom(0)
				s:linear(0.1):zoom(0.418)
				s:linear(0.1):diffusealpha(1):zoomx(0.62):zoomy(0.64)
				s:linear(0.1):diffusealpha(1):zoomx(0.69):zoomy(0.71)
				s:linear(0.1):zoom(0.667)
			end,
		};
		Def.Sprite {
			InitCommand=function(s) s:diffusealpha(0) end,
			OffCommand=function(s)
				if not STATSMAN:GetCurStageStats():AllFailed() then
					s:Load(THEME:GetPathG("","_shared/message/"..ClearedToLoad()))
					s:sleep(BeginOutDelay())
				else
					s:Load(THEME:GetPathG("","_shared/message/FAILED"))
				end
				s:queuecommand('Animate')
			end,
			AnimateCommand=function(s)
				s:diffusealpha(0):zoom(0)
				s:linear(0.1):zoom(1.2)
				s:linear(0.1):diffusealpha(0.5):zoomx(0.62):zoomy(0.64)
				s:linear(0.1):diffusealpha(0.5):zoomx(0.72):zoomy(0.74)
				s:linear(0.1):diffusealpha(0):zoom(0.92)
			end,
		};
	};
end

return t