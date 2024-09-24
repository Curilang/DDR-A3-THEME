local grade = Def.ActorFrame{};
local cleared = Def.ActorFrame{};
local cursor = Def.ActorFrame{};
local diff = Def.ActorFrame{};

for i=1,2 do
	cursor[#cursor+1] = Def.Sprite{
		Texture=THEME:GetPathG("","_shared/"..Model().."cursor"),
		InitCommand=function(s) s:x(i==1 and -525 or 525):zoom(1.85):rotationy(i==2 and 180 or 0) end,
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

for i=1,2 do
	cleared[#cleared+1] = Def.Sprite{
		Texture=THEME:GetPathG("MusicWheelItem Song","NormalPart/cleared"),
		InitCommand=function(s) s:xy(i==1 and -462 or 458,-20):setsize(20,140) end,
	};
end

for i,pn in pairs(GAMESTATE:GetEnabledPlayers()) do 
	grade[#grade+1] = loadfile(THEME:GetPathG("MusicWheelItem","Course NormalPart/grade.lua"))(pn)..{
		InitCommand=function(s) s:xy(3,-20):zoom(1.65) end,
	};
	diff[#diff+1] = loadfile(THEME:GetPathG("MusicWheelItem","Course NormalPart/diff.lua"))(pn)..{
		InitCommand=function(s) s:xy(pn == PLAYER_1 and -485 or 485,-115):zoom(1.65) end,
	};
end;

return Def.ActorFrame{
	SetMessageCommand=function(self, params)
		if params.Index ~= nil then
			self:zoom( params.HasFocus and 1.15 or 1);
		end
	end;
	Def.Banner {
		Name="SongBanner";
		InitCommand=function(s) s:xy(-3,-23):scaletoclipped(889,172) end,
		SetMessageCommand=function(self,params)
			if params.Type == "Course" then
				self:LoadFromCourse(params.Course);
			end
		end;
	};
	Def.Sprite{
		Texture=Model().."card",
		InitCommand=function(s,p) s:zoom(1.65) end,
	};
	Def.ActorFrame{
		Name="Highlights",
		SetMessageCommand=function(self, params)
			if params.Index ~= nil then
				self:visible( params.HasFocus );
			end
		end;
		Def.Sprite{
			Texture=Model().."high",
			InitCommand=function(s) s:zoom(1.65)
				s:diffuseramp():effectcolor1(color("1,1,1,0.2")):effectcolor2(color("1,1,1,1")):effectperiod(0.5)
			end,
		};
		Def.ActorFrame{
			InitCommand=function(s) s:diffuseramp():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,1")):effectperiod(0.5) end,
			Def.Sprite{
				Texture=Model().."line",
				InitCommand=function(s) s:zoom(1.65)
					s:thump(1):effectmagnitude(1.1,1,0):effectperiod(0.5) 
				end,
			};
		};
	};
	Def.BitmapText{
		Font="_wheelnames 28px",
		InitCommand=function(s) s:y(103):zoom(1):maxwidth(260) end,
		SetMessageCommand=function(s,params)
			local course = params.Course
			if course then
				s:settext(course:GetDisplayFullTitle())
				s:strokecolor(color("0.15,0.15,0.0,0.9"))
			end
		end,
	};
	cleared;
	grade;
	diff;
	cursor;
};
