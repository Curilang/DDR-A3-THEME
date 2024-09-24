local t = Def.ActorFrame{}

t[#t+1] = Def.Quad{ InitCommand=function(s) s:FullScreen():diffusecolor(Color.Black):diffusealpha(1) end, };

t[#t+1] = Def.ActorFrame{
	OnCommand=function(s) s:queuecommand("Play") end,
	PlayCommand=function(s) 
		local sound = THEME:GetPathS("ScreenStageInformation","StageSound")
		SOUND:PlayOnce(StreamingSound(sound)) 
	end,
};


t[#t+1] = Def.ActorFrame{
	OnCommand=function(s) s:sleep(1.55):queuecommand("Play") end,
	PlayCommand=function(s) 
		local sound = THEME:GetPathS("ScreenStageInformation","JacketSound")
		SOUND:PlayOnce(StreamingSound(sound)) 
	end,
};

t[#t+1] = loadfile(THEME:GetPathB("","_normaldoors"))()..{
	OnCommand=function(s) s:sleep(0.3):queuecommand("Play") end,
	PlayCommand=function(s) s:finishtweening():queuecommand("AnimClose")
	s:sleep(1.6):queuecommand("AnimStand") 
	end,
};

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s) s:xy(142,82):zoom(0.67) end,
	Def.Sprite{
		Texture=THEME:GetPathG("","_shared/message/BLUE"),
		InitCommand=function(s) s:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+10):zoom(1) end,
		OnCommand=function(self)	
			self:diffusealpha(1);
			self:zoomx(1);
			self:zoomy(1);
			self:linear(0.1);
			self:diffusealpha(1);
			self:zoomx(1.2);
			self:zoomy(1.2);
			self:linear(0.1);
			self:diffusealpha(1);
			self:zoomx(1.1);
			self:zoomy(1.1);
			self:sleep(0.3);
			self:sleep(0.1);
			self:linear(0.1);
			self:zoom(1)
			--self:sleep(0.85):linear(0.04):diffusealpha(0):zoomx(0.8*1.2):zoomy(0)
		end;
	};
	Def.Sprite{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+5;zoom,1);
		OnCommand=function(self)
			self:Load(THEME:GetPathG("","_shared/message/COURSE"));
			self:diffusealpha(1):linear(0.1):diffusealpha(1)
				:zoomx(1.1):zoomy(1.2):linear(0.1)
				:zoomx(1.2):zoomy(1.1):linear(0.15)
				:zoomx(1.15):zoomy(1.1):sleep(0.3):linear(0.1)
				:zoom(1)
				--:sleep(0.8):linear(0.04):diffusealpha(0.2):zoomx(1.8*2):zoomy(0);
		end;
	};
	Def.Sprite{
	InitCommand=cmd(x,SCREEN_CENTER_X-0;y,SCREEN_CENTER_Y;zoom,0.9;blend,Blend.Add);
	OnCommand=function(self)
	self:Load(THEME:GetPathG("","_shared/message/COURSE"));
	self:diffusealpha(0.5):zoom(1.5):linear(0.1):diffusealpha(0.5)
	:zoomx(1.1):zoomy(1.2):linear(0.15)
	:zoomx(1.5):zoomy(1.8):linear(0.15)
	:zoomx(2):zoomy(2.1):diffusealpha(0);
	end;
	};
};

t[#t+1] = LoadActor( THEME:GetPathG("","ScreenSelectProfile/"..Model().."press") ) .. {
	InitCommand=cmd(x,_screen.cx+8;y,SCREEN_BOTTOM-65;zoomy,0;diffuseshift;effectcolor1,Color('White');effectcolor2,color("#A5A6A5"));
	OnCommand=cmd(sleep,1.59;linear,0.09;zoom,0.667);
};
	
t[#t+1] = Def.Quad{
	InitCommand=function(s) s:FullScreen():diffusecolor(Color.White):diffusealpha(0) end,
	OnCommand=function(s) s:sleep(0.164):linear(0.2):diffusealpha(0.7):linear(0.3):diffusealpha(0) end,
};

return t;