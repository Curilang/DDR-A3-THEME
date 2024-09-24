local t = Def.ActorFrame{};

local TwoPart = Def.ActorFrame{
	StartSelectingStepsMessageCommand=function(s) s:AddChildFromPath(THEME:GetPathB("ScreenSelectMusic","overlay/TwoPartDiff")) end,
	SongUnchosenMessageCommand=function(s) 
		s:sleep(0.2):queuecommand("Remove")
	end,
	RemoveCommand=function(s) s:RemoveChild("TwoPartDiff") end,
};

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/Difficulty"))(pn)..{
		InitCommand=function(s) s:xy(pn==PLAYER_1 and SCREEN_LEFT+94 or SCREEN_RIGHT-94,_screen.cy-97):zoom(0.667) end,
	};
	t[#t+1] = Def.ActorFrame{
		loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/RadarHandler/default.lua"))(pn)..{
			InitCommand=function(s) s:xy(pn==PLAYER_1 and SCREEN_LEFT+86 or SCREEN_RIGHT-86,_screen.cy+24):zoom(0.667) end,
		};
		loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore/default.lua"))(pn);
		};
	t[#t+1] = loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/ShockArrows/default.lua"))(pn)..{
		InitCommand=function(s) s:xy(pn==PLAYER_1 and SCREEN_LEFT+86 or SCREEN_RIGHT-86,_screen.cy+36):zoom(0.667) end,
	};
end

t[#t+1] = loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/Info"))()..{
	OnCommand=function(s) s:zoom(0.667):y(57):diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
};
t[#t+1] = loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/StageDisplay"))()..{
	OnCommand=function(s) s:zoom(0.667):diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
};

return Def.ActorFrame{
	OffCommand=function(s) s:finishtweening() end,
	TwoPart;
	t;
}