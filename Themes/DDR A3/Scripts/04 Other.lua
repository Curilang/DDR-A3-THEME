function ThemeManager:GetAbsolutePath(sPath, optional)
	local sFinPath = self:GetCurrentThemeDirectory().."/"..sPath
	if not optional then
		assert(FILEMAN:DoesFileExist(sFinPath), "the theme element "..sPath.." is missing")
	end
	return sFinPath
end

function GetJacketPath(item, fallback) 
	if item:HasJacket() then
		return item:GetJacketPath()
	elseif item:HasBackground() then
		return item:GetBackgroundPath()
	elseif item:HasBanner() then
		return item:GetBannerPath()
	else
		return fallback or THEME:GetPathG("Common","fallback jacket")
	end
end

function Sprite:_LoadSCJacket(...)
	return self:Load(GetJacketPath(...))
end

function SameDiffSteps(song, pn)
    if song then
		local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty();
		local st = GAMESTATE:GetCurrentStyle():GetStepsType();
		return song:GetOneSteps(st, diff);
	end;
end;

function ReadOrCreateAppearancePlusValueForPlayer(PlayerUID, MyValue)
	local AppearancePlusFile = RageFileUtil:CreateRageFile()
	if AppearancePlusFile:Open("Save/AppearancePlus/"..PlayerUID..".txt",1) then 
		local str = AppearancePlusFile:Read();
		MyValue =str;
	else
		AppearancePlusFile:Open("Save/AppearancePlus/"..PlayerUID..".txt",2);
		AppearancePlusFile:Write("Visible");
		MyValue="Visible";
	end
	AppearancePlusFile:Close();
	return MyValue;
end

function SaveAppearancePlusValueForPlayer( PlayerUID, MyValue)
	local AppearancePlusFile2 = RageFileUtil:CreateRageFile();
	AppearancePlusFile2:Open("Save/AppearancePlus/"..PlayerUID..".txt",2);
	AppearancePlusFile2:Write(tostring(MyValue));
	AppearancePlusFile2:Close();
end

function ScreenGameplay_P1X()
	local st = GAMESTATE:GetCurrentStyle():GetStepsType();
	if st == "StepsType_Dance_Solo" then
		return SCREEN_CENTER_X;
	elseif st == "StepsType_Dance_Couple" then
		return WideScale(SCREEN_CENTER_X-180,SCREEN_CENTER_X-160);
	else
		return WideScale(SCREEN_CENTER_X-180,SCREEN_CENTER_X-240);
	end
end
function ScreenGameplay_P2X()
	local st = GAMESTATE:GetCurrentStyle():GetStepsType();
	if st == "StepsType_Dance_Solo" then
		return SCREEN_CENTER_X;
	elseif st == "StepsType_Dance_Couple" then
		return WideScale(SCREEN_CENTER_X+180,SCREEN_CENTER_X+160);
	else
		return WideScale(SCREEN_CENTER_X+180,SCREEN_CENTER_X+240);
	end
end

function RegionFile()
	if FILEMAN:DoesFileExist("/Themes/Region.lua") then
		return "/Themes/Region.lua"
	else
		return THEME:GetPathB("","_none")
	end
end

function GetSongName(item)
	if item:GetDisplayFullTitle() == "OurMemories" then
		return "#OurMemories"
	else
		return item:GetDisplayFullTitle()
	end
end

function GetArtistName(item)
	if item:GetDisplayArtist() == "Unknown artist" then 
		return ""
	elseif item:GetDisplayFullTitle() == "The legend of MAX" or item:GetDisplayFullTitle() == "The legend of MAX(X-Special)" then
		return "ZZ"
	else
		return item:GetDisplayArtist()
	end
end

function ComboUnderField()
	if ReadPrefFromFile("OptionRowComboUnderField") ~= nil then
		if GetUserPref("OptionRowComboUnderField") == 'false' then
			return false
		else
			return true
		end
	else
		return true
	end
end

