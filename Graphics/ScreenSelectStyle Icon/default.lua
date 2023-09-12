local t = Def.ActorFrame {};
local Style = Var("GameCommand"):GetName();
--------------------------------------
t[#t+1] = Def.ActorFrame {
    LoadActor(Style) .. {
		InitCommand=cmd(zoom,0.667;xy,142,80);
		-- OnCommand=cmd();
		-- GainFocusCommand=cmd(diffusealpha,0;sleep,0.1;linear,0.1;diffusealpha,1);
		-- LoseFocusCommand=cmd(linear,0.1;diffusealpha,0);
	};
};

return t;
