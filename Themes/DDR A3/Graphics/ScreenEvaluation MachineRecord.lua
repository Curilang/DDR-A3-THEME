local Player = ...
assert(Player,"MachineRecord needs Player")
local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
local record = stats:GetMachineHighScoreIndex()
local hasMachineRecord = record ~= -1
local t = Def.ActorFrame {};

local dum 
if PREFSMAN:GetPreference("PercentageScoring")==false then
	dum = "dum02_rsnew0"
else
	dum = "dum02_rsnew1"
end

return Def.ActorFrame {
	LoadActor(dum)..{
		InitCommand=function(s) s:zoomx(0.667):xy(Player==PLAYER_1 and _screen.cx-195 or _screen.cx+232,_screen.cy-65) end,
		BeginCommand=function(s) s:visible(hasMachineRecord) end,
		OnCommand=cmd(zoomy,0;sleep,2.3;linear,0.1;zoomy,0.667);
		OffCommand=cmd(decelerate,0.05;zoomy,0);
	};
};