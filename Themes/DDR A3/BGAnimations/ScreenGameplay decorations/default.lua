local t = LoadFallbackB()
local song = GAMESTATE:GetCurrentSong():GetDisplayFullTitle();

if not GAMESTATE:IsCourseMode() then
	t[#t+1] = LoadActor("Score");
end;


if not GAMESTATE:IsDemonstration() then
	if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
		t[#t+1] = LoadActor("Cut-In/DanceStages")
	elseif GetUserPref("OptionRowGameplayBackground")=='SNCharacters' then
		t[#t+1] = LoadActor("Cut-In/SNCharacters")
	end
end
	
for _, pn in ipairs(GAMESTATE:GetEnabledPlayers()) do	
	t[#t+1] = LoadActor("ScreenFilter",pn);	
end;

t[#t+1] = LoadActor("ScreenGameplay Danger");
t[#t+1] = LoadActor("Speed-Appearance")..{ InitCommand=function(s) s:draworder(1) end, };

if ShowFastSlow() then
	t[#t+1] = LoadActor("FastSlow");
end
	
t[#t+1] = StandardDecorationFromFileOptional("StageFrame","StageFrame");


if not GAMESTATE:IsDemonstration() then
	t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")
end

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("lifeframe",pn);
	t[#t+1] = LoadActor( THEME:GetPathG("","OptionIcon/"..ToEnumShortString(pn)) ) .. {
		InitCommand=function(s) s:player(pn):zoomx(0.64):zoomy(0.63):draworder(1):x(pn==PLAYER_1 and _screen.cx-296 or _screen.cx+318)
			if IsReverse(pn) then
				s:y(_screen.cy-179)
			else
				s:y(_screen.cy+161)
			end
		end,
	};
end

t[#t+1] = StandardDecorationFromFile("ScoreFrame","ScoreFrame");

if GetUserPref("OptionRowBPM")=='BPM' then
	for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
		t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")..{
			InitCommand=function(s) s:zoomx(0.667):zoomy(0.69)
				if IsReverse(pn) then
					s:x(pn==PLAYER_1 and _screen.cx-206 or _screen.cx+360)
					s:y(_screen.cy-197) 
				else
					s:y(_screen.cy+179) 
					s:x(pn==PLAYER_1 and _screen.cx-220 or _screen.cx+379)
				end
			end,
		};
	end;
end;

return t