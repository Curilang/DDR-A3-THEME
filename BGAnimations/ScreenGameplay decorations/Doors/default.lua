local loader
if IsGoldenLeague() then
	loader = "GoldenLeague"
else
	loader = "Normal"
end

return Def.ActorFrame{ 
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) 
			local sound = THEME:GetPathS("","DoorOpen")
			SOUND:PlayOnce(StreamingSound(sound)) 
		end,
	};
	LoadActor(loader); 
}