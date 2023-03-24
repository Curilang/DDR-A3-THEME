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

return t