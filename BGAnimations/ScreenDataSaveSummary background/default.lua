local loader
if IsGoldenLeague() then
	loader = "_GoldenLeaguebg"
else
	loader = THEME:GetPathB("ScreenSelectStyle","background")
end

return Def.ActorFrame{ LoadActor(loader); }