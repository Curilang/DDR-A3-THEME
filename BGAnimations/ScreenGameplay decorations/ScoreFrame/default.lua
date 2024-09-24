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
				InitCommand=function(self)
					local steps;
					if GAMESTATE:IsCourseMode() then
						steps = ToEnumShortString(GAMESTATE:GetCurrentTrail(pn):GetDifficulty());
					else
						steps = ToEnumShortString(GAMESTATE:GetCurrentSteps(pn):GetDifficulty());
					end
					local diff = {
						["Beginner"] = -44,
						["Easy"] = -60,
						["Medium"] = -46,
						["Hard"] = -57,
						["Challenge"] = -41,
						["Edit"] = -47,
					};
					self:xy(diff[steps],IsReverse(pn) and -5 or 0)
				end;
				Def.BitmapText{
					Font="_commador extended 32px",
					Name="Diff Label",
					InitCommand=function(s) s:zoomy(0.6):zoomx(0.76):y(3.5) end,
					SetCommand=function(s) s:halign(1)
						local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty();
						s:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff))):uppercase(true):diffuse(CustomDifficultyToColor(diff))
					end;
					CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
				};
				Def.BitmapText{
					Font="_impact 32px",
					Name = "Difficulty Meter";
					InitCommand=function(s) s:xy(15,2):zoomx(0.87):zoomy(0.68) end,
					SetCommand=function(s)
						local meter = GAMESTATE:GetCurrentSteps(pn):GetMeter()
						if meter % 1 == 0 then
							s:settext(meter)
						else
							s:settext(string.format("%.1f", meter))
						end
					end;
					CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
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