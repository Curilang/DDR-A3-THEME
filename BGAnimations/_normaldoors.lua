return Def.ActorFrame{
	Def.ActorFrame{
		AnimCloseCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorClose")) end,
		AnimOpenCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorOpen")) end,
	};
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffuse(Color.Black):diffusealpha(0) end,
		AnimCloseCommand=function(s) s:sleep(0.35):linear(0.1):diffusealpha(1) end,
		AnimOpenCommand=function(s) s:diffusealpha(0) end,
		AnimStandCommand=function(s) s:diffusealpha(0) end,
	};
	Def.Sprite{
		InitCommand=function(s) s:diffusealpha(0) end,
		AnimCloseCommand=function(s) 
			s:Load(BackgroundInit()):SetAllStateDelays(0.042):FullScreen()
			s:sleep(0.6):linear(0.1):diffusealpha(1) 
		end,
		AnimOpenCommand=function(s)
			s:Load(BackgroundEntry()):SetAllStateDelays(0.042):FullScreen():diffusealpha(1)
			s:linear(0.2):diffusealpha(0)
		end,
		AnimStandCommand=function(s)
			s:Load(BackgroundEntry()):SetAllStateDelays(0.032):FullScreen():diffusealpha(1)
		end,
	};
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffuse(Color.Black):diffusealpha(0) end,
		AnimCloseCommand=function(s) s:sleep(0.6):linear(0.1):diffusealpha(0.2) end,
		AnimOpenCommand=function(s) s:diffusealpha(0.2):linear(0.2):diffusealpha(0) end,
		AnimStandCommand=function(s) s:diffusealpha(0.2) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/lines"),
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
		AnimCloseCommand=function(s) s:sleep(0.6):linear(0.1):diffusealpha(0.2) end,
		AnimOpenCommand=function(s) s:diffusealpha(0.2):linear(0.2):diffusealpha(0) end,
		AnimStandCommand=function(s) s:diffusealpha(0.2) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/squares"),
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
		AnimCloseCommand=function(s) s:sleep(0.6):linear(0.1):diffusealpha(0.14) end,
		AnimOpenCommand=function(s) s:diffusealpha(0.14):linear(0.2):diffusealpha(0) end,
		AnimStandCommand=function(s) s:diffusealpha(0.14) end,
	};
	Def.Quad{
		InitCommand=cmd(diffusealpha,0);
		AnimCloseCommand=cmd(sleep,1.75);
		AnimOpenCommand=cmd(sleep,1.5);
	};
	Def.ActorFrame{
		InitCommand=function(s) s:x(_screen.cx) end,	
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door up"))..{ 
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+30):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:sleep(0.3):linear(0.1):y(SCREEN_TOP+63):diffusealpha(1) end,
			AnimOpenCommand=function(s) s:y(SCREEN_TOP+63):diffusealpha(1):linear(0.2):y(SCREEN_TOP+30):diffusealpha(0) end,
			AnimStandCommand=function(s) s:diffusealpha(1):y(SCREEN_TOP+63) end,
		}; 
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door down"))..{  
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:sleep(0.3):linear(0.1):y(SCREEN_BOTTOM-63):diffusealpha(1) end,
			AnimOpenCommand=function(s) s:y(SCREEN_BOTTOM-63):diffusealpha(1):linear(0.2):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			AnimStandCommand=function(s) s:diffusealpha(1):y(SCREEN_BOTTOM-63) end,
		}; 		
	};
};
