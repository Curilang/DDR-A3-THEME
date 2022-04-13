return Def.BPMDisplay {
	File=THEME:GetPathF("BPMDisplay", "bpm");
	Name="BPMDisplay";
	SetCommand=function(self) 
		self:SetFromGameState() 
		if GAMESTATE:IsCourseMode() or GAMESTATE:IsExtraStage()==true or GAMESTATE:IsExtraStage2()==true then
		self:diffuse(color("#ffffff")); 
		else
		self:diffuse(color("#000000")); 
		end
		
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
};