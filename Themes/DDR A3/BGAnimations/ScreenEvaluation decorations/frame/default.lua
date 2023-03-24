local pn, controller, paneState = ...;
local tabCount = 3
local paneState = 1;

local FRAME_WIDTH, FRAME_HEIGHT = 458, 240;

local zoomTowards = (controller == PLAYER_1) and -700 or 700;


return Def.ActorFrame{
	OffCommand=function(s) s:sleep(0.2):linear(0.2):addx(zoomTowards) end,
	--Input handler
	CodeMessageCommand=function(s,p)
		if p.PlayerNumber==controller then
			if p.Name=="Left" then
				if paneState > 0 then
					SOUND:PlayOnce(THEME:GetPathS("ScreenOptions","change" ));
					paneState = paneState - 1;
				end;
			elseif p.Name=="Right" then
				if paneState < (tabCount-1) then
					--soundeffect:play();
					SOUND:PlayOnce(THEME:GetPathS("ScreenOptions","change" ));
					paneState = paneState + 1;
				end;
			else
				SCREENMAN:SystemMessage("Unknown button: "..p.Name);
			end;
		end;
	end;
	--Background
	Def.Sprite{
		Name="DefaultFrame";
		Texture="base",
		InitCommand=function(s) s:setsize(FRAME_WIDTH,FRAME_HEIGHT):diffusealpha(0.7) end,
	};

	--Tabs
	Def.Sprite{
		Texture=Language().."tabs",
		InitCommand=function(s) s:pause():xy(-97,-144):zoom(1.1):setstate(paneState) end,
		CodeMessageCommand=function(s,p)
			if p.PlayerNumber==controller then
				s:setstate(paneState)
			end;
        end;
	};
	LoadActor("kcal",pn)..{
		InitCommand=function(s) 
			if paneState == 0 then
				s:diffusealpha(1);
			else
				s:diffusealpha(0);
			end
		end,
		CodeMessageCommand=function(s,p)
			if p.PlayerNumber==controller then
				if paneState == 0 then
					s:diffusealpha(1);
				else
					s:diffusealpha(0);
				end;
			end;
		end;
	};
	LoadActor("data",pn)..{
		InitCommand=function(s) 
			if paneState == 1 then
				s:diffusealpha(1);
			else
				s:diffusealpha(0);
			end
		end,
		CodeMessageCommand=function(s,p)
			if p.PlayerNumber==controller then
				if paneState == 1 then
					s:diffusealpha(1);
				else
					s:diffusealpha(0);
				end;
			end;
		end;
		
	};
	--3rd pane, rankings
	LoadActor("rival",pn)..{
		InitCommand=function(s) 
			if paneState == 2 then
				s:diffusealpha(1);
			else
				s:diffusealpha(0);
			end
		end,
		CodeMessageCommand=function(s,p)
			if p.PlayerNumber==controller then
				if paneState == 2 then
					s:diffusealpha(1);
				else
					s:diffusealpha(0);
				end;
			end;
		end;
	};
  };