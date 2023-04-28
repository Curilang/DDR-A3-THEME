local AnimPlayed = true

return Def.ActorFrame{
	InitCommand=cmd(xy,_screen.cx,_screen.cy-274);
	CurrentSongChangedMessageCommand=function(s)
		if GAMESTATE:GetCurrentSong() then
			s:queuecommand("Show"):queuecommand("Set")
		else
			s:queuecommand("Hide")
		end
	end,
	ShowCommand=function(s)
		if AnimPlayed == false then 
			s:diffusealpha(0):linear(0.05):diffusealpha(0.75)
			s:linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1)
			s:queuecommand("UpdateShow")
		end
	end,
	UpdateShowCommand=function(s) AnimPlayed = true end,
	HideCommand=function(s)
		if AnimPlayed == true then
			s:diffusealpha(1):sleep(0.05):diffusealpha(0):sleep(0.05):diffusealpha(0.5)
			s:sleep(0.05):diffusealpha(0):sleep(0.05):diffusealpha(0.25):sleep(0.05)
			s:linear(0.05):diffusealpha(0)
			s:queuecommand("UpdateHide")
		end
	end,
	UpdateHideCommand=function(s) AnimPlayed = false end,
	
	Def.ActorFrame{
		Name="SongArtist Bar";
		InitCommand=cmd(xy,-90,-7);
			LoadActor(Model().."info")..{ InitCommand=function(s) s:x(12):y(23) end, };
			LoadFont("_arial black 28px")..{
			Name="Title";
			InitCommand=cmd(x,-235;zoom,0.8;halign,0;maxwidth,560;diffuse,color("White"));
			SetCommand=function(s)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					s:settext(GetSongName(song))
				end
			end
		};
		LoadFont("_arial black 28px")..{
		Name="Artist";
			InitCommand=cmd(xy,-235,29;halign,0;maxwidth,540;zoomx,0.78;zoomy,0.65);
			SetCommand=function(s)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					s:settext(GetArtistName(song))
				end
			end
		};
	};
	Def.ActorFrame{
		Name="BPMBar";
		InitCommand=cmd(xy,-20,44);
			LoadActor("BPM")..{ InitCommand=function(s) s:xy(91,9):zoom(0.87) end, };
			Def.Sprite{
				Texture="_meter 2x2.png";
				InitCommand=cmd(xy,58,16;effectclock,'beatnooffset';SetAllStateDelays,1);
			};
			LoadFont("Bpm")..{
			InitCommand=cmd(zoom,1.4;xy,148,1);
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				if song then
					local bpmtext;
					bpmtext = song:GetDisplayBpms();
						if bpmtext[1] == bpmtext[2] then
							bpmtext = round(bpmtext[1],0);
						else
							bpmtext = string.format("%d\nx%3d",round(bpmtext[1],0),round(bpmtext[2],0));
						end
					self:horizalign(right);
					self:vertalign(top);
					self:settext(bpmtext);
					self:visible(true);
				else
					self:visible(false);
				end
			end;
		};
	};
	Def.ActorFrame{
		Name="Jacket";
		LoadActor(Model().."jacket")..{ InitCommand=function(s) s:x(245):y(15) end, };
		Def.Quad{ 
			InitCommand=function(s) s:diffuse(Color.Black):diffusealpha(0.4):xy(244,17):setsize(152,152) end,
		};
		Def.Sprite{
			InitCommand=function(s) s:x(244):y(17) end,
			SetCommand=function(s)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					s:Load(GetJacketPath(song))
				end
				s:setsize(150,150)
			end
		};
	};
};