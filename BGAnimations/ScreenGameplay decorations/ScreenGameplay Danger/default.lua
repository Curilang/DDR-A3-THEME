local t = Def.ActorFrame{};
local Center1Player = PREFSMAN:GetPreference('Center1Player');
local NumPlayers = GAMESTATE:GetNumPlayersEnabled();
local NumSides = GAMESTATE:GetNumSidesJoined();
local st = GAMESTATE:GetCurrentStyle():GetStepsType();

local function GetPosition(pn)
	if st == "StepsType_Dance_Double" or st == "StepsType_Dance_Solo" or Center1Player then 
		return SCREEN_WIDTH/2;
	else
	local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers";
	local strSide = (NumSides == 1) and "OneSide" or "TwoSides";
		return THEME:GetMetric("ScreenGameplay","Player".. ToEnumShortString(pn)..strPlayer..strSide.."X");
	end;
end;

--LoadFilters
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("DangerAnim"..ToEnumShortString(pn))..{
		InitCommand=function(self)
			self:x(GetPosition(pn));
		end;
		ShowCommand=cmd(diffusealpha,1);
		HideCommand=cmd(diffusealpha,1);
	}
end

return t