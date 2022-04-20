local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
    StandardDecorationFromFile("Header","Header");
	StandardDecorationFromFile("StageDisplay","StageDisplay");
    StandardDecorationFromFileOptional("Footer","Footer");
}
	
--Machine Record
for pn in ivalues(PlayerNumber) do
	local MetricsName = "MachineRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "MachineRecord"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
	};
end

--Personal Record
for pn in ivalues(PlayerNumber) do
	local MetricsName = "PersonalRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "PersonalRecord"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
	};
end

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = Def.Sprite{
		Texture="eamu/"..Language().."scre_eamu_base00",
		InitCommand=function(s) s:xy(pn==PLAYER_1 and _screen.cx-212.5 or _screen.cx+212.5,_screen.cy+179):zoom(0.6) end,
		OffCommand=function(s) s:sleep(0.2):linear(0.2):addx(pn==PLAYER_1 and -700 or 700)  end,
	};
	t[#t+1] = Def.ActorFrame{
		InitCommand=function(s) s:zoom(0.667):xy(pn==PLAYER_1 and _screen.cx-208 or _screen.cx+220,_screen.cy-40) end,
        OffCommand=function(s) s:sleep(0.2):linear(0.2):diffusealpha(0) end,
		Def.Sprite{
            InitCommand=function(s) s:xy(-124,-36) 
				if IsEXScore() then
					s:Load(THEME:GetPathB("ScreenEvaluation","decorations/score/mdx02_rs_ex"))
				else
					s:Load(THEME:GetPathB("ScreenEvaluation","decorations/score/mdx02_rs_score"))
				end
			end,
        };
    };
	t[#t+1] = Def.ActorFrame{
        InitCommand=function(s) s:zoom(0.667):xy(pn==PLAYER_1 and _screen.cx-209 or _screen.cx+209,_screen.cy-32) end,
        OffCommand=function(s) s:sleep(0.2):linear(0.2):diffusealpha(0) end,
        Def.RollingNumbers{
            File="ScreenEvaluation ScoreNumber",
            InitCommand=function(s) s:x(0):playcommand("Set") end,
            OffCommand=function(s) s:sleep(0.067):zoom(0) end,
            SetCommand=function(s)
            local score
				if IsEXScore() then
					score = (STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetPossibleDancePoints())*(STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetPercentDancePoints());
				else 
					score = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetScore();
				end;
			    s:Load("RollingNumbersEvaluation"):targetnumber(score);
            end,
        };
    };
	t[#t+1] = LoadActor("Grade")..{
		InitCommand=cmd(zoom,0.667;draworder,11;x,_screen.cx-262.5;y,_screen.cy-210.5);
		OffCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
	};
    t[#t+1] = Def.ActorFrame{
        Name="StepsDisplay",
        InitCommand=function(s) s:xy(pn==PLAYER_1 and _screen.cx-133 or _screen.cx+133,_screen.cy-201):zoom(0.667) end,
        OffCommand=function(s) s:linear(0.25):diffusealpha(0) end,
        Def.BitmapText{
            Font="_impact 32px",
            InitCommand=function(self)
				self:x(2)
				self:zoom(0.79)
                local style = GAMESTATE:GetCurrentStyle()
                if style:GetStyleType() == "StyleType_OnePlayerTwoSides" then
                    self:settext("DOUBLE");
                elseif style:GetStyleType() == "StyleType_OnePlayerOneSide" then
                    self:settext("SINGLE");
                elseif style:GetStyleType() == "StyleType_TwoPlayersTwoSides" then
                    self:settext("VERSUS");
                end;
            end,
        };
        Def.BitmapText{
            Font="_impact 32px",
            InitCommand=function(self)
                self:x(3):y(25):zoom(0.79)
                local diffname = GAMESTATE:GetCurrentSteps(pn):GetDifficulty();
				self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diffname)));
				self:diffuse(GameColor.Difficulty[diffname])
            end,
        };
		Def.BitmapText{
            Font="_impact 32px",
            InitCommand=function(self)
                self:y(55):x(3):shadowlength(0):zoom(1.1):diffuse(color("White"))
                local meter = GAMESTATE:GetCurrentSteps(pn):GetMeter();
				self:settext(meter);
            end,
        };
    };
	t[#t+1] = Def.ActorFrame{ 
		Def.Sprite{
			Texture=Model().."player",
			InitCommand=function(s) s:xy(pn==PLAYER_1 and SCREEN_LEFT+52 or SCREEN_RIGHT-52,_screen.cy-181):zoom(0.35):rotationy(pn==PLAYER_1 and 0 or 180) end,
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

local StageIndex = GAMESTATE:GetCurrentStageIndex()
local FinalStage = PREFSMAN:GetPreference("SongsPerPlay")

if (StageIndex == FinalStage+1) or (StageIndex == FinalStage+2) then

else
	for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
		t[#t+1] = LoadActor(THEME:GetPathB("GameDecoration","3 Stars"))..{
			InitCommand=function(s) s:xy(pn==PLAYER_1 and _screen.cx-56 or _screen.cx+271,_screen.cy-14):zoom(0.667) end,
			OffCommand=function(s) s:sleep(0.2):linear(0.2):addx(pn==PLAYER_1 and -700 or 700) end,
		};
	end;

	t[#t+1] = LoadActor(THEME:GetPathB("GameDecoration","9 Stars"))..{
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
        Def.Sprite{Texture=THEME:GetPathG("","_shared/song info"),};
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