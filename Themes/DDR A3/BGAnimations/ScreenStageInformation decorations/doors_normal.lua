return Def.ActorFrame{
	Def.ActorFrame{
		AnimOffCommand=cmd(diffusealpha,1;accelerate,0.4;diffusealpha,0);
		Def.Quad{
			InitCommand=cmd(FullScreen;diffuse,Color.White;diffusealpha,0.1;);
		};
		Def.Sprite{
			Texture=THEME:GetPathB("","_door/"..Model().."lines"),
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
		LoadActor(THEME:GetPathB("","_door/shadow"))..{
			InitCommand=function(s) s:zoomtowidth(SCREEN_WIDTH):y(SCREEN_TOP+30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_TOP+61):diffusealpha(1) end,
		};
		LoadActor(THEME:GetPathB("","_door/shadow"))..{
			InitCommand=function(s) s:rotationx(180):zoomtowidth(SCREEN_WIDTH):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_BOTTOM-61):diffusealpha(1) end,
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."door_up"))..{
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_TOP+61):diffusealpha(1) end, 
		};
		LoadActor(THEME:GetPathB("","_door/center_circle"))..{
			InitCommand=function(s) s:zoom(0.447):y(_screen.cy-2.2):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.55):rotationz(360):diffusealpha(0.5) end,
		};
		LoadActor(THEME:GetPathB("","_door/center_outline"))..{
			InitCommand=function(s) s:zoom(0.447):y(_screen.cy-2.2):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.55):diffusealpha(0.5) end,
		};
		LoadActor(THEME:GetPathB("","_door/center_line"))..{
			InitCommand=function(s) s:zoomx(0):zoomy(0.447):y(_screen.cy-2.2):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.25):zoomx(0.447):diffusealpha(1) end,
		};
		LoadActor(THEME:GetPathB("","_door/cosh_burst_flare"))..{
			InitCommand=cmd(zoom,0.53;x,13;y,SCREEN_TOP+25;blend,Blend.Add;);
			OnCommand=cmd(diffusealpha,0;sleep,1.034;linear,0.3;diffusealpha,1;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0.9");effectperiod,0.02);
		};
		LoadActor(THEME:GetPathG("ScreenWithMenuElements","header/"..GetCurrentModel().."/base"))..{
			InitCommand=function(s) s:zoom(0.445):y(-16):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):y(15):diffusealpha(1) end, 
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."squares"))..{
			InitCommand=function(s) s:zoom(0.445):y(15):diffusealpha(0):cropleft(0.5):cropright(0.5) end,
			OnCommand=function(s) s:sleep(0.68):linear(0.1):diffusealpha(1):linear(0.5):cropleft(0):cropright(0) end, 
		};		
		LoadActor(THEME:GetPathB("","_door/"..Model().."door_down"))..{
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.68):linear(0.1):y(SCREEN_BOTTOM-61):diffusealpha(1) end, 
		};
		
		LoadActor(THEME:GetPathB("","_door/"..Model().."squares"))..{
			InitCommand=function(s) s:rotationx(180):zoomx(0.38):zoomy(0.3):y(SCREEN_BOTTOM-8):diffusealpha(0):cropleft(0.5):cropright(0.5) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):diffusealpha(1):linear(0.5):cropleft(0):cropright(0) end, 
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."up lines"))..{
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_TOP+61):sleep(0.3):linear(0.2):diffusealpha(1) end, 
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."down lines"))..{
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_BOTTOM-61):sleep(0.3):linear(0.2):diffusealpha(1) end, 
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."stars"))..{
			InitCommand=function(s) s:zoom(0.26):x(339):y(SCREEN_TOP+2):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):sleep(0.3):linear(0.2):diffusealpha(1) end, 
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."stars"))..{
			InitCommand=function(s) s:zoom(0.26):x(-339):y(SCREEN_TOP+2):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):sleep(0.3):linear(0.2):diffusealpha(1) end, 
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."stars"))..{
			InitCommand=function(s) s:zoom(0.26):x(339):y(SCREEN_BOTTOM-4):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):sleep(0.3):linear(0.2):diffusealpha(1) end, 
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."stars"))..{
			InitCommand=function(s) s:zoom(0.26):x(-339):y(SCREEN_BOTTOM-4):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.6):linear(0.1):sleep(0.3):linear(0.2):diffusealpha(1) end, 
		};
	};
	
}