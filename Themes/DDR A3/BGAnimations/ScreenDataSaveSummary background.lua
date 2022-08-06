local loader
if IsGoldenLeague() then
	loader = "_GoldenLeaguebg"
else
	loader = "_bluebg"
end

return Def.ActorFrame{ LoadActor(loader); }