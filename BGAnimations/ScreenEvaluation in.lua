local bg
local msg

if (STATSMAN:GetCurStageStats():AllFailed()) then
	bg = THEME:GetPathG("","_shared/message/RED")
	msg = THEME:GetPathG("","_shared/message/FAILED")
else
	bg = THEME:GetPathG("","_shared/message/BLUE")
	msg = THEME:GetPathG("","_shared/message/"..ClearedToLoad())
end

local st = STATSMAN:GetCurStageStats()
local pss_p1 = st:GetPlayerStageStats(PLAYER_1)
local pss_p2 = st:GetPlayerStageStats(PLAYER_2)

return Def.ActorFrame {
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) 
			local sound = THEME:GetPathS("ScreenEvaluation","Swoosh")
			SOUND:PlayOnce(StreamingSound(sound)) 
		end,
	};
	Def.ActorFrame{
		Condition=pss_p1:GetScore() > 0 or pss_p2:GetScore() > 0;
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) 
			local sound = THEME:GetPathS("ScreenEvaluation","Score")
			SOUND:PlayOnce(StreamingSound(sound)) 
		end,
	};
	loadfile(THEME:GetPathB("ScreenGameplay","out/_doors"))()..{
		OnCommand=function(s) 
			if (STATSMAN:GetCurStageStats():AllFailed()) then
				s:playcommand("AnimFailedOpen")
			else
				s:playcommand("AnimOpen") 
			end
		end,
	};
	Def.Sprite{
		Texture=bg,
		InitCommand=function(s) s:Center():blend(Blend.Add):zoom(0.667) end,
		OnCommand=function(s) s:linear(0.1):zoomy(0) end,
	};
	Def.Sprite{
		Texture=msg,
		InitCommand=function(s) s:Center():zoom(0.667) end,
		OnCommand=function(s) s:linear(0.09):zoomx(1):zoomy(0) end,
	};
};