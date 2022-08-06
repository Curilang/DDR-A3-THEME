function OptionRowAppearancePlus()
	local t = {
		Name="AppearancePlus",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { "Visible", 'Hidden', 'Sudden', 'Stealth', 'Hidden+', 'Sudden+', 'Hidden+&Sudden+', },
		LoadSelections = function(self, list, pn)
			local AppearancePlusValue = "Visible";
			local pf = PROFILEMAN:GetProfile(pn);
			local PlayerUID = "";
			
			if pf then 
				PlayerUID = pf:GetGUID()  
				AppearancePlusValue = ReadOrCreateAppearancePlusValueForPlayer(PlayerUID,AppearancePlusValue);
			else
				PlayerUID = "UnknownPlayerUID"
				AppearancePlusValue = "Visible";
			end
			
			if AppearancePlusValue ~= nil then
				if AppearancePlusValue == "Hidden" then
					list[2] = true
				elseif AppearancePlusValue == "Sudden" then
					list[3] = true
				elseif AppearancePlusValue == "Stealth" then
					list[4] = true
				elseif AppearancePlusValue == "Hidden+" then
					list[5] = true
				elseif AppearancePlusValue == "Sudden+" then
					list[6] = true
				elseif AppearancePlusValue == "Hidden+&Sudden+" then
					list[7] = true
				else
					list[1] = true
				end
			else
				SaveAppearancePlusValueForPlayer(PlayerUID,"Visible")
				list[1] = true
			end
			
		end,
		SaveSelections = function(self, list, pn)
			local pName = ToEnumShortString(pn)
			local found = false
			local PlayerUID = "";
			local pf = PROFILEMAN:GetProfile(pn);
			
			if pf then 
				PlayerUID = pf:GetGUID()  
			else
				PlayerUID = "UnknownPlayerUID"
			end
			
			for i=1,#list do
				if not found then
					if list[i] == true then
						local val = "Visible";
						if i==2 then
							val = "Hidden";
						elseif i==3 then
							val = "Sudden";
						elseif i==4 then
							val = "Stealth";
						elseif i==5 then
							val = "Hidden+";
						elseif i==6 then
							val = "Sudden+";
						elseif i==7 then
							val = "Hidden+&Sudden+";
						else
							val = "Visible";
						end
						setenv("AppearancePlus"..pName,val)
						SaveAppearancePlusValueForPlayer(PlayerUID,val)
						found = true
						break;
					end
				end
			end
		end,
	};
	setmetatable(t, t)
	return t
end

