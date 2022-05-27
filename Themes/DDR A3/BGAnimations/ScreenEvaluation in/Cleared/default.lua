local loader
if GoldenLeague() == "Bronze" or GoldenLeague() == "Silver" or GoldenLeague() == "Gold" then
	loader = "GoldenLeague"
else
	loader = "Normal"
end

return Def.ActorFrame{ LoadActor(loader); }