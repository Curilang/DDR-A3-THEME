local steps = GAMESTATE:GetCurrentSteps(GAMESTATE:GetMasterPlayerNumber())
local timer = SCREENMAN:GetTopScreen():GetChild("Timer"):GetSeconds()


local sortorders = {
	"Title",
	"Genre",
	"Group",
	"Artist",
	"TopGrades",
	"BPM",
	"EasyMeter",
	"Recent",
	"Length",
	"Preferred",
}
local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
local curIndex = 1;
-- this handles user input
local function input(event, param)
	if not event.PlayerNumber or not event.button then
		return false
	end

	if event.type ~= "InputEventType_Release" then
		local overlay = SCREENMAN:GetTopScreen():GetChild("Overlay")
		if event.GameButton == "Start" then
			overlay:GetChild("start_sound"):play()
			MESSAGEMAN:Broadcast("MusicWheelSort")
			if sortorders[curIndex] == "EasyMeter" then
				mw:ChangeSort("SortOrder_"..ToEnumShortString(steps:GetDifficulty()).."Meter")
			else
				mw:ChangeSort("SortOrder_"..sortorders[curIndex])
			end
			SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen")
		elseif event.GameButton == "Back" then
			SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen")
		elseif event.GameButton == "MenuRight" then
			if curIndex >= #sortorders then
				curIndex = 1
			else
				curIndex = curIndex+1
			end
			overlay:GetChild("change_sound"):play()
		elseif event.GameButton == "MenuUp" then
			if curIndex == 1 then
				curIndex = #sortorders-1
			elseif curIndex == 2 then
				curIndex = #sortorders
			else
				curIndex = curIndex - 2
			end
			overlay:GetChild("change_sound"):play()
		elseif event.GameButton == "MenuDown" then
			if curIndex >= #sortorders then
				curIndex = 2
			elseif curIndex >= #sortorders-1 then
				curIndex = 1
			else
				curIndex = curIndex + 2
			end
			overlay:GetChild("change_sound"):play()
		elseif event.GameButton == "MenuLeft" then
			if curIndex == 1 then
				curIndex = #sortorders
			else
				curIndex = curIndex-1
			end
			overlay:GetChild("change_sound"):play()
		end
		MESSAGEMAN:Broadcast("MoveScroller");
	end

	return false
end

local function MakeItem(sortorders, idx)
	return Def.ActorFrame{
		Name="Item"..idx;
		BeginCommand=function(s) s:playcommand(idx == curIndex and "GainFocus" or "LoseFocus") end,
		OnCommand=function(s)
			if idx%2==0 then
				s:addx(200):diffusealpha(0):sleep(idx/12):decelerate(0.2):diffusealpha(1):addx(-200)
			else
				s:addx(-200):diffusealpha(0):sleep(idx/12):decelerate(0.2):diffusealpha(1):addx(200)
			end
		end,
		OffCommand=function(s)
			if idx%2==0 then
				s:accelerate(0.1):addx(200):diffusealpha(0)
			else
				s:accelerate(0.1):addx(-200):diffusealpha(0)
			end
		end,
		MoveScrollerMessageCommand=function(self,param)
			if curIndex == idx then
				self:playcommand("GainFocus")
			else
				self:playcommand("LoseFocus")
			end
		end;
		Def.ActorFrame{
			InitCommand=function(s) 
				if idx%2 == 0 then s:zoomx(-1):zoomy(-1) else
					return
				end
			end,
			LoadActor("TAB");
			LoadActor("Insert")..{
				InitCommand=function(s) s:diffuse(Color.Black) end,
				GainFocusCommand=function(s) s:finishtweening():diffuseshift():effectcolor1(Color.White):effectcolor2(Alpha(Color.White,0.2)):effectperiod(0.75) end,
				LoseFocusCommand=function(s) s:finishtweening():stopeffect():diffuse(Color.Black) end,
			},
		};
		Def.ActorFrame{
			InitCommand=function(s) 
				if idx%2 == 0 then s:zoomx(-1) else
					return
				end
			end,
			GainFocusCommand=function(s) s:finishtweening():visible(true) end,
			LoseFocusCommand=function(s) s:finishtweening():visible(false) end,
			LoadActor(THEME:GetPathG("","_shared/"..Model().."cursor"))..{
				InitCommand=function(s) s:x(-90)
					s:bounce():effectperiod(1):effectmagnitude(-10,0,0):effectoffset(0.5):zoom(0.75)
				end,
			},
			LoadActor(THEME:GetPathG("","_shared/"..Model().."cursor"))..{
				InitCommand=function(s) s:x(90):zoomx(-0.75):zoomy(0.75)
					s:bounce():effectperiod(1):effectmagnitude(10,0,0):effectoffset(0.5)
				end,
			},
		},
		Def.BitmapText{
			Name="SortText";
			Font="_arial black 20px";
			InitCommand=function(s)
				local DisplayName = THEME:GetString("MusicWheel",sortorders.."Text")
				if idx == 7 then
					DisplayName = "Choose by LEVEL"
				end
				s:settext(DisplayName):wrapwidthpixels(200):zoom(0.75)
			end,
		}
	}
end

local ItemList = {};
for i=1,#sortorders do
	ItemList[#ItemList+1] = MakeItem(sortorders[i],i)
end;

local t = Def.ActorFrame{
	InitCommand=function(s) s:zoom(0.667):Center():queuecommand("Capture") end,
	CaptureCommand=function(s) 
		SCREENMAN:GetTopScreen():AddInputCallback(input)
		--SOUND:PlayOnce(THEME:GetPathS("_PHOTwON","back"))
	end,
	LoadActor("fondo")..{
		OnCommand=function(s) s:xy(-6,48):zoomy(0):decelerate(0.2):zoomy(1) end,
	},
	Def.ActorFrame{
		OnCommand=function(s) s:x(-6):valign(1):y(0):decelerate(0.2):y(-195) end,
		LoadActor(THEME:GetPathG("","ScreenSelectProfile/"..Model().."upper_base"))..{
			InitCommand=function(s) s:valign(1):zoom(0.59) end,
		},
		LoadActor(Language().."title")..{
			InitCommand=function(s) s:y(-25) end,
		}
	};
	LoadActor(THEME:GetPathG("ScreenSelectStyle","Icon/"..Model().."bottom"))..{
		InitCommand=function(s) s:zoom(0.43) end,
 		OnCommand=function(s) s:x(-6):valign(0):y(0):decelerate(0.2):y(289) end,
	},
	Def.ActorScroller{
		SecondsPerItem=0;
		NumItemsToDraw=20;
		TransformFunction=function(self,offsetFromCenter,itemIndex,numItems)
			self:y((offsetFromCenter * 32)-170);
			self:draworder( math.abs(offsetFromCenter)*10 );
			if itemIndex%2==0 then
			  self:x(-84)
			else
			  self:x(78)
			end;
		end,
		children=ItemList;
	}
};
t[#t+1] = LoadActor( THEME:GetPathS("", "_MusicWheel change") )..{ Name="change_sound", SupportPan = false }
t[#t+1] = LoadActor( THEME:GetPathS("", "player mine") )..{ Name="change_invalid", SupportPan = false }
t[#t+1] = LoadActor( THEME:GetPathS("common", "start") )..{ Name="start_sound", SupportPan = false }

t[#t+1] = Def.ActorFrame {
	LoadActor("../_swoosh_in") .. {
	OnCommand=cmd(queuecommand,"Play");
	PlayCommand=cmd(play);
	};
};
return t