--[[
[en] The Branch table replaces the various functions used for branching in the
StepMania 4 default theme.
Lines with a single string (e.g. TitleMenu = "ScreenTitleMenu") are referenced
in the metrics as Branch.keyname.
If the line is a function, you'll have to use Branch.keyname() instead.
--]]

-- used for various SMOnline-enabled screens:
function SMOnlineScreen()
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		if not IsSMOnlineLoggedIn(pn) then
			return "ScreenSMOnlineLogin"
		end
	end
	return "ScreenNetRoom"
end

function SelectMusicOrCourse()
	if IsNetSMOnline() then
		return "ScreenNetSelectMusic"
	elseif GAMESTATE:IsCourseMode() then
		return "ScreenSelectCourse"
	else
		return "ScreenSelectMusic"
	end
end

-- functions used for Routine mode
function IsRoutine()
	return GAMESTATE:GetCurrentStyle() and GAMESTATE:GetCurrentStyle():GetStyleType() == "StyleType_TwoPlayersSharedSides"
end


Branch = {
	Init = function() return "ScreenInit" end,
	AfterInit = function()
		if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
			return Branch.TitleMenu()
		else
			return "ScreenLogo"
		end
	end,
	NoiseTrigger = function()
		local hour = Hour()
		return hour > 3 and hour < 6 and "ScreenNoise" or "ScreenInit"
	end,
	OldSM = function()
		if _VERSION ~= "Lua 5.3" and tonumber(VersionDate()) < 20190328 then
			return "ScreenOldSM"
		else
			return "ScreenWarning"
		end
	end,
	TitleMenu = function()
		-- home mode is the most assumed use of sm-ssc.
		if GAMESTATE:GetCoinMode() == "CoinMode_Home" then
			return "ScreenTitleMenu"
		end
		-- arcade junk:
		if GAMESTATE:GetCoinsNeededToJoin() > GAMESTATE:GetCoins() then
			-- if no credits are inserted, don't show the Join screen. SM4 has
			-- this as the initial screen, but that means we'd be stuck in a
			-- loop with ScreenInit. No good.
			return "ScreenTitleJoin"
		else
			return "ScreenTitleJoin"
		end
	end,
	StartGame = function()
		-- Check to see if there are 0 songs installed. Also make sure to check
		-- that the additional song count is also 0, because there is
		-- a possibility someone will use their existing StepMania simfile
		-- collection with sm-ssc via AdditionalFolders/AdditionalSongFolders.
		if SONGMAN:GetNumSongs() == 0 and SONGMAN:GetNumAdditionalSongs() == 0 then
			return "ScreenHowToInstallSongs"
		end
		return "ScreenSelectLanguage"
	end,
	Profile = function()
		if PROFILEMAN:GetNumLocalProfiles() >= 1 then
			return "ScreenSelectProfile"
		else
			return "ScreenSelectStyle"
		end
	end,
	ServiceOptions = function()
		if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
			return "ScreenOptionsHome"
		else
			return "ScreenOptionsService"
		end
	end,	
	Net = function()
		if IsNetSMOnline() then
			return SMOnlineScreen()
		else
			return "ScreenCaution"
		end
	end,
	AfterSMOLogin = SMOnlineScreen(),
	BackOutOfPlayerOptions = function()
		return SelectMusicOrCourse()
	end,
	OptionsEdit = function()
		-- Similar to above, don't let anyone in here with 0 songs.
		if SONGMAN:GetNumSongs() == 0 and SONGMAN:GetNumAdditionalSongs() == 0 then
			return "ScreenHowToInstallSongs"
		end
		return "ScreenOptionsEdit"
	end,
	AfterSelectStyle = function()
		if IsNetConnected() then
			ReportStyle()
			GAMESTATE:ApplyGameCommand("playmode,regular")
		end
		if IsNetSMOnline() then
			return SMOnlineScreen()
		end
		if IsNetConnected() then
			return "ScreenNetRoom"
		end
		return "ScreenProfileLoad"

		--return CHARMAN:GetAllCharacters() ~= nil and "ScreenSelectCharacter" or "ScreenGameInformation"
	end,
	
	AfterCaution = function()
		if GAMESTATE:IsCourseMode() then
			return "ScreenSelectCourse"
		else
			return "ScreenSelectMusic"
		end
	end,
	AfterSelectProfile = function()
			return "ScreenCaution"
	end,
	AfterProfileLoad = function()
		return "ScreenSelectPlayMode"
	end,
	AfterProfileSave = function()
		-- Might be a little too broken? -- Midiman
		if GAMESTATE:IsCourseMode() then
			if GAMESTATE:IsEventMode() then
				return SelectMusicOrCourse()
			else
				return "ScreenGameOver"
			end
			
		else
			if GAMESTATE:IsEventMode() then
				return SelectMusicOrCourse()
			elseif STATSMAN:GetCurStageStats():AllFailed() then
				if GAMESTATE:GetCurrentStage() == "Stage_Extra1" or GAMESTATE:GetCurrentStage() == "Stage_Extra2" then
					return "ScreenEvaluationSummary"
				else
					local Players = GAMESTATE:GetHumanPlayers()
					-- if string.find(string.lower(GAMESTATE:GetPlayerState("PlayerNumber_P1"):GetPlayerOptionsString("ModsLevel_Preferred")) ,"battery")  
						-- or string.find(string.lower(GAMESTATE:GetPlayerState("PlayerNumber_P1"):GetPlayerOptionsString("ModsLevel_Preferred")) ,"lives")  
						-- or string.find(string.lower(GAMESTATE:GetPlayerState("PlayerNumber_P2"):GetPlayerOptionsString("ModsLevel_Preferred")) ,"lives") 
						-- then
					
					local GameplayMeterTypeP1 = "";
					local GameplayMeterTypeP2 = "";
					if string.find(ReadOrCreateGameplayMeterTypeForPlayer(PROFILEMAN:GetProfile("PlayerNumber_P1"):GetGUID(),GameplayMeterTypeP1),'Lives') or 
						string.find(ReadOrCreateGameplayMeterTypeForPlayer(PROFILEMAN:GetProfile("PlayerNumber_P2"):GetGUID(),GameplayMeterTypeP2),'Lives') 
					then --ReadOrCreateGameplayMeterTypeForPlayer  See BGAnimations/ScreenGameply decorations/OptionsHack.lua
					
						
						for pn in ivalues(Players) do
							for i=1, (PREFSMAN:GetPreference( "SongsPerPlay" ) - GAMESTATE:GetCurrentStageIndex()) do
								GAMESTATE:AddStageToPlayer(pn)
							end
						end
						
						if (PREFSMAN:GetPreference( "SongsPerPlay" ) - GAMESTATE:GetCurrentStageIndex())==0 then
							return "ScreenEvaluationSummary"
						else
							return SelectMusicOrCourse();
						end
					else
						return "ScreenGameOver"
					end
				end
			elseif GAMESTATE:GetSmallestNumStagesLeftForAnyHumanPlayer() == 0 then
				return "ScreenEvaluationSummary"
			else
				return SelectMusicOrCourse()
			end
		end

	end,
	
	
	GetGameInformationScreen = function()
		bTrue = PREFSMAN:GetPreference("ShowInstructions")
		return (bTrue and GoToMusic() or "ScreenGameInformation")
	end,
	BackOutOfStageInformation = function()
		return SelectMusicOrCourse()
	end,
	AfterSelectMusic = function()
		if SCREENMAN:GetTopScreen():GetGoToOptions() then
			return "ScreenStageInformation"
		else
			return "ScreenStageInformation"
		end
	end,
	
	PlayerOptions = function()
		local pm = GAMESTATE:GetPlayMode()
		local restricted = { "PlayMode_Oni", "PlayMode_Rave","PlayMode_Nonstop"
			--"PlayMode_Battle" -- ??
		}
		local optionsScreen = "ScreenPlayerOptions"
		for i=1,#restricted do
			if restricted[i] == pm then
				--optionsScreen = "ScreenPlayerOptionsRestricted"
				optionsScreen = "ScreenStageInformation"
			end
		end
		if SCREENMAN:GetTopScreen():GetGoToOptions() then
			--return optionsScreen
			return "ScreenStageInformation"
		else
			return "ScreenStageInformation"
		end
	end,
	SongOptions = function()
		if SCREENMAN:GetTopScreen():GetGoToOptions() then
			return "ScreenSongOptions"
		else
			return "ScreenStageInformation"
		end
	end,
	GameplayScreen = function()
		return IsRoutine() and "ScreenGameplayShared" or "ScreenGameplay"
	end,
	AfterGameplay = function()
		-- pick an evaluation screen based on settings.
		if IsNetSMOnline() then
			return "ScreenNetEvaluation"
		else
			-- todo: account for courses etc?
			return "ScreenEvaluationNormal"
		end
	end,
	AfterEvaluation = function()
		--extra attack
		--normal
		if GAMESTATE:GetSmallestNumStagesLeftForAnyHumanPlayer() >= 1 then
			return "ScreenProfileSave"
		elseif GAMESTATE:GetCurrentStage() == "Stage_Extra1" or GAMESTATE:GetCurrentStage() == "Stage_Extra2" then
			return "ScreenProfileSave"
		elseif GAMESTATE:IsCourseMode() then
			return "ScreenProfileSaveSummary"
		elseif STATSMAN:GetCurStageStats():AllFailed() then
			-- if string.find(string.lower(GAMESTATE:GetPlayerState("PlayerNumber_P1"):GetPlayerOptionsString("ModsLevel_Preferred")) ,"battery")  
				-- or string.find(string.lower(GAMESTATE:GetPlayerState("PlayerNumber_P2"):GetPlayerOptionsString("ModsLevel_Preferred")) ,"battery") 
				-- or string.find(string.lower(GAMESTATE:GetPlayerState("PlayerNumber_P1"):GetPlayerOptionsString("ModsLevel_Preferred")) ,"lives")  
				-- or string.find(string.lower(GAMESTATE:GetPlayerState("PlayerNumber_P2"):GetPlayerOptionsString("ModsLevel_Preferred")) ,"lives") 
				-- then
			local GameplayMeterTypeP1 = "";
			local GameplayMeterTypeP2 = "";
			if string.find(ReadOrCreateGameplayMeterTypeForPlayer(PROFILEMAN:GetProfile("PlayerNumber_P1"):GetGUID(),GameplayMeterTypeP1),'Lives') or 
				string.find(ReadOrCreateGameplayMeterTypeForPlayer(PROFILEMAN:GetProfile("PlayerNumber_P2"):GetGUID(),GameplayMeterTypeP2),'Lives') 
			then	 --ReadOrCreateGameplayMeterTypeForPlayer  See BGAnimations/ScreenGameply decorations/OptionsHack.lua
				return "ScreenProfileSave"
				
			else
				return "ScreenProfileSaveSummary"
			end
		
		else
			return "ScreenEvaluationSummary"
		end
	end,
	
	AfterSummary = "ScreenProfileSaveSummary",
	Network = function()
		return IsNetConnected() and "ScreenTitleMenu" or "ScreenTitleMenu"
	end,
 	AfterSaveSummary = function()
		if PROFILEMAN:GetNumLocalProfiles() >= 1 then
			return "ScreenDataSaveSummary"
		else
			return "ScreenGameOver"
		end
	end,
	AfterDataSaveSummary = function()
		if GAMESTATE:AnyPlayerHasRankingFeats() then
			return "ScreenDataSaveSummaryEnd"
		else
			return "ScreenDataSaveSummaryEnd"
		end
	end,
	
}
