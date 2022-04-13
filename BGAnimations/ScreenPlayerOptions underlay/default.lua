local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("0,0,0,0.5")):FullScreen() end,
		OnCommand=function(s) s:diffusealpha(0):sleep(0.1):linear(0.2):diffusealpha(0.5) end,
		OffCommand=function(s) s:linear(0.2):diffusealpha(0) end,
	};
};


-- local RSO = math.random(1,2);
t[#t+1] = Def.ActorFrame {
	LoadActor("swoosh")..{
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
	-- LoadActor(THEME:GetPathS("","Announcer/ScreenSelectOptions "..RSO))..{
		-- OnCommand=cmd(queuecommand,"Play");
		-- PlayCommand=cmd(play);
	-- };
};

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("options.lua",pn)..{
		InitCommand=function(s) s:zoom(0.667):xy(pn==PLAYER_1 and _screen.cx-143 or _screen.cx+143,_screen.cy-160.5) end,
	};
end;

return t;
