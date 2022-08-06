return Def.ActorFrame {
	SetMessageCommand=function(self,params)
		if params.HasFocus then
			self:zoom(2.2);
		else
			self:zoom(1.8);
		end
	end;
	Def.Sprite{
		Texture=THEME:GetPathG("","MusicWheelItem/"..Model().."normal"),
		InitCommand=function(s) s:y(2):zoom(0.91) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","MusicWheelItem/"..Model().."flash"),
		InitCommand=function(s) s:y(2) end,
		SetMessageCommand=function(s,params)
			if params.HasFocus then
				s:zoomx(0.915):zoomy(0.76)
				s:diffuseramp():effectcolor1(color("1,1,1,0.2")):effectcolor2(color("1,1,1,1")):effectperiod(0.5)
			else
				s:zoom(0)
			end
		end;
	};
	LoadFont("_dfghsgothic-w9 20px")..{
		InitCommand=cmd(y,0;maxwidth,320);
		SetMessageCommand=function(self, params)
			local group = params.Text;
			  self:settext(SongAttributes.GetGroupName(group));
		end;
	  };
	  LoadActor(THEME:GetPathG("","_shared/"..Model().."cursor"))..{
			InitCommand=cmd(x,-287);
			SetCommand=function(self,params)
				(cmd(bounce;effectmagnitude,12,0,0;effectperiod,0.8))(self);
				if params.HasFocus then
					self:zoom(0.85);
				else
					self:zoom(0);
				end
			end;
			OffCommand=cmd();
			StartSelectingStepsMessageCommand=cmd(diffusealpha,0);
		};
		LoadActor(THEME:GetPathG("","_shared/"..Model().."cursor"))..{
			InitCommand=cmd(x,287);
			SetCommand=function(self,params)
				(cmd(bounce;effectmagnitude,-12,0,0;effectperiod,0.8))(self);
				if params.HasFocus then
					self:zoomx(-0.85);
					self:zoomy(0.85);
				else
					self:zoom(0);
				end
			end;
			OffCommand=cmd();
			StartSelectingStepsMessageCommand=cmd(diffusealpha,0);
		};
};
