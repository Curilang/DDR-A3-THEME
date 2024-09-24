--Code by SimplyLove

range = function(start, stop, step)
	if start == nil then return end

	if not stop then
		stop = start
		start = 1
	end

	step = step or 1

	-- if step has been explicitly provided as a positive number
	-- but the start and stop values tell us to decrement
	-- multiply step by -1 to allow decrementing to occur
	if step > 0 and start > stop then
		step = -1 * step
	end

	local t = {}
	for i = start, stop, step do
		t[#t+1] = i
	end
	return t
end

function stringify( tbl, form )
	if not tbl then return end

	local t = {}
	for _,value in ipairs(tbl) do
		t[#t+1] = (type(value)=="number" and form and form:format(value) ) or tostring(value)
	end
	return t
end

function EditorNoteskin()
	local skins = NOTESKIN:GetNoteSkinNames()
	return {
		Name = "EditorNoteSkin",
		LayoutType = "ShowOneInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = skins,
		LoadSelections = function(self, list, pn)
			local skin = PREFSMAN:GetPreference("EditorNoteSkinP1") or
				PREFSMAN:GetPreference("EditorNoteSkinP2") or
				THEME:GetMetric("Common", "DefaultNoteSkinName")
			if not skin then return end

			local i = FindInTable(skin, skins) or 1
			list[i] = true
		end,
		SaveSelections = function(self, list, pn)
			for i = 1, #skins do
				if list[i] then
					PREFSMAN:SetPreference("EditorNoteSkinP1", skins[i])
					PREFSMAN:SetPreference("EditorNoteSkinP2", skins[i])
					break
				end
			end
		end,
	}
end


function offsetMS(pref, low, high)
	local val = PREFSMAN:GetPreference(pref)
	local ms = round(val * 1000)	-- convert seconds to milliseconds

	-- If the player has a value set outside of the specified range
	-- accommodate by extending the range.
	low = math.min(low, ms)
	high = math.max(high, ms)

	-- _values as a temp table of values * 1000 as an intermediate step, not presented to players
	--  choices as millisecond integers with "ms" appended, presented to players
	local _values  = range(low, high)
	local choices  = stringify(_values, "%ims")

	return {
		Name=pref,
		Choices=choices,
		LayoutType = "ShowOneInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		LoadSelections = function(self, list, pn)
			local i = ms - low + 1
			list[i] = true
		end,
		SaveSelections = function(self, list, pn)
			for i=1, #choices do
				if list[i] then
					PREFSMAN:SetPreference(pref, (low + i - 1) / 1000)
					break
				end
			end
		end
	}
end

function GlobalOffsetSeconds()
	-- 100ms should be sufficient to accomodate for audio delay
	return offsetMS("GlobalOffsetSeconds", -100, 100)
end

function VisualDelaySeconds()
	-- up to 1s of visual delay, because some TVs are really slow
	return offsetMS("VisualDelaySeconds", -50, 50)
end

--Code by SimplyLove