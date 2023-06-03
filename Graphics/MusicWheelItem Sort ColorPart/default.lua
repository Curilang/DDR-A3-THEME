local function SetIndex(self, param)
	if param.Index ~= nil then
		local index = param.Index
		if index%2 == 1 then
			self:x(235)
		elseif index%2 == 2 then
			self:x(-235)
		else
			self:x(-235)
		end
	end
end

return Def.ActorFrame{
	SetMessageCommand=function(self,params)
		local index = params.Index
		if index ~= nil then
			SetIndex(self, params)
		end
	end;
	Def.Sprite{
		InitCommand=function(s) s:y(-8):zoom(1.65) end,
		SetMessageCommand=function(s,p) 
			if p.HasFocus then
				s:Load(THEME:GetPathG("MusicWheelItem","Sort ColorPart/"..Model().."selected"))
			else
				s:Load(THEME:GetPathG("MusicWheelItem","Sort ColorPart/"..Model().."normal"))
			end
		end
	};
	Def.ActorFrame{
		SetMessageCommand=function(self,params)self:visible(params.HasFocus and true or false); end;
		InitCommand=function(s) s:zoom(1.62):y(-8) end,
		Def.Sprite{
			Texture=Model().."high",
			InitCommand=function(s) s:diffuseramp():effectcolor1(color("1,1,1,0.2")):effectcolor2(color("1,1,1,1")):effectperiod(0.5) end,
		};
		Def.ActorFrame{
			InitCommand=function(s) s:diffuseramp():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,1")):effectperiod(0.5) end,
			Def.Sprite{
				Texture=Model().."line",
				InitCommand=function(s) s:thump(1):effectmagnitude(1.1,1,0):effectperiod(0.5) end,
			};
		};
	};
	LoadFont("MusicWheelItem GroupNames")..{
		InitCommand=function(s) s:zoom(1.5):maxwidth(240):diffuse(Color("White")):uppercase(true) end,
		SetCommand=function(self,params)
			self:stoptweening();
			self:settextf("%s",params.Label);
			if params.HasFocus then
				self:diffuse(Color("Black"))
			else
				self:diffuse(Color("White"))
			end			
		end;
	};
	
};