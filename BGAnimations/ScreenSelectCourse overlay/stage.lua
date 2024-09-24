return Def.ActorFrame {
	Def.Sprite{
		Texture=THEME:GetPathB("ScreenSelectMusic","Overlay/StageDisplay/"..Model().."bg"),
		InitCommand=function(s) s:xy(SCREEN_LEFT+116,SCREEN_TOP+43) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("", "_shared/Style"),
		InitCommand=function(s) s:xy(146,66):pause():queuecommand("Set") end,
		SetCommand=function(s)
			local style = GAMESTATE:GetCurrentStyle()
			if style:GetStyleType() == "StyleType_OnePlayerOneSide" then
				s:setstate(0);
			elseif style:GetStyleType() == "StyleType_TwoPlayersTwoSides" then
				s:setstate(1);
			elseif style:GetStyleType() == "StyleType_OnePlayerTwoSides" then
				s:setstate(2);
			end;
		end,
	};
	Def.Sprite{
		Texture=THEME:GetPathB("ScreenSelectMusic","Overlay/StageDisplay/"..Model().."Course"),
		InitCommand=function(s) s:xy(96,30.5) end,
	};
};
