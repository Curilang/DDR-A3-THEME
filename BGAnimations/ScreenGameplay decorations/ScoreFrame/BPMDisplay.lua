local function UpdateSingleBPM(self)
	local bpmDisplay = self:GetChild("BPMDisplay")
	local bpm = GAMESTATE:GetPlayerState(GAMESTATE:GetMasterPlayerNumber()):GetSongPosition():GetCurBPS() * 60
	bpmDisplay:settext( string.format("%02.0f",bpm) )
end

local t = Def.ActorFrame{};

t[#t+1] = LoadFont("_impact 32px")..{
	Name="BPMDisplay";
	InitCommand=function(s) s:draworder(101):zoomx(0.9):zoomy(0.68):shadowlength(1) end,
};

t.InitCommand=cmd(SetUpdateFunction,UpdateSingleBPM);

return t;