function ShockArrows()
	if GetUserPref("OptionRowShockArrows") == 'true' then
		return true
	else
		return false
	end
end

function GuideLines()
	if ReadPrefFromFile("OptionRowGuideLines") ~= nil then
		if GetUserPref("OptionRowGuideLines") == 'false' then
			return false
		else
			return true
		end
	else
		return true
	end
end

function UseStaticBackground()
	if ReadPrefFromFile("OptionRowGameplayBackground") ~= nil then
		if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
			return false
		else
			return true
		end
	else
		return true
	end
end

function ShowFastSlow()
	if ReadPrefFromFile("OptionRowFastSlow") ~= nil then
		if GetUserPref("OptionRowFastSlow") == 'Off' then
			return false
		else
			return true
		end
	else
		return true
	end
end

function SpeedDisplay()
	if ReadPrefFromFile("OptionRowSpeedDisplay") ~= nil then
		if GetUserPref("OptionRowSpeedDisplay")=='On' then
			return true
		else
			return false
		end
	else
		return false
	end
end

function IsTitleMenu()
	local curScreen = Var "LoadingScreen"
	return curScreen == "ScreenTitleMenu"
end

function IsTitleJoin()
	local curScreen = Var "LoadingScreen"
	return curScreen == "ScreenTitleJoin"
end

function IsHowToPlay()
	local curScreen = Var "LoadingScreen"
	return curScreen == "ScreenHowToPlay"
end

function IsLogo()
	local curScreen = Var "LoadingScreen"
	return curScreen == "ScreenLogo"
end

function IsReverse(pn)
	return GAMESTATE:PlayerIsUsingModifier(pn,'reverse')
end

function IsEXScore()
	if PREFSMAN:GetPreference("PercentageScoring") == true then
		return true
	else
		return false
	end
end

function SecondsToStep()
	if GetUserPref("OptionRowSongTiming")=='DDR' then
		return 0
	else
		return 6.0
	end
end

function SecondsToMusic()
	if GetUserPref("OptionRowSongTiming")=='DDR' then
		return 0
	else
		return 2.0
	end
end

function SecondsToStepNextSong()
	if GetUserPref("OptionRowSongTiming")=='DDR' then
		return 0
	else
		return 2.0
	end
end

function Language()
	if GetUserPref("OptionRowLanguage")=='jp' then
		return "jp_"
	elseif GetUserPref("OptionRowLanguage")=='en' then
		return "en_"
	elseif GetUserPref("OptionRowLanguage")=='kor' then
		return "kor_"
	else
		return "en_"
	end
end

function GetCurrentLanguage()
	if Language() == "jp_" then
		return "Japanese"
	elseif Language() == "en_" then
		return "English"
	elseif Language() == "kor_" then
		return "Korean"
	else
		return "English"
	end
end

function Model()
	if ReadPrefFromFile("OptionRowModel") ~= nil then
		if GetUserPref("OptionRowModel")=='Gold' then
			return "gold_"
		elseif GetUserPref("OptionRowModel")=='Blue' then
			return "blue_"
		else
			return "gold_"
		end
	else
		return "gold_"
	end
end

function GetCurrentModel()
	if Model() == "gold_" then
		return "Gold"
	elseif Model() == "blue_" then
		return "Blue"
	else
		return "Gold"
	end
end

function Version()
	if ReadPrefFromFile("OptionRowVersion") ~= nil then
		if GetUserPref("OptionRowVersion")=='A20' then
			return "a20_"
		elseif GetUserPref("OptionRowVersion")=='A20 PLUS' then
			return "a20p_"
		else
			return "a20_"
		end
	else
		return "a20_"
	end
end

function GetCurrentVersion()
	if Version() == "a20_" then
		return "A20"
	elseif Version() == "a20p_" then
		return "A20 PLUS"
	else
		return "A20"
	end
end

