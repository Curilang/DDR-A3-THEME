local args = {...};
local pn = args[1];

local function p(text)
    return text:gsub("%%", ToEnumShortString(pn));
end

local function base_x()
    if pn == PLAYER_1 then
        return SCREEN_CENTER_X-215;
    elseif pn == PLAYER_2 then
        return SCREEN_CENTER_X+215;
    else
        error("Pass a valid player number, dingus.",2)
    end
end

local screen = SCREENMAN:GetTopScreen();


local rownames
if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
	rownames = { "Speed", "Accel", "Appearance", "Turn", "Hide", "Scroll", "NoteSkins", "Remove", "Freeze", "Jump" }
else
	if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
		rownames = { "Speed", "Accel", "Appearance", "Turn", "Hide", "Scroll", "NoteSkins", "Remove", "Freeze", "Jump", "ScreenFilter", "Gauge", "Characters", "DanceStage" }
	elseif GetUserPref("OptionRowGameplayBackground")=='SNCharacters' then
		rownames = { "Speed", "Accel", "Appearance", "Turn", "Hide", "Scroll", "NoteSkins", "Remove", "Freeze", "Jump", "ScreenFilter", "Gauge", "Characters" }
	else
		rownames = { "Speed", "Accel", "Appearance", "Turn", "Hide", "Scroll", "NoteSkins", "Remove", "Freeze", "Jump", "ScreenFilter", "Gauge", }
	end
end

local function GetOptionName(screen, idx)
    return screen:GetOptionRow(idx-1):GetName();
end

local exitIndex = #rownames

function setting(self,screen)
	local screen = SCREENMAN:GetTopScreen();
	local index = screen:GetCurrentRowIndex(pn);
	local row = screen:GetOptionRow(index);
	local name = row:GetName();
	local choice = row:GetChoiceInRowWithFocus(pn);
	if THEME:GetMetric( "ScreenOptionsMaster",name.."Explanation" ) then
		self:settext(THEME:GetString("OptionItemExplanations",name..tostring(choice)));
	else self:settext("");
	end;
end;