function OptionRowFastSlow()
	local t = {
		Name = "FastSlow";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = true,
		Choices = {"Off", "On", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowFastSlow") ~= nil then
				if GetUserPref("OptionRowFastSlow")=='Off' then
					list[1] = true
				elseif GetUserPref("OptionRowFastSlow")=='On' then
					list[2] = true
				else
					list[2] = true
				end
			else
				WritePrefToFile("OptionRowFastSlow",'On');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowFastSlow",'Off');
			elseif list[2] then
				WritePrefToFile("OptionRowFastSlow",'On');
			else
				WritePrefToFile("OptionRowFastSlow",'On');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowLanguage()
	local t = {
		Name = "Language";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = true;
		Choices = {"jp", "en", "kor", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowLanguage") ~= nil then
				if GetUserPref("OptionRowLanguage")=='jp' then
					list[1] = true
				elseif GetUserPref("OptionRowLanguage")=='en' then
					list[2] = true
				elseif GetUserPref("OptionRowLanguage")=='kor' then
					list[3] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowLanguage",'en');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowLanguage",'jp');
			elseif list[2] then
				WritePrefToFile("OptionRowLanguage",'en');
			elseif list[3] then
				WritePrefToFile("OptionRowLanguage",'kor');
			else
				WritePrefToFile("OptionRowLanguage",'en');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowComboUnderField()
	local t = {
		Name = "ComboUnderField";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = true;
		Choices = {"Background", "Foreground", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowComboUnderField") ~= nil then
				if GetUserPref("OptionRowComboUnderField")=='true' then
					list[1] = true
				elseif GetUserPref("OptionRowComboUnderField")=='false'then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowComboUnderField",true);
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowComboUnderField",true);
			elseif list[2] then
				WritePrefToFile("OptionRowComboUnderField",false);
			else
				WritePrefToFile("OptionRowComboUnderField",true);
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowGuideLines()
	local t = {
		Name = "GuideLines";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = true;
		Choices = {"Off", "On", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowGuideLines") ~= nil then
				if GetUserPref("OptionRowGuideLines")=='false' then
					list[1] = true
				elseif GetUserPref("OptionRowGuideLines")=='true' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowGuideLines",false);
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowGuideLines",false);
			elseif list[2] then
				WritePrefToFile("OptionRowGuideLines",true);
			else
				WritePrefToFile("OptionRowGuideLines",false);
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowShockArrows()
	local t = {
		Name = "ShockArrows";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = true;
		Choices = {"Off", "On", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowShockArrows") ~= nil then
				if GetUserPref("OptionRowShockArrows")=='false' then
					list[1] = true
				elseif GetUserPref("OptionRowShockArrows")=='true' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowShockArrows",false);
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowShockArrows",false);
			elseif list[2] then
				WritePrefToFile("OptionRowShockArrows",true);
			else
				WritePrefToFile("OptionRowShockArrows",false);
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowScreenFilter()
	local t = {
		Name = "ScreenFilter";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = false;
		ExportOnChange = true;
		Choices = {"Off", "Dark", "Darker", "Darkest", };
		LoadSelections = function(self, list, pn)
		local pName = ToEnumShortString(pn)
			if ReadPrefFromFile("OptionRowScreenFilter"..pName) ~= nil then
				if GetUserPref("OptionRowScreenFilter"..pName)=='Off' then
					list[1] = true
				elseif GetUserPref("OptionRowScreenFilter"..pName)=='DARK' then
					list[2] = true
				elseif GetUserPref("OptionRowScreenFilter"..pName)=='Darker' then
					list[3] = true
				elseif GetUserPref("OptionRowScreenFilter"..pName)=='Darkest' then
					list[4] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowScreenFilter"..pName,'Darker');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			local pName = ToEnumShortString(pn)
			if list[1] then
				WritePrefToFile("OptionRowScreenFilter"..pName,'Off');
			elseif list[2] then
				WritePrefToFile("OptionRowScreenFilter"..pName,'DARK');
			elseif list[3] then
				WritePrefToFile("OptionRowScreenFilter"..pName,'Darker');
			elseif list[4] then
				WritePrefToFile("OptionRowScreenFilter"..pName,'Darkest');
			else
				WritePrefToFile("OptionRowScreenFilter"..pName,'Darker');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowBPM()
	local t = {
		Name = "BPM";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = true;
		Choices = {"Name", "BPM", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowBPM") ~= nil then
				if GetUserPref("OptionRowBPM")=='Name' then
					list[1] = true
				elseif GetUserPref("OptionRowBPM")=='BPM' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowBPM",'Name');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowBPM",'Name');
			elseif list[2] then
				WritePrefToFile("OptionRowBPM",'BPM');
			else
				WritePrefToFile("OptionRowBPM",'Name');
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowSpeedDisplay()
	local t = {
		Name = "SpeedDisplay";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = true;
		Choices = {"Off" ,"On" };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowSpeedDisplay") ~= nil then
				if GetUserPref("OptionRowSpeedDisplay")=='Off' then
					list[1] = true
				elseif GetUserPref("OptionRowSpeedDisplay")=='On' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowSpeedDisplay",'Off');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowSpeedDisplay",'Off');
			elseif list[2] then
				WritePrefToFile("OptionRowSpeedDisplay",'On');
			else
				WritePrefToFile("OptionRowSpeedDisplay",'Off');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowGameplayBackground()
	local t = {
		Name = "GameplayBackground";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {"Background", "DanceStages", "SNCharacters" };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowGameplayBackground") ~= nil then
				if GetUserPref("OptionRowGameplayBackground")=='Background' then
					list[1] = true
				elseif GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
					list[2] = true
				elseif GetUserPref("OptionRowGameplayBackground")=='SNCharacters' then
					list[3] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowGameplayBackground",'Background');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowGameplayBackground",'Background');
			elseif list[2] then
				WritePrefToFile("OptionRowGameplayBackground",'DanceStages');
			elseif list[3] then
				WritePrefToFile("OptionRowGameplayBackground",'SNCharacters');
			else
				WritePrefToFile("OptionRowGameplayBackground",'Background');
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowSongTiming()
	local t = {
		Name = "SongTiming";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {"StepMania", "DDR", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowSongTiming") ~= nil then
				if GetUserPref("OptionRowSongTiming")=='StepMania' then
					list[1] = true
				elseif GetUserPref("OptionRowSongTiming")=='DDR'then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowSongTiming",'StepMania');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowSongTiming",'StepMania');
			elseif list[2] then
				WritePrefToFile("OptionRowSongTiming",'DDR');
			else
				WritePrefToFile("OptionRowSongTiming",'StepMania');
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

--DDR A20--

function OptionRowModel()
	local t = {
		Name = "Model";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {"Gold", "Blue", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowModel") ~= nil then
				if GetUserPref("OptionRowModel")=='Gold' then
					list[1] = true
				elseif GetUserPref("OptionRowModel")=='Blue' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowModel",'Gold');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowModel",'Gold');
			elseif list[2] then
				WritePrefToFile("OptionRowModel",'Blue');
			else
				WritePrefToFile("OptionRowModel",'Gold');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowVersion()
	local t = {
		Name = "Version";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {"A20", "A20 PLUS", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowVersion") ~= nil then
				if GetUserPref("OptionRowVersion")=='A20' then
					list[1] = true
				elseif GetUserPref("OptionRowVersion")=='A20 PLUS' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowVersion",'A20');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowVersion",'A20');
			elseif list[2] then
				WritePrefToFile("OptionRowVersion",'A20 PLUS');
			else
				WritePrefToFile("OptionRowVersion",'A20');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowGoldenLeague()
	local t = {
		Name = "GoldenLeague";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {"Off" ,"Bronze", "Silver", "Gold" };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowGoldenLeague") ~= nil then
				if GetUserPref("OptionRowGoldenLeague")=='Off' then
					list[1] = true
				elseif GetUserPref("OptionRowGoldenLeague")=='Bronze' then
					list[2] = true
				elseif GetUserPref("OptionRowGoldenLeague")=='Silver' then
					list[3] = true
				elseif GetUserPref("OptionRowGoldenLeague")=='Gold' then
					list[4] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowGoldenLeague",'Off');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowGoldenLeague",'Off');
			elseif list[2] then
				WritePrefToFile("OptionRowGoldenLeague",'Bronze');
			elseif list[3] then
				WritePrefToFile("OptionRowGoldenLeague",'Silver');
			elseif list[4] then
				WritePrefToFile("OptionRowGoldenLeague",'Gold');
			else
				WritePrefToFile("OptionRowGoldenLeague",'Off');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowStreamMode()
	local t = {
		Name = "StreamMode";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = true;
		Choices = {"Off", "On", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowStreamMode") ~= nil then
				if GetUserPref("OptionRowStreamMode")=='Off' then
					list[1] = true
				elseif GetUserPref("OptionRowStreamMode")=='On' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowStreamMode",'Off');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowStreamMode",'Off');
			elseif list[2] then
				WritePrefToFile("OptionRowStreamMode",'On');
			else
				WritePrefToFile("OptionRowStreamMode",'Off');
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowJudgementAnimation()
	local t = {
		Name = "JudgementAnimation";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = true;
		Choices = {"Normal", "Simple", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowJudgementAnimation") ~= nil then
				if GetUserPref("OptionRowJudgementAnimation")=='Normal' then
					list[1] = true
				elseif GetUserPref("OptionRowJudgementAnimation")=='Simple' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowJudgementAnimation",'Normal');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowJudgementAnimation",'Normal');
			elseif list[2] then
				WritePrefToFile("OptionRowJudgementAnimation",'Simple');
			else
				WritePrefToFile("OptionRowJudgementAnimation",'Normal');
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

function OptionRowDanCourse()
	local t = {
		Name = "DanCourse";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {"None" ,"1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th", "9th", "10th", "Kaiden", };
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("OptionRowDanCourse") ~= nil then
				if GetUserPref("OptionRowDanCourse")=='None' then
					list[1] = true
				elseif GetUserPref("OptionRowDanCourse")=='1st' then
					list[2] = true
				elseif GetUserPref("OptionRowDanCourse")=='2nd' then
					list[3] = true
				elseif GetUserPref("OptionRowDanCourse")=='3rd' then
					list[4] = true
				elseif GetUserPref("OptionRowDanCourse")=='4th' then
					list[5] = true
				elseif GetUserPref("OptionRowDanCourse")=='5th' then
					list[6] = true
				elseif GetUserPref("OptionRowDanCourse")=='6th' then
					list[7] = true
				elseif GetUserPref("OptionRowDanCourse")=='7th' then
					list[8] = true
				elseif GetUserPref("OptionRowDanCourse")=='8th' then
					list[9] = true
				elseif GetUserPref("OptionRowDanCourse")=='9th' then
					list[10] = true
				elseif GetUserPref("OptionRowDanCourse")=='10th' then
					list[11] = true
				elseif GetUserPref("OptionRowDanCourse")=='Kaiden' then
					list[12] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("OptionRowDanCourse",'None');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("OptionRowDanCourse",'None');
			elseif list[2] then
				WritePrefToFile("OptionRowDanCourse",'1st');
			elseif list[3] then
				WritePrefToFile("OptionRowDanCourse",'2nd');
			elseif list[4] then
				WritePrefToFile("OptionRowDanCourse",'3rd');
			elseif list[5] then
				WritePrefToFile("OptionRowDanCourse",'4th');
			elseif list[6] then
				WritePrefToFile("OptionRowDanCourse",'5th');
			elseif list[7] then
				WritePrefToFile("OptionRowDanCourse",'6th');
			elseif list[8] then
				WritePrefToFile("OptionRowDanCourse",'7th');
			elseif list[9] then
				WritePrefToFile("OptionRowDanCourse",'8th');
			elseif list[10] then
				WritePrefToFile("OptionRowDanCourse",'9th');
			elseif list[11] then
				WritePrefToFile("OptionRowDanCourse",'10th');
			elseif list[12] then
				WritePrefToFile("OptionRowDanCourse",'Kaiden');
			else
				WritePrefToFile("OptionRowDanCourse",'None');
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end