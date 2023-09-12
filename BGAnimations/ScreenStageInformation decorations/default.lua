local t = Def.ActorFrame{}

t[#t+1] = Def.Quad{
	InitCommand=function(s) s:FullScreen():diffusecolor(Color.Black):diffusealpha(1) end,
};

t[#t+1] = Def.ActorFrame{
	OnCommand=function(s) s:queuecommand("Play") end,
	PlayCommand=function(s) 
		local sound = THEME:GetPathS("ScreenStageInformation","StageSound")
		SOUND:PlayOnce(StreamingSound(sound)) 
	end,
};

t[#t+1] = Def.ActorFrame{
	OnCommand=function(s) s:sleep(0.3):queuecommand("Play") end,
	PlayCommand=function(s) 
		local sound = THEME:GetPathS("","DoorClose")
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

t[#t+1] = LoadActor("Doors");


t[#t+1] = Def.ActorFrame{
	Name="Jacket",
	InitCommand=function(s) s:setsize(300,300):xy(_screen.cx,_screen.cy+12) end,
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/jacket frame"),
		OnCommand=function(s) 
			s:zoomy(0.0129):zoomx(1.3):diffusealpha(0)
			:sleep(1.2):diffusealpha(1)
			:sleep(0.017):diffusealpha(0):zoomy(0.0645)
			:sleep(0.017):diffusealpha(1)
			:sleep(0.017):diffusealpha(0):zoomy(0.1741)
			:sleep(0.033):diffusealpha(1)
			:sleep(0.017):diffusealpha(0):zoomy(0.2806):zoomx(1.265)
			:sleep(0.017):diffusealpha(1)
			:sleep(0.017):diffusealpha(0):zoomy(0.407):zoomx(1.245)
			:sleep(0.017):diffusealpha(1)
			:sleep(0.017):diffusealpha(0):zoomy(0.527):zoomx(1.201)
			:sleep(0.017):diffusealpha(1)
			:sleep(0.017):diffusealpha(0):zoomy(0.7):zoomx(1.126)
			:sleep(0.017):diffusealpha(1)
			:sleep(0.017):diffusealpha(0):zoomy(0.790):zoomx(1.116)
			:sleep(0.017):diffusealpha(1)
			:sleep(0.017):diffusealpha(0):zoomy(0.952):zoomx(1.066)
			:sleep(0.017):diffusealpha(1)
			:sleep(0.017):diffusealpha(0)
		end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/jacket frame"),
		OnCommand=function(s) s:diffusealpha(0)
			:sleep(1.5):zoomy(1.033):zoomx(1.033)
			:sleep(0.034):diffusealpha(1)
			:sleep(0.017):diffusealpha(0)
			:sleep(0.016):diffusealpha(1)
			:sleep(0.018):diffusealpha(0)
			:sleep(0.017):diffusealpha(1)
			:sleep(0.016):diffusealpha(0)
			:sleep(0.018):diffusealpha(1)
			:sleep(0.017):diffusealpha(0)
			:sleep(0.016):diffusealpha(1)
			:sleep(0.018):diffusealpha(0)
			:sleep(0.150):diffusealpha(1)
			:sleep(0.017):diffusealpha(0)
		end,
	};
};

t[#t+1] = LoadActor("StageDisplay")..{ InitCommand=function(s) s:xy(140,80):zoom(0.667) end, };

t[#t+1] = LoadActor("APFC")..{
	Condition=GAMESTATE:IsExtraStage2();
	InitCommand=function(s) s:xy(_screen.cx,_screen.cy-157):zoom(0.637) end, 
	OnCommand=function(s) s:diffusealpha(0):sleep(1.85):linear(0.2):diffusealpha(1):sleep(0.5):linear(0.2):diffusealpha(0) end,
};

t[#t+1] = Def.Sprite {
	InitCommand=function(s) s:x(_screen.cx):y(_screen.cy+12):diffusealpha(0) end,
	OnCommand=function(s) s:queuecommand("Set"):sleep(1.85):linear(0.2):diffusealpha(1):sleep(0.7) end,
	SetCommand=function(s)
	local song = GAMESTATE:GetCurrentSong()
		if song then
			s:Load(GetJacketPath(song))
		end;
		s:setsize(300,300)
	end;
};

t[#t+1] = Def.Quad{
	InitCommand=function(s) s:FullScreen():diffusecolor(Color.White):diffusealpha(0) end,
	OnCommand=function(s) s:sleep(0.164):linear(0.2):diffusealpha(0.7):linear(0.3):diffusealpha(0) end,
};

t[#t+1] = LoadActor("ScoreDisplay")..{ InitCommand=function(s) s:zoom(0.667) end, };

return t