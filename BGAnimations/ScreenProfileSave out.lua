
local x = Def.ActorFrame{};

if GAMESTATE:IsCourseMode() then 
	x[#x+1] = loadfile(THEME:GetPathB("ScreenGameplay","out/_doors"))()..{
		OnCommand=function(s) s:sleep(0.3):queuecommand("Play") end,
		PlayCommand=function(s) s:finishtweening():queuecommand("AnimClose")
			s:sleep(1.6):queuecommand("AnimStand") 
		end,
	};
end

return x;