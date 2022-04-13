local pn = ...;
local t = Def.ActorFrame {};
local CaloriesToday = PROFILEMAN:GetProfile(pn):GetCaloriesBurnedToday();

local CaloriesPercent;
	if CaloriesToday >= 0 and CaloriesToday <= 5 then
		CaloriesPercent = ((CaloriesToday/5)*100)
	elseif CaloriesToday >= 5.01 and CaloriesToday <= 30 then
		CaloriesPercent = ((CaloriesToday/30)*100)
	elseif CaloriesToday >= 30.01 and CaloriesToday <= 50 then
		CaloriesPercent = ((CaloriesToday/50)*100)
	elseif CaloriesToday >= 50.01 and CaloriesToday <= 60 then
		CaloriesPercent = ((CaloriesToday/60)*100)
	elseif CaloriesToday >= 60.01 and CaloriesToday <= 70 then
		CaloriesPercent = ((CaloriesToday/70)*100)
	elseif CaloriesToday >= 70.01 and CaloriesToday <= 85 then
		CaloriesPercent = ((CaloriesToday/85)*100)
	elseif CaloriesToday >= 85.01 and CaloriesToday <= 100 then
		CaloriesPercent = ((CaloriesToday/100)*100)
	elseif CaloriesToday >= 100.01 and CaloriesToday <= 120 then
		CaloriesPercent = ((CaloriesToday/120)*100)
	elseif CaloriesToday >= 120.01 and CaloriesToday <= 150 then
		CaloriesPercent = ((CaloriesToday/150)*100)
	elseif CaloriesToday >= 150.01 and CaloriesToday <= 200 then
		CaloriesPercent = ((CaloriesToday/200)*100)
	elseif CaloriesToday >= 200.01 and CaloriesToday <= 220 then
		CaloriesPercent = ((CaloriesToday/220)*100)
	elseif CaloriesToday >= 220.01 and CaloriesToday <= 235 then
		CaloriesPercent = ((CaloriesToday/235)*100)
	elseif CaloriesToday >= 235.01 and CaloriesToday <= 250 then
		CaloriesPercent = ((CaloriesToday/250)*100)
	elseif CaloriesToday >= 250.01 and CaloriesToday <= 280 then
		CaloriesPercent = ((CaloriesToday/280)*100)
	elseif CaloriesToday >= 280.01 and CaloriesToday <= 300 then
		CaloriesPercent = ((CaloriesToday/300)*100)
	elseif CaloriesToday >= 300.01 and CaloriesToday <= 330 then
		CaloriesPercent = ((CaloriesToday/330)*100)
	elseif CaloriesToday >= 330.01 and CaloriesToday <= 355 then
		CaloriesPercent = ((CaloriesToday/355)*100)
	elseif CaloriesToday >= 355.01 and CaloriesToday <= 400 then
		CaloriesPercent = ((CaloriesToday/400)*100)
	elseif CaloriesToday >= 400.01 and CaloriesToday <= 430 then
		CaloriesPercent = ((CaloriesToday/430)*100)
	elseif CaloriesToday >= 430.01 and CaloriesToday <= 450 then
		CaloriesPercent = ((CaloriesToday/450)*100)
	elseif CaloriesToday >= 450.01 and CaloriesToday <= 505 then
		CaloriesPercent = ((CaloriesToday/505)*100)
	elseif CaloriesToday >= 505.01 and CaloriesToday <= 550 then
		CaloriesPercent = ((CaloriesToday/550)*100)
	elseif CaloriesToday >= 550.01 and CaloriesToday <= 570 then
		CaloriesPercent = ((CaloriesToday/570)*100)
	elseif CaloriesToday >= 570.01 and CaloriesToday <= 600 then
		CaloriesPercent = ((CaloriesToday/600)*100)
	elseif CaloriesToday >= 600.01 and CaloriesToday <= 620 then
		CaloriesPercent = ((CaloriesToday/620)*100)	
	elseif CaloriesToday >= 620.01 and CaloriesToday <= 700 then
		CaloriesPercent = ((CaloriesToday/700)*100)	
	elseif CaloriesToday >= 700.01 and CaloriesToday <= 740 then
		CaloriesPercent = ((CaloriesToday/740)*100)	
	elseif CaloriesToday >= 740.01 and CaloriesToday <= 870 then
		CaloriesPercent = ((CaloriesToday/870)*100)
	elseif CaloriesToday >= 870.01 and CaloriesToday <= 900 then
		CaloriesPercent = ((CaloriesToday/900)*100)			
	else
		CaloriesPercent = 100
	end

