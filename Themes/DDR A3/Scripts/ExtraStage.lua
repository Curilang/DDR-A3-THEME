ExtraStage = {}

local gradeAwards = {
	Grade_Tier01 = 3,
	Grade_Tier02 = 2
}
setmetatable(gradeAwards, {__index=function() return 1 end})

function ExtraStage.GetStarsFromPSS(pss)
	local grade = pss:GetGrade()
	if grade == 'Grade_Failed' then
		return 0
	end
	local possible_stars = 1 --for clear
	possible_stars = possible_stars + gradeAwards[grade]
	possible_stars = possible_stars + pss:FullCombo() and 1 or 0
	return math.min(possible_stars, 3)
end