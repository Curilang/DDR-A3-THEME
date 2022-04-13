local pn = ...
assert(pn)

local Center1Player = PREFSMAN:GetPreference('Center1Player')
local NumPlayers = GAMESTATE:GetNumPlayersEnabled()
local NumSides = GAMESTATE:GetNumSidesJoined()
local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)
local st = GAMESTATE:GetCurrentStyle():GetStepsType()

local function GetPosition(pn)
	if st == "StepsType_Dance_Double" or st == "StepsType_Dance_Solo" or Center1Player then return SCREEN_WIDTH/2;
	else
		local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers"
		local strSide = (NumSides == 1) and "OneSide" or "TwoSides"
		return THEME:GetMetric("ScreenGameplay","Player"..ToEnumShortString(pn)..strPlayer..strSide.."X")
	end
end

local function GetPosition2(pn)
	if st == "StepsType_Dance_Double" or st == "StepsType_Dance_Solo" then return SCREEN_WIDTH/10;
	elseif Center1Player then
		return SCREEN_WIDTH/2
	else
		local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers"
		local strSide = (NumSides == 1) and "OneSide" or "TwoSides"
		return THEME:GetMetric("ScreenGameplay","Player"..ToEnumShortString(pn)..strPlayer..strSide.."X")
	end
end

local function GradationWidth()
	if st == "StepsType_Dance_Double" then return (2);
	elseif st == "StepsType_Dance_Solo" then return (1.5);
	else return (1);
	end
end

local function DownGradationWidth()
	if st == "StepsType_Dance_Double" then return (SCREEN_WIDTH);
	elseif st == "StepsType_Dance_Solo" then return (384);
	else return (256);
	end
end

local function TextZoom()
	if st == "StepsType_Dance_Double" then return (1.61);
	elseif st == "StepsType_Dance_Solo" then return (1.3);
	else return (1);
	end
end

local function IsFullCombo()
	if pss:FullCombo() or pss:FullComboOfScore('TapNoteScore_W4') then
		return true
	else
		return false
	end
end

local FullComboEffectColor1 = {
	TapNoteScore_W1=color("#ffffff");
	TapNoteScore_W2=color("#f0f389");
	TapNoteScore_W3=color("#06fd32");
	TapNoteScore_W4=color("#3399ff");
};

local FullComboEffectColor2 = {
	TapNoteScore_W1=color("#fefed0");
	TapNoteScore_W2=color("#f0f389");
	TapNoteScore_W3=color("#1BFF1D");
	TapNoteScore_W4=color("#33F3FF");
};

function PlayerStageStats:FullComboType()
	if self:FullComboOfScore('TapNoteScore_W1') then
		return 'TapNoteScore_W1'
	elseif self:FullComboOfScore('TapNoteScore_W2') then
		return 'TapNoteScore_W2'
	elseif self:FullComboOfScore('TapNoteScore_W3') then
		return 'TapNoteScore_W3'
	elseif self:FullComboOfScore('TapNoteScore_W4') then
		return 'TapNoteScore_W4'
	else
		return nil
	end
end

local t = Def.ActorFrame{};

t[#t+1] = LoadActor("Combo_Splash")..{
	OffCommand=function(s)
		if IsFullCombo() then
			s:play()
		end
	end,
};

local NumColumns = GAMESTATE:GetCurrentStyle():ColumnsPerPlayer()
local NFWidth = GAMESTATE:GetCurrentStyle():GetWidth(pn)*(NumColumns/1.8)


