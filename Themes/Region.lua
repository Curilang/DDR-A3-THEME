-- Here you can change your region (country, town, world, etc.)
-- How to do it:
-- Change the country, city, town, world, galaxy, etc. in the parts that says: return " "
-- CAUTION: Don't change anything else, just change the text between the " "
-- For Example:
-- return "UNITED STATES OF AMERICA"
-- return "USA"


local function Region()
	if GetCurrentLanguage() == "English" or GetCurrentLanguage() == "Korean" then
		
		--English:
		return " "
	
	elseif GetCurrentLanguage() == "Japanese" then
	
		--Japanese:
		return " "
	
	end
end
-- Now you have your exactly region!.	

return LoadFont("region 20px")..{ InitCommand=function(s) s:settext(Region()):maxwidth(70) end, };