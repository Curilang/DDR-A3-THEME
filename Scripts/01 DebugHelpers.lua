--not exactly part of this library but OK
local strings = {}
local defaultStrings = 
{
	ErrorTemplate = "An error occurred at"	
}
SN3Debug = FILEMAN:DoesFileExist(THEME:GetCurrentThemeDirectory().."debug.txt")
if SN3Debug then
	print("DebugHelpers: SN3 debug mode enabled. Switching to full mode.")
end

DebugHelpers = {}

function DebugHelpers.Report(msg)
end