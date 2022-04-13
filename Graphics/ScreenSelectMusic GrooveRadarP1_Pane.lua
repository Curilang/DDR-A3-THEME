local function radarSet(self)
	local selection = nil
	if GAMESTATE:IsCourseMode() then
		if GAMESTATE:GetCurrentCourse() then
			selection = GAMESTATE:GetCurrentTrail(PLAYER_1)
		end
	else
		if GAMESTATE:GetCurrentSong() then
			selection = GAMESTATE:GetCurrentSteps(PLAYER_1)
		end
	end
	if selection then
		local tt={};
		-- assert(tt);
		 tt[1]=selection:GetRadarValues(PLAYER_1):GetValue('RadarCategory_Stream')/2;
		tt[2]=selection:GetRadarValues(PLAYER_1):GetValue('RadarCategory_Voltage')/2;
		tt[3]=selection:GetRadarValues(PLAYER_1):GetValue('RadarCategory_Air')/2;
		tt[4]=selection:GetRadarValues(PLAYER_1):GetValue('RadarCategory_Freeze')/2;
		tt[5]=selection:GetRadarValues(PLAYER_1):GetValue('RadarCategory_Chaos')/2;
		
		self:SetFromValues(PLAYER_1,tt);
		--self:SetFromRadarValues(PLAYER_1, selection:GetRadarValues(PLAYER_1))
	else
		self:SetEmpty(PLAYER_1)
	end
end

local t = Def.ActorFrame {
	CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		local course = GAMESTATE:GetCurrentCourse()
		if song or course then
-- 			self:setaux(0)
			self:finishtweening()
			self:playcommand("TweenOn")
		elseif not song and self:GetZoomX() == 1 then
-- 			self:setaux(1)
			self:finishtweening()
			self:playcommand("TweenOff")
		end
	end,
	Name="Radar",
	InitCommand=cmd(Center),

	Def.GrooveRadar {
		OnCommand=cmd(zoom,0;sleep,0.583;decelerate,0.150;zoom,2;diffuse,PlayerColor(PLAYER_1)),
		OffCommand=cmd(sleep,0.00;decelerate,0.167;zoom,0),
		CurrentSongChangedMessageCommand=radarSet,
		CurrentStepsP1ChangedMessageCommand=radarSet,
		CurrentTrailP1ChangedMessageCommand=radarSet,
	},
}

return t