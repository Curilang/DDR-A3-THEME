local pn = ...

local function SameDiffSteps(song,pn)
	if song then
		local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
		local st = GAMESTATE:GetCurrentStyle():GetStepsType()
		return song:GetOneSteps(st,diff)
	end
end
    
local function ClearLamp(song,steps,pn)
        local best_lamp = 0; --No Play
	    local profile;
		if PROFILEMAN:IsPersistentProfile(pn) then 
			prof = PROFILEMAN:GetProfile(pn); --player profile
		else 
			prof = PROFILEMAN:GetMachineProfile(); --machine profile
		end;
		if prof then
		    local st = GAMESTATE:GetCurrentStyle():GetStepsType();
		    local BestGetHighScoreList;
				if Profile.GetHighScoreListIfExists then
					BestGetHighScoreList = Profile.GetHighScoreListIfExists;
				else
					BestGetHighScoreList = Profile.GetHighScoreList;
				end;
			local list = BestGetHighScoreList(prof, song, steps);
		    if list then
		    	for score in ivalues(list:GetHighScores()) do
		    		local this_lamp = 0;
		    		if score:GetGrade() == 'Grade_Failed' then
		    			this_lamp = 1; --Failed
		    		else
		    			local missed_nontaps = (score:GetHoldNoteScore'HoldNoteScore_LetGo'
		    			+ score:GetHoldNoteScore'HoldNoteScore_MissedHold'
		    			+ score:GetTapNoteScore'TapNoteScore_HitMine')>0
		    			if missed_nontaps or score:GetTapNoteScore'TapNoteScore_Miss'>0 then
		    				this_lamp = 2; --Cleared
		    			elseif score:GetTapNoteScore'TapNoteScore_W5'>0
		    				or score:GetTapNoteScore'TapNoteScore_W4'>0
		    			then
		    				this_lamp = 3; --Good FC
		    			elseif score:GetTapNoteScore'TapNoteScore_W3'>0 then
			    			this_lamp = 4; --Great FC
			    		elseif score:GetTapNoteScore'TapNoteScore_W2'>0 then
			    			this_lamp = 5; --Perfect FC
			    		elseif score:GetTapNoteScore'TapNoteScore_W1'>0 then
			    			--no reason to keep searching, this is the best one
			    			return 6; --Marvelous FC
			    		else
			    			--this means the chart has no notes.
			    			--treat this as a normal clear.
			    			return 2; --Cleared
			    		end;
			    	end;
			    	if this_lamp > best_lamp then
			    		best_lamp = this_lamp;
			    	end;
			    end;
		    end;
	    end;
	    return best_lamp;
end

return Def.Sprite{
	InitCommand=function(self)
        self:visible(false);
        if #(GAMESTATE:GetHumanPlayers()) == 2 then
            if pn == PLAYER_1 then
                self:cropright(0.5);
            elseif pn == PLAYER_2 then
                self:cropleft(0.5);
            end;
        end;
    end;
	SetCommand=function(self,param)
		self.cur_song = param.Song;
		self:queuecommand "DiffChange";
	end;
    DiffChangeCommand=function(self)
        local steps = SameDiffSteps(self.cur_song, pn);
		self:visible(steps ~= nil);
        if steps then
			local lamp = ClearLamp(self.cur_song, steps, pn)
			if lamp == 1 then 
				self:Load(THEME:GetPathG("MusicWheelItem Song NormalPart/lamp/ClearedMark","Failed"))
				self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,1")):effectperiod(1.1)
			elseif lamp == 2 then 
				self:Load(THEME:GetPathG("MusicWheelItem Song NormalPart/lamp/ClearedMark","Cleared"))
				self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,1")):effectperiod(1.1)
			elseif lamp == 3 then 
				self:Load(THEME:GetPathG("MusicWheelItem Song NormalPart/lamp/ClearedMark","GoodFC"))
				self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.6")):effectperiod(0.09)
			elseif lamp == 4 then 
				self:Load(THEME:GetPathG("MusicWheelItem Song NormalPart/lamp/ClearedMark","GreatFC"))
				self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.6")):effectperiod(0.09)
			elseif lamp == 5 then 
				self:Load(THEME:GetPathG("MusicWheelItem Song NormalPart/lamp/ClearedMark","PFC"))
				self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.6")):effectperiod(0.09)
			elseif lamp == 6 then 
				self:Load(THEME:GetPathG("MusicWheelItem Song NormalPart/lamp/ClearedMark","MFC"))
				self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.7")):effectperiod(0.09)
			else
				self:visible(false)
			end
        end;
    end;
	CurrentStepsP1ChangedMessageCommand=function(s) s:queuecommand("DiffChange") end,
	CurrentStepsP2ChangedMessageCommand=function(s) s:queuecommand("DiffChange") end,
	CurrentSongChangedMessageCommand=function(s) s:queuecommand("DiffChange") end,
};