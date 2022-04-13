return Def.ActorFrame{
	PlayerJoinedMessageCommand=function(self,param)
		SCREENMAN:GetTopScreen():SetNextScreenName("ScreenSelectMusic"):StartTransitioningScreen("SM_GoToNextScreen")
  	end;
	loadfile(THEME:GetPathB("ScreenSelectMusic","decorations/InputHandler.lua"))();
	OffCommand=function(s)
		SOUND:PlayOnce(THEME:GetPathB("","_music_out"))
	end,
	StandardDecorationFromFileOptional("Footer","Footer");
}