function League()
	if ReadPrefFromFile("OptionRowGoldenLeague") ~= nil then
		if GetUserPref("OptionRowGoldenLeague")=='Bronze' then
			return "brn_" 
		elseif GetUserPref("OptionRowGoldenLeague")=='Silver' then
			return "slv_"
		elseif GetUserPref("OptionRowGoldenLeague")=='Gold' then
			return "gld_"
		end
	end
end

function GoldenLeague()
	if League() == "brn_" then
		return "Bronze"
	elseif League() == "slv_" then
		return "Silver"
	elseif League() == "gld_" then
		return "Gold"
	end
end

function OptionNumber()
	if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
		return "Speed,Accel,Appearance,Turn,Hide,Scroll,NoteSkins,Cut,Freeze,Jump,ScreenFilter,Characters,SelectStage,Risky"
	elseif GetUserPref("OptionRowGameplayBackground")=='SNCharacters' then
		return "Speed,Accel,Appearance,Turn,Hide,Scroll,NoteSkins,Cut,Freeze,Jump,ScreenFilter,Characters,Risky"
	else
		return "Speed,Accel,Appearance,Turn,Hide,Scroll,NoteSkins,Cut,Freeze,Jump,ScreenFilter,Risky"
	end
end

function ReadyToLoad()
	local GetSong = GAMESTATE:GetCurrentSong():GetDisplayFullTitle()
	if GetSong == "Lesson by DJ" then
		return THEME:GetPathB("ScreenGameplay","ready/HOW")
	else
		return THEME:GetPathB("ScreenGameplay","ready/READY")
	end
end

function ClearedToLoad()
	local GetSong = GAMESTATE:GetCurrentSong():GetDisplayFullTitle()
	if GetSong == "Tohoku EVOLVED" or GetSong == "COVID" then
		return THEME:GetPathB("ScreenGameplay","out/PRAY")
	elseif GetSong == "Lesson by DJ" or GetSong == "LET'S CHECK YOUR LEVEL!" then
		return THEME:GetPathB("ScreenGameplay","out/ENJOY")
	else
		return THEME:GetPathB("ScreenGameplay","out/CLEARED")
	end
end

function FilterReadPref(pn) 
	return ReadPrefFromFile("OptionRowScreenFilter"..ToEnumShortString(pn)); 
end

function StreamingMode()
	if GetUserPref("OptionRowStreamMode")=='Silent' then
		return true
	end
end

function StreamingSound(item)
	if GetUserPref("OptionRowStreamMode")=='Silent' then
		return THEME:GetPathS("","_silent")
	else
		return item
	end 
end

function JudgmentZoom()
	if GetUserPref("OptionRowJudgementAnimation")=='Simple' then
		return 0.34
	else
		return 0.37
	end
end

function JudgmentYP()
	if GetUserPref("OptionRowJudgementAnimation")=='Simple' then
		return 0
	else
		return 2
	end
end

function JudgmentYM()
	if GetUserPref("OptionRowJudgementAnimation")=='Simple' then
		return 0
	else
		return -2
	end
end

function ComboAnim()
	if GetUserPref("OptionRowJudgementAnimation")=='Simple' then
		return 1
	else
		return 1.28
	end
end

function SelectMusicBGM()
	local Music = THEME:GetAbsolutePath("Sounds/ScreenSelectMusic music (loop).redir")
	local file = RageFileUtil.CreateRageFile()

	
	if GetUserPref("OptionRowStreamMode")=='Silent' then
		file:Open(Music,2)
		file:Write("_silent")
		file:Close()
		file:destroy()
	else
		file:Open(Music,2)
		file:Write("_systembgm2 (loop)")
		file:Close()
		file:destroy()
	end
end

function MenuTimer()
	local TimerNumbers = THEME:GetAbsolutePath("Fonts/MenuTimer numbers.redir")
	local file = RageFileUtil.CreateRageFile()

	
	if GetCurrentModel() == "Blue" then
		file:Open(TimerNumbers,2)
		file:Write("BlueTimerNumbers")
		file:Close()
		file:destroy()
	else
		file:Open(TimerNumbers,2)
		file:Write("GoldTimerNumbers")
		file:Close()
		file:destroy()
	end
