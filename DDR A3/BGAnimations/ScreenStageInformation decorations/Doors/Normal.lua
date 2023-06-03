return Def.ActorFrame{
	Def.ActorFrame{
		AnimOffCommand=cmd(diffusealpha,1;accelerate,0.4;diffusealpha,0);
		Def.Quad{
			InitCommand=cmd(FullScreen;diffuse,Color.White;diffusealpha,0.1;);
		};
		LoadActor(THEME:GetPathG("","_doors/squares"))..{
			InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):diffusealpha(0.06) end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/lines"),
			InitCommand=function(self)
				self:FullScreen():diffusealpha(0.5)
				local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
				local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
				self:customtexturerect(2,0.8,w,h);
				self:texcoordvelocity(0,1);
			end;
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(CenterX);	
		
		LoadActor(THEME:GetPathG("","_doors/shadow"))..{
			InitCommand=function(s) s:zoomtowidth(SCREEN_WIDTH):y(SCREEN_TOP+30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_TOP+71):diffusealpha(1) end,
		};
		LoadActor(THEME:GetPathG("","_doors/shadow"))..{
			InitCommand=function(s) s:rotationx(180):zoomtowidth(SCREEN_WIDTH):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_BOTTOM-71):diffusealpha(1) end,
		};
		LoadActor(THEME:GetPathG("","_doors/center_circle"))..{
			InitCommand=function(s) s:zoom(0.347):y(_screen.cy-2.2):rotationz(45):diffusealpha(0):fadeleft(0.1) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.7):rotationz(0):zoom(0.447):diffusealpha(0.5) end,
		};
		LoadActor(THEME:GetPathG("","_doors/center_circle"))..{
			InitCommand=function(s) s:zoom(0.647):y(_screen.cy-2.2):rotationz(0):diffusealpha(0):fadeleft(0.1) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.7):rotationz(45):zoom(0.447):diffusealpha(0.5):linear(0.1):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/center_outline"))..{
			InitCommand=function(s) s:zoom(0.3):y(_screen.cy-2.2):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.55):diffusealpha(0.5):zoom(0.447) end,
		};
		LoadActor(THEME:GetPathG("","_doors/center_lines_up"))..{
			InitCommand=function(s) s:zoomx(0.347):zoomy(0.447):y(_screen.cy-2.2):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(1.1):linear(0.2):zoomx(0.447):diffusealpha(1) end,
		};
		LoadActor(THEME:GetPathG("","_doors/center_lines_center"))..{
			InitCommand=function(s) s:zoomx(0.4):zoomy(0.447):y(_screen.cy-2.2):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(1.2):linear(0.2):zoomx(0.447):diffusealpha(1) end,
		};
		LoadActor(THEME:GetPathG("","_doors/flare.png"))..{
			InitCommand=cmd(zoom,0.4;x,-5;y,SCREEN_TOP+12;blend,Blend.Add;);
			OnCommand=cmd(diffusealpha,0;sleep,1.034;linear,0.3;diffusealpha,1;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0.9");effectperiod,0.02);
		};
		--Doors
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/top"))..{
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_TOP+61):diffusealpha(1) end, 
		};
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/bottom"))..{
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_BOTTOM-61):diffusealpha(1) end, 
		};
		--Squares
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/upquad"))..{
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+61):diffusealpha(0):cropleft(0.5):cropright(0.5) end,
			OnCommand=function(s) s:sleep(0.68):linear(0.1):diffusealpha(1):linear(1.5):cropleft(0):cropright(0) end, 
		};
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/downquad"))..{
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_BOTTOM-61):diffusealpha(0):cropleft(0.5):cropright(0.5) end,
			OnCommand=function(s) s:sleep(0.68):linear(0.1):diffusealpha(1):linear(1.5):cropleft(0):cropright(0) end, 
		};
		--Lights
		Def.ActorFrame{
		InitCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0.9");effectperiod,0.47);
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/lightup"))..{
				InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+61):diffusealpha(0) end,
				OnCommand=function(s) s:sleep(0.8):linear(0.25):diffusealpha(1) end, 
			};
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/lightdown"))..{
				InitCommand=function(s) s:zoom(0.667):y(SCREEN_BOTTOM-61):diffusealpha(0) end,
				OnCommand=function(s) s:sleep(0.8):linear(0.25):diffusealpha(1) end, 
			};
		};
	};
};