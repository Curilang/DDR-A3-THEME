local t = Def.ActorFrame{}

--Sound
t[#t+1] = LoadActor(THEME:GetPathS("ScreenStageInformation","Stef")) .. {		
	OnCommand=cmd(queuecommand,"Play");
	PlayCommand=cmd(play);
};

--Sound
t[#t+1] = LoadActor(THEME:GetPathS("","DoorClose")) .. {
		OnCommand=cmd(sleep,0.3;queuecommand,"Play");
		PlayCommand=cmd(play);
};

t[#t+1] = LoadActor(THEME:GetPathS("ScreenStageInformation","Jksh")) .. {	
	OnCommand=cmd(sleep,1.55;queuecommand,"Play");
	PlayCommand=cmd(play);
	};

t[#t+1] = LoadActor("doors_normal");

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(setsize,300,300;x,_screen.cx;y,_screen.cy+12);
	LoadActor("jacket-bg")..{
		OnCommand=cmd(
			zoomy,0.0129;diffusealpha,0;zoomx,1.3;
			sleep,1.2;diffusealpha,1;
			sleep,0.017;diffusealpha,0;zoomy,0.0645;
			sleep,0.017;diffusealpha,1;
			sleep,0.017;diffusealpha,0;zoomy,0.1741;
			sleep,0.033;diffusealpha,1;
			sleep,0.017;diffusealpha,0;zoomy,0.2806;zoomx,1.265;
			sleep,0.017;diffusealpha,1;
			sleep,0.017;diffusealpha,0;zoomy,0.407;zoomx,1.245;
			sleep,0.017;diffusealpha,1;
			sleep,0.017;diffusealpha,0;zoomy,0.527;zoomx,1.201;
			sleep,0.017;diffusealpha,1;
			sleep,0.017;diffusealpha,0;zoomy,0.7;zoomx,1.126;
			sleep,0.034;diffusealpha,1;
			sleep,0.017;diffusealpha,0;zoomy,0.790;zoomx,1.116;
			sleep,0.017;diffusealpha,1;
			sleep,0.017;diffusealpha,0;zoomy,0.952;zoomx,1.066;
			sleep,0.017;diffusealpha,1;
			sleep,0.017;diffusealpha,0;
		);
	};
	LoadActor("jacket-bg")..{
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(
			sleep,1.5;zoomy,1.033;zoomx,1.033;
			sleep,0.034;diffusealpha,1;
			sleep,0.017;diffusealpha,0;
			sleep,0.016;diffusealpha,1;
			sleep,0.018;diffusealpha,0;
			sleep,0.017;diffusealpha,1;
			sleep,0.016;diffusealpha,0;
			sleep,0.018;diffusealpha,1;
			sleep,0.017;diffusealpha,0;
			sleep,0.016;diffusealpha,1;
			sleep,0.018;diffusealpha,0;
			sleep,0.150;diffusealpha,1;
			sleep,0.017;diffusealpha,0;
		);
	};
};

t[#t+1] = LoadActor("StageDisplay")..{ InitCommand=function(s) s:xy(140,80):zoom(0.667) end, };

t[#t+1] = Def.Sprite {
	InitCommand=function(s) s:x(_screen.cx):y(_screen.cy+12):diffusealpha(0) end,
	OnCommand=function(s) s:queuecommand("Set"):sleep(1.85):linear(0.2):diffusealpha(1):sleep(0.7) end,
	SetCommand=function(s)
	local song = GAMESTATE:GetCurrentSong()
		if song then
			s:Load(GetJacketPath(song))
		end;
		--s:setsize(0,0)
		s:setsize(300,300)
	end;
};

t[#t+1] = Def.Quad{
	OnCommand=cmd(Center;FullScreen;diffusecolor,Color.White;draworder,1;diffusealpha,0;sleep,0.164;linear,0.2;diffusealpha,0.7;linear,0.3;diffusealpha,0;);
};

t[#t+1] = LoadActor(THEME:GetPathB("","_door/whiteflash"))..{
	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0;sleep,0.164;zoom,1.5;linear,0.134;linear,0.299;zoom,5);
};

t[#t+1] = LoadActor("ScoreDisplay")..{ InitCommand=function(s) s:zoom(0.667) end, };

return t