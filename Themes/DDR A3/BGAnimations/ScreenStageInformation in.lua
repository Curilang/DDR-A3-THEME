local t = Def.ActorFrame{};

--song jacket--
t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(playcommand,'Set';Center;diffusealpha,0;zoom,0;sleep,1.6+0.25;linear,0.1;diffusealpha,0;zoom,0;sleep,0.5;diffusealpha,0);
	Def.Sprite {
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			local course = GAMESTATE:GetCurrentCourse();
			if song then
				if song:HasJacket() then
					self:LoadBackground(song:GetJacketPath());
					self:setsize(0,0);
				elseif song:HasBanner() then
					self:LoadFromSongBanner(GAMESTATE:GetCurrentSong());
					self:setsize(0,0);
				else
					self:Load(THEME:GetPathG("","Common fallback jacket"));
					self:setsize(0,0);
				end;
			elseif course then
				
					self:LoadBackground(course:GetBannerPath());
					self:setsize(0,0);
			else
					self:Load(THEME:GetPathG("","Common fallback jacket"));
					self:setsize(0,0);
			end;
		end;
	};
};

-- t[#t+1] = LoadActor(THEME:GetPathB("ScreenStageInformation","decorations/SoundStage"));

return t;