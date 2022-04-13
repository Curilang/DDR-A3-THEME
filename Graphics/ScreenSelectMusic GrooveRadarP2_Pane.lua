local function radarSet(self)
	local selection = nil
	if GAMESTATE:IsCourseMode() then
		if GAMESTATE:GetCurrentCourse() then
			selection = GAMESTATE:GetCurrentTrail(PLAYER_2)
		end
	else
		if GAMESTATE:GetCurrentSong() then
			selection = GAMESTATE:GetCurrentSteps(PLAYER_2)
		end
	end
	if selection then
		local tt={};
		-- assert(tt);
		 tt[1]=selection:GetRadarValues(PLAYER_2):GetValue('RadarCategory_Stream')/2;
		tt[2]=selection:GetRadarValues(PLAYER_2):GetValue('RadarCategory_Voltage')/2;
		tt[3]=selection:GetRadarValues(PLAYER_2):GetValue('RadarCategory_Air')/2;
		tt[4]=selection:GetRadarValues(PLAYER_2):GetValue('RadarCategory_Freeze')/2;
		tt[5]=selection:GetRadarValues(PLAYER_2):GetValue('RadarCategory_Chaos')/2;
		
		self:SetFromValues(PLAYER_2,tt);
		--self:SetFromRadarValues(PLAYER_1, selection:GetRadarValues(PLAYER_1))
	else
		self:SetEmpty(PLAYER_2)
	end
end

local t = Def.ActorFrame {
	CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
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
		OnCommand=cmd(zoom,0;sleep,0.583;decelerate,0.150;zoom,2;diffuse,PlayerColor(PLAYER_2)),
		OffCommand=cmd(sleep,0.00;decelerate,0.167;zoom,0),
		CurrentSongChangedMessageCommand=radarSet,
		CurrentStepsP2ChangedMessageCommand=radarSet,
		CurrentTrailP2ChangedMessageCommand=radarSet,
	},
}

return t