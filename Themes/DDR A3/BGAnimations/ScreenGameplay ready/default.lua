local function SongSleep()
	if GetUserPref("OptionRowSongTiming")=='DDR' then
			if GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Butterfly" 														then return 0.8
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "CHAOS"															then return 1.6
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "DEAD END (\"GROOVE RADAR\" Special)" 							then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Pluto Relinquish" 												then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "SABER WING" 													then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Shiny World" 													then return 8.6
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
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Neutrino" 														then return 0.9
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "最小三倍完全数" 													then return 0		
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "ORCA" 															then return 1.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "世界の果てに約束の凱歌を -DDR Extended Megamix-"						then return 0.6	
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "AI"																then return 0.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "PANIC HOLIC"													then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Sword of Vengeance"												then return 0.6
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Triple Cross"													then return 0.6
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Uh-Oh"															then return 0.7
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "The Medley of Kirby SSDX"										then return 0.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "The legend of MAX(X-Special)"									then return 0.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "DDR TAGMIX -LAST DanceR-"										then return 6.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Lesson by DJ"													then return 3.5
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "MEGALOVANIA"													then return 1.28
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Avenger"														then return 0.9
		else 																															 return 1 
		end
	else
		if GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Lesson by DJ" then 
			return 5.5
		else
			return 0.5 
		end
	end
end

return Def.ActorFrame {
	LoadActor("bg")..{
		InitCommand=function(s) s:Center()
			if GetCurrentModel() == "Gold" then
				s:blend(('BlendMode_Add'))
			end
		end,
		OnCommand=function(s)
			s:diffusealpha(0):zoom(0)
			s:linear(0.1):diffusealpha(1):zoom(0.867)
			s:linear(0.1):diffusealpha(1):zoom(0.667):sleep(SongSleep()+0.2)
			s:linear(0.1):diffusealpha(0):zoomx(0.667):zoomy(0);
		end,
	};
	
	--Left
	LoadActor(ReadyToLoad())..{
		InitCommand=function(s) s:Center() end,
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
	LoadActor(ReadyToLoad())..{
		InitCommand=function(s) s:Center():blend(('BlendMode_Add')) end,
		OnCommand=function(s) 
			s:diffusealpha(0):zoom(0)
			s:linear(0.1):zoom(1.2)
			s:linear(0.1):diffusealpha(0.5):zoomx(0.62):zoomy(0.64)
			s:linear(0.1):diffusealpha(0.5):zoomx(0.72):zoomy(0.74)
			s:linear(0.1):diffusealpha(0):zoom(0.92)
		end,
	};
};