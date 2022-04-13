return Def.ActorFrame {
	LoadFont("_itc avant garde std bk 20px") .. {
		Text="BPM";
		InitCommand=function(self) 
		--self:SetFromGameState() 
			if GAMESTATE:IsCourseMode() or GAMESTATE:IsExtraStage()==true or GAMESTATE:IsExtraStage2()==true then
			self:diffuse(color("#ffffff")); 
			else
			self:diffuse(color("#000000")); 
			end
		
		end;
	};
};