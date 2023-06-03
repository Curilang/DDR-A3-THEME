local pn = ...
local player = ToEnumShortString(pn)

return Def.ActorFrame {
	-- Speed
	Def.ActorFrame{
		OnCommand=function(s) s:x(-186) end,
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:playcommand("On");
			end;
		end;
		CodeMessageCommand=function(self, params)
			if params.PlayerNumber == pn then
				self:queuecommand("On");
			end;
		end;
		Def.Sprite{
			Texture=THEME:GetPathG("","OptionIcon/"..player.."/Speed"),
		};
		Def.BitmapText{
			Font="OptionIcon Speed",
			OnCommand=function(self)
				self:y(1):zoomx(0.78):zoomy(0.74):maxwidth(34)
				self:settext("x"..GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred"):ScrollSpeed());
			end;	
		};
	};
	-- Boost
	Def.Sprite {
		InitCommand=function(self)
			self:x(-153);
			if GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):Boost() == 1 then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Boost/Boost.png"));
			elseif GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):Brake() == 1 then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Boost/Brake.png"));
			elseif GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):Wave() == 1 then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Boost/Wave.png"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:playcommand("Init");
			end;
		end;
	};
	-- Appearance
	Def.Sprite {
		InitCommand=function(self)
			self:x(-119);
			local PlayerUID = PROFILEMAN:GetProfile(pn):GetGUID()
			local MyValue = ReadOrCreateAppearancePlusValueForPlayer(PlayerUID,MyValue);
			if MyValue == "Visible" then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Off.png"));
			elseif MyValue == "Hidden" then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Appearance/Hidden.png"));
			elseif MyValue == "Sudden" then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Appearance/Sudden.png"));
			elseif MyValue == "Stealth" then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Appearance/Stealth.png"));
			elseif MyValue == "Hidden+" then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Appearance/HiddenPlus.png"));
			elseif MyValue == "Sudden+" then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Appearance/SuddenPlus.png"));
			elseif MyValue == "Hidden+&Sudden+" then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Appearance/HiddenSuddenPlus.png"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:playcommand("Init");
			end;
		end;
	};
	-- Turn
	Def.Sprite {
		InitCommand=function(self)
			self:x(-85);
			if GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):Mirror() then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Turn/Mirror.png"));
			elseif GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):Left() then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Turn/Left.png"));
			elseif GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):Right() then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Turn/Right.png"));
			elseif GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):Shuffle() then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Turn/Shuffle.png"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:playcommand("Init");
			end;
		end;
	};
	-- Dark
	Def.Sprite {
		InitCommand=function(self)
			self:x(-51);
			if GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):Dark() == 1 then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Dark/Off.png"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:playcommand("Init");
			end;
		end;
	};
	-- Scroll
	Def.Sprite {
		InitCommand=function(self)
			self:x(-18);
			if GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):Reverse() == 1 then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Scroll/Reverse.png"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:playcommand("Init");
			end;
		end;
	};
	-- Arrow
	Def.Sprite {
		InitCommand=function(self)
			self:x(16);
			if not GAMESTATE:IsDemonstration() then
				if GetUserPref("NTOption")=='On' then
					self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Arrow/"..GetArrowColor(pn)));
				else
					self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Arrow/Note"));
				end
			end
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:playcommand("Init");
			end;
		end;
	};
	-- Cut
	Def.Sprite {
		InitCommand=function(self)
			self:x(49);
			if GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):Little() then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Cut/On1.png"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:playcommand("Init");
			end;
		end;
	};
	-- Freeze arrow
	Def.Sprite {
		InitCommand=function(self)
			self:x(83);
			if GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):NoHolds() then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Freeze/Off.png"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:playcommand("Init");
			end;
		end;
	};
	-- Jump
	Def.Sprite {
		InitCommand=function(self)
			self:x(116);
			if GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Current'):NoJumps() then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Jump/On2.png"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:playcommand("Init");
			end;
		end;
	};
	-- Risky
	Def.Sprite {
		InitCommand=function(self)
			self:x(151);
			if table.search(GAMESTATE:GetPlayerState(pn):GetPlayerOptionsArray("ModsLevel_Preferred"), '4Lives') then			
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Gauge/Life4.png"));
			elseif table.search(GAMESTATE:GetPlayerState(pn):GetPlayerOptionsArray("ModsLevel_Preferred"), '1Lives') then			
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Gauge/Risky.png"));                                			
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == pn then
				self:playcommand("Init");
			end;
		end;
	};
};