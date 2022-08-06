local AnimationSleep = 1.2
local loader
if IsGoldenLeague() then
	loader = "GoldenLeague"
else
	loader = "Normal"
end

return Def.ActorFrame{ 
	Def.ActorFrame{
		StartTransitioningCommand=function(s) s:sleep(AnimationSleep+0.035):queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorClose")) end,
	};
	Def.ActorFrame{
		StartTransitioningCommand=function(s) s:sleep(AnimationSleep+0.035):queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayAnnouncer("stage sound X");
								SOUND:PlayAnnouncer("stage sound SN");
								SOUND:PlayAnnouncer("stage cleared");
		end,
	};
	LoadActor(loader); 
};