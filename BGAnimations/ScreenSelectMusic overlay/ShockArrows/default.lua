local pn = ...

local function HasMines(pn,rc)
	local RadarValue = 0;
	if GAMESTATE:GetCurrentSteps(pn) then
		RadarValue = GAMESTATE:GetCurrentSteps(pn):GetRadarValues(pn):GetValue(rc);
	end;
	return RadarValue;
end;

local function ShockArrow(pn,rc)
	return Def.ActorFrame {
		InitCommand=function(s) s:xy(0,-18):diffusealpha(0):playcommand("Set") end,
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(s)
			local song = GAMESTATE:GetCurrentSong()
			local st = GAMESTATE:GetCurrentSteps(pn);
			if st then
				s:stoptweening():decelerate(0.2):diffusealpha((HasMines(pn,rc) == 0 or not song) and 0 or 1)
			end
		end,
		LoadActor( "shock" );
		LoadActor( "effect" )..{
			InitCommand=function(s)
				s:diffuseshift()
				s:effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.8"))
				s:effectperiod(0.2)
			end,
		};
	};
end;

return Def.ActorFrame{ ShockArrow(pn, 'RadarCategory_Mines'); };