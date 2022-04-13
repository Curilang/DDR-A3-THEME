return Def.ActorFrame{
	LoadActor(THEME:GetPathG("","ScrollBar TickThumb/scrollbar_pointer.png"))..{
	InitCommand=function (self)
			self:x(-8);
			self:zoom(1.6);
			self:rotationz(17);
		end;
	};
	LoadActor(THEME:GetPathG("","ScrollBar TickThumb/scrollbar_triangle.png"))..{
	InitCommand=function (self)
			self:x(4);
			self:y(3);
			self:zoom(1.8);
			self:rotationz(17);
		end;
	};
};

