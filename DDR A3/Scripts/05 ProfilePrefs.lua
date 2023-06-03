--[[
ProfilePrefs
Values and their meanings:
guidelines: whether beat lines should be shown
character: the name of the character that should be used.
filter: the screen filter darkness that should be used.
lanes: whether lane boundaries should be shown or not.
bias: whether the early/late indicator should be shown.
stars: extra stage stars (it's not a pref. should that be here?)
]]
local defaultPrefs = 
{
	guidelines = false,
	character = "",
	filter = 0,
	lanes = false,
	bias = false,
	stars = 0
}
local gameSeed = nil
local machinePrefs = DeepCopy(defaultPrefs)
local ppSetting = create_setting('ProfilePrefs','ProfilePrefs.lua', 
	defaultPrefs, 1, {})

ProfilePrefs = {}

function ProfilePrefs.Read(ident)
	if ident == "!MACHINE" then
		if GAMESTATE then
			local curGameSeed = GAMESTATE:GetGameSeed()
			if curGameSeed ~= gameSeed then
				machinePrefs = DeepCopy(defaultPrefs)
			end
			return machinePrefs
		else
			return DeepCopy(defaultPrefs)
		end
	end
	if not ppSetting:is_loaded(ident) then
		ppSetting:load(ident)
	end
	return ppSetting:get_data(ident)
end

function ProfilePrefs.Save(ident)
	if ident == "!MACHINE" then
		--don't do anything
		return
	end
	return ppSetting:set_dirty(ident)
end

function ProfilePrefs.SaveAll()
	return ppSetting:save_all()
end