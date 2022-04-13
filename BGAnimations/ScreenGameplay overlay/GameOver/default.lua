local t = Def.ActorFrame{};
local Center1Player = PREFSMAN:GetPreference('Center1Player');
local NumPlayers = GAMESTATE:GetNumPlayersEnabled();
local NumSides = GAMESTATE:GetNumSidesJoined();
local st = GAMESTATE:GetCurrentStyle():GetStepsType();

local function GetPositionOniGamerOverX(pn)
	if st == "StepsType_Dance_Double" or st == "StepsType_Dance_Solo" or Center1Player then return SCREEN_WIDTH/2;
	else
	local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers";
	local strSide = (NumSides == 1) and "OneSide" or "TwoSides";
	return THEME:GetMetric("ScreenGameplay","Player".. ToEnumShortString(pn) .. strPlayer .. strSide .."X");
end;
end;

t[#t+1] = LoadActor("jx3hd_gover_p1")..{
	InitCommand=function(s) s:player(PLAYER_1):visible(false):zoom(0.667):y(_screen.cy):bob():effectperiod(0.533):effectmagnitude(0,5,0):rotationz(-5) end,
	HealthStateChangedMessageCommand=function(self, param)
		if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'battery') == true then 
			if  param.PlayerNumber =='PlayerNumber_P1' then
				if param.HealthState == "HealthState_Dead" then
					self:x(GetPositionOniGamerOverX(param.PlayerNumber));
					self:sleep(0.5);
					self:visible(true);
				else
					self:visible(false);
				end;
			end;
		end;
	end;
};

t[#t+1] = LoadActor("jx3hd_gover_p2")..{
	InitCommand=function(s) s:player(PLAYER_2):visible(false):zoom(0.667):y(_screen.cy):bob():effectperiod(0.533):effectmagnitude(0,5,0):rotationz(-5) end,
	HealthStateChangedMessageCommand=function(self, param)
		if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'battery') == true then 
			if  param.PlayerNumber =='PlayerNumber_P2' then
				if param.HealthState == "HealthState_Dead" then
					self:x(GetPositionOniGamerOverX(param.PlayerNumber));
					self:sleep(0.5);
					self:visible(true);
				else
					self:visible(false);
				end;
			end;
		end;
	end;
};

return t;