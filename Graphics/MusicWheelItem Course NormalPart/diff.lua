local pn = ...
local t = Def.ActorFrame{};

local function setDiffBG1(self,param)
	local st = GAMESTATE:GetCurrentStyle():GetStepsType()
	if self.ParamCourse then
		local trail = GAMESTATE:GetCurrentTrail(pn)
		if trail then
			local diff = trail:GetDifficulty()
			local alltrails = self.ParamCourse:GetAllTrails()
			local temp=#alltrails;
			if alltrails[1] then
				for i=1,temp do 
					if alltrails[i]:GetDifficulty() == diff and st == alltrails[i]:GetStepsType() then
						targetindex = i;
						break;
					else
						targetindex = 0;
					end
					if i== temp then
						targetindex = 0;
					end
				end
			end
			if alltrails[1] and targetindex~=0  then
				self:diffuse(color("1,1,1,1"))
			else
				self:diffuse(color("1,1,1,0"))
			end;
		else
			self:diffuse(color("1,1,1,0"))
		end;
	end;
end;

local function setDiffBG2(self,param)
	local st = GAMESTATE:GetCurrentStyle():GetStepsType()
	if self.ParamCourse then
		local trail = GAMESTATE:GetCurrentTrail(pn)
		if trail then
			local diff = trail:GetDifficulty()
			local alltrails = self.ParamCourse:GetAllTrails()
			local temp=#alltrails;
			if alltrails[1] then
				for i=1,temp do 
					if alltrails[i]:GetDifficulty() == diff and st == alltrails[i]:GetStepsType() then
						targetindex = i;
						break;
					else
						targetindex = 0;
					end
					if i== temp then
						targetindex = 0;
					end
				end
			end
			if alltrails[1] and targetindex~=0  then
				self:diffuse(CustomDifficultyToColor(diff));
			else
				self:diffuse(color("1,1,1,0"))
			end;
		else
			self:diffuse(color("1,1,1,0"))
		end;
	end;
end;

local function setDiff(self,param)
	local st = GAMESTATE:GetCurrentStyle():GetStepsType()
	local targetindex = 1;
	if self.ParamCourse then
		local trail = GAMESTATE:GetCurrentTrail(pn)
		if trail then
			local diff = trail:GetDifficulty()
			local alltrails = self.ParamCourse:GetAllTrails()
			local temp=#alltrails;
			if alltrails[1] then
				for i=1,temp do 
					if alltrails[i]:GetDifficulty() == diff and st == alltrails[i]:GetStepsType() then
						targetindex = i;
						break;
					else
						targetindex = 0;
					end
					if i== temp then
						targetindex = 0;
					end
				end
			end
			if alltrails[1] and targetindex~=0  then
				if self:GetName() == diff then
					self:settext( alltrails[targetindex]:GetMeter() )
					self:visible(true)
					self:zoom(2)
				else
					self:visible(false)
				end;
			else
				self:settext("")
			end;
		else
			self:settext("")
		end;
	end;
end;



return Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(zoom,0.37);
		LoadActor(THEME:GetPathG("","_shared/"..Model().."hex"))..{
			InitCommand=cmd(draworder,0);
			SetCommand=function(self,param)
				self.ParamCourse = param.Course
				setDiffBG1(self)
			end;
			CurrentTrailP1ChangedMessageCommand=function(self) setDiffBG1(self) end;
			CurrentTrailP2ChangedMessageCommand=function(self) setDiffBG1(self) end;
			CurrentCourseChangedMessageCommand=function(self) setDiffBG1(self) end;
		};
		LoadActor(THEME:GetPathG("MusicWheelItem Song","NormalPart/line"))..{
			InitCommand=cmd(draworder,1);
			SetCommand=function(self,param)
				self.ParamCourse = param.Course
				setDiffBG2(self)
			end;
			CurrentTrailP1ChangedMessageCommand=function(self) setDiffBG2(self) end;
			CurrentTrailP2ChangedMessageCommand=function(self) setDiffBG2(self) end;
			CurrentCourseChangedMessageCommand=function(self) setDiffBG2(self) end;
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(x,-1;zoom,0.4;draworder,2);
		Def.BitmapText{
			InitCommand=cmd(diffuse,color("#FFFFFF");strokecolor,color("#000000"));
			Font="_impact 32px";
			Name = "Difficulty_Beginner";
			SetCommand=function(self,param)
				self.ParamCourse = param.Course
				setDiff(self)
			end;
			CurrentTrailP1ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentTrailP2ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentCourseChangedMessageCommand=function(self) setDiff(self) end;
		};
		Def.BitmapText{
			Font="_impact 32px";
			Name = "Difficulty_Easy";
			InitCommand=cmd(diffuse,color("#FFFFFF");strokecolor,color("#000000"));
			SetCommand=function(self,param)
				self.ParamCourse = param.Course
				setDiff(self)
			end;
			CurrentTrailP1ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentTrailP2ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentCourseChangedMessageCommand=function(self) setDiff(self) end;
		};
		Def.BitmapText{
			Font="_impact 32px";
			Name = "Difficulty_Medium";
			InitCommand=cmd(diffuse,color("#FFFFFF");strokecolor,color("#000000"));
			SetCommand=function(self,param)
				self.ParamCourse = param.Course
				setDiff(self)
			end;
			CurrentTrailP1ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentTrailP2ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentCourseChangedMessageCommand=function(self) setDiff(self) end;
		};
		Def.BitmapText{
			Font="_impact 32px";
			Name = "Difficulty_Hard";
			InitCommand=cmd(diffuse,color("#FFFFFF");strokecolor,color("#000000"));
			SetCommand=function(self,param)
				self.ParamCourse = param.Course
				setDiff(self)
			end;
			CurrentTrailP1ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentTrailP2ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentCourseChangedMessageCommand=function(self) setDiff(self) end;
		};
		Def.BitmapText{
			Font="_impact 32px";
			Name = "Difficulty_Challenge";
			InitCommand=cmd(diffuse,color("#FFFFFF");strokecolor,color("#000000"));
			SetCommand=function(self,param)
				self.ParamCourse = param.Course
				setDiff(self)
			end;
			CurrentTrailP1ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentTrailP2ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentCourseChangedMessageCommand=function(self) setDiff(self) end;
		};
		Def.BitmapText{
			Font="_impact 32px";
			Name = "Difficulty_Edit";
			InitCommand=cmd(diffuse,color("#FFFFFF");strokecolor,color("#000000"));
			SetCommand=function(self,param)
				self.ParamCourse = param.Course
				setDiff(self)
			end;
			CurrentTrailP1ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentTrailP2ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentCourseChangedMessageCommand=function(self) setDiff(self) end;
		};
		
	};
};
