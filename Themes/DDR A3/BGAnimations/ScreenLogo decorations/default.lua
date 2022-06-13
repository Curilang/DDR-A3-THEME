return Def.ActorFrame{
	Def.ActorFrame{
		OnCommand=function(s)
			if IsLogo() then
				SOUND:PlayAnnouncer("title menu game name")
			end
		end,
	};
	
	LoadActor(THEME:GetPathB("ScreenLogo","decorations/"..Model().."logo"))..{
		InitCommand=function(s) s:xy(_screen.cx,_screen.cy-14):setsize(725,325) end,
	};
	
	LoadActor(THEME:GetPathB("ScreenLogo","decorations/copyright"))..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-98;zoom,0.54);
	};
	
	Def.Quad{
		InitCommand=function(s) s:diffuse(Color("White")):FullScreen() end,
		OnCommand=function(s) 
			if IsLogo() then
				s:linear(0.25):diffusealpha(0):sleep(9.5):linear(0.25):diffusealpha(1) 
			elseif IsTitleMenu() or IsTitleJoin then 
				s:linear(0.25):diffusealpha(0)
			end
		end
	};
	
	LoadActor(THEME:GetPathB("","ModDate"));
	
	LoadActor(THEME:GetPathB("","_Arcade decorations"));
};