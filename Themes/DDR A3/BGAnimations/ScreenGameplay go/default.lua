local t = Def.ActorFrame{};

local function SongSleep()
	if GetUserPref("OptionRowSongTiming")=='DDR' then
			if GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Butterfly" 														then return 0.8
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "CHAOS"															then return 1.4
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "DEAD END (\"GROOVE RADAR\" Special)" 							then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Pluto Relinquish" 												then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "SABER WING" 													then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Shiny World" 													then return 6.8
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Valkyrie dimension" 											then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "NEPHILIM DELTA" 												then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "SILVER☆DREAM" 													then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Tohoku EVOLVED" 												then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "TRIP MACHINE EVOLUTION" 										then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Triple Journey -TAG EDITION-" 									then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "MAX.(period)" 													then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Over The “Period”" 												then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "IX" 	 														then return 0.8
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "恋する☆宇宙戦争っ!!" 												then return 0 	
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "MAX 360" 														then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "最小三倍完全数" 													then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "AI" 															then return 0.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "PANIC HOLIC"													then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "The Medley of Kirby SSDX"										then return 0.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "The legend of MAX(X-Special)"									then return 0.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "DDR TAGMIX -LAST DanceR-"										then return 2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Avenger"														then return 0.8
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "量子の海のリントヴルム"													then return 0.6
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Boss Rush"														then return 0.7
		else 																															 return 1 
		end
	else
		return 0.5
	end
end

if not (GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Lesson by DJ") then
	t[#t+1] = Def.ActorFrame {
		LoadActor( "bg" )..{
			InitCommand=function(s) s:Center():blend(('BlendMode_Add')) end,
			OnCommand=function(s)
				s:diffusealpha(0):zoom(0)
				s:linear(0.1):diffusealpha(1):zoom(0.867)
				s:linear(0.1):diffusealpha(1):zoom(0.667):sleep(SongSleep()+0.2)
				s:linear(0.1):diffusealpha(0):zoomx(0.667):zoomy(0);
			end,
		};
	
		--Left
		LoadActor("GO")..{
			InitCommand=function(s) s:xy(_screen.cx,_screen.cy) end,
			OnCommand=function(self)
				self:diffusealpha(1):zoom(0)
				self:linear(0.1):zoom(0.418)
				self:linear(0.1):diffusealpha(1):zoomx(0.62):zoomy(0.64)
				self:linear(0.1):diffusealpha(1):zoomx(0.69):zoomy(0.71)
				self:linear(0.1):zoom(0.667):sleep(SongSleep())
				self:linear(0.1):diffusealpha(0):zoomx(0.69):zoomy(0);
			end;
		};
	
		--Right
		LoadActor("GO")..{
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
end

return t;