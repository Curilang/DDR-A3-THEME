local c;
local player = Var "Player";

local tTotalJudgments = {};

local JudgeCmds = {
	TapNoteScore_W1 = THEME:GetMetric( "Judgment", "JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment", "JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment", "JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment", "JudgmentW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment", "JudgmentW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment", "JudgmentMissCommand" );
};

local TNSFrames = {
	TapNoteScore_W1 = 0;
	TapNoteScore_W2 = 1;
	TapNoteScore_W3 = 2;
	TapNoteScore_W4 = 3;
	TapNoteScore_W5 = 4;
	TapNoteScore_Miss = 4;
};

local t = Def.ActorFrame {};



t[#t+1] = Def.ActorFrame {
	LoadActor("FastSlow")..{
		InitCommand=function(s) s:diffusealpha(0):animate(false):xy(80,IsReverse(player) and -70 or 60) end,
		JudgmentMessageCommand=function(self, params)
			if not ShowFastSlow() then return end;
			if params.Player ~= player then return end;
			if 		params.TapNoteScore == 'TapNoteScore_W1' 
				or 	params.TapNoteScore == 'TapNoteScore_W5' 
				or	params.TapNoteScore == 'TapNoteScore_Miss'
				or	params.TapNoteScore == 'TapNoteScore_HitMine' 
				or	params.TapNoteScore == 'TapNoteScore_AvoidMine' 
				or	params.HoldNoteScore 
			then return end;
			self:finishtweening();
			if params.Early then
				self:setstate(0);
			else
				self:setstate(1);
			end
			self:queuecommand("Animate");
		end;
		AnimateCommand=cmd(diffusealpha,1;zoom,0.37*1.5;linear,0.05;zoom,0.34*1.5;sleep,0.4;diffusealpha,0);
	};
	
	LoadActor("Judgment") .. {
		Name="Judgment";
		InitCommand=cmd(pause;visible,false);
		OnCommand=THEME:GetMetric("Judgment","JudgmentOnCommand");
		ResetCommand=cmd(finishtweening;stopeffect;visible,false);
	};
	InitCommand = function(self) c = self:GetChildren(); end;
	JudgmentMessageCommand=function(self, param)
		if param.Player ~= player then return end;
		if param.HoldNoteScore then return end;
		
		local iNumStates = c.Judgment:GetNumStates();
		local iFrame = TNSFrames[param.TapNoteScore];
		
		if not iFrame then return end
		
		if iNumStates == 12 then
			iFrame = iFrame * 2;
			if not param.Early then
				iFrame = iFrame + 1;
			end
		end
		
		local fTapNoteOffset = param.TapNoteOffset;
		
		if param.HoldNoteScore then
			fTapNoteOffset = 1;
		else
			fTapNoteOffset = param.TapNoteOffset; 
		end
		
		if param.TapNoteScore == 'TapNoteScore_Miss' then
			fTapNoteOffset = 1;
			bUseNegative = true;
		else
			bUseNegative = false;
		end;
		
		if fTapNoteOffset ~= 1 then
			tTotalJudgments[#tTotalJudgments+1] = bUseNegative and fTapNoteOffset or math.abs( fTapNoteOffset );
		end
		
		self:playcommand("Reset");

		c.Judgment:visible( not bShowProtiming );
		c.Judgment:setstate( iFrame );
		JudgeCmds[param.TapNoteScore](c.Judgment);
	end;
};


return t;
