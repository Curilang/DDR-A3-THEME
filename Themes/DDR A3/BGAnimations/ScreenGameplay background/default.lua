local loader
if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
	loader = "DanceStages"
elseif GetUserPref("OptionRowGameplayBackground")=='SNCharacters' then
	loader = "SNCharacters"
else
	loader = "Background"
end;

return Def.ActorFrame{ LoadActor(loader) };