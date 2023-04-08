local t = Def.ActorFrame{};

local StageIndex = GAMESTATE:GetCurrentStageIndex()
local FinalStage = PREFSMAN:GetPreference("SongsPerPlay")

t[#t+1] = Def.ActorFrame{
    StandardDecorationFromFile("Header","Header");
    StandardDecorationFromFileOptional("Footer","Footer");
}


for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)
	if pss:GetMachineHighScoreIndex() == 0 or pss:GetPersonalHighScoreIndex() == 0 then
		t[#t+1] = Def.Sprite{
			Texture="Record",
			InitCommand=function(s) s:zoomx(0.667):xy(pn==PLAYER_1 and _screen.cx-195 or _screen.cx+232,_screen.cy-65) end,
			OnCommand=function(s) s:zoomy(0):sleep(2.3):linear(0.1):zoomy(0.667) end,
			OffCommand=function(s) s:decelerate(0.05):zoomy(0) end,
		};
		t[#t+1] = Def.Sound {
			File=THEME:GetPathS("ScreenEvaluation", "NewRecord"),
			OnCommand=function(s) s:play() end,
		};
	end
	t[#t+1] = Def.Sprite{
		Texture=Language().."exp",
		InitCommand=function(s) s:xy(pn==PLAYER_1 and _screen.cx-212.5 or _screen.cx+212.5,_screen.cy+179):zoom(0.6) end,
		OffCommand=function(s) s:sleep(0.2):linear(0.2):addx(pn==PLAYER_1 and -700 or 700)  end,
	};
	local IsScore = "NORMAL.png"
	if IsEXScore() then
		IsScore = "EX.png"
	end
	t[#t+1] = Def.ActorFrame{
		InitCommand=function(s) s:zoom(0.667):xy(pn==PLAYER_1 and _screen.cx-208 or _screen.cx+220,_screen.cy-40) end,
        OffCommand=function(s) s:sleep(0.2):linear(0.2):diffusealpha(0) end,
		Def.Sprite{
			Texture=IsScore,
            InitCommand=function(s) s:xy(-124,-36) end,
        };
    };
	t[#t+1] = Def.ActorFrame{
        InitCommand=function(s) s:zoom(0.667):xy(pn==PLAYER_1 and _screen.cx-200 or _screen.cx+200,_screen.cy-42) end,
        OffCommand=function(s) s:sleep(0.2):linear(0.2):diffusealpha(0) end,
        Def.RollingNumbers{
            File="ScreenEvaluation ScoreNumber",
            InitCommand=function(s) s:x(0):playcommand("Set") end,
            OffCommand=function(s) s:sleep(0.067):zoom(0) end,
            SetCommand=function(s)
            local score
				if IsEXScore() then
					score = (pss:GetPossibleDancePoints())*(pss:GetPercentDancePoints());
				else 
					score = pss:GetScore();
				end;
			    s:Load("RollingNumbersEvaluation"):targetnumber(score);
            end,
        };
    };
	t[#t+1] = LoadActor("Grade")..{
		InitCommand=cmd(zoom,0.667;draworder,11;x,_screen.cx-282;y,_screen.cy-210.5);
		OffCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
	};
    t[#t+1] = Def.ActorFrame{
        Name="StepsDisplay",
        InitCommand=function(s) s:xy(pn==PLAYER_1 and _screen.cx-153 or _screen.cx+153,_screen.cy-201):zoom(0.667) end,
        OffCommand=function(s) s:linear(0.25):diffusealpha(0) end,
        Def.Sprite{
			Texture=THEME:GetPathG("", "_shared/Style"),
			InitCommand=function(s) s:xy(2,5):pause():queuecommand("Set") end,
			SetCommand=function(self)
				local style = GAMESTATE:GetCurrentStyle()
				if style:GetStyleType() == "StyleType_OnePlayerOneSide" then
					self:setstate(0);
				elseif style:GetStyleType() == "StyleType_TwoPlayersTwoSides" then
					self:setstate(1);
				elseif style:GetStyleType() == "StyleType_OnePlayerTwoSides" then
					self:setstate(2);
				end;
			end;
		};
        Def.BitmapText{
            Font="_impact 32px",
            InitCommand=function(self)
                self:x(3):y(31):zoom(0.74)
                self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(GAMESTATE:GetCurrentSteps(pn):GetDifficulty())));
				self:diffuse(GameColor.Difficulty[GAMESTATE:GetCurrentSteps(pn):GetDifficulty()])
            end,
        };
		Def.BitmapText{
            Font="EvaluationMeter",
            InitCommand=function(self)
                self:xy(-3,52):shadowlength(0):zoom(0.34):diffuse(color("White"))
                local meter = GAMESTATE:GetCurrentSteps(pn):GetMeter();
				self:settext(meter)
            end,
        };
    };
	t[#t+1] = Def.ActorFrame{ 
		Def.Sprite{
			Texture=THEME:GetPathG("","_shared/"..Model().."player"),
			InitCommand=function(s) s:xy(pn==PLAYER_1 and SCREEN_LEFT+48 or SCREEN_RIGHT-48,_screen.cy-181):zoom(0.667):rotationy(pn==PLAYER_1 and 0 or 180) end,
			OffCommand=function(s) s:sleep(0.2):linear(0.2):addx(pn==PLAYER_1 and -300 or 300) end,
		};
		Def.BitmapText{
			Font="_dispatrox 32px",
			InitCommand=function(s) 
				s:xy(pn==PLAYER_1 and SCREEN_LEFT+100 or SCREEN_RIGHT-100,_screen.cy-180)
				s:horizalign(pn==PLAYER_1 and right or left)
					if PROFILEMAN:GetNumLocalProfiles() >= 1 then
						s:settext(string.upper(PROFILEMAN:GetPlayerName(pn)))
					else
						s:settext(pn==PLAYER_1 and "PLAYER 1" or "PLAYER 2")
					end
				s:draworder(50):maxwidth(150):diffuse(color("#feec0a")):zoomx(0.53):zoomy(0.52);
			end,
			OffCommand=function(s) s:sleep(0.2):linear(0.2):addx(pn==PLAYER_1 and -300 or 300) end,
        };
	};
	
	if not ((StageIndex == FinalStage+1) or (StageIndex == FinalStage+2)) then
		t[#t+1] = LoadActor(THEME:GetPathB("ScreenEvaluation","decorations/stars"))..{
			InitCommand=function(s) s:xy(pn==PLAYER_1 and _screen.cx-54 or _screen.cx+278,_screen.cy-10):zoom(0.667) end,
			OffCommand=function(s) s:sleep(0.2):linear(0.2):addx(pn==PLAYER_1 and -700 or 700) end,
		};
	end;
