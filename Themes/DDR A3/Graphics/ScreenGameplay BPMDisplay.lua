-- check if players are playing steps with different timingdata.
local numPlayers = GAMESTATE:GetNumPlayersEnabled()

local function UpdateSingleBPM(self)
	local bpmDisplay = self:GetChild("BPMDisplay")
	local bpm = GAMESTATE:GetPlayerState(GAMESTATE:GetMasterPlayerNumber()):GetSongPosition():GetCurBPS() * 60
	bpmDisplay:settext( string.format("%02.0f",bpm) )
end

local t = Def.ActorFrame{}

-- manual bpm display
t[#t+1] = LoadFont("_squareslab711 lt bt Bold 24px")..{
	Name="BPMDisplay";
	InitCommand=function(s) s:draworder(101):zoomx(1.3):zoomy(1):shadowlength(1) end,
};

t.InitCommand=cmd(SetUpdateFunction,UpdateSingleBPM);


return t;