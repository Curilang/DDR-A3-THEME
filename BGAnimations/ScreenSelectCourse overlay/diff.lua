local pn = ...
local yspacing = 39
local DiffList = Def.ActorFrame{};

local function DrawDiffListItem(diff)
	local DifficultyListItem = Def.ActorFrame{ 
		InitCommand=function(s) s:xy(pn==PLAYER_1 and -3 or 3,(Difficulty:Reverse()[diff] * yspacing)-80) end,
		SetCommand=function(self)
			local st=GAMESTATE:GetCurrentStyle():GetStepsType()
			local song=GAMESTATE:GetCurrentCourse()
			if song then
				if diff == "Difficulty_Beginner" or diff == "Difficulty_Easy" or diff == "Difficulty_Medium" or diff == "Difficulty_Hard" or diff == "Difficulty_Challenge" then
					self:diffusealpha(1)
				else
					self:diffusealpha(0.5)
				end
			else
				self:diffusealpha(0.5)
			end;
		end;
		Def.BitmapText{
			Font="_dispatrox 32px",
			InitCommand=function(self)
				self:halign(pn=='pnNumber_P2' and 1 or 0):draworder(99):diffuse(Color.White):zoomx(0.5):zoomy(0.6):maxwidth(150)
				self:x(-119)
				self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff)))
			end;
		};
		Def.ActorFrame{
			InitCommand=function(s) s:x(pn==pn_2 and 26 or -26) end,
			Def.Quad{
				InitCommand=function(s) s:setsize(26,25):diffuse(CustomDifficultyToColor(diff)) end,
			};
		};
	};
	return DifficultyListItem
end

local difficulties = {"Difficulty_Beginner", "Difficulty_Easy", "Difficulty_Medium", "Difficulty_Hard", "Difficulty_Challenge"}


for diff in ivalues(difficulties) do
	DiffList[#DiffList+1] = DrawDiffListItem(diff)
end


return Def.ActorFrame{
	["CurrentTrail" .. ToEnumShortString(pn) .. "ChangedMessageCommand"]=function(s) s:finishtweening():queuecommand("Set") end,
	Def.Sprite{
		Texture=THEME:GetPathB("ScreenSelectMusic","overlay/Difficulty/"..Model().."frame"),
		InitCommand=function(s) s:xy(pn==PLAYER_1 and 36 or -36,-17):rotationy(pn==PLAYER_1 and 0 or 180) end,
		OnCommand=function(s) s:diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathB("ScreenSelectMusic","overlay/Difficulty/"..Model()..Language().."text"),
		InitCommand=function(s) s:xy(20,-112) end,
		OnCommand=function(s) s:diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
	};
    DiffList..{
		InitCommand=function(s) s:x(pn==PLAYER_1 and 0 or -14) end,
		OnCommand=function(s) s:diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
    };
	Def.Sprite{
    Texture=THEME:GetPathB("ScreenSelectMusic","overlay/Difficulty/"..Model().."line"),
    InitCommand=function(s) s:x(pn==PLAYER_1 and 0 or -9)
		s:setsize(246,25):diffusealpha(0)
		s:diffuseshift():effectcolor1(color("1,1,1,0.7")):effectcolor2(color("1,1,1,0.2")):effectperiod(0.8):visible(false) 
	end,
	OnCommand=function(s) s:diffusealpha(0):sleep(0.8):diffusealpha(0.7) end,
	["CurrentTrail" .. ToEnumShortString(pn) .. "ChangedMessageCommand"]=function(s)
		local song=GAMESTATE:GetCurrentCourse()
		if song then
			s:visible(true)
			local steps = GAMESTATE:GetCurrentTrail(pn)
			if steps then
				local diff = steps:GetDifficulty();
				local st=GAMESTATE:GetCurrentStyle():GetStepsType();
				s:y((Difficulty:Reverse()[diff] * yspacing)-80)
			else
				s:visible(false)
			end;
		end;
    end,
	};
}