local yval = SCREEN_BOTTOM-38
local t = Def.ActorFrame{
    CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
};	

t[#t+1] = Def.ActorFrame{
	Condition=not GAMESTATE:IsDemonstration();
	InitCommand=function(s) s:xy(_screen.cx,yval):zoom(0.67):draworder(99) end,		
	Def.Sprite{
		Texture=THEME:GetPathG("","_shared/song info"),
		InitCommand=function(s) s:setsize(380,54) end,
	};
	Def.BitmapText{
		Font="_swis721 blk bt 28px",
		InitCommand=function(s) s:zoom(0.9):maxwidth(374):x(1):y(-12) end,
		CurrentSongChangedMessageCommand=function(s)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				s:settext(GetSongName(song))
			end
		end,
	};
	Def.BitmapText{
		Font="_swis721 blk bt 28px",
		InitCommand=function(s) s:zoom(0.7):maxwidth(450):y(13) end,
		CurrentSongChangedMessageCommand=function(s)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				s:settext(GetArtistName(song))
			end
		end,
	};
};

--Players
for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
    t[#t+1] = Def.ActorFrame{
		InitCommand=function(s) 
			s:xy(pn==PLAYER_1 and SCREEN_LEFT+128 or SCREEN_RIGHT-128,144)
			s:draworder(10):zoom(0.67)
		end,
		Def.ActorFrame{
            InitCommand=function(s) s:y(IsReverse(pn) and SCREEN_TOP-148 or (yval-33)):x(IsReverse(pn) and (pn==PLAYER_1 and 24 or -22) or 0)  end,
				Def.Sprite{
					Texture=Model().."name",
					InitCommand=function(s) s:rotationx(IsReverse(pn) and 180 or 0):x(75) end,
				};
				Def.Sprite{
					Texture=Model().."diff",
					InitCommand=function(s) s:rotationx(IsReverse(pn) and 180 or 0):x(-85) end,
				};
				Def.BitmapText{
					Font="_dispatrox 32px",
					InitCommand=function(s) s:zoom(0.72):maxwidth(180):y(IsReverse(pn) and -1 or 3):diffuse(color("#feec0a"))
						s:settext(ShowBPMDisplay() and "BPM" or (string.upper(PROFILEMAN:GetPlayerName(pn))))
						s:x(ShowBPMDisplay() and 40 or 80)
					end,
				};
				LoadActor("BPMDisplay")..{ 
					InitCommand=function(s) s:x(122):y(IsReverse(pn) and -2.6 or 1.5):visible(ShowBPMDisplay()) end,
				};
			Def.ActorFrame{
				InitCommand=function(s) s:y(IsReverse(pn) and -5 or 0) end,
				Def.BitmapText{
					Font="_commador extended 32px",
					InitCommand=function(s) s:halign(1):zoomy(0.6):zoomx(0.76):playcommand("Set") end,
					SetCommand=function(s)
						local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
						local sDifficulty = ToEnumShortString(diff);
						if diff then
							s:settext(THEME:GetString("CustomDifficulty",sDifficulty)):diffuse(CustomDifficultyToColor(diff))
							s:maxwidth(sDifficulty == 'Edit' and 126 or 200)
                            local meter = tonumber(GAMESTATE:GetCurrentSteps(pn):GetMeter())
							local sDiffWidth = 0;
		                    local sMeterWidth = 0;
							
								if meter <= 0  then  sMeterWidth = 18;
							elseif meter <= 9  then  sMeterWidth = 18 ;
							elseif meter <= 99 then  sMeterWidth = 0;
							else                     sMeterWidth = -18; end;
								if sDifficulty == 'Beginner' 	then sDiffWidth = 80;
                            elseif sDifficulty == 'Easy' 		then sDiffWidth = 45;
                            elseif sDifficulty == 'Medium' 		then sDiffWidth = 78;
                            elseif sDifficulty == 'Hard' 		then sDiffWidth = 58;
                            elseif sDifficulty == 'Challenge' 	then sDiffWidth = 89;
                            else 									 sDiffWidth = 78; end;
                            
							local totalWidth = sDiffWidth+sMeterWidth;
                            local additionXPos = totalWidth/2-42;
                            
							s:x(-43+additionXPos):y(3.5)
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
                        local sDifficulty = ToEnumShortString(diff)


							local sDiffWidth = 0;
		                    local sMeterWidth = 0;
								if meter <= 0  then  sMeterWidth = 18;
							elseif meter <= 9  then  sMeterWidth = 18 ;
							elseif meter <= 99 then  sMeterWidth = 0;
							else                     sMeterWidth = -18; end;
								if sDifficulty == 'Beginner' 	then sDiffWidth = 85;
                            elseif sDifficulty == 'Easy' 		then sDiffWidth = 52;
                            elseif sDifficulty == 'Medium' 		then sDiffWidth = 84;
                            elseif sDifficulty == 'Hard' 		then sDiffWidth = 64;
                            elseif sDifficulty == 'Challenge' 	then sDiffWidth = 89;
                            else 									 sDiffWidth = 89; end;
                            local totalWidth = sDiffWidth+sMeterWidth;
                            local additionXPos = totalWidth/2-42;
                        s:settext(meter):x(-41+additionXPos):y(2)
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
			InitCommand=function(s) s:xy(-83,yval+1):visible(IsEXScore()) end,
		};
		
    };
end

return t;