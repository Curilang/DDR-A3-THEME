local grade = Def.ActorFrame{}
local cursor = Def.ActorFrame{};
local diff = Def.ActorFrame{};
local top

local function quadButton(z)
	local t = Def.Quad{
		InitCommand= function(self) 
			self:z(z)
		end;
		MouseLeftClickMessageCommand = function(self)
			if isOver(self) then
				addPressedActors(self)
			end
		end;
		TopPressedCommand = function(self)
		end;
	}

	return t
end

local function GetExpandedSectionIndex()
	local mWheel = SCREENMAN:GetTopScreen():GetMusicWheel()
	local curSections = mWheel:GetCurrentSections()
	for i=1, #curSections do
		if curSections[i] == GAMESTATE:GetExpandedSectionName() then
			return i-1
		end
	end
end

function IndexStage(param)
	if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
		return param.Index ~= nil
	else
		return GetExpandedSectionIndex()
	end
end

function IndexStage2(param)
	if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
		return param.Index
	else
		return param.Index-GetExpandedSectionIndex()-1
	end
end


local function SetXYPosition(self, param)
	if IndexStage(param) then
		local index = IndexStage2(param)
		
		if index%3 == 0 then
			self:x(-304):y(107)
		elseif index%3 == 1 then
			self:x(0):y(0)
		else
			self:x(304):y(-107)
		end
	end
end

for i=1,2 do
	cursor[#cursor+1] = Def.Sprite{
		Texture=THEME:GetPathG("","_shared/"..Model().."cursor"),
		InitCommand=function(s) s:x(i==1 and -114 or 114):zoom(0.85):rotationy(i==2 and 180 or 0) end,
		SetMessageCommand=function(s,p)
			if p.Index then
				s:visible(p.HasFocus)
				if p.HasFocus then
					s:bounce():effectmagnitude(i==1 and 12 or -12,0,0):effectperiod(1)
				else
					s:stopeffect()
				end
			end
		end
	};
end

for i,pn in pairs(GAMESTATE:GetEnabledPlayers()) do 
	grade[#grade+1] = loadfile(THEME:GetPathG("MusicWheelItem","Song NormalPart/grade.lua"))(pn)..{
		InitCommand=function(s) s:xy(-5,3.4):zoomy(1.13) end,
	};
	diff[#diff+1] = loadfile(THEME:GetPathG("MusicWheelItem","Song NormalPart/diff.lua"))(pn)..{
		InitCommand=function(s) s:xy(pn == PLAYER_1 and -74 or 74,-36) end,
	};
end;


return Def.ActorFrame{
	OnCommand = function(self)
		top = SCREENMAN:GetTopScreen()
	end;
	SetMessageCommand=function(self,params)
		local index = params.Index
		
		if index ~= nil then
			SetXYPosition(self, params)
			self:zoom(params.HasFocus and 2 or 1.7);
			self:name(tostring(params.Index))
		end
	end;
	quadButton(1)..{
		InitCommand=function(s) s:visible(false) end,
		TopPressedCommand=function(self)
			local newIndex = tonumber(self:GetParent():GetName())
			local wheel = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
			local size = wheel:GetNumItems()
			local move = newIndex-wheel:GetCurrentIndex()

		if math.abs(move)>math.floor(size/2) then
			if newIndex > wheel:GetCurrentIndex() then
				move = (move)%size-size
			else
				move = (move)%size
			end
		end

		wheel:Move(move)
		wheel:Move(0)

		-- TODO: play sounds.
		if move == 0 and wheel:GetSelectedType() == 'WheelItemDataType_Section' then
			if wheel:GetSelectedSection() == curFolder then
				wheel:SetOpenSection("")
				curFolder = ""
			else
				wheel:SetOpenSection(wheel:GetSelectedSection())
				curFolder = wheel:GetSelectedSection()
			end
		end
	end,
	};
	Def.Sprite{
		Texture=Model().."card",
		InitCommand=function(s) s:zoom(0.94) end,
	};
	Def.Sprite{
		InitCommand=function(s) s:zoom(0.94) end,
		SetCommand=function(s,p)
			local song = p.Song;
			if song then
				local songtit = song:GetDisplayMainTitle();
				if GoldenLeagueSong[songtit] ~= nil then
					local GoldenLeagueSong = GoldenLeagueSong[songtit];
					s:Load(THEME:GetPathG("","MusicWheelItem Song NormalPart/"..GoldenLeagueSong));
				else
					s:Load(THEME:GetPathG("","_blank"));
				end
			end
		end,
	};
	Def.ActorFrame{
		Name="Highlights",
		InitCommand=function(s) s:x(-4) end,
		SetMessageCommand=function(self, params)
			if params.Index ~= nil then
				self:visible( params.HasFocus );
			end
		end;
		Def.Sprite{
			Texture=Model().."high",
			InitCommand=function(s) s:zoom(0.94):x(5)
				s:diffuseramp():effectcolor1(color("1,1,1,0.2")):effectcolor2(color("1,1,1,1")):effectperiod(0.5)
			end,
		};
		Def.ActorFrame{
			Name="cardcursor",
			InitCommand=function(s) s:diffuseramp():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,1")):effectperiod(0.5) end,
			Def.Sprite{
				Texture=Model().."line",
				InitCommand=function(s) s:zoom(0.94):x(5)
					s:thump(1):effectmagnitude(1.1,1,0):effectperiod(0.5) 
				end,
			};
		};
	};
	Def.Sprite{
		Texture=Model().."New",
		InitCommand=function(s) s:visible(false):xy(90,-67):halign(1,1):zoom(0.5) end,
		SetMessageCommand=function(s,p)
			local song = p.Song
			if song then
				s:visible(PROFILEMAN:IsSongNew(song))
			end
		end,
	};
	Def.ActorFrame{
		Def.Sprite{
			Name="Banner",
			InitCommand=function(s) s:xy(-2.5,-1.5) end,
			SetMessageCommand=function(s,p)
				local song = p.Song;
				if song then
					if (GAMESTATE:IsExtraStage()) and song:GetDisplayFullTitle() == "ENDYMION" then
						s:Load(THEME:GetPathG("","ENDYMION"))
					else
						s:Load(GetJacketPath(song))
					end
				end
				s:setsize(103,103)
			end,
		};
		
	};
	Def.ActorFrame{
		InitCommand=function(s) s:x(1):y(67) end,
		Def.BitmapText{
			Font="_helveticaneuelt w1g 75 bd 24px",
			InitCommand=function(s) s:zoom(0.6):maxwidth(260):diffuse(Color.White):strokecolor(color("0.15,0.15,0.0,0.9")) end,
			SetMessageCommand=function(self,params)
				local song = params.Song
				if song then
					self:settext(GetSongName(song))
				end
			end;
		};
	};
	Def.ActorFrame{
		Name="Clear Bases",
		Def.Sprite{
			Texture=THEME:GetPathG("MusicWheelItem Song","NormalPart/cleared"),
			InitCommand=function(s) s:xy(54.9,3) end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("MusicWheelItem Song","NormalPart/cleared"),
			InitCommand=function(s) s:xy(-60,3):zoomx(-1) end,
		};
		grade;
	};
	diff;
	cursor;
}