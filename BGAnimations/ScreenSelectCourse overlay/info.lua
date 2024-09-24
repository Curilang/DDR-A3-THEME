return Def.ActorFrame{
	InitCommand=cmd(xy,_screen.cx,_screen.cy-274);
	CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
	Def.ActorFrame{
		InitCommand=cmd(xy,-90,-7);
		LoadActor(THEME:GetPathB("ScreenSelectMusic","Overlay/Info/"..Model().."info"))..{ 
			InitCommand=function(s) s:x(12):y(23) end, 
		};
		LoadFont("_swis721 blk bt 28px")..{
			InitCommand=cmd(xy,-235,-1;zoom,0.8;halign,0;maxwidth,560;diffuse,color("White"));
			SetCommand=function(s) 
				s:settext(GAMESTATE:GetCurrentCourse():GetDisplayFullTitle()) 
			end,
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(xy,-20,44);
		LoadActor(THEME:GetPathB("ScreenSelectMusic","Overlay/Info/BPM"))..{ InitCommand=function(s) s:xy(91,9):zoom(0.87) end, };
		Def.Sprite{
			Texture=THEME:GetPathB("ScreenSelectMusic","Overlay/Info/_meter 2x2.png");
			InitCommand=cmd(xy,58,16;effectclock,'beatnooffset';SetAllStateDelays,1);
		};
		Def.BitmapText{
			Font="Bpm";
			InitCommand=cmd(zoom,1.4;xy,148,1);
			SetCommand = function(self)
				local curTrail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
				if curTrail:IsSecret() then
					self:settext("???")
				else
					local bpmlow = {}
					local bpmhigh = {}
					for i=1,#curTrail:GetTrailEntries() do
						local ce = curTrail:GetTrailEntry(i-1):GetSong():GetDisplayBpms()
						table.insert(bpmlow,ce[1])
						table.insert(bpmhigh,ce[#ce])
					end
					self:settextf("%03d\nx%03d",math.floor(math.min(unpack(bpmlow))+0.5),math.floor(math.max(unpack(bpmhigh)))+0.5)
					self:horizalign(right):vertalign(top)
				end
			end,
			CurrentCourseChangedMessageCommand = function(s) s:queuecommand("Set") end,
			ChangedLanguageDisplayMessageCommand = function(s) s:queuecommand("Set") end,
		};
	};
};