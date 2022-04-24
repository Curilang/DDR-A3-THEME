return Def.ActorFrame {
	Def.Sprite{
		Texture=THEME:GetPathB("","_door/"..Model().."scsh_back_01"),
		InitCommand=function(self)
			self:FullScreen()
		end;
	};
	Def.Sprite{
		Texture=THEME:GetPathB("","_door/scsh_back_02"),
		InitCommand=function(self)
			self:FullScreen():blend(('BlendMode_Add')):diffusealpha(0.3)
		end;
	};
	
	Def.Sprite{
		Texture=THEME:GetPathB("","_door/purple_light"),
		InitCommand=function(s) s:xy(_screen.cx-5,-10)
		--:blend(('BlendMode_Add'))
		:diffusealpha(0):zoom(0.667):queuecommand("Animate") end,
		AnimateCommand=function(s) s:diffusealpha(1):linear(0.85):diffusealpha(0.65):linear(0.85):diffusealpha(1):queuecommand("Animate") end,
	};
	
	Def.Sprite{
		Texture=THEME:GetPathB("","_door/"..Model().."lines"),
		InitCommand=function(self)
			self:FullScreen():blend(('BlendMode_Add')):diffusealpha(0.2)
		end;
	};

	Def.ActorFrame{
	InitCommand=function(s) s:x(_screen.cx) end,	
		LoadActor(THEME:GetPathB("","_door/"..Model().."door_up"))..{ 
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+61) end, 
		}; 
		
		LoadActor(THEME:GetPathB("","_door/"..Model().."door_down"))..{ 
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-61) end, 
		}; 
	};
};