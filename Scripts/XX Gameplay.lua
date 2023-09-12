--THIS IS MIDFLIGHT DIGITAL CONTENT!! THANK YOU MD TEAM!!

function GetSong()
	if GAMESTATE:IsCourseMode() then
		local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
		local tEntry = trail:GetTrailEntries()
		local i = GAMESTATE:GetLoadingCourseSongIndex()+1

		if tEntry[i] then
			return tEntry[i]:GetSong()
		end
	else
		return GAMESTATE:GetCurrentSong()
	end
end

function GetSongStartDelay()
	local delay = 0
	local song
	
	if GAMESTATE:GetCurrentCourse() then
		local cEntry = GAMESTATE:GetCurrentCourse():GetCourseEntry(GAMESTATE:GetLoadingCourseSongIndex())
		
		if cEntry then
			song = cEntry:GetSong()
		end
	else
		song = GAMESTATE:GetCurrentSong()
	end
	
	if song then
		local td = song:GetTimingData()
		local bpm = round(td:GetBPMAtBeat(0),3)
		local offset = round(-(td:GetElapsedTimeFromBeat(0)+PREFSMAN:GetPreference("GlobalOffsetSeconds")),3)
		local measureSec = 60/bpm*4
		
		if bpm >= 240 then
			measureSec = measureSec*2
		end
		
		if offset < 0 then
			delay = round(offset%measureSec,3)
		elseif offset > 0 then
			delay = offset
		end
	end
	
	return delay
end

function MinSecondsToStep()
	local delay = 0
	
	if GetSong() then
		local td = GetSong():GetTimingData()
		local firstBeat = round(GetSong():GetFirstBeat(),3)
		local bpm = round(td:GetBPMAtBeat(4),3)
		local measureSec = 60/bpm*4
		local offset = round(-(td:GetElapsedTimeFromBeat(0)+PREFSMAN:GetPreference("GlobalOffsetSeconds")),3)
		
		if offset ~= 0 and firstBeat < 12 then
			delay = round(measureSec*3,3)
		end
	end
	
	return delay
end

function BeginReadyDelay()
	local firstBeat = GetSong():GetFirstBeat()
	local td = GetSong():GetTimingData()
	local bpm = round(td:GetBPMAtBeat(4),3)
	local m = 1
	
	if bpm > 240 then
		m =  2
	elseif bpm < 60 then
		m =  0.5
	end
	
	local timeSigs = split('=', td:GetTimeSignatures()[1])
	local n = timeSigs[2]
	local d = timeSigs[3]
	local g_offset = round(PREFSMAN:GetPreference("GlobalOffsetSeconds"),3)
	
	local delay = (td:GetElapsedTimeFromBeat(firstBeat)+GetSongStartDelay())-(60/bpm*12*m*(n/d))+g_offset
	
	if delay < 0 then
		delay = 0
	end
	
	return round(delay,3)
	
end

function SongMeasureSec()
	local firstBeat = round(GetSong():GetFirstBeat(),3)
	local td = GetSong():GetTimingData()
	local bpm = round(td:GetBPMAtBeat(4),3)
	local offset = round(-(td:GetElapsedTimeFromBeat(0)+PREFSMAN:GetPreference("GlobalOffsetSeconds")),3)
	local timeSigs = split('=', td:GetTimeSignatures()[1])
	local n = timeSigs[2]
	local d = timeSigs[3]
	local sec = 0
	local m = 1
	
	if offset == 0 and firstBeat < 12 then
		if bpm <= 100 then
			sec = td:GetElapsedTimeFromBeat(firstBeat)/4*(n/d)
		else
			sec = td:GetElapsedTimeFromBeat(firstBeat)/3*(n/d)
		end
	else
		if bpm >= 240 and firstBeat > 12 then
			m = 2
		elseif bpm < 60 then
			m = 0.5
		end
		sec = 60/bpm*4*m*(n/d)
	end
	
	return sec
end

function BeginOutDelay()
	local song = GetSong()
	local dif = 0
	
	if GAMESTATE:IsCourseMode() then
		local numCourseSongs = #GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber()):GetTrailEntries()
		local j = (GAMESTATE:GetLoadingCourseSongIndex() == numCourseSongs-1) and 0 or 1
		
		song = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber()):GetTrailEntry(GAMESTATE:GetLoadingCourseSongIndex()-j):GetSong()
	end
	
	local td = song:GetTimingData()
	local bpm = round(td:GetBPMAtBeat(song:GetLastBeat()),3)
	local m = 1
	
	if bpm >= 60 and bpm < 120 then
		m = 0.75
	elseif bpm < 60 then
		m = 0.5
	else
		--- 240 bpm and above
		for i=1, 3 do
			if bpm >= 240*(3-(i-1)) then
				m = 2*(3-(i-1))
				break
			end
		end
	end
	
	local timeSigs = split('=', td:GetTimeSignatures()[1])
	local n = timeSigs[2]
	local d = timeSigs[3]
	dif = 60/bpm*8*m*n/d
	
	if STATSMAN:GetCurStageStats():AllFailed() then
		dif = 0
	elseif GAMESTATE:IsCourseMode() and (GAMESTATE:GetSongBeat() < song:GetLastBeat()-2) then
		--- yes, not zero
		dif = 0.001
	end
	
	return dif
end

function FindInTable(needle, haystack)
	for i = 1, #haystack do
		if needle == haystack[i] then
			return i
		end
	end
	return nil
end

function VideoRenderer()

	-- opengl is a valid VideoRenderer for all platforms right now
	-- so start by assuming it is the only choice.
	-- If there is a method available to Lua to get available renderers
	-- from the engine, I haven't found it yet.
	local choices = { "opengl" }
	local values  = { "opengl" }

	-- Windows also has d3d as a VideoRenderer on SM 5.1, and SM 5.3
	-- features a modern OpenGL based backend (glad) on all supported
	-- platforms. The convention(?) there is to list both available
	-- backends in Preferences.ini, but only use the first
	local architecture = HOOKS:GetArchName():lower()
	if _VERSION == "Lua 5.3" then
		table.insert(choices, "glad")
		values = { "opengl,glad", "glad,opengl" }
	elseif architecture:match("windows") then
		table.insert(choices, "d3d")
		values = { "opengl,d3d", "d3d,opengl" }
	end

	return {
		Name = _VERSION == "Lua 5.3" and "VideoRendererSM5.3" or "VideoRenderer",
		Choices = choices,
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		LoadSelections = function(self, list, pn)
			local pref = PREFSMAN:GetPreference("VideoRenderers")

			-- Multiple comma-delimited VideoRenderers may be listed, but
			-- we only want the first because that's the one actually in use.
			-- Split the string on commas, get the first match found, and
			-- immediately break from the loop.
			for renderer in pref:gmatch("(%w+),?") do
				pref = renderer
				break
			end

			if not pref then return end

			local i = FindInTable(pref, self.Choices) or 1
			list[i] = true
		end,
		SaveSelections = function(self, list, pn)
			for i=1, #list do
				if list[i] then
					PREFSMAN:SetPreference("VideoRenderers", values[i])
					break
				end
			end
		end,
	}
end