local iPN = ...;
assert(iPN,"[Graphics/PaneDisplay text.lua] No PlayerNumber Provided.");

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

local function CreatePaneDisplayItem( _pnPlayer, _sLabel, _rcRadarCategory )
	return Def.ActorFrame {
		LoadFont("Common SemiBold") .. {
			Text=string.upper( THEME:GetString("PaneDisplay",_sLabel) );
			InitCommand=cmd(horizalign,left);
			OnCommand=cmd(zoom,0.5875;diffuse,color("0.9,0.9,0.9");shadowlength,1);
		};
		LoadFont("Common Normal") .. {
			Text=string.format("%04i", 0);
			InitCommand=cmd(x,96;horizalign,right);
			OnCommand=cmd(zoom,0.5875;shadowlength,1);
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local course = GAMESTATE:GetCurrentCourse()
				if not song and not course then
					self:settextf("%04i", 0);
				else
					self:settextf("%04i", GetRadarData( _pnPlayer, _rcRadarCategory ) );
				end
			end;
		};
	};
end;

local function CreatePaneDisplayGraph( _pnPlayer, _sLabel, _rcRadarCategory )
	return Def.ActorFrame {
		LoadFont("Common Normal") .. {
			InitCommand=cmd(zoom,1;horizalign,center;x,30);
			OnCommand=cmd(diffuse,color("#000000"));
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local course = GAMESTATE:GetCurrentCourse()
				if not song and not course then
					self:settext("")
				else
					self:settextf("%0.0f",GetRadarData( _pnPlayer, _rcRadarCategory )*100);
				end
			end;
		};
	};
end;

--[[ Numbers ]]
t[#t+1] = Def.ActorFrame {
	--percentage stuff for groove radar
	CreatePaneDisplayGraph( iPN, "S", 'RadarCategory_Stream' ) .. {
		InitCommand=cmd(y,-80-40-10-2;x,-20-10);
	};
	CreatePaneDisplayGraph( iPN, "V", 'RadarCategory_Voltage' ) .. {
		InitCommand=cmd(x,-100-20-20-10-2;y,-60+10);
	};
	CreatePaneDisplayGraph( iPN, "A", 'RadarCategory_Air' ) .. {
		InitCommand=cmd(x,-85-20-2-2-1;y,80-10-10+5+2);
	};
	CreatePaneDisplayGraph( iPN, "F", 'RadarCategory_Freeze' ) .. {
		InitCommand=cmd(x,85-20-10-5;y,80-10-10+5+2);
	};
	CreatePaneDisplayGraph( iPN, "C", 'RadarCategory_Chaos' ) .. {
		InitCommand=cmd(x,100-5-2;y,-60+10);
	};
};
return t;