local t = Def.ActorFrame{};

for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("FullCombo",pn);
end;



if not GAMESTATE:IsCourseMode() then
	if GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "LET'S CHECK YOUR LEVEL!" then
		t[#t+1] = LoadActor("LET'S CHECK YOUR LEVEL!");
	elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Lesson by DJ" then
		t[#t+1] = LoadActor("Lesson by DJ");
	end;
end

return t;