return Def.ActorFrame {
	loadfile(THEME:GetPathB("","_normaldoors"))()..{
		OffCommand=function(s) s:finishtweening():playcommand("AnimClose")
			s:sleep(1.6):queuecommand("AnimStand") 
		end,
	};
};