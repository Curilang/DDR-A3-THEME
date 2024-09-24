local t = Def.ActorFrame{};

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = Def.ActorFrame{
		Def.Sprite{
			Texture=Model().."frame",
			InitCommand=function(s) s:draworder(40)
				s:xy(pn==PLAYER_1 and SCREEN_LEFT+101 or SCREEN_RIGHT-101,_screen.cy+20):zoom(0.667)
			end,
			OnCommand=function(s) s:diffusealpha(0):linear(0.4):diffusealpha(1) end,
		};
	};
	t[#t+1] = loadfile(THEME:GetPathB("ScreenSelectCourse","overlay/diff"))(pn)..{
		InitCommand=function(s) s:xy(pn==PLAYER_1 and SCREEN_LEFT+94 or SCREEN_RIGHT-94,_screen.cy-97):zoom(0.667) end,
	};
end

t[#t+1] = loadfile(THEME:GetPathB("ScreenSelectCourse","overlay/info"))()..{
	OnCommand=function(s) s:zoom(0.667):y(57):diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
};
t[#t+1] = loadfile(THEME:GetPathB("ScreenSelectCourse","overlay/stage"))()..{
	OnCommand=function(s) s:zoom(0.667):diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
};

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = StandardDecorationFromFileOptional("CourseContentsList","CourseContentsList")..{
		InitCommand=function(s) s:x(pn==PLAYER_1 and SCREEN_LEFT+153 or SCREEN_RIGHT-50) end,
	};
end
return t;