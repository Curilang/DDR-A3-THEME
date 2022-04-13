local iPN = ...;
assert(iPN,"[Graphics/ShockArrowDisplay Icon.lua] No PlayerNumber Provided.");

local t = Def.ActorFrame {};

local function GetRadarData( pnPlayer, rcRadarCategory )
	local tRadarValues;
	local StepsOrTrail;
	local fDesiredValue = 0;
	if GAMESTATE:GetCurrentSteps( pnPlayer ) then
		StepsOrTrail = GAMESTATE:GetCurrentSteps( pnPlayer );
		fDesiredValue = StepsOrTrail:GetRadarValues( pnPlayer ):GetValue( rcRadarCategory );
	elseif GAMESTATE:GetCurrentTrail( pnPlayer ) then
		StepsOrTrail = GAMESTATE:GetCurrentTrail( pnPlayer );
		fDesiredValue = StepsOrTrail:GetRadarValues( pnPlayer ):GetValue( rcRadarCategory );
	else
		StepsOrTrail = nil;
	end;
	return fDesiredValue;
end;


local function CreatPanelDisplayShockArrowIcon(_pnPlayer, _sLabel, _rcRadarCategory )
	return Def.ActorFrame {
		LoadActor( "_ShockArrow" )..{
			InitCommand=cmd(zoom,0);
			OnCommand=cmd(playcommand,"Set");
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local course = GAMESTATE:GetCurrentCourse()
				local selection = GAMESTATE:GetCurrentSteps(_pnPlayer);
				if GAMESTATE:IsCourseMode() then
						self:stoptweening();
						self:decelerate(0.2);
						self:zoom(0);
				else
					if selection then
						if GetRadarData( _pnPlayer, _rcRadarCategory) ==0 or not song and not course then
							self:stoptweening();
							self:decelerate(0.2);
							self:zoom(0);
						else
							self:stoptweening();
							self:decelerate(0.2);
							
							self:zoom(1);
						end;
					end;
				end;
			end;	
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
		};
	};
end;



--[[ Numbers ]]
t[#t+1] = Def.ActorFrame {	
	--shockarrow���icon
	CreatPanelDisplayShockArrowIcon(iPN, "Mines", 'RadarCategory_Mines')..{
		InitCommand=cmd(x,0;y,0);
	}
};
return t;