if GetUserPref("NTOption")=='On' then
	for _, pn in ipairs(GAMESTATE:GetEnabledPlayers()) do
		GetPlayerNoteSkin(pn)
	end
end

return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenStageInformation","decorations/Announcer"));
    OnCommand=function(s) s:sleep(2.1) end,
};