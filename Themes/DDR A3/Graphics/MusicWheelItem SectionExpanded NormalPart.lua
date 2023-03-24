return Def.ActorFrame {
	SetMessageCommand=function(self,params) self:zoom(params.HasFocus and 2.2 or 1.8); end,
	Def.Sprite{
		Texture=THEME:GetPathG("","MusicWheelItem/"..Model().."selected"),
		InitCommand=function(s) s:y(2):zoom(0.91) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","MusicWheelItem/"..Model().."flash"),
		InitCommand=function(s) s:y(2) end,
		SetMessageCommand=function(s,params)
			s:zoomx(0.915):zoomy(0.76):diffusealpha(params.HasFocus and 1 or 0):diffuseramp():effectcolor1(color("1,1,1,0.2")):effectcolor2(color("1,1,1,1")):effectperiod(0.5)
		end;
	};
	LoadFont("_dfghsgothic-w9 20px")..{
		InitCommand=function(s) s:maxwidth(320):diffuse(Color.Black) end,
		SetCommand=function(self,params)
			self:stoptweening();
			if params.Text == '' then
				self:settext("RANDOM");
			elseif GAMESTATE:GetSortOrder() == 'SortOrder_Group' then
				self:settext(string.gsub(params.Text,"^%d%d? ?%- ?", ""));
			elseif GAMESTATE:GetSortOrder() == 'SortOrder_TopGrades' then
				self:settext(string.gsub(params.Text,"AAAA","AAA+"))
			else
				self:settext(SongAttributes.GetGroupName(params.Text));
			end
		end;
	  };
	Def.Sprite{ Texture=THEME:GetPathG("","_shared/"..Model().."cursor"),
		InitCommand=function(s) s:x(-287):zoom(0.85) end, 
		SetCommand=function(s,p) s:bounce():effectmagnitude(12,0,0):effectperiod(0.8)
			if p.Index ~= nil then
				s:visible(p.HasFocus);
			end
		end,
		StartSelectingStepsMessageCommand=function(s) s:diffusealpha(0) end,
	};
	Def.Sprite{ Texture=THEME:GetPathG("","_shared/"..Model().."cursor"),
		InitCommand=function(s) s:x(287):zoom(0.85):rotationy(180) end, 
		SetCommand=function(s,p) s:bounce():effectmagnitude(-12,0,0):effectperiod(0.8)
			if p.Index ~= nil then
				s:visible(p.HasFocus);
			end
		end,
		StartSelectingStepsMessageCommand=function(s) s:diffusealpha(0) end,
	};
};