local function MakeRow(rownames, idx)
     --the first row begins with focus
     local hasFocus = idx == 1;
     local function IsExitRow()
         return idx == exitIndex;
     end
	return Def.ActorFrame{
		Name="Row"..idx;
		OnCommand=function(self)
			self:playcommand(hasFocus and "GainFocus" or "LoseFocus");
		end;
		ChangeRowMessageCommand=function(self,param)
            if param.PlayerNumber ~= pn then return end
			if param.RowIndex+1 == idx then
                if not hasFocus then
                    hasFocus = true;
				    self:stoptweening();
				    self:queuecommand("GainFocus");
                end;
			elseif hasFocus then
                hasFocus = false;
				self:queuecommand("LoseFocus");
			end;
		end;
		--LINE LEFT
		LoadActor("base")..{
			GainFocusCommand=function(s) 
				if GetCurrentModel() == "Gold" then
					s:diffuse(color("#84ffff"))
				else
					s:diffuse(color("#ffee00"))
				end
			end,
			LoseFocusCommand=cmd(diffuse,color("0,0,0,1"));
		};
		Def.Quad{
			InitCommand=cmd(setsize,4,15;diffuse,color("0,0,0,1");xy,-132,0);
			GainFocusCommand=cmd(diffuse,color("0,0,0,1"));
			LoseFocusCommand=function(self)
				if GetCurrentModel() == "Gold" then
					self:diffuse(color("#8b000e"));
				else
					self:diffuse(color("#00d8ff"));
				end;
			end;
		};
		--LINE OPTIONS
		LoadActor("type.png")..{
			InitCommand=cmd(diffuse,color("0,0,0,1");x,64;setsize,142,30);
		};
		LoadActor("type line.png")..{
			InitCommand=function(s)
				if GetCurrentModel() == "Gold" then
					s:diffuse(color("#dac42e"))
				else
					s:diffuse(color("#00d8ff"))
				end
				s:x(64):setsize(142,30)
			end,
		};
		LoadActor("bsln");
		LoadFont("_avenirnext lt pro bold Bold 20px")..{
			InitCommand=cmd(x,-122;uppercase,true;halign,0;zoom,0.75);
			OnCommand=function(s) s:queuecommand("Set") end,
			SetCommand=function(self)
                local screen = SCREENMAN:GetTopScreen();
                if screen then
                     self:settext(THEME:GetString("OptionTitles",GetOptionName(screen, idx)));
                 else
                     --okay my theory here is if the top screen isn't ready
                     --yet for some reason we should keep trying until it is.
                     --is that right? -tertu
                     self:queuecommand("Set");
                end;
			end;
			GainFocusCommand=cmd(diffuse,color("0,0,0,1"));
			LoseFocusCommand=cmd(diffuse,color("1,1,1,1"));
		};
		--SPEED DISPLAY
		Def.ActorFrame{
			InitCommand=function(s) s:visible(SpeedDisplay()) end,
			Name="Row Name";
				OnCommand=function(s) s:queuecommand("Set") end,
				SetCommand=function(self)
					if not IsExitRow() then
						local screen = SCREENMAN:GetTopScreen();
						local song = GAMESTATE:GetCurrentSong()
						if screen then
							if GetOptionName(screen,idx) == "Speed" then
								if song then
									self:visible(true)
									self:y(-39)
								end
							end
						else
							self:queuecommand("Set");
						end;
					end;
				end;
				GainFocusCommand=function(s) s:finishtweening()
					local screen = SCREENMAN:GetTopScreen();
						local song = GAMESTATE:GetCurrentSong()
					if GetOptionName(screen,idx) == "Speed" then
						s:diffusealpha(1)
					else
						s:diffusealpha(0)
					end
				end,
				LoseFocusCommand=function(s) s:finishtweening():diffusealpha(0) end,
				[p"MenuLeft%MessageCommand"]=function(s) s:playcommand("Set") end,
				[p"MenuRight%MessageCommand"]=function(s) s:playcommand("Set") end,
			LoadActor("base")..{ InitCommand=function(s) s:diffuse(color("0,0,0,1")):visible(SpeedDisplay()) end, };
			LoadActor("bsln")..{ InitCommand=function(s) s:visible(SpeedDisplay()) end, };
			LoadActor("type line")..{ 
				InitCommand=function(s) s:x(64):setsize(142,30):visible(SpeedDisplay())
					if GetCurrentModel() == "Gold" then
						s:diffuse(color("#dac42e"))
					else
						s:diffuse(color("#00d8ff"))
					end
				end, 
			};
			LoadFont("_avenirnext lt pro bold Bold 20px")..{
				InitCommand=function(s) s:visible(SpeedDisplay()):settext("CURRENT BPM"):x(-67):zoom(0.78):maxwidth(150) end,
			};
			Def.Quad{
				InitCommand=function(s) s:setsize(4,15):xy(-132,0):visible(SpeedDisplay())
					if GetCurrentModel() == "Gold" then
						s:diffuse(color("#8b000e"));
					else
						s:diffuse(color("#00d8ff"));
					end;
				end;
			};
		};
		LoadFont("_avenirnext lt pro bold Bold 20px")..{
			Name="Row Name";
            Text="";
			InitCommand=function(s) s:visible(SpeedDisplay())end,
			OnCommand=function(s) s:queuecommand("Set") end,
			SetCommand=function(self)
                if not IsExitRow() then
					local screen = SCREENMAN:GetTopScreen();
					local song = GAMESTATE:GetCurrentSong()
                    if screen then
                        if GetOptionName(screen,idx) == "Speed" then
							if song then
								local speedmult = screen:GetOptionRow(0):GetChoiceInRowWithFocus(pn)
								local speedstring = THEME:GetString("OptionItemNames","Speed"..speedmult)
								local speedsub = string.gsub(speedstring, "x", "")
								if song:IsDisplayBpmRandom() or song:IsDisplayBpmSecret() then
									text = "?"
								else
									local dispBPMs = song:GetDisplayBpms()
									local BPM1Mod = math.floor(dispBPMs[1]*speedsub)
									if song:IsDisplayBpmConstant() then
										text = BPM1Mod
									else
										local BPM2Mod = math.floor(dispBPMs[2]*speedsub)
										text = BPM1Mod.." - "..BPM2Mod
									end
								end
								self:settext(text);
								self:xy(65,-39)
								self:zoom(0.9)
							end
						end
                    else
                        --okay my theory here is if the top screen isn't ready
                        --yet for some reason we should keep trying until it is.
                        --is that right? -tertu
                        self:queuecommand("Set");
                    end;
                end;
			end;
			GainFocusCommand=function(s) s:finishtweening():diffusealpha(1) end,
			LoseFocusCommand=function(s) s:finishtweening():diffusealpha(0) end,
			[p"MenuLeft%MessageCommand"]=function(s) s:playcommand("Set") end,
			[p"MenuRight%MessageCommand"]=function(s) s:playcommand("Set") end,
		};
		--SPEED DISPLAY
		
		LoadFont("_avenirnext lt pro bold Bold 20px")..{
			InitCommand=cmd(x,64;uppercase,true;zoom,0.8;maxwidth,150);
			OnCommand=cmd(queuecommand,"Set");
			SetCommand=function(self)
				local screen = SCREENMAN:GetTopScreen();
				if screen then
					local name = GetOptionName(screen, idx);
                    local choice = screen:GetOptionRow(idx-1):GetChoiceInRowWithFocus(pn);
                    local function ChoiceToText(choice)
                        if THEME:GetMetric("ScreenOptionsMaster",name.."Explanation") then
                            return THEME:GetString("OptionItemNames",name..tostring(choice))
                        else
                            return ""
                        end
                    end
					if name ~= "NoteSkins" and name ~= "DanceStage" and name ~= "Characters" then
						--normal option, handle default choice coloring.
                        local ChoiceText = ChoiceToText(choice)
                        --for most options, 0 is the default choice, for Speed it is 3.
						if ChoiceText and ChoiceText == ChoiceToText(name == "Speed" and 3 or 0) then
							self:diffuse(color("#06ff06")):diffusetopedge(color("#74ff74"));
						else
							if ChoiceText == "LIFE4" or ChoiceText == "RISKY" then
								self:diffuse(color("#ff0606")):diffusetopedge(color("#ff7474"));
							else
								self:diffuse(color("1,1,1,1"));
							end
						end;
                        self:settext(ChoiceText);
					elseif name == "NoteSkins" then
						self:settext(NOTESKIN:GetNoteSkinNames()[choice+1])
					elseif name == "DanceStage" then
						local DanceStagesNames = GetAllDanceStagesNames()
						if choice == 0 then
							self:settext("DEFAULT"):diffuse(color("#06ff06")):diffusetopedge(color("#74ff74"))
						elseif choice == 1 then
							self:settext("RANDOM"):diffuse(color("1,1,1,1"))
						else		
							self:settext(DanceStagesNames[choice+1]):diffuse(color("1,1,1,1"))
						end
					elseif name == "Characters" then
						if GetUserPref("OptionRowGameplayBackground")=='DanceStages' then
							local chars = GetAllCharacterNames()
							if choice == 0 then
								self:settext("Random"):diffuse(color("#06ff06")):diffusetopedge(color("#74ff74"))
							else
								self:settext(chars[choice+1]):diffuse(color("1,1,1,1"))
							end;
						elseif GetUserPref("OptionRowGameplayBackground")=='SNCharacters' then
							if choice == 0 then
								self:settext("OFF"):diffuse(color("#06ff06")):diffusetopedge(color("#74ff74"))
							else
								self:settext(Characters.GetAllCharacterNames()[choice]):diffuse(color("1,1,1,1"))
							end;
						end
					else
						self:settext("")
					end;
				end;
			end;
			[p"MenuLeft%MessageCommand"]=function(s) s:queuecommand("Set") end,
	        [p"MenuRight%MessageCommand"]=function(s) s:queuecommand("Set") end,
		};
		LoadActor(THEME:GetPathG("","_shared/"..Model().."cursor"))..{
			InitCommand=cmd(zoom,0.75;x,-20;diffusealpha,1;bounce;effectmagnitude,3,0,0;effectperiod,1);
			GainFocusCommand=cmd(visible,true);
			LoseFocusCommand=cmd(visible,false);
		};
		LoadActor(THEME:GetPathG("","_shared/"..Model().."cursor"))..{
			InitCommand=cmd(zoom,0.75;x,146;diffusealpha,1;zoomx,-0.75;bounce;effectmagnitude,-3,0,0;effectperiod,1);
			GainFocusCommand=cmd(visible,true);
			LoseFocusCommand=cmd(visible,false);
		};
	};
