for _, pn in ipairs(GAMESTATE:GetEnabledPlayers()) do
	if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
		local CharaRandom = GetAllCharacterNames()
			table.remove(CharaRandom,IndexKey(CharaRandom,"Random"))
			table.remove(CharaRandom,IndexKey(CharaRandom,"None"))
		if GetUserPref("SelectCharacter"..pn) == "Random" then
			WritePrefToFile("CharaRandom"..pn,CharaRandom[math.random(#CharaRandom)]);
		end
		if GetUserPref("SelectCharacter"..pn) ~= "Random" then
			GAMESTATE:SetCharacter(pn,GetUserPref("SelectCharacter"..pn))
		else
			GAMESTATE:SetCharacter(pn,GetUserPref("CharaRandom"..pn))
		end
	end
	if GetUserPref("NTOption")=='On' then
		GetPlayerNoteSkin(pn)
	end
end



return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenStageInformation","decorations/Announcer"));
    OnCommand=function(s) s:sleep(2.1) end,
};