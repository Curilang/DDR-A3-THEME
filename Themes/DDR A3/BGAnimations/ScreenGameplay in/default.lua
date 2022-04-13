local t = Def.ActorFrame{};

if not GAMESTATE:IsDemonstration() then
	t[#t+1] = LoadActor("doors");
	t[#t+1] = LoadActor("jacket");
end

return t