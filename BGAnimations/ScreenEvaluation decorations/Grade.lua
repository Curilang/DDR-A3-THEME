local t = Def.ActorFrame{};

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	local Award = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetStageAward()
	local Grade = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetGrade()
	t[#t+1] = Def.Sprite{
		InitCommand=function(s) s:player(pn):x(pn== PLAYER_1 and _screen.cx-297 or _screen.cx+380):y(_screen.cy-80):zoom(0):queuecommand("Set") end,
		OnCommand=function(s) s:linear(0.2):zoom(1):spin():effectmagnitude(0,0,170) end,
		SetCommand=function(s)
			if (Award == "StageAward_FullComboW1") then
				s:Load(THEME:GetPathG("","Grade/MarvelousFullcombo_ring"))
			elseif ((Award == "StageAward_SingleDigitW2") or (Award == "StageAward_OneW2") or (Award == "StageAward_FullComboW2")) then
				s:Load(THEME:GetPathG("","Grade/PerfectFullcombo_ring"))
			elseif ((Award == "StageAward_SingleDigitW3") or (Award == "StageAward_OneW3") or (Award == "StageAward_FullComboW3")) then 
				s:Load(THEME:GetPathG("","Grade/GreatFullcombo_ring"))
			elseif (STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):FullComboOfScore('TapNoteScore_W4')) then
				s:Load(THEME:GetPathG("","Grade/GoodFullcombo_ring"))
			end
		end,
		OffCommand=function(s) s:linear(0.2):zoom(0) end,
	};
	t[#t+1] = Def.Sprite{
		InitCommand=function(s) s:player(pn):x(pn== PLAYER_1 and _screen.cx-378 or _screen.cx+302):y(_screen.cy-98):zoom(0):queuecommand("Set") end,
		OnCommand=function(s) s:linear(0.2):zoom(1) end,
		OffCommand=function(s) s:linear(0.2):zoom(0) end,
		SetCommand=function(s) s:Load(THEME:GetPathG("","Grade/"..Grade)) end,
	};
end

return t;