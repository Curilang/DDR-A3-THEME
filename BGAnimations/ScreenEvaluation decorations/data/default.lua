local player = ...;

local Combo = 	STATSMAN:GetCurStageStats():GetPlayerStageStats(player):MaxCombo();

local Marvelous = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W1");
local Perfect = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W2");
local Great = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W3");
local Good = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W4");
local Ok = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetHoldNoteScores("HoldNoteScore_Held");
local Miss = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_Miss") + STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W5");

local Fast=getenv("numFast"..ToEnumShortString(player));
local Slow=getenv("numSlow"..ToEnumShortString(player));

local Score = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetScore();
local EXScore = math.floor(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetPossibleDancePoints())*(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetPercentDancePoints())+0.5


local Large = Def.BitmapText{
	Font="_itc avant garde pro bk 20px",
	InitCommand=function(s) s:zoom(1.2) end,
};

local Judge = Def.BitmapText{
	Font="_helveticaneuelt pro 55 roman 17px",
	InitCommand=function(s) s:zoom(1.3):halign(1)
		:DiffuseAndStroke(Color.Black,Color.White)
	end,
};

local t = Def.ActorFrame{
	LoadActor("scre_score_base");
	Def.Sprite{
		InitCommand=function(s)
			if IsEXScore() then
				s:Load(THEME:GetPathB("ScreenEvaluation","decorations/data/scre_ex_base"))
			else
				s:Load(THEME:GetPathB("ScreenEvaluation","decorations/data/scre_normal_base"))
			end
		end,
		};
	Def.Sprite{ 
		InitCommand=function(s)
			s:Load(THEME:GetPathB("ScreenEvaluation","decorations/data/scre_fastslow_base.png"))
			s:visible(ShowFastSlow())
		end,
	};
	Large..{
		Name="MaxCombo",
		InitCommand=function(s)
			s:xy(90,-105):halign(1)
			:settextf(Combo)
		end,
	};
	Judge..{
		Name="Marvelous",
		InitCommand=function(s)
			s:xy(93,-76):halign(1)
			:settextf(Marvelous)
		end,
	};
	Judge..{
		Name="Perfect",
		InitCommand=function(s)
			s:xy(93,-45):halign(1)
			:settextf(Perfect)
		end,
	};
	Judge..{
		Name="Great",
		InitCommand=function(s)
			s:xy(93,-15):halign(1)
			:settextf(Great)
		end,
	};
	Judge..{
		Name="Good",
		InitCommand=function(s)
			s:xy(93,15):halign(1)
			:settextf(Good)
		end,
	};
	Judge..{
		Name="Ok",
		InitCommand=function(s)
			s:xy(93,45):halign(1)
			:settextf(Ok)
		end,
	};
	Judge..{
		Name="Miss",
		InitCommand=function(s)
			s:xy(93,75):halign(1)
			:settextf(Miss)
		end,
	};
	Large..{
		InitCommand=function(s) s:y(107):halign(1)
			if IsEXScore() then
				s:x(133):settextf("%4d",Score)
			else
				s:x(93):settextf("%4d",EXScore)
			end
		end,
	};
};

if ShowFastSlow() then
t[#t+1] = Def.ActorFrame{
	Judge..{
		Name="Fast",
		InitCommand=function(s) s:xy(205,11):halign(1):settextf(Fast) end,
	};
	Judge..{
		Name="Slow",
		InitCommand=function(s) s:xy(205,70):halign(1):settextf(Slow) end,
	};
};
end

return t;