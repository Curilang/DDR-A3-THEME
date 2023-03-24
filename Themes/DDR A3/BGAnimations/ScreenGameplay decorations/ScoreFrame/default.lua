local yval = SCREEN_BOTTOM-38
local t = Def.ActorFrame{
    CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
};	

if not GAMESTATE:IsDemonstration() then
t[#t+1] = Def.ActorFrame{
    InitCommand=function(s) s:draworder(99) end,
    Def.ActorFrame{
        Name="TextBanner",
        InitCommand=function(s) s:xy(_screen.cx,yval):zoom(0.67) end,
        Def.Sprite{
            Texture=THEME:GetPathG("","_shared/song info"),
			InitCommand=function(s) s:setsize(380,54) end,
        };
		--Song
        Def.BitmapText{
            Font="_arial black 28px",
            InitCommand=function(s) s:zoom(0.9):maxwidth(374):x(1):y(-9) end,
            CurrentSongChangedMessageCommand=function(s)
                local song = GAMESTATE:GetCurrentSong()
                if song then
                     s:settext(GetSongName(song))
                end
            end,
        };
		--Artist
        Def.BitmapText{
            Font="_arial black 28px",
            InitCommand=function(s) s:zoom(0.7):maxwidth(450):y(17) end,
            CurrentSongChangedMessageCommand=function(s)
                local song = GAMESTATE:GetCurrentSong()
                if song then
                    s:settext(GetArtistName(song))
                end
            end,
        }
    };
};
end

--Players
for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
    t[#t+1] = Def.ActorFrame{
        InitCommand=function(s) s:y(144):draworder(10):zoom(0.67):x(pn==PLAYER_1 and SCREEN_LEFT+128 or SCREEN_RIGHT-128) end,
        Def.ActorFrame{
            InitCommand=function(s)
                s:y(IsReverse(pn) and SCREEN_TOP-143 or (yval-29)):zoomx(1.02)
				s:x(IsReverse(pn) and (pn==PLAYER_1 and 24 or -22) or 0) end,
			--Graphic
			Def.ActorFrame{
			InitCommand=function(s) s:xy(pn==PLAYER_1 and 0 or 0,-5) end,
				Def.Sprite{
					Texture=Model().."name",
					InitCommand=function(s) 
                        s:rotationx(IsReverse(pn) and 180 or 0)
						s:x(75)
					end,
				};
				Def.Sprite{
					Texture=Model().."diff",
					InitCommand=function(s) 
						s:rotationx(IsReverse(pn) and 180 or 0)
						s:x(-80)
					end,
				};
            };
			Def.BitmapText{
            Font="_dispatrox 32px",
            InitCommand=function(s)
				s:settext(ShowBPMDisplay()==true and "BPM" or (string.upper(PROFILEMAN:GetPlayerName(pn)))):diffuse(color("#feec0a"))
				s:x(pn==PLAYER_1 and (ShowBPMDisplay()==true and 40 or 80) or (ShowBPMDisplay()==true and 40 or 77)):zoom(0.72):maxwidth(180)
				s:y(IsReverse(pn) and -6 or -2)
            end,
        };
            Def.ActorFrame{
                InitCommand=function(s) s:x(pn==PLAYER_1 and -63 or -63) end,
			--Difficulty Name
                Def.BitmapText{
                    Font="_commador extended 32px",
                    InitCommand=function(s) s:halign(1):zoomy(0.6):zoomx(0.76):playcommand("Set") end,
                    SetCommand=function(s)
                        local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
                        local sDifficulty = ToEnumShortString( diff );
                        if diff then
                            s:settext(THEME:GetString("CustomDifficulty",sDifficulty))
                            :diffuse(CustomDifficultyToColor(diff))
                            if sDifficulty == 'Edit' then
                                s:maxwidth(126)
                            end
                            local meter = tonumber(GAMESTATE:GetCurrentSteps(pn):GetMeter())
                            local sDiffWidth = 0;
		                    local sMeterWidth = 0;

		                    if meter <= 0 then
		                    	sMeterWidth = 18;
		                    elseif meter <= 9 then
		                    	sMeterWidth = 18 ;
		                    elseif meter <= 99 then
		                    	sMeterWidth = 0;
		                    else
		                    	sMeterWidth = -18;
                            end;
                            if sDifficulty == 'Beginner' then
                                sDiffWidth = 80;
                            elseif sDifficulty == 'Easy' then
                                sDiffWidth = 48;
                            elseif sDifficulty == 'Medium' then
                                sDiffWidth = 84;
                            elseif sDifficulty == 'Hard' then
                                sDiffWidth = 60;
                            elseif sDifficulty == 'Challenge' then
                                sDiffWidth = 86;
                            else
                                sDiffWidth = 78;
                            end;
                            local totalWidth = sDiffWidth+sMeterWidth;
                            local additionXPos = totalWidth/2-42;
                            s:x(25+additionXPos)
							s:y(IsReverse(pn) and -6 or -1.5)
                        end
                    end
                };
				--Number
                Def.BitmapText{
                    Font="_impact 32px",
                    InitCommand=function(s) s:halign(0):zoomx(1):zoomx(0.9):zoomy(0.68) end,
                    SetCommand=function(s)
                        local meter = GAMESTATE:GetCurrentSteps(pn):GetMeter();
                        local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
                        if GAMESTATE:IsCourseMode() then
                            diff = GAMESTATE:GetCurrentTrail(pn):GetTrailEntry(GAMESTATE:GetCourseSongIndex()):GetSteps():GetDifficulty();
                            meter = GAMESTATE:GetCurrentTrail(pn):GetTrailEntry(GAMESTATE:GetCourseSongIndex()):GetSteps():GetMeter();
                        end
                        local sDifficulty = ToEnumShortString(diff)

                        local sDiffWidth = 0;
				        local sMeterWidth = 0;
	
				        if meter <= 0 then
				        	sMeterWidth = 18;
				        elseif meter <= 9 then
				        	sMeterWidth = 18 ;
				        elseif meter <= 99 then
				        	sMeterWidth = 0;
				        else
				        	sMeterWidth = -18;
				        end;

				        if sDifficulty == 'Beginner' then
				        	sDiffWidth = 85;
				        elseif sDifficulty == 'Easy' then
				        	sDiffWidth = 52;
				        elseif sDifficulty == 'Medium' then
				        	sDiffWidth = 84;
				        elseif sDifficulty == 'Hard' then
				        	sDiffWidth = 62;
				        elseif sDifficulty == 'Challenge' then
				        	sDiffWidth = 86;
				        else
				        	sDiffWidth = 80;
				        end;

				        local totalWidth = sDiffWidth+sMeterWidth;
                        local additionXPos = totalWidth/2-42;
                        s:settext(meter):x(29+additionXPos)
						s:y(IsReverse(pn) and -8 or -3)
                    end,
                };
            };
            
        };
		Def.ActorFrame{
			InitCommand=function(s) s:y(yval+2.4) end,
			Def.Sprite{
				Texture=Model().."score",
			};
			LoadActor("score_counter",pn);
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_shared/EX"),
			InitCommand=function(s) s:xy(pn==PLAYER_1 and -83 or -83,_screen.cy+203):visible(IsEXScore()) end,
		};
		LoadActor("BPMDisplay")..{ 
			InitCommand=function(s) s:x(pn==PLAYER_1 and (IsReverse(pn) and 147 or 124) or (IsReverse(pn) and 102 or 124)):y(IsReverse(pn) and SCREEN_TOP-150 or (yval-32)):diffusealpha(ShowBPMDisplay() and 1 or 0) end,
		};
    };
end

return t;