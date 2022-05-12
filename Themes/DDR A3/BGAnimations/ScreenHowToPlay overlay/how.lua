local HowToSleep = 4.8;

return Def.ActorFrame {
	LoadActor(THEME:GetPathB("ScreenGameplay","ready/bg"))..{
		InitCommand=function(s) s:Center()
			if GetCurrentModel() == "Gold" then
				s:blend(('BlendMode_Add'))
			end
		end,
		OnCommand=function(s)
			s:diffusealpha(0):zoom(0)
			s:linear(0.1):diffusealpha(1):zoom(0.867)
			s:linear(0.1):diffusealpha(1):zoom(0.667):sleep(HowToSleep+0.2)
			s:linear(0.1):diffusealpha(0):zoomx(0.667):zoomy(0);
		end,
	};
	
	--Left
	LoadActor(THEME:GetPathB("ScreenGameplay","ready/HOW"))..{
		InitCommand=function(s) s:xy(_screen.cx,_screen.cy) end,
		OnCommand=function(self)
			self:diffusealpha(1):zoom(0)
			self:linear(0.1):zoom(0.418)
			self:linear(0.1):diffusealpha(1):zoomx(0.62):zoomy(0.64)
			self:linear(0.1):diffusealpha(1):zoomx(0.69):zoomy(0.71)
			self:linear(0.1):zoom(0.667):sleep(HowToSleep)
			self:linear(0.1):diffusealpha(0):zoomx(0.69):zoomy(0);
		end;
	};
	
	--Right
	LoadActor(THEME:GetPathB("ScreenGameplay","ready/HOW"))..{
		InitCommand=function(s) s:xy(_screen.cx,_screen.cy):blend(Blend.Add) end,
		OnCommand=function(s) 
			s:diffusealpha(0):zoom(0)
			s:linear(0.1):zoom(1.2)
			s:linear(0.1):diffusealpha(0.5):zoomx(0.62):zoomy(0.64)
			s:linear(0.1):diffusealpha(0.5):zoomx(0.72):zoomy(0.74)
			s:linear(0.1):diffusealpha(0):zoom(0.92)
		end,
	};
};