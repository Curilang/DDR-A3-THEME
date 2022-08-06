return Def.ActorFrame {
	Def.ActorFrame{
		InitCommand=function(s) s:x(_screen.cx):y(SCREEN_TOP-30) end,
		OnCommand=function(s) s:linear(0.3):y(SCREEN_TOP+15):sleep(40.3):linear(0.3):y(SCREEN_TOP-30) end,
		LoadActor(THEME:GetPathG("ScreenWithMenuElements","header/"..GetCurrentModel().."/base"))..{
			InitCommand=function(s) s:zoom(0.667):y(2) end,
		};
		LoadActor(THEME:GetPathG("ScreenWithMenuElements","header/"..GetCurrentModel().."/HOW"))..{
			InitCommand=function(s) s:setsize(340,27) end,
		};
	};
	
	LoadActor(THEME:GetPathB("ScreenGameplay","overlay/Lesson by DJ"))..{
		InitCommand=function(s) s:y(_screen.cy+109) end,
	};
	
	LoadActor(THEME:GetPathB("ScreenHowToPlay","overlay/how"));
	
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("White")):FullScreen():sleep(0.25):linear(0.25):diffusealpha(0):sleep(40.3):linear(0.25):diffusealpha(1) end,
	};
	LoadActor(THEME:GetPathB("","_arcade decorations"));
};