local CaloriesCrop
	if CaloriesPercent >= 0 and CaloriesPercent <= 0.99 then
		CaloriesCrop = 1
	elseif CaloriesPercent >= 1 and CaloriesPercent <= 1.99 then
		CaloriesCrop = 0.99
	elseif CaloriesPercent >= 2 and CaloriesPercent <= 2.99 then
		CaloriesCrop = 0.98
	elseif CaloriesPercent >= 3 and CaloriesPercent <= 3.99 then
		CaloriesCrop = 0.97
	elseif CaloriesPercent >= 4 and CaloriesPercent <= 4.99 then
		CaloriesCrop = 0.96
	elseif CaloriesPercent >= 5 and CaloriesPercent <= 5.99 then
		CaloriesCrop = 0.95
	elseif CaloriesPercent >= 6 and CaloriesPercent <= 6.99 then
		CaloriesCrop = 0.94
	elseif CaloriesPercent >= 7 and CaloriesPercent <= 7.99 then
		CaloriesCrop = 0.93
	elseif CaloriesPercent >= 8 and CaloriesPercent <= 8.99 then
		CaloriesCrop = 0.92
	elseif CaloriesPercent >= 9 and CaloriesPercent <= 9.99 then
		CaloriesCrop = 0.91
	elseif CaloriesPercent >= 10 and CaloriesPercent <= 10.99 then
		CaloriesCrop = 0.90
	elseif CaloriesPercent >= 11 and CaloriesPercent <= 11.99 then
		CaloriesCrop = 0.89
	elseif CaloriesPercent >= 12 and CaloriesPercent <= 12.99 then
		CaloriesCrop = 0.88
	elseif CaloriesPercent >= 13 and CaloriesPercent <= 13.99 then
		CaloriesCrop = 0.87
	elseif CaloriesPercent >= 14 and CaloriesPercent <= 14.99 then
		CaloriesCrop = 0.86
	elseif CaloriesPercent >= 15 and CaloriesPercent <= 15.99 then
		CaloriesCrop = 0.85
	elseif CaloriesPercent >= 16 and CaloriesPercent <= 16.99 then
		CaloriesCrop = 0.84
	elseif CaloriesPercent >= 17 and CaloriesPercent <= 17.99 then
		CaloriesCrop = 0.83
	elseif CaloriesPercent >= 18 and CaloriesPercent <= 18.99 then
		CaloriesCrop = 0.82
	elseif CaloriesPercent >= 19 and CaloriesPercent <= 19.99 then
		CaloriesCrop = 0.81
	elseif CaloriesPercent >= 20 and CaloriesPercent <= 20.99 then
		CaloriesCrop = 0.80
	elseif CaloriesPercent >= 21 and CaloriesPercent <= 21.99 then
		CaloriesCrop = 0.79
	elseif CaloriesPercent >= 22 and CaloriesPercent <= 22.99 then
		CaloriesCrop = 0.78
	elseif CaloriesPercent >= 23 and CaloriesPercent <= 23.99 then
		CaloriesCrop = 0.77
	elseif CaloriesPercent >= 24 and CaloriesPercent <= 24.99 then
		CaloriesCrop = 0.76
	elseif CaloriesPercent >= 25 and CaloriesPercent <= 25.99 then
		CaloriesCrop = 0.75
	elseif CaloriesPercent >= 26 and CaloriesPercent <= 26.99 then
		CaloriesCrop = 0.74
	elseif CaloriesPercent >= 27 and CaloriesPercent <= 27.99 then
		CaloriesCrop = 0.73
	elseif CaloriesPercent >= 28 and CaloriesPercent <= 28.99 then
		CaloriesCrop = 0.72
	elseif CaloriesPercent >= 29 and CaloriesPercent <= 29.99 then
		CaloriesCrop = 0.71
	elseif CaloriesPercent >= 30 and CaloriesPercent <= 30.99 then
		CaloriesCrop = 0.70
	elseif CaloriesPercent >= 31 and CaloriesPercent <= 31.99 then
		CaloriesCrop = 0.69
	elseif CaloriesPercent >= 32 and CaloriesPercent <= 32.99 then
		CaloriesCrop = 0.68
	elseif CaloriesPercent >= 33 and CaloriesPercent <= 33.99 then
		CaloriesCrop = 0.67
	elseif CaloriesPercent >= 34 and CaloriesPercent <= 34.99 then
		CaloriesCrop = 0.66
	elseif CaloriesPercent >= 35 and CaloriesPercent <= 35.99 then
		CaloriesCrop = 0.65
	elseif CaloriesPercent >= 36 and CaloriesPercent <= 36.99 then
		CaloriesCrop = 0.64
	elseif CaloriesPercent >= 37 and CaloriesPercent <= 37.99 then
		CaloriesCrop = 0.63
	elseif CaloriesPercent >= 38 and CaloriesPercent <= 38.99 then
		CaloriesCrop = 0.62
	elseif CaloriesPercent >= 39 and CaloriesPercent <= 39.99 then
		CaloriesCrop = 0.61
	elseif CaloriesPercent >= 40 and CaloriesPercent <= 40.99 then
		CaloriesCrop = 0.60
	elseif CaloriesPercent >= 41 and CaloriesPercent <= 41.99 then
		CaloriesCrop = 0.59
	elseif CaloriesPercent >= 42 and CaloriesPercent <= 42.99 then
		CaloriesCrop = 0.58
	elseif CaloriesPercent >= 43 and CaloriesPercent <= 43.99 then
		CaloriesCrop = 0.57
	elseif CaloriesPercent >= 44 and CaloriesPercent <= 44.99 then
		CaloriesCrop = 0.56
	elseif CaloriesPercent >= 45 and CaloriesPercent <= 45.99 then
		CaloriesCrop = 0.55
	elseif CaloriesPercent >= 46 and CaloriesPercent <= 46.99 then
		CaloriesCrop = 0.54
	elseif CaloriesPercent >= 47 and CaloriesPercent <= 47.99 then
		CaloriesCrop = 0.53
	elseif CaloriesPercent >= 48 and CaloriesPercent <= 48.99 then
		CaloriesCrop = 0.52
	elseif CaloriesPercent >= 49 and CaloriesPercent <= 49.99 then
		CaloriesCrop = 0.51
	elseif CaloriesPercent >= 50 and CaloriesPercent <= 50.99 then
		CaloriesCrop = 0.50
	elseif CaloriesPercent >= 51 and CaloriesPercent <= 51.99 then
		CaloriesCrop = 0.49
	elseif CaloriesPercent >= 52 and CaloriesPercent <= 52.99 then
		CaloriesCrop = 0.48
	elseif CaloriesPercent >= 53 and CaloriesPercent <= 53.99 then
		CaloriesCrop = 0.47
	elseif CaloriesPercent >= 54 and CaloriesPercent <= 54.99 then
		CaloriesCrop = 0.46
	elseif CaloriesPercent >= 55 and CaloriesPercent <= 55.99 then
		CaloriesCrop = 0.45
	elseif CaloriesPercent >= 56 and CaloriesPercent <= 56.99 then
		CaloriesCrop = 0.44
	elseif CaloriesPercent >= 57 and CaloriesPercent <= 57.99 then
		CaloriesCrop = 0.43
	elseif CaloriesPercent >= 58 and CaloriesPercent <= 58.99 then
		CaloriesCrop = 0.42
	elseif CaloriesPercent >= 59 and CaloriesPercent <= 59.99 then
		CaloriesCrop = 0.41
	elseif CaloriesPercent >= 60 and CaloriesPercent <= 60.99 then
		CaloriesCrop = 0.40
	elseif CaloriesPercent >= 61 and CaloriesPercent <= 61.99 then
		CaloriesCrop = 0.39
	elseif CaloriesPercent >= 62 and CaloriesPercent <= 62.99 then
		CaloriesCrop = 0.38
	elseif CaloriesPercent >= 63 and CaloriesPercent <= 63.99 then
		CaloriesCrop = 0.37
	elseif CaloriesPercent >= 64 and CaloriesPercent <= 64.99 then
		CaloriesCrop = 0.36
	elseif CaloriesPercent >= 65 and CaloriesPercent <= 65.99 then
		CaloriesCrop = 0.35
	elseif CaloriesPercent >= 66 and CaloriesPercent <= 66.99 then
		CaloriesCrop = 0.34
	elseif CaloriesPercent >= 67 and CaloriesPercent <= 67.99 then
		CaloriesCrop = 0.33
	elseif CaloriesPercent >= 68 and CaloriesPercent <= 68.99 then
		CaloriesCrop = 0.32
	elseif CaloriesPercent >= 69 and CaloriesPercent <= 69.99 then
		CaloriesCrop = 0.31
	elseif CaloriesPercent >= 70 and CaloriesPercent <= 70.99 then
		CaloriesCrop = 0.30
	elseif CaloriesPercent >= 71 and CaloriesPercent <= 71.99 then
		CaloriesCrop = 0.29
	elseif CaloriesPercent >= 72 and CaloriesPercent <= 72.99 then
		CaloriesCrop = 0.28
	elseif CaloriesPercent >= 73 and CaloriesPercent <= 73.99 then
		CaloriesCrop = 0.27
	elseif CaloriesPercent >= 74 and CaloriesPercent <= 74.99 then
		CaloriesCrop = 0.26
	elseif CaloriesPercent >= 75 and CaloriesPercent <= 75.99 then
		CaloriesCrop = 0.25
	elseif CaloriesPercent >= 76 and CaloriesPercent <= 76.99 then
		CaloriesCrop = 0.24
	elseif CaloriesPercent >= 77 and CaloriesPercent <= 77.99 then
		CaloriesCrop = 0.23
	elseif CaloriesPercent >= 78 and CaloriesPercent <= 78.99 then
		CaloriesCrop = 0.22
	elseif CaloriesPercent >= 79 and CaloriesPercent <= 79.99 then
		CaloriesCrop = 0.21
	elseif CaloriesPercent >= 80 and CaloriesPercent <= 80.99 then
		CaloriesCrop = 0.20
	elseif CaloriesPercent >= 81 and CaloriesPercent <= 81.99 then
		CaloriesCrop = 0.19
	elseif CaloriesPercent >= 82 and CaloriesPercent <= 82.99 then
		CaloriesCrop = 0.18
	elseif CaloriesPercent >= 83 and CaloriesPercent <= 83.99 then
		CaloriesCrop = 0.17
	elseif CaloriesPercent >= 84 and CaloriesPercent <= 84.99 then
		CaloriesCrop = 0.16
	elseif CaloriesPercent >= 85 and CaloriesPercent <= 85.99 then
		CaloriesCrop = 0.15
	elseif CaloriesPercent >= 86 and CaloriesPercent <= 86.99 then
		CaloriesCrop = 0.14
	elseif CaloriesPercent >= 87 and CaloriesPercent <= 87.99 then
		CaloriesCrop = 0.13
	elseif CaloriesPercent >= 88 and CaloriesPercent <= 88.99 then
		CaloriesCrop = 0.12
	elseif CaloriesPercent >= 89 and CaloriesPercent <= 89.99 then
		CaloriesCrop = 0.11
	elseif CaloriesPercent >= 90 and CaloriesPercent <= 90.99 then
		CaloriesCrop = 0.10
	elseif CaloriesPercent >= 91 and CaloriesPercent <= 91.99 then
		CaloriesCrop = 0.09
	elseif CaloriesPercent >= 92 and CaloriesPercent <= 92.99 then
		CaloriesCrop = 0.08
	elseif CaloriesPercent >= 93 and CaloriesPercent <= 93.99 then
		CaloriesCrop = 0.07
	elseif CaloriesPercent >= 94 and CaloriesPercent <= 94.99 then
		CaloriesCrop = 0.06
	elseif CaloriesPercent >= 95 and CaloriesPercent <= 95.99 then
		CaloriesCrop = 0.05
	elseif CaloriesPercent >= 96 and CaloriesPercent <= 96.99 then
		CaloriesCrop = 0.04
	elseif CaloriesPercent >= 97 and CaloriesPercent <= 97.99 then
		CaloriesCrop = 0.03
	elseif CaloriesPercent >= 98 and CaloriesPercent <= 98.99 then
		CaloriesCrop = 0.02
	elseif CaloriesPercent >= 99 and CaloriesPercent <= 99.99 then
		CaloriesCrop = 0.01
	elseif CaloriesPercent == 100 then
		CaloriesCrop = 0
	else
		CaloriesCrop = 0
	end

