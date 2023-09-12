return Def.ActorFrame {
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("ScreenCompany","Sound")) end,
	};
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("#b60014")):FullScreen() end,
		OnCommand=function(s) s:sleep(4.5):linear(0.5):diffusealpha(0) end,
	};
	Def.Sprite{
		Texture="KONAMI_1",
		InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
		OnCommand=function(s) 
			s:diffusealpha(0):linear(0.5):diffusealpha(1):sleep(4):linear(0.5):diffusealpha(0)
		end,
	};
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("#ffffff")):FullScreen() end,
		OnCommand=function(s) s:diffusealpha(0):sleep(4):linear(0.5):diffusealpha(1) end,
	};
	Def.Sprite{
		Texture=Language().."BEMANI",
		InitCommand=function(s) s:Center():diffusealpha(0):zoom(0.766) end,
		OnCommand=function(s)
			s:sleep(4):linear(0.5):diffusealpha(1):sleep(2):linear(0.5):diffusealpha(0)
		end,
	};
	Def.Sprite{
		Texture="EAMUSEMENT",
		InitCommand=function(s) s:Center():diffusealpha(0):zoom(0.6) end,
		OnCommand=function(s)
			s:sleep(7):linear(0.5):diffusealpha(1):sleep(2):linear(0.5):diffusealpha(0)
		end,
	};
	Def.Sprite{
		Texture=Language().."RSA",
		InitCommand=function(s) s:Center():diffusealpha(0):zoom(0.667) end,
		OnCommand=function(s)
			s:sleep(10):linear(0.5):diffusealpha(1):sleep(2):linear(0.5):diffusealpha(0)
		end,
	};
	Def.Sprite{
		Texture="THANK YOU",
		InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
		OnCommand=function(s)
			s:sleep(12):linear(0.5):diffusealpha(1):sleep(3):linear(0.5):diffusealpha(0)
		end,
	};
};