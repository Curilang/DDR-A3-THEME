local loader
if GoldenLeague() == "Bronze" or GoldenLeague() == "Silver" or GoldenLeague() == "Gold" then
	loader = "_doors GoldenLeague close"
else
	loader = "_doors close"
end

return Def.ActorFrame{ LoadActor(loader); }