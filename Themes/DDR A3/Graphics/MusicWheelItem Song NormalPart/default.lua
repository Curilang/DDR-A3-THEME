local GoldenLeagueSong = {
	--A20
	["Avenger"] = "league"; 								--1st 
	["New Era"] = "league";									--2nd
	["Give Me"] = "league";									--3rd
	["Ace out"] = "league"; 								--4th
	["The World Ends Now"] = "league";						--5th
	["Rampage Hero"] = "league";							--6th
	["ALPACORE"] = "league";								--7th
	["Starlight in the Snow"] = "league";					--8th
	["Glitch Angel"] = "league";							--9th
	["Golden Arrow"] = "league";							--10th
	["CyberConnect"] = "league";							--11th
	--A20 PLUS
	["DIGITALIZER"] = "league";								--1st
	["Draw the Savage"] = "league";							--2nd
	["MUTEKI BUFFALO"] = "league";							--3rd
	["Going Hypersonic"] = "league";						--4th
	["Lightspeed"] = "league";								--5th
	["Run The Show"] = "league";							--6th
	["Yuni's Nocturnal Days"] = "league";					--7th
	["Good Looking"] = "league";							--8th
	["Step This Way"] = "league";							--9th
	["Come Back To Me"] = "league";							--10th
	["actualization of self (weaponized)"] = "league";		--11th
	["Better Than Me"] = "league";							--12th
	["DDR TAGMIX -LAST DanceR-"] = "league";				--13th
	["THIS IS MY LAST RESORT"] = "league";					--14th
	--A3
	["STAY GOLD"] = "league";								--1st
	["Teleportation"] = "league";							--2nd
	["Environ [De-SYNC](feat.lythe)"] = "league";			--3rd
};

local grade = Def.ActorFrame{}
local cursor = Def.ActorFrame{};
local diff = Def.ActorFrame{};

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

if GAMESTATE:IsSideJoined(PLAYER_1) then 
	grade[#grade+1] = loadfile(THEME:GetPathG("MusicWheelItem","Song NormalPart/grade1.lua"))(PLAYER_1)..{
		InitCommand=function(s) s:xy(-5,3.4):zoomy(1.13) end,
	};
	diff[#diff+1] = loadfile(THEME:GetPathG("MusicWheelItem","Song NormalPart/diff1.lua"))(PLAYER_1)..{
		InitCommand=function(s) s:xy(-74,-36) end,
	};
	end;
if GAMESTATE:IsSideJoined(PLAYER_2) then
	grade[#grade+1] = loadfile(THEME:GetPathG("MusicWheelItem","Song NormalPart/grade2.lua"))(PLAYER_2)..{
		InitCommand=function(s) s:xy(-5,3.4):zoomy(1.13) end,
	};
	diff[#diff+1] = loadfile(THEME:GetPathG("MusicWheelItem","Song NormalPart/diff2.lua"))(PLAYER_2)..{
		InitCommand=function(s) s:xy(74,-36) end,
	};
end;

return Def.ActorFrame{
	SetMessageCommand=function(self, params)
		if params.Index ~= nil then
			local index = params.Index;

			if index%3 == 1 then
				self:x(-304):y(107);
			elseif index%3 == 2 then
				self:x(0):y(0);
			else
				self:x(304):y(-107);
			end
			self:zoom(params.HasFocus and 2 or 1.7);
		end
	end;
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