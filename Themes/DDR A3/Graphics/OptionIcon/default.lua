local pn = ...
local player = ToEnumShortString(pn)

return Def.ActorFrame {
	-- Speed
	Def.Sprite {
		OnCommand=function(self)
			self:x(-186);
			if GAMESTATE:PlayerIsUsingModifier(pn,'0.25x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x025.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'0.5x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x050.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'0.75x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x075.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'1x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x100.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'1.25x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x125.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'1.5x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x150.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'1.75x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x175.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'2x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x200.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'2.25x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x225.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'2.5x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x250.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'2.75x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x275.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'3x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x300.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'3.25x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x325.png"));        
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'3.5x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x350.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'3.75x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x375.png"));        
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'4x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x400.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'4.25x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x425.png"));         
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'4.5x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x450.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'4.75x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x475.png"));         
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'5x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x500.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'5.25x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x525.png"));        
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'5.5x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x550.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'5.75x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x575.png"));        
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'6x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x600.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'6.25x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x625.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'6.5x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x650.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'6.75x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x675.png"));        
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'7x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x700.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'7.25x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x725.png"));        
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'7.5x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x750.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'7.75x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x775.png"));  
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'8x') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Speed/x800.png"));
			end;
		end;
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
	};
	-- Boost
	Def.Sprite {
		InitCommand=function(self)
			self:x(-153);
			if IsBoost(pn) then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Boost/Boost.png"));
			elseif IsBrake(pn) then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Boost/Brake.png"));
			elseif IsWave(pn) then
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
			if GAMESTATE:PlayerIsUsingModifier(pn,'mirror') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Turn/Mirror.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'left') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Turn/Left.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'right') then
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Turn/Right.png"));
			elseif GAMESTATE:PlayerIsUsingModifier(pn,'shuffle') then
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
			if IsDark(pn) then
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
			if IsReverse(pn) then
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
			if GAMESTATE:PlayerIsUsingModifier(pn,'little') then
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
			if GAMESTATE:PlayerIsUsingModifier(pn,'noholds') then
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
			if GAMESTATE:PlayerIsUsingModifier(pn,'nojumps') then
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
			if Is4Lives(pn) then			
				self:Load(THEME:GetPathG("","OptionIcon/"..player.."/Gauge/Life4.png"));
			elseif Is1Lives(pn) then			
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