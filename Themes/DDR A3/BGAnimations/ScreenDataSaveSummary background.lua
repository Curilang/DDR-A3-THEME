local loader
if GoldenLeague() == "Bronze" or GoldenLeague() == "Silver" or GoldenLeague() == "Gold" then
	loader = "_GoldenLeaguebg"
else
	loader = "_bluebg"
end

return Def.ActorFrame{ LoadActor(loader); }