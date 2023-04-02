local t = LoadFallbackB()

t[#t+1] = StatsEngine()

t[#t+1] = Def.Actor{
    AfterStatsEngineMessageCommand = function(self, params)
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

	end;
};

local lastAnnouncer = ANNOUNCER:GetCurrentAnnouncer()
t[#t+1] = Def.ActorFrame {
	Def.Actor {
		InitCommand=function(s) 
			ANNOUNCER:SetCurrentAnnouncer('')
			s:sleep(BeginReadyDelay()):queuecommand('Play') 
		end,
		PlayCommand=function(s) 
			if lastAnnouncer then
				ANNOUNCER:SetCurrentAnnouncer(lastAnnouncer)
			end
			SOUND:PlayAnnouncer('gameplay ready') end,
	},
};

if not GAMESTATE:IsDemonstration() then
	if ShowCutIns() then 
		if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
			t[#t+1] = LoadActor("Cut-In/DanceStages")
		elseif GetUserPref("OptionRowGameplayBackground")=='SNCharacters' then
			t[#t+1] = LoadActor("Cut-In/SNCharacters")
		end
	end
end
	
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
			s:player(pn):zoomx(0.64):zoomy(0.63):draworder(1):x(pn==PLAYER_1 and _screen.cx-296 or _screen.cx+318)
			s:y(IsReverse(pn) and _screen.cy-179 or _screen.cy+161)
		end,
	};
end

t[#t+1] = LoadActor("ScoreFrame")..{ InitCommand=function(s) s:draworder(99) end, };
t[#t+1] = LoadActor("message")..{ InitCommand=function(s) s:draworder(99) end, };

if not GAMESTATE:IsDemonstration() then
	t[#t+1] = LoadActor("doors")..{ InitCommand=function(s) s:draworder(99) end, };
end

t[#t+1] = Def.ActorFrame {
	Condition=not GAMESTATE:IsDemonstration(),
	InitCommand=function(s) s:x(_screen.cx):y(_screen.cy+12):draworder(99) end,
	OnCommand=function(s) s:sleep(BeginReadyDelay()):linear(0.06):zoom(1.5):diffusealpha(0) end,
	Def.Sprite {
		OnCommand=function(s)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			s:Load(GetJacketPath(song))
		end;
		s:setsize(300,300)
		end,
	};
};

return t