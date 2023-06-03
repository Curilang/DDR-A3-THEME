-- SSC Color Module and Library

-- Original Color Module.
Color = {
-- Color Library
-- These colors are pure swatch colors and are here purely to be used
-- on demand without having to type color("stuff") or dig through 
-- a palette to get the color you want.
	Black		=	color("0,0,0,1"),
	White		=	color("1,1,1,1"),
	Red			=	color("#ed1c24"),
	Blue		=	color("#00aeef"),
	Green		=	color("#39b54a"),
	Yellow		=	color("#fff200"),
	Orange		=	color("#f7941d"),
	Purple		=	color("#92278f"),
	Outline		=	color("0,0,0,0.5"),
	Invisible	=	color("1,1,1,0"),
	Stealth		=	color("0,0,0,0"),
-- Color Functions
-- These functions alter colors in a certain way so that you can make
-- new ones without having to copy a color or find a new one.
--[[     Brightness(fInput)
    Hue(hInput)
    Saturation(hInput)
    Alpha(hInput)
    HSV(iHue,fSaturation,fValue or any other overload) --]]
	Alpha = function(c, fAlpha)
		return { c[1],c[2],c[3], fAlpha }
	end
}

setmetatable(Color, { __call = function(self, c) return self[c] end })

-- Remapped Color Module, since some themes are crazy
-- Colors = Color;

GameColor = {
	PlayerColors = {
		PLAYER_1 = color("#1ed0c2"),
		PLAYER_2 = color("#f253ed"),
	},
	Difficulty = {
		--[[ These are for 'Custom' Difficulty Ranks. It can be very  useful
		in some cases, especially to apply new colors for stuff you
		couldn't before. (huh? -aj) ]]
		Beginner	= color("#1ed6ff"),			-- light blue
		Easy		= color("#ffaa19"),			-- yellow
		Medium		= color("#ff1e3c"),			-- red
		Hard		= color("#32eb19"),			-- green
		Challenge	= color("#eb1eff"),			-- light cyan
		Edit		= color("#afafaf"),		-- gray
		Couple		= color("#ed0972"),			-- hot pink
		Routine		= color("#ff9a00"),			-- orange
		--[[ These are for courses, so let's slap them here in case someone
		wanted to use Difficulty in Course and Step regions. ]]
		Difficulty_Beginner	= color("#1ed6ff"),	-- light blue
		Difficulty_Easy		= color("#ffaa19"),		-- yellow
		Difficulty_Medium	= color("#ff1e3c"),		-- red
		Difficulty_Hard		= color("#32eb19"),		-- green
		Difficulty_Challenge	= color("#eb1eff"),		-- purple
		Difficulty_Edit 	= color("#afafaf"),		-- gray
		Difficulty_Couple	= color("#ed0972"),				-- hot pink
		Difficulty_Routine	= color("#ff9a00")				-- orange
	},
	Stage = {
		Stage_1st	= color("#00ffc7"),
		Stage_2nd	= color("#58ff00"),
		Stage_3rd	= color("#f400ff"),
		Stage_4th	= color("#00ffda"),
		Stage_5th	= color("#ed00ff"),
		Stage_6th	= color("#73ff00"),
		Stage_Next	= color("#73ff00"),
		Stage_Final	= color("#ff0707"),
		Stage_Extra1	= color("#fafa00"),
		Stage_Extra2	= color("#ff0707"),
		Stage_Nonstop	= color("#FFFFFF"),
		Stage_Oni	= color("#FFFFFF"),
		Stage_Endless	= color("#FFFFFF"),
		Stage_Event	= color("#FFFFFF"),
		Stage_Demo	= color("#FFFFFF")
	},
	Judgment = {
		JudgmentLine_W1		= color("#bfeaff"),
		JudgmentLine_W2		= color("#fff568"),
		JudgmentLine_W3		= color("#48ff1d"),
		JudgmentLine_W4		= color("#34bfff"),
		JudgmentLine_W5		= color("#e44dff"),
		JudgmentLine_Held	= color("#FFFFFF"),
		JudgmentLine_Miss	= color("#ff3c3c"),
		JudgmentLine_MaxCombo	= color("#ffc600")
	},
}

GameColor.Difficulty["Crazy"] = GameColor.Difficulty["Hard"]
GameColor.Difficulty["Freestyle"] = GameColor.Difficulty["Easy"]
GameColor.Difficulty["Nightmare"] = GameColor.Difficulty["Challenge"]
GameColor.Difficulty["HalfDouble"] = GameColor.Difficulty["Medium"]

function groupColor(groupName)
	local group_colors= {
		["DanceDanceRevolution 1stMIX"]= "#b4e556",
		["DanceDanceRevolution 2ndMIX"]= "#eb8bc8",
		["DanceDanceRevolution 3rdMIX"]= "#fdf380",
		["DanceDanceRevolution 4thMIX"]= "#a592d5",
		["DanceDanceRevolution 5thMIX"]= "#12d0f2",
		["DanceDanceRevolution 6thMIX MAX"]= "#ffbe32",
		["DanceDanceRevolution 7thMIX MAX2"]= "#fa4b3c",
		["DanceDanceRevolution 8thMIX EXTREME"]= "#81f1a9",
		["DanceDanceRevolution SuperNOVA"]= "#fa4b3c",
		["DanceDanceRevolution SuperNOVA2"]= "#12cff2",
		["DanceDanceRevolution X"]= "#ffbe32",
		["DanceDanceRevolution X2"]= "#eb8cc8",
		["DanceDanceRevolution X3"]= "#16b5ef",
		["DDR 2013"]= "#69ebca",
		["DDR 2014"]= "#69ebca",
		["DDR A"]= "#12cff2",
		
		["01 - DDR 1st"]= "#b4e556",
		["02 - DDR 2ndMIX"]= "#eb8bc8",
		["03 - DDR 3rdMIX"]= "#fdf380",
		["04 - DDR 4thMIX"]= "#a592d5",
		["05 - DDR 5thMIX"]= "#12d0f2",
		["06 - DDR MAX"]= "#ffbe32",
		["07 - DDR MAX2"]= "#fa4b3c",
		["08 - DDR EXTREME"]= "#81f1a9",
		["09 - DDR SuperNOVA"]= "#fa4b3c",
		["10 - DDR SuperNOVA2"]= "#12cff2",
		["11 - DDR X"]= "#ffbe32",
		["12 - DDR X2"]= "#eb8cc8",
		["13 - DDR X3 vs 2ndMIX"]= "#16b5ef",
		["14 - DDR 2013"]= "#69ebca",
		["15 - DDR 2014"]= "#69ebca",
		["16 - DDR A"]= "#12cff2",
		
		["Pop"] = "#ffbe32",
		["Anime/Game"] = "#fff582",
		["Variety"] = "#eb8cc8",
		["Electronic"] = "#0aef6b",
		["GUMI"] = "#b8e267",
		["U.M.U. x BEMANI"] = "#fbafb4",
		["KONAMI originals"] = "#fa4b3c",
		["beatmania IIDX"] = "#0165ac",
		["pop'n music"] = "#fff582",
		["GITADORA"] = "#a592d5",
		["jubeat"] = "#f1f5fb",
		["REFLEC BEAT"] = "#81f1a9",
		["DanceEvolution"] = "#12d0f2",
		["SOUND VOLTEX"] = "#eb8cc8",
		["FutureTomTom"] = "#fff582",
		["DDR"] = "#43ff9d",
		["BEMANI Academy"] = "#12d0f2",
		["BEMANI STADIUM"] = "#ffbe32",
		["BEMANI Stadium"] = "#ffbe32",
		["HinaBitter"] = "#eb8cc8",
		["BEMANI x TOHO project"] = "#fa4b3c",
		["Dancemania"] = "#02fefb",
		["beatmania"] = "#0165ac",
		["beatmania III"] = "#0165ac",
		["BeatStream"] = "#ffbe32",
		["BEMANI SUMMER DIARY 2015"] = "#12d0f2",
		["Dance Maniax"] = "#a592d5",
		["Kaitou BisCo no yokokujou!!"] = "#eb8bc8",
		["KEYBOARDMANIA"] = "#0aef6b",
		["MAMBO A GOGO"] = "#ffbe32",
		["ParaParaParadise"] = "#eb8cc8",
		["CROSSxBEATS"] = "#8bdb01",
		["TAIKO NO TATSUJIN"] = "#fa4b3c",
	};
	local color_grp= group_colors[groupName] or "#FFFFFF";
	return color_grp;
end;

--[[ Fallbacks ]]
function BoostColor( cColor, fBoost )
	local c = cColor
	return { c[1]*fBoost, c[2]*fBoost, c[3]*fBoost, c[4] }
end

function ColorLightTone(c)
	return { c[1]+(c[1]/2), c[2]+(c[2]/2), c[3]+(c[3]/2), c[4] }
end

function ColorMidTone(c)
	return { c[1]/1.5, c[2]/1.5, c[3]/1.5, c[4] }
end

function ColorDarkTone(c)
	return { c[1]/2, c[2]/2, c[3]/2, c[4] }
end

function PlayerColor( pn )
	if pn == PLAYER_1 then return color("#0089cf") end -- sea-blue
	if pn == PLAYER_2 then return color("#f253ed") end -- pink-red
	return color("1,1,1,1")
end
function PlayerScoreColor( pn )
	if pn == PLAYER_1 then return color("#0089cf") end -- sea-blue
	if pn == PLAYER_2 then return color("#ef403d") end -- pink-red
	return color("1,1,1,1")
end

function CustomDifficultyToColor( sCustomDifficulty ) 
	return GameColor.Difficulty[sCustomDifficulty]
end

function CustomDifficultyToDarkColor( sCustomDifficulty ) 
	local c = GameColor.Difficulty[sCustomDifficulty]
	return { c[1]/2, c[2]/2, c[3]/2, c[4] }
end

function CustomDifficultyToLightColor( sCustomDifficulty ) 
	local c = GameColor.Difficulty[sCustomDifficulty]
	return { scale(c[1],0,1,0.5,1), scale(c[2],0,1,0.5,1), scale(c[3],0,1,0.5,1), c[4] }
end

function StepsOrTrailToColor(StepsOrTrail)
	return CustomDifficultyToColor( StepsOrTrailToCustomDifficulty(stepsOrTrail) )
end

function StageToColor( stage )
	return GameColor.Stage[stage] or color("#000000")
end

function StageToStrokeColor( stage )
	local c = GameColor.Stage[stage]
	return { c[1]/2, c[2]/2, c[3]/2, c[4] }
end

function JudgmentLineToColor( i )
	return GameColor.Judgment[i] or color("#000000")
end

function JudgmentLineToStrokeColor( i )
	local c = GameColor.Judgment[i]
	return { c[1]/2, c[2]/2, c[3]/2, c[4] }
end