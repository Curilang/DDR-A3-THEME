return Def.ActorFrame{
	loadfile(THEME:GetPathB("ScreenGameplay","out/_doors"))()..{
		OnCommand=function(s) s:playcommand("AnimStand") end,
	},
};