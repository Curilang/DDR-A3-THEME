local entryToPrefixMap = {
	['filter'] = "ScreenFilter",
	['character'] = "SNCharacter"
}

function LoadFromProfilePrefs()
	--note: unless you don't use the _fallback version of getenv/setenv this
	--code does not work
	local env = GAMESTATE:Env()
	for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
		local prefs = ProfilePrefs.Read(GetProfileIDForPlayer(pn))
		local shortPn = ToEnumShortString(pn)
		for sourceName, destName in pairs(entryToPrefixMap) do
			destName = destName..shortPn
			if not env[destName] then
				env[destName] = prefs[sourceName]
			end
		end
	end
end 