end

function JudgmentTransformCommand( self, params )
	local x = 0
	local y = -76
	if params.bReverse then y = 67 end
	self:x( x )
	self:y( y )
end

function ComboTransformCommand( self, params )
	local x = 0
	local y = 38
	if params.bReverse then y = -23 end
	self:x( x )
	self:y( y )
end

function SongMeterDisplayX(pn)
	if Center1Player() then
		return SCREEN_CENTER_X
	else
		return pn == PLAYER_1 and SCREEN_LEFT+16 or SCREEN_RIGHT-16
	end
end

function SongMeterDisplayY(pn)
	return Center1Player() and SCREEN_TOP+50 or SCREEN_CENTER_Y
end

function SongMeterDisplayCommand(pn)
	if Center1Player() then
		return cmd(draworder,50;zoom,0;y,SCREEN_TOP-24;sleep,1.5;decelerate,0.5;zoom,1;y,SCREEN_TOP+50)
	else
		local xAdd = (pn == PLAYER_1) and -24 or 24
		return cmd(draworder,5;rotationz,-90;zoom,0;addx,xAdd;sleep,1.5;decelerate,0.5;zoom,1;addx,xAdd*-1)
	end
end

function IsPlayingWorkout()
	return GAMESTATE:GetEnv("Workout") == "1"
end
	
function WorkoutResetStageStats()
	STATSMAN:Reset()
end

function WorkoutGetProfileGoalType( pn )
	return PROFILEMAN:GetProfile(pn):GetGoalType()
end

function WorkoutGetStageCalories( pn )
	return STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetCaloriesBurned()
end

function WorkoutGetTotalCalories( pn )
	return STATSMAN:GetAccumStageStats():GetPlayerStageStats(pn):GetCaloriesBurned()
end

function WorkoutGetTotalSeconds( pn )
	return STATSMAN:GetAccumStageStats():GetGameplaySeconds()
end

function WorkoutGetGoalCalories( pn )
	return PROFILEMAN:GetProfile(pn):GetGoalCalories()
end

function WorkoutGetGoalSeconds( pn )
	return PROFILEMAN:GetProfile(pn):GetGoalSeconds()
end

function WorkoutGetPercentCompleteCalories( pn )
	return WorkoutGetTotalCalories(pn) / WorkoutGetGoalCalories(pn)
end

function WorkoutGetPercentCompleteSeconds( pn )
	return WorkoutGetTotalSeconds(pn) / WorkoutGetGoalSeconds(pn)
end

local numbered_stages= {
	Stage_1st= true,
	Stage_2nd= true,
	Stage_3rd= true,
	Stage_4th= true,
	Stage_5th= true,
	Stage_6th= true,
	Stage_Next= true,
}

function thified_curstage_index(on_eval)
	local cur_stage= GAMESTATE:GetCurrentStage()
	local adjust= 1
	-- hack: ScreenEvaluation shows the current stage, but it needs to show
	-- the last stage instead.  Adjust the amount.
	if on_eval then
		adjust= 0
	end
	if numbered_stages[cur_stage] then
		return FormatNumberAndSuffix(GAMESTATE:GetCurrentStageIndex() + adjust)
	else
		return ToEnumShortString(cur_stage)
	end
end

--Loads the file at path and runs it in the specified environment,
--or an empty one if no environment is provided. Catches any errors that occur.
--Returns false if the called function failed, true and anything else the function returned if it worked
function dofile_safer(path, env)
    env = env or {}
    if not FILEMAN:DoesFileExist(path) then
        --the file doesn't exist
        return false
    end
    local handle = RageFileUtil.CreateRageFile()
    handle:Open(path, 1)
    local code = loadstring(handle:Read(), path)
    handle:Close()
    handle:destroy()
    if not code then
        --an error occurred while compiling the file
        return false
    end
    setfenv(code, env)
    return pcall(code)
end