local Announcer
if (GAMESTATE:GetCurrentStage() == 'Stage_1st') then
	Announcer = "stage 1"
elseif (GAMESTATE:GetCurrentStage() == 'Stage_2nd') then
	Announcer = "stage 2"
elseif (GAMESTATE:GetCurrentStage() == 'Stage_3rd') then
	Announcer = "stage 3"
elseif (GAMESTATE:GetCurrentStage() == 'Stage_4th') then
	Announcer = "stage 4"
elseif (GAMESTATE:GetCurrentStage() == 'Stage_Final') then
	Announcer = "stage final"
elseif (GAMESTATE:IsExtraStage()) then
	Announcer = "stage extra1"
elseif (GAMESTATE:IsExtraStage2()) then
	Announcer = "stage extra2"
elseif (GAMESTATE:IsEventMode()) then
	Announcer = "stage event"
end

return Def.ActorFrame{
	SOUND:PlayAnnouncer("stage sound X");
	SOUND:PlayAnnouncer(Announcer);
};