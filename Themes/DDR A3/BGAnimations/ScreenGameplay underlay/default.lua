local loader
if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
	loader = "DanceStages"
else
	loader = "Background"
end;

return Def.ActorFrame{ 
	LoadActor(loader); 	
};