end;

if #GAMESTATE:GetEnabledPlayers() == 1 then
	t[#t+1] = LoadActor("frame", GAMESTATE:GetMasterPlayerNumber(),PLAYER_1,(GAMESTATE:GetMasterPlayerNumber() ~= PLAYER_1))..{
		InitCommand=cmd(xy,_screen.cx-164,_screen.cy+85;zoom,0.667);
	};
	t[#t+1] = LoadActor("frame", GAMESTATE:GetMasterPlayerNumber(),PLAYER_2,(GAMESTATE:GetMasterPlayerNumber() ~= PLAYER_2))..{
		InitCommand=cmd(xy,_screen.cx+168,_screen.cy+85;zoom,0.667);
	};
else
	t[#t+1] = LoadActor("frame", PLAYER_1,PLAYER_1,false)..{
		InitCommand=cmd(xy,_screen.cx-164,_screen.cy+85;zoom,0.667);
	};
	t[#t+1] = LoadActor("frame", PLAYER_2,PLAYER_2,false)..{
		InitCommand=cmd(xy,_screen.cx+168,_screen.cy+85;zoom,0.667);
	};
end;



if not ((StageIndex == FinalStage+1) or (StageIndex == FinalStage+2)) then
	t[#t+1] = LoadActor(THEME:GetPathG("","_shared/stars"))..{
		InitCommand=function(s) s:xy(_screen.cx,_screen.cy+184):zoom(0.667) end,
		OffCommand=function(s) s:linear(0.2):diffusealpha(0) end,
	};
end

if (GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage()) then
	t[#t+1] = LoadActor("Extra");
elseif (GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage2()) then
	t[#t+1] = LoadActor("Encore");
end



t[#t+1] = Def.ActorFrame{
    Name="Jacket";
    InitCommand=cmd(x,_screen.cx+1;y,_screen.cy-134;draworder,1);
	Def.Sprite {
		OnCommand=function(s)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				s:Load(GetJacketPath(song))
			end;
			s:setsize(144,144)
		end;
		OffCommand=cmd(sleep,0.2;bouncebegin,0.175;zoomy,0);
	};
};

t[#t+1] = Def.ActorFrame{
    Name="songinfo",
    InitCommand=function(s) s:xy(_screen.cx,_screen.cy-40):zoom(0.667) end,
    OffCommand=function(s) s:linear(0.2):zoomy(0) end,
    Def.Sprite{ 
		Texture=THEME:GetPathG("","_shared/song info"), 
		InitCommand=function(s) s:setsize(300,47) end,
	};
    Def.BitmapText{
        Font="_arial black 28px",
        InitCommand=function(s)
            s:maxwidth(300):zoom(0.9)
            local song = GAMESTATE:GetCurrentSong()
            local course = GAMESTATE:GetCurrentCourse()
            if song then
                s:settext(GetSongName(song)):y(-9)
            else
                s:settext(course:GetDisplayTitle())
            end
        end,
    };		
    Def.BitmapText{
        Font="_arial black 28px",
        InitCommand=function(s)
			s:maxwidth(390):y(13):x(2):zoom(0.7)
            local song = GAMESTATE:GetCurrentSong()
			if song then
                s:settext(GetArtistName(song))
            else
				s:settext("")
            end
        end,
    };
};

return t;