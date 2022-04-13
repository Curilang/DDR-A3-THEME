local t = Def.ActorFrame{};

SOUND:PlayOnce(THEME:GetPathS("","Announcer/Crowd X"));

local Announcer
if GAMESTATE:GetCurrentStage() == 'Stage_1st' then
	Announcer = "1st Stage"
elseif GAMESTATE:GetCurrentStage() == 'Stage_2nd' then
	Announcer = "2nd Stage"
elseif GAMESTATE:GetCurrentStage() == 'Stage_3rd' then
	Announcer = "3rd Stage"
elseif GAMESTATE:GetCurrentStage() == 'Stage_4th' then
	Announcer = "4th Stage"
elseif GAMESTATE:GetCurrentStage() == 'Stage_Final' then
	Announcer = "Final Stage"
elseif GAMESTATE:IsExtraStage() then
	Announcer = "Extra Stage"
elseif GAMESTATE:IsExtraStage2() then
	Announcer = "Encore Extra Stage"
end

if (not GAMESTATE:IsEventMode()) then
	t[#t+1] = LoadActor(THEME:GetPathS("","Announcer/"..Announcer)) .. {		
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
end

return t;