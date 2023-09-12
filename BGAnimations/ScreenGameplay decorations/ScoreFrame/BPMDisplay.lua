local function UpdateSingleBPM(self)
	local bpmDisplay = self:GetChild("BPMDisplay")
	local bpm = GAMESTATE:GetPlayerState(GAMESTATE:GetMasterPlayerNumber()):GetSongPosition():GetCurBPS() * 60
	bpmDisplay:settext( string.format("%02.0f",bpm) )
end

return Def.ActorFrame{
	InitCommand=function(s) s:SetUpdateFunction(UpdateSingleBPM) end,
	Def.BitmapText{
		Name="BPMDisplay";
		Font="_impact 32px",
		InitCommand=function(s) s:draworder(101):zoomx(0.9):zoomy(0.68):shadowlength(1) end,
	};
};