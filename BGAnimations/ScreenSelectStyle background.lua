return Def.ActorFrame {
	loadfile(THEME:GetPathB("","_normaldoors"))()..{
		OnCommand=function(s) s:finishtweening():playcommand("AnimStand") end,
	};
};