end;

local RowList = {};
for i=1,#rownames do
	RowList[#RowList+1] = MakeRow(rownames[i],i)
end;

local t = Def.ActorFrame{
	InitCommand=function(s) s:x(base_x()) end,
	OnCommand=cmd(diffusealpha,1;sleep,0.05;diffusealpha,0;sleep,0.05;diffusealpha,1;sleep,0.05;diffusealpha,0;sleep,0.05;diffusealpha,1;sleep,0.05;diffusealpha,0;sleep,0.05;linear,0.05;diffusealpha,1);
	OffCommand=cmd(diffusealpha,1;sleep,0.05;diffusealpha,0;sleep,0.05;diffusealpha,1;sleep,0.05;diffusealpha,0;sleep,0.05;diffusealpha,1;sleep,0.05;diffusealpha,0;sleep,0.05);

	Def.ActorScroller{
		Name="ListScroller";
		SecondsPerItem=0.1;
		NumItemsToDraw=30;
		InitCommand=cmd(y,SCREEN_CENTER_Y-26);
		TransformFunction=function(self,offsetFromCenter,itemIndex,numItems)
			self:y( offsetFromCenter * 40 );
		end;
		children = RowList;
        ChangeRowMessageCommand=function(s,param)
            local screen = SCREENMAN:GetTopScreen{};
			if param.PlayerNumber == pn then
				s:SetDestinationItem(screen:GetCurrentRowIndex(param.PlayerNumber))
            end
		end
	};
	Def.ActorFrame{
		InitCommand=function(s) s:y(_screen.cy-150) end,
		LoadActor(Model().."header")..{
            InitCommand=function(s) s:zoom(0.5) end,
        };
		LoadActor(Language().."text");
	};
	Def.ActorFrame{
		InitCommand=cmd(y,SCREEN_CENTER_Y+215);
		LoadActor("exp.png");
		LoadFont("_avenirnext lt pro bold Bold 20px")..{
	    InitCommand=cmd(wrapwidthpixels,290;zoom,1);
		BeginCommand=function(s) s:queuecommand("Set") end,
	    SetCommand=function(self)
	      local screen = SCREENMAN:GetTopScreen();
	      if screen then
	        setting(self,screen);
	      end;
	    end;
	    [p"MenuLeft%MessageCommand"]=function(s) s:playcommand("Set") end,
	    [p"MenuRight%MessageCommand"]=function(s) s:playcommand("Set") end,
	    ChangeRowMessageCommand=function(s,param)
            if param.PlayerNumber == pn then s:playcommand "Set"; end;
        end;
	  };
	};
};

return t;