t[#t+1] = LoadActor("scre_cal_base");
t[#t+1] = LoadActor(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_deco"));

t[#t+1] = LoadFont("_itc avant garde pro bk 20px")..{
	InitCommand=function(s) s:player(pn):xy(41,-91):maxwidth(40):zoom(1.2) end,
	OnCommand=function(s)
	local CaloriesBurned = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetCaloriesBurned();
		s:settextf("%04.1f",CaloriesBurned) end,
};

t[#t+1] = LoadFont("_itc avant garde pro bk 20px")..{
	InitCommand=function(s) s:player(pn):xy(41,-59):maxwidth(40):zoom(1.2):diffuse(color("#000000")) end,
	OnCommand=function(s) s:settextf("%04.1f",CaloriesToday) end,
};

t[#t+1] = LoadActor("mdx02_rs_cal_guage_k")..{
	InitCommand=function(s) s:xy(207,40):rotationz(-90):cropright(1) end,
	OnCommand=function(s) s:linear(1):cropright(CaloriesCrop) end,
};

t[#t+1] = LoadFont("_itc avant garde std bk 50px")..{
	InitCommand=function(s) s:xy(100,46):diffuse(color("#3e3d3d")):maxwidth(90) end,
	OnCommand=function(s) s:settextf("%0.0f",CaloriesPercent) end,
};

t[#t+1] = Def.Sprite{
		InitCommand=cmd(zoom,1);
		OnCommand=function(self)
		if CaloriesToday >= 0 and CaloriesToday <= 5 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon00"));
		elseif CaloriesToday >= 5.01 and CaloriesToday <= 30 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon01"));
		elseif CaloriesToday >= 30.01 and CaloriesToday <= 50 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon02"));
		elseif CaloriesToday >= 50.01 and CaloriesToday <= 60 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon03"));
		elseif CaloriesToday >= 60.01 and CaloriesToday <= 70 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon04"));
		elseif CaloriesToday >= 70.01 and CaloriesToday <= 85 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon05"));
		elseif CaloriesToday >= 85.01 and CaloriesToday <= 100 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon06"));
		elseif CaloriesToday >= 100.01 and CaloriesToday <= 120 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon07"));
		elseif CaloriesToday >= 120.01 and CaloriesToday <= 150 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon08"));
		elseif CaloriesToday >= 150.01 and CaloriesToday <= 200 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon09"));
		elseif CaloriesToday >= 200.01 and CaloriesToday <= 220 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon10"));
		elseif CaloriesToday >= 220.01 and CaloriesToday <= 235 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon11"));
		elseif CaloriesToday >= 235.01 and CaloriesToday <= 250 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon12"));
		elseif CaloriesToday >= 250.01 and CaloriesToday <= 280 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon13"));
		elseif CaloriesToday >= 280.01 and CaloriesToday <= 300 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon14"));
		elseif CaloriesToday >= 300.01 and CaloriesToday <= 330 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon15"));
		elseif CaloriesToday >= 330.01 and CaloriesToday <= 355 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon16"));
		elseif CaloriesToday >= 355.01 and CaloriesToday <= 400 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon17"));
		elseif CaloriesToday >= 400.01 and CaloriesToday <= 430 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon18"));
		elseif CaloriesToday >= 430.01 and CaloriesToday <= 450 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon19"));
		elseif CaloriesToday >= 450.01 and CaloriesToday <= 505 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon20"));
		elseif CaloriesToday >= 505.01 and CaloriesToday <= 550 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon21"));
		elseif CaloriesToday >= 550.01 and CaloriesToday <= 570 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon22"));
		elseif CaloriesToday >= 570.01 and CaloriesToday <= 600 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon23"));
		elseif CaloriesToday >= 600.01 and CaloriesToday <= 620 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon24"));
		elseif CaloriesToday >= 620.01 and CaloriesToday <= 700 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon25"));
		elseif CaloriesToday >= 700.01 and CaloriesToday <= 740 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon26"));
		elseif CaloriesToday >= 740.01 and CaloriesToday <= 870 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon27"));
		elseif CaloriesToday >= 870.01 and CaloriesToday <= 900 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon28"));			
		elseif CaloriesToday >= 900.01 and CaloriesToday <= 100000 then
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon28"));			
		else
			self:Load(THEME:GetPathB("ScreenEvaluation", "decorations/kcal/"..Language().."icon/scre_cal_icon28"));			
		end;
	end;
};

return t;