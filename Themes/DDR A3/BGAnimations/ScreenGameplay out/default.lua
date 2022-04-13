local AnimationSleep = 1.2
-- local Cleared = math.random(1,2);

return Def.ActorFrame{
	InitCommand=function(s) s:draworder(99) end,
	Def.ActorFrame{
		StartTransitioningCommand=function(s) s:sleep(AnimationSleep+0.035):queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorClose")) end,
	};
	-- Def.ActorFrame{
		-- StartTransitioningCommand=function(s) s:sleep(AnimationSleep+0.035):queuecommand("Play") end,
		-- PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","Announcer/Crowd X"))
								-- SOUND:PlayOnce(THEME:GetPathS("","Announcer/Crowd SN"))
								-- SOUND:PlayOnce(THEME:GetPathS("","Announcer/StageCleared "..Cleared)) 
		-- end,
	-- };
	LoadActor(THEME:GetPathB("","_door/scsh_back_black"))..{
		InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep):linear(0.1):diffusealpha(1):sleep(0.6):linear(0.1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathB("","_door/"..Model().."scsh_back_04"))..{
		InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep):linear(0.1):diffusealpha(1) end,
	};
	LoadActor(THEME:GetPathB("","_door/scsh_back_02"))..{
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep):linear(0.1):diffusealpha(0.2) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathB("","_door/"..Model().."lines"),
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep):linear(0.1):diffusealpha(0.2) end,
	};
	Def.Quad{
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,1.5);
	};
	Def.ActorFrame{
	InitCommand=function(s) s:x(_screen.cx) end,	
		LoadActor(THEME:GetPathB("","_door/"..Model().."door_up"))..{ 
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(AnimationSleep):linear(0.1):y(SCREEN_TOP+61):diffusealpha(1) end, 
		}; 
		LoadActor(THEME:GetPathB("","_door/"..Model().."door_down"))..{  
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(AnimationSleep):linear(0.1):y(SCREEN_BOTTOM-61):diffusealpha(1) end, 
		}; 		
	};
	LoadActor(THEME:GetPathB("","_door/blue bg"))..{
		InitCommand=cmd(x,_screen.cx;y,_screen.cy;blend,Blend.Add);
		OnCommand=function(s) s:diffusealpha(0):zoom(1):sleep(AnimationSleep+0.035):linear(0.264):diffusealpha(1):zoom(0.667) end,
	};
	
	Def.ActorFrame{
	InitCommand=function(s) s:zoom(0.635):xy(155,88) end,
		Def.Sprite{
			InitCommand=function(s) s:diffusealpha(0):Center():Load(ClearedToLoad()) end,
			OnCommand=function(s) 
				s:zoom(0.5):sleep(AnimationSleep+0.035):linear(0):diffusealpha(1):linear(0.2):diffusealpha(1)
				s:zoomx(1):zoomy(1.15):linear(0.05):diffusealpha(1)
				s:zoomx(1.1):zoomy(1.5):linear(0.1):diffusealpha(1)
				s:zoomx(1.15):zoomy(1.15):linear(0.1)
				s:zoomx(1.1):zoomy(1.1):linear(0.1)
				s:zoomx(1.05):zoomy(1.05) 
			end,
		};
		Def.Sprite{
			InitCommand=function(s) s:diffusealpha(0):Center():Load(ClearedToLoad()) end,
			OnCommand=function(s) 
				s:zoom(2.5):sleep(AnimationSleep+0.035):linear(0):diffusealpha(0.3):linear(0.2):diffusealpha(1)
				s:zoomx(1):zoomy(1.15):linear(0.05):diffusealpha(0.3)
				s:zoomx(1.1):zoomy(1.5):linear(0.1):diffusealpha(0.3)
				s:zoomx(2.5):zoomy(2.3):linear(0.5):diffusealpha(0)
				s:zoomx(4):zoomy(3.45) 
			end,
		};
	};
};