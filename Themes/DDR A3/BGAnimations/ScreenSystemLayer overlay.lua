local function CreditsText()
	local text = LoadFont("_futura lt medium 24px") .. {
		InitCommand=cmd(zoom,0.43;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-7.3;strokecolor,color("0.3,0.3,0.3,1");playcommand,"Refresh");
		RefreshCommand=function(self)
		--Other coin modes
			if GAMESTATE:IsEventMode() then self:settext('EVENT MODE') return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Free' then self:settext('FREE PLAY') return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Home' then self:settext('HOME MODE') return end
		--Normal pay
			local coins=GAMESTATE:GetCoins()
			local coinsPerCredit=PREFSMAN:GetPreference('CoinsPerCredit')
			local credits=math.floor(coins/coinsPerCredit)
			local remainder=math.mod(coins,coinsPerCredit)
			local s='CREDIT:'
			if credits > 1 then
				s='CREDITS:'..credits
			elseif credits == 1 then
				s=s..credits
			else
				s=s..0
			end
			self:horizalign(center)
			self:settext(s)
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end;

			self:visible( bShow );
		end;
		CoinInsertedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		RefreshCreditTextMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};
	return text;
end;

local function CoinsText()
	local text = LoadFont("_futura lt medium 24px") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-10.5;strokecolor,color("0.3,0.3,0.3,1");horizalign,center;playcommand,"Refresh");
		RefreshCommand=function(self)
			local coins=GAMESTATE:GetCoins()
			local coinsPerCredit=PREFSMAN:GetPreference('CoinsPerCredit')
			local remainder=math.mod(coins,coinsPerCredit)
			local s='COIN(S):'
			if coinsPerCredit > 1 then
				s=s..remainder..'/'..coinsPerCredit
			else
				s=''
			end

			if GAMESTATE:GetCoinMode() == 'CoinMode_Pay' then
				self:visible(true);
			else
				self:visible(false);
			end

			self:settext(s)
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end;

			self:visible( bShow );
		end;
		CoinInsertedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		RefreshCreditTextMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};
	return text;
end;

local function NetworkText()
	local text = LoadFont("_futura lt medium 24px") .. {
		InitCommand=function (self)
			self:name("NetworkStatus");
			self:settext("-----");
			self:x(SCREEN_CENTER_X-177);
			self:y(SCREEN_BOTTOM-7.3);
			self:horizalign(right);
			self:zoom(0.43);
			self:strokecolor(color("0.3,0.3,0.3,1"));
		end;
		RefreshCommand=function (self)
		local netConnected = IsNetConnected();
		local loggedOnSMO = IsNetSMOnline();
			if netConnected then
				self:diffuse(color("#00FF00"));
				self:settext("ONLINE");
			else
				self:diffuse(color("#00FF00"));
				self:settext("ONLINE");
			end;
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end

			self:visible( bShow );
		end;
		CoinInsertedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		RefreshCreditTextMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};
	return text;
end;

local function Paseli()
	local textP1 = LoadFont("_futura lt medium 24px") .. {
	InitCommand=function(self)  
		self:settext("PASELI:******")
		self:x(_screen.cx-390);
		self:y(SCREEN_BOTTOM-7.3);
		self:zoom(0.43);
		self:strokecolor(color("0.3,0.3,0.3,1")) 
	end,
	};
	
	local textP2 = LoadFont("_futura lt medium 24px") .. {
	InitCommand=function(self)  
		self:settext("PASELI:******")
		self:x(_screen.cx+341);
		self:y(SCREEN_BOTTOM-7.3);
		self:zoom(0.43);
		self:strokecolor(color("0.3,0.3,0.3,1")) 
	end,
	};
	
	return Def.ActorFrame { textP1; textP2; };
end


local t = Def.ActorFrame {}

t[#t+1] = Def.ActorFrame {
	NetworkText();
	CreditsText();
	CoinsText();
};

return t;
