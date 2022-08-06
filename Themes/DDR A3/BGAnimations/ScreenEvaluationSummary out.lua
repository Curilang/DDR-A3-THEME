local loader
if IsGoldenLeague() then
	loader = "_doors GoldenLeague close"
else
	loader = "_doors close"
end

return Def.ActorFrame{ LoadActor(loader); }