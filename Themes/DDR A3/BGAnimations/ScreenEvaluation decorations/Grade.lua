local t = Def.ActorFrame{};


for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	local Award = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetStageAward()
	t[#t+1] = Def.ActorFrame {
		InitCommand=function(s) s:player(pn):x(pn== PLAYER_1 and _screen.cx-297 or _screen.cx+380):y(_screen.cy-80):zoom(0) end,
		OnCommand=function(s) s:linear(0.2):zoom(1):spin():effectmagnitude(0,0,170) end,
		OffCommand=function(s) s:linear(0.2):zoom(0) end,
		Def.Sprite{
			OnCommand=function(s)
				if (Award == "StageAward_FullComboW1") then
					s:Load(THEME:GetPathG("","Grade/MarvelousFullcombo_ring"))
				elseif ((Award == "StageAward_SingleDigitW2") or (Award == "StageAward_OneW2") or (Award == "StageAward_FullComboW2")) then
					s:Load(THEME:GetPathG("","Grade/PerfectFullcombo_ring"))
				elseif ((Award == "StageAward_SingleDigitW3") or (Award == "StageAward_OneW3") or (Award == "StageAward_FullComboW3")) then 
					s:Load(THEME:GetPathG("","Grade/Fullcombo_ring"))
				elseif (STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):FullComboOfScore('TapNoteScore_W4')) then
					s:Load(THEME:GetPathG("","Grade/GoodFullcombo_ring"))
				end
			end,
		};
		Def.Sprite{
			OnCommand=function(s)
				if ((Award == "StageAward_SingleDigitW3") or (Award == "StageAward_OneW3") or (Award == "StageAward_FullComboW3")) then 
					s:Load(THEME:GetPathG("","Grade/Fullcombo_lines"))
				elseif ((Award == "StageAward_SingleDigitW2") or (Award == "StageAward_OneW2") or (Award == "StageAward_FullComboW2")) then
					s:Load(THEME:GetPathG("","Grade/PerfectFullcombo_lines"))
				elseif (Award == "StageAward_FullComboW1") then
					s:Load(THEME:GetPathG("","Grade/MarvelousFullcombo_lines"))
				elseif (STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):FullComboOfScore('TapNoteScore_W4')) then
					s:Load(THEME:GetPathG("","Grade/GoodFullcombo_lines"))
				end
			end,
		};
	};
	local Grade = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetGrade()
	t[#t+1] = Def.Sprite{
		InitCommand=function(s) s:player(pn):x(pn== PLAYER_1 and _screen.cx-378 or _screen.cx+302):y(_screen.cy-98):zoom(0):queuecommand("Set") end,
		OnCommand=function(s) s:linear(0.2):zoom(1) end,
		OffCommand=function(s) s:linear(0.2):zoom(0) end,
		SetCommand=function(s)
			if Grade == "Grade_Tier01" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier01"))
			elseif Grade == "Grade_Tier02" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier02"))
			elseif Grade == "Grade_Tier03" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier03"))
			elseif Grade == "Grade_Tier04" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier04"))
			elseif Grade == "Grade_Tier05" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier05"))
			elseif Grade == "Grade_Tier06" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier06"))
			elseif Grade == "Grade_Tier07" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier07"))
			elseif Grade == "Grade_Tier08" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier08"))
			elseif Grade == "Grade_Tier09" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier09"))
			elseif Grade == "Grade_Tier10" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier10"))
			elseif Grade == "Grade_Tier11" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier11"))
			elseif Grade == "Grade_Tier12" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier12"))
			elseif Grade == "Grade_Tier13" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier13"))
			elseif Grade == "Grade_Tier14" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier14"))
			elseif Grade == "Grade_Tier15" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier15"))
			elseif Grade == "Grade_Tier16" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier16"))
			elseif Grade == "Grade_Tier17" then
				s:Load(THEME:GetPathG("Grade/Grade","Tier17"))
			elseif Grade == "Grade_Failed" then
				s:Load(THEME:GetPathG("Grade/Grade","Failed"))
			end
		end,
	};
end

return t;