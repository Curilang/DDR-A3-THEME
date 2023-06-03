return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh in.ogg"))..{
		OnCommand=function(s) s:sleep(0.2):queuecommand("Play") end,
		PlayCommand=function(s) s:play() end,
	};
};