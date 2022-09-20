local function jacket_in()
	if GetUserPref("OptionRowSongTiming")=='DDR' then
		-- DDR 1st
			if GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Butterfly" 														then return 1
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "CHAOS"															then return 4.6
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "DEAD END (\"GROOVE RADAR\" Special)" 							then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Pluto Relinquish" 												then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "SABER WING" 													then return 0.3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Shiny World" 													then return 0.3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Valkyrie dimension" 											then return 0.3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "NEPHILIM DELTA" 												then return 0.3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "SILVER☆DREAM" 													then return 0.3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Tohoku EVOLVED" 												then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "TRIP MACHINE EVOLUTION" 										then return 0
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Triple Journey -TAG EDITION-" 									then return 0.3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "MAX.(period)" 													then return 0.3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Over The “Period”" 												then return 0.3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "IX" 	 														then return 1
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "恋する☆宇宙戦争っ!!" 												then return 0.3 	--Koisuru uchuu sensou!!
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "MAX 360" 														then return 2.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Neutrino" 														then return 8.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Prey"	 														then return 6.8
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "最小三倍完全数" 													then return 0.3		--Saishou sanbai kanzensuu
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "ORCA" 															then return 3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "世界の果てに約束の凱歌を -DDR Extended Megamix-"						then return 2.5		--Sekai no hate ni yakusoku no gaika wo -DDR Extended Megamix-
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "AI"																then return 0.4
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "ANTI ANTHEM"													then return 8.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "PANIC HOLIC"													then return 0.3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Sword of Vengeance"												then return 3.5
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Triple Cross"													then return 7.5
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Uh-Oh"															then return 3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "We're so Happy"													then return 9.1
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "The legend of MAX(X-Special)"									then return 0.5
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "DDR TAGMIX -LAST DanceR-"										then return 0.2
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "MEGALOVANIA" 													then return 0.25
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Avenger" 														then return 2.3
		elseif GAMESTATE:GetCurrentSong():GetDisplayFullTitle() == "Boss Rush" 														then return 7.6
		else 																															 return 1 
		end
	else
		return 0.5
	end
end

--Jacket
return Def.ActorFrame {
 	InitCommand=function(s) s:xy(_screen.cx,_screen.cy+12) end,
	OnCommand=function(s) s:sleep(jacket_in()):linear(0.06):zoom(1.5):diffusealpha(0) end,
	Def.Sprite {
		OnCommand=function(s)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			s:Load(GetJacketPath(song))
		end;
		s:setsize(300,300)
	end;
	};
};