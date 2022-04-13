local pn = ({...})[1]
local ScreenFilter = FilterReadPref(pn);

local Filter
if GAMESTATE:GetCurrentStyle():GetStepsType() == 'StepsType_Dance_Double' then
	Filter = THEME:GetPathB("ScreenGameplay","decorations/ScreenFilter/double")
else
	Filter = THEME:GetPathB("ScreenGameplay","decorations/ScreenFilter/single")
end

local Position
if PREFSMAN:GetPreference('Center1Player') and GAMESTATE:GetNumPlayersEnabled() == 1 and GAMESTATE:GetNumSidesJoined() == 1 then 
	Position = _screen.cx
elseif GAMESTATE:GetCurrentStyle():GetStepsType() == 'StepsType_Dance_Double' then
	Position = _screen.cx
else
	Position = pn == PLAYER_1 and ScreenGameplay_P1X() or ScreenGameplay_P2X()
end

local Darkness
	if ScreenFilter == "Off"	 	then Darkness = 0
elseif ScreenFilter == "Dark"	 	then Darkness = 0.35
elseif ScreenFilter == "Darker"	 	then Darkness = 0.65
elseif ScreenFilter == "Darkest"	then Darkness = 0.95					
else 									 Darkness = 0.65					
end

if GAMESTATE:IsDemonstration()  then Darkness = 0.65 end

function FilterUpdate(self)
	if (GAMESTATE:GetSongBeat() >= GAMESTATE:GetCurrentSong():GetLastBeat()) then 
		self:visible(false)
	elseif (GAMESTATE:GetSongBeat() >= GAMESTATE:GetCurrentSong():GetFirstBeat()-8) then 
		self:visible(true)
	else 
		self:visible(false)
	end
end

local t = Def.ActorFrame {};

t[#t+1] = Def.Sprite { 
	InitCommand=function(s) s:zoom(0.67):x(Position):y(_screen.cy):Load(Filter):diffusealpha(Darkness) end, 
};

if GuideLines() == false then
	t.InitCommand=cmd(SetUpdateFunction,FilterUpdate); 
end;

return t;