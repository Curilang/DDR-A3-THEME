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
		InitCommand=function(s) s:Center():diffusealpha(0) end,
		OnCommand=function(s) s:Load(THEME:GetPathB("ScreenCompany","background/KONAMI")):zoom(0.74)
			s:diffusealpha(0):linear(0.5):diffusealpha(1):sleep(4):linear(0.5):diffusealpha(0)
		end,
	};
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("#ffffff")):FullScreen() end,
		OnCommand=function(s) s:diffusealpha(0):sleep(4):linear(0.5):diffusealpha(1) end,
	};
	Def.Sprite{
		InitCommand=function(s) s:Center():diffusealpha(0) end,
		OnCommand=function(s) s:Load(THEME:GetPathB("ScreenCompany","background/"..Language().."BEMANI")):zoom(0.766)
			s:sleep(4):linear(0.5):diffusealpha(1):sleep(2):linear(0.5):diffusealpha(0)
		end,
	};
	Def.Sprite{
		InitCommand=function(s) s:Center():diffusealpha(0) end,
		OnCommand=function(s) s:Load(THEME:GetPathB("ScreenCompany","background/EAMUSEMENT")):zoom(0.6)
			s:sleep(7):linear(0.5):diffusealpha(1):sleep(2):linear(0.5):diffusealpha(0)
		end,
	};
	Def.Sprite{
		InitCommand=function(s) s:Center():diffusealpha(0) end,
		OnCommand=function(s) s:Load(THEME:GetPathB("ScreenCompany","background/"..Language().."RSA")):zoom(0.667)
			s:sleep(10):linear(0.5):diffusealpha(1):sleep(2):linear(0.5):diffusealpha(0)
		end,
	};
	Def.Sprite{
		InitCommand=function(s) s:Center():diffusealpha(0) end,
		OnCommand=function(s) s:Load(THEME:GetPathB("ScreenCompany","background/THANK YOU")):zoom(0.667)
			s:sleep(12):linear(0.5):diffusealpha(1):sleep(3):linear(0.5):diffusealpha(0)
		end,
	};
};