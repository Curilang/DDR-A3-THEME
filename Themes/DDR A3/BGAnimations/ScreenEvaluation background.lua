local Sound
local SoundTime

if (GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage()) or (GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage2()) then
	Sound = THEME:GetPathS("","_silent")
	SoundTime = 1
else	
	Sound = THEME:GetPathS("","_systembgm3 (loop)")
	SoundTime = 2.4
end

return Def.ActorFrame {
	Def.Sound{
		File=Sound,
		OnCommand=function(s) s:sleep(SoundTime):queuecommand("Play") end,
		PlayCommand=function(s) s:play() end,
	};
	
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","background"));
};