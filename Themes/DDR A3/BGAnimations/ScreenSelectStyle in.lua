-- local RSC = math.random(1,4);

return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffuse(Alpha(Color.Black,0)) end,
	};
	LoadActor(THEME:GetPathS("","_swoosh in.ogg"))..{
		OnCommand=function(s) s:sleep(0.2):queuecommand("Play") end,
		PlayCommand=function(s) s:play() end,
	};
	-- LoadActor(THEME:GetPathS("","Announcer/ScreenSelectStyle "..RSC))..{
		-- OnCommand=cmd(sleep,0.5;queuecommand,"Play");
		-- PlayCommand=cmd(play);
	-- };
};