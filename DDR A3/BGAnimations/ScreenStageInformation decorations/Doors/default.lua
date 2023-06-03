local loader
if IsGoldenLeague() then
	loader = "GoldenLeague"
else
	loader = "Normal"
end

return Def.ActorFrame{ LoadActor(loader); }