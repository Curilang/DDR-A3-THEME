local t = Def.ActorFrame{};

if not GAMESTATE:IsEventMode() then
	t[#t+1] = LoadActor(THEME:GetPathG("","ScreenSelectProfile/"..Model().."three"))..{
		InitCommand=cmd(x,-1.8;y,0;zoom,0.5);
	};
	t[#t+1] = Def.ActorFrame{
	InitCommand=function(s) s:xy(0.5,0.5) end, 
	--3
	LoadActor(THEME:GetPathG("","ScreenSelectProfile/star")) ..{
		InitCommand=cmd(x,-50.5;diffusealpha,1);
	};
	LoadActor(THEME:GetPathG("","ScreenSelectProfile/star")) ..{
		InitCommand=cmd(x,-50.5;blend,Blend.Add;diffusealpha,0;diffusealpha,0;linear,0.01;smooth,0.3;diffusealpha,1;diffuseramp;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,1");effectperiod,0.70);
	};
	--4
	LoadActor(THEME:GetPathG("","ScreenSelectProfile/star")) ..{
		InitCommand=cmd(x,-25.5;diffusealpha,1);
	};
	LoadActor(THEME:GetPathG("","ScreenSelectProfile/star")) ..{
		InitCommand=cmd(x,-25.5;blend,Blend.Add;diffusealpha,0;diffusealpha,0;linear,0.01;smooth,0.3;diffusealpha,1;diffuseramp;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,1");effectperiod,0.70);
	};
	--5
	LoadActor(THEME:GetPathG("","ScreenSelectProfile/star")) ..{
		InitCommand=cmd(x,0.5;diffusealpha,1);
	};
	LoadActor(THEME:GetPathG("","ScreenSelectProfile/star")) ..{
		InitCommand=cmd(x,0.5;blend,Blend.Add;diffusealpha,0;diffusealpha,0;linear,0.01;smooth,0.3;diffusealpha,1;diffuseramp;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,1");effectperiod,0.70);
	};
};
end;

return t;