for i=1,NumColumns do
	local ColumnInfo = GAMESTATE:GetCurrentStyle():GetColumnInfo(pn,i)
	t[#t+1] = Def.ActorFrame{
		InitCommand=function(s)
			s:x(GetPosition2(pn)):diffusealpha(0):zoom(0.45)
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				s:y(_screen.cy+(THEME:GetMetric("Player","ReceptorArrowsYReverse")))
			else
				s:y(_screen.cy+(THEME:GetMetric("Player","ReceptorArrowsYStandard")))
			end
		end,
		OffCommand = function(s)
			if IsFullCombo() then
				s:diffuse(FullComboEffectColor1[pss:FullComboType()])
			end
		end,
		LoadActor("Star")..{
			InitCommand=function(s) s:blend(Blend.Add)
				s:x((NFWidth/1.6)-(i*tonumber(THEME:GetMetric("ArrowEffects","ArrowSpacing")*2.25)))
			end,
			OffCommand=function(s)
				if IsFullCombo() then
					s:diffusealpha(1):rotationz(-20):zoom(2):linear(0.5):zoom(0.3):rotationz(60)
					:linear(0.25):zoom(0):rotationz(150)
				end
			end,
		},
		LoadActor("SStar")..{
			InitCommand=function(s) s:zoom(0):blend(Blend.Add)
				s:x((NFWidth/1.6)-(i*tonumber(THEME:GetMetric("ArrowEffects","ArrowSpacing")*2.25)))
			end,
			OffCommand=function(s)
				if IsFullCombo() then
					s:diffuse(Color.White):sleep(0.65):diffusealpha(0.8)
					:zoomx(2):zoomy(0):linear(0.1):zoomy(2):rotationz(0):linear(0.5)
					:zoom(1.2):rotationz(90):diffusealpha(0.4):linear(0.05):diffusealpha(0)
				end
			end,
		}
	}
end


t[#t+1] = Def.ActorFrame{
	InitCommand=function(s) s:x(GetPosition(pn)):diffusealpha(0):zoom(0.47) end,
	OffCommand = function(s)
		if IsFullCombo() then
			s:diffuse(FullComboEffectColor1[pss:FullComboType()])
		end
	end,
	--Up Gradient
	LoadActor("Down")..{
		InitCommand=function(s) s:valign(1)
			if IsReverse(pn) then
				s:y(SCREEN_BOTTOM+545)
				:zoomy(1)
			else
				s:y(SCREEN_TOP)
				:zoomy(-1)
			end
		end,
		OffCommand=function(s)
			if IsFullCombo() then
				if IsReverse(pn) then
					s:diffusealpha(0.5):zoomtowidth(NFWidth)
					:linear(0.25):diffusealpha(0.25):zoomtowidth(NFWidth+0.25):zoomy(2):linear(0.25)
					:zoomtowidth(NFWidth):zoomy(1.5):diffusealpha(0)
				else
					s:diffusealpha(0.5):zoomtowidth(NFWidth)
					:linear(0.25):diffusealpha(0.25):zoomtowidth(NFWidth+0.25):zoomy(-2):linear(0.25)
					:zoomtowidth(NFWidth):zoomy(-1.5):diffusealpha(0)
				end
			end
		end,
	},
	LoadActor("Star")..{
		InitCommand=function(s)
			s:blend(Blend.Add)
			if IsReverse(pn) then
				s:y(_screen.cy+(THEME:GetMetric("Player","ReceptorArrowsYReverse")+545))
			else
				s:y(_screen.cy+(THEME:GetMetric("Player","ReceptorArrowsYStandard")))
			end
		end,
		OffCommand=function(s)
			if IsFullCombo() then
				if IsReverse(pn) then
					s:diffusealpha(1):zoomx(0):linear(0.1):zoomx(4):zoomy(1):linear(0.12)
					:zoomx(1):addy(-120):linear(0.36):addy(-1000):diffusealpha(0)
				else
					s:diffusealpha(1):zoomx(0):linear(0.1):zoomx(4):zoomy(1):linear(0.12)
					:zoomx(1):addy(120):linear(0.36):addy(1000):diffusealpha(0)
				end
			end
		end,
	},
	LoadActor("Down")..{
		InitCommand=function(s) s:valign(1)
			if IsReverse(pn) then
				s:y(SCREEN_TOP)
			else
				s:y(SCREEN_BOTTOM+545)
			end
		end,
		OffCommand=function(s)
			if IsFullCombo() then
				if IsReverse(pn) then
					s:diffusealpha(0):sleep(0.48):diffusealpha(0.5):zoomto(64,0):linear(0.5)
					:zoomto(NFWidth+32,-SCREEN_HEIGHT):linear(0.3):diffusealpha(0):zoomto(NFWidth,-SCREEN_HEIGHT)
				else
					s:diffusealpha(0):sleep(0.48):diffusealpha(0.5):zoomto(64,0):linear(0.5)
					:zoomto(NFWidth+32,SCREEN_HEIGHT):linear(0.3):diffusealpha(0):zoomto(NFWidth,SCREEN_HEIGHT)
				end
			end
		end,
	},
	LoadActor("Gradation")..{
		InitCommand=function(s)
			s:align(0,1)
			if IsReverse(pn) then
				s:y(SCREEN_BOTTOM+600)
			else
				s:y(SCREEN_TOP)
			end
		end,
		OffCommand=function(s)
			if IsFullCombo() then
				if IsReverse(pn) then
					s:zoomx(1.125):zoomy(0.75):diffusealpha(0)
					:sleep(0.24):diffusealpha(1):linear(0.24):zoomy(1):linear(0.5)
					:zoomx(-1):linear(0.1):addx(-42):linear(0.2):addx(-(NFWidth/2)-96)
					:diffusealpha(0)
				else
					s:zoomx(1.125):zoomy(-0.75):diffusealpha(0)
					:sleep(0.24):diffusealpha(1):linear(0.24):zoomy(-1):linear(0.5)
					:zoomx(-1):linear(0.1):addx(-42):linear(0.2):addx(-(NFWidth/2)-96)
					:diffusealpha(0)
				end
			end
		end,
	},
	LoadActor("Gradation")..{
		InitCommand=function(s)
			s:align(0,1)
			if IsReverse(pn) then
				s:y(SCREEN_BOTTOM+600)
			else
				s:y(SCREEN_TOP)
			end
		end,
		OffCommand=function(s)
			if IsFullCombo() then
				if IsReverse(pn) then
					s:zoomx(-1.125):zoomy(0.75):diffusealpha(0)
					:sleep(0.24):diffusealpha(1):linear(0.24):zoomy(1):linear(0.5)
					:zoomx(1):linear(0.1):addx(42):linear(0.2):addx((NFWidth/2)+96)
					:diffusealpha(0)
				else
					s:zoomx(-1.125):zoomy(-0.75):diffusealpha(0)
					:sleep(0.24):diffusealpha(1):linear(0.24):zoomy(-1):linear(0.5)
					:zoomx(1):linear(0.1):addx(42):linear(0.2):addx((NFWidth/2)+96)
					:diffusealpha(0)
				end
			end
		end,
	},
	Def.ActorFrame{
		InitCommand=function(s)
			if IsReverse(pn) then
				s:y(380)
			else
				s:y(120)
			end
		end,
		LoadActor("Star")..{
			InitCommand=function(s)
				s:blend(Blend.Add):zoom(0)
				s:y(_screen.cy)
			end,
			OffCommand=function(s)
				if IsFullCombo() then
					s:sleep(0.65):diffusealpha(1):zoomx(1.4):zoomy(0):linear(0.1)
					:zoomy(1.4):rotationz(0):linear(0.5):zoom(0.7):rotationz(90):diffusealpha(0.4)
					:linear(0.05):diffusealpha(0)
				end
			end,
		},
		LoadActor("SStar")..{
			InitCommand=function(s)
				s:blend(Blend.Add):zoom(0)
				s:y(_screen.cy)
			end,
			OffCommand=function(s)
				if IsFullCombo() then
					s:diffuse(color("#ffffff"))
					s:sleep(0.65):diffusealpha(0.5):zoomx(1.4):zoomy(0):linear(0.1)
					:zoomy(1.4):rotationz(0):linear(0.5):zoom(0.7):rotationz(90):diffusealpha(0.4)
					:linear(0.05):diffusealpha(0)
				end
			end,
		},
		LoadActor("Fullcombo01")..{
			InitCommand=function(s)
				s:zoom(0)
				s:y(_screen.cy)
			end,
			OffCommand=function(s)
				if IsFullCombo() then
					s:diffuse(FullComboEffectColor2[pss:FullComboType()])
					s:sleep(0.65):zoomx(1.8):zoomy(0):linear(0.1):zoomy(1.8)
					:rotationz(0):linear(0.5):zoom(0.9):rotationz(90):linear(0.15)
					:zoomx(0.75):diffusealpha(0)
				end
			end,
		},
		LoadActor("Fullcombo02")..{
		InitCommand=function(s)
			s:zoom(0)
			s:y(_screen.cy)
		end,
		OffCommand=function(s)
			if IsFullCombo() then
				s:diffuse(FullComboEffectColor2[pss:FullComboType()])
				s:sleep(0.65):zoomx(1.8):zoomy(0):linear(0.1):zoomy(1.8)
				:rotationz(0):linear(0.5):zoom(0.9):rotationz(-90):linear(0.15)
				:zoomx(0.75):diffusealpha(0)
			end
		end,
		},
	};
};

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s) s:x(GetPosition(pn)):diffusealpha(1):zoom(0.47) end,
	Def.ActorFrame{
		InitCommand=function(s)
			if IsReverse(pn) then
				s:y(380)
			else
				s:y(120)
			end
		end,
		Def.Sprite{
		InitCommand=function(s)
			s:y(_screen.cy)
		end,
		OffCommand=function(s)
			if IsFullCombo() then
				if pss:FullComboOfScore('TapNoteScore_W1') then
					s:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/FCM.png"))
				elseif pss:FullComboOfScore('TapNoteScore_W2') then
					s:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/FCP.png"))
				elseif pss:FullComboOfScore('TapNoteScore_W3') then
					s:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/FCGr.png"))
				elseif pss:FullComboOfScore('TapNoteScore_W4') then
					s:Load(THEME:GetPathB("ScreenGameplay","overlay/FullCombo/FCGo.png"))
				end
				s:diffusealpha(0):sleep(0.6):diffusealpha(1):zoomy(0)
				:linear(0.1):zoom(TextZoom()):linear(0.5):zoom(TextZoom()*1.55):linear(0.05)
				:diffusealpha(0.66):zoomx(TextZoom()*1.6):linear(0.1):zoomy(0):zoomx(TextZoom()*1.65):diffusealpha(0)
			end
		end,
		};
	};
};

for i=1,(NumColumns*0.75) do
	t[#t+1] = Def.ActorFrame{
		InitCommand=function(s)
			s:x(GetPosition2(pn)):diffusealpha(0):zoom(0.45)
			if modre then
				s:y(_screen.cy+(THEME:GetMetric("Player","ReceptorArrowsYReverse")))
			else
				s:y(_screen.cy+(THEME:GetMetric("Player","ReceptorArrowsYStandard")))
			end
		end,
		OffCommand = function(s)
			if IsFullCombo() then
				s:diffuse(FullComboEffectColor1[pss:FullComboType()])
			end
		end,
		LoadActor("Slim")..{
			InitCommand=function(s) s:blend(Blend.Add)
				s:x((NFWidth/2)-(i*tonumber(THEME:GetMetric("ArrowEffects","ArrowSpacing")*2.25)))
			end,
			OffCommand=function(s)
				if IsFullCombo() then
					s:diffusealpha(0.5):zoomx(0):zoomy(0.5):linear(0.25):diffusealpha(0.25)
					:zoomx(1):zoomy(1.75):linear(0.25):zoomx(0):zoomy(0.5):diffusealpha(0)
				end
			end,
		},

	}
end

return t
