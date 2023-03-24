local value = 235
return Def.ActorFrame {
	
	Def.ActorFrame{
		Name="Cursor",
		InitCommand=function(s) s:y(-8):zoom(1.65) end,
		SetMessageCommand=function(self,params)
			if params.Index ~= nil then
				local index = params.Index;
				if index%2 == 1 then
					self:x(value);
				elseif index%2 == 2 then
					self:x(-value);
				else
					self:x(-value);
				end
			end
		end;
		Def.Sprite{
			Texture=Model().."normal",
		};
		Def.Sprite{
			Texture=Model().."selected",
			SetMessageCommand=function(self,params)
				if params.HasFocus then
					self:zoom(1)
				else
					self:zoom(0)
				end
			end;
		};
	};
	Def.ActorFrame{
		Name="Highlights",
		InitCommand=function(s) s:zoom(1.62):xy(40,-8) end,
		SetMessageCommand=function(self, params)
			if params.Index ~= nil then
				self:visible( params.HasFocus );
				if params.Index ~= nil then
					local index = params.Index;
					if index%2 == 1 then
						self:x(value);
					elseif index%2 == 2 then
						self:x(-value);
					else
						self:x(-value);
					end
				end
			end
		end;
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
	LoadFont("_arial black 20px")..{
		InitCommand=cmd(y,0;zoom,1.5;maxwidth,240;diffuse,Color("White");uppercase,true);
		SetCommand=function(self,params)
			self:stoptweening();
			self:settextf("%s",params.Label);
			if params.Index ~= nil then
				local index = params.Index;
				if index%2 == 1 then
					self:x(value);
				elseif index%2 == 2 then
					self:x(-value);
				else
					self:x(-value);
				end
			end
			if params.HasFocus then
				self:diffuse(Color("Black"));
			else
				self:diffuse(Color("White"));
			end
		end;
	};
};