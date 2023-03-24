return Def.ActorFrame {
	Condition=not GAMESTATE:IsDemonstration(),
	Def.ActorFrame{
		InitCommand=function(s) s:Center() end,
		CurrentSongChangedMessageCommand=function(s) s:finishtweening():diffusealpha(0):sleep(BeginReadyDelay()):diffusealpha(1):queuecommand('Ready') end,
		ReadyCommand=function(s) s:sleep(SongMeasureSec()):queuecommand('GoIn') end,
		GoInCommand=function(s) s:sleep(SongMeasureSec()):queuecommand('GoOut') end,
	
		Def.ActorFrame {
			CurrentSongChangedMessageCommand=function(s) s:SetUpdateRate(1) end,
			ReadyCommand=function(s) s:SetUpdateRate(2/SongMeasureSec()) end,
			--Ready
			Def.ActorFrame {
				GoInCommand=function(s) s:linear(0.1):diffusealpha(0):zoomy(0) end,
				Def.Sprite {
					Texture=THEME:GetPathG("","_shared/message/BLUE"),
					InitCommand=function(s) s:blend(('BlendMode_Add')) end,
					ReadyCommand=function(s)
						s:diffusealpha(0):zoom(0)
						s:linear(0.1):diffusealpha(1):zoom(0.867)
						s:linear(0.1):diffusealpha(1):zoom(0.667)
					end,
				},
				Def.Sprite {
					Texture=THEME:GetPathG("","_shared/message/READY"),
					ReadyCommand=function(s) s:diffusealpha(1):zoom(0)
						s:linear(0.1):zoom(0.418)
						s:linear(0.1):diffusealpha(1):zoomx(0.62):zoomy(0.64)
						s:linear(0.1):diffusealpha(1):zoomx(0.69):zoomy(0.71)
						s:linear(0.1):zoom(0.667)
					end,
				},
				Def.Sprite {
					Texture=THEME:GetPathG("","_shared/message/READY"),
					InitCommand=function(s) s:blend(('BlendMode_Add')) end,
					ReadyCommand=function(s) 
						s:diffusealpha(0):zoom(0)
						s:linear(0.1):zoom(1.2)
						s:linear(0.1):diffusealpha(0.5):zoomx(0.62):zoomy(0.64)
						s:linear(0.1):diffusealpha(0.5):zoomx(0.72):zoomy(0.74)
						s:linear(0.1):diffusealpha(0):zoom(0.92)
					end,
				},
			},
			--Go
			Def.ActorFrame {
				GoOutCommand=function(s) s:linear(0.1):diffusealpha(0):zoomy(0) end,
				Def.Sprite {
					Texture=THEME:GetPathG("","_shared/message/YELLOW"),
					InitCommand=function(s) s:diffusealpha(0):blend(('BlendMode_Add')) end,
					GoInCommand=function(s)
						s:diffusealpha(0):zoom(0)
						s:linear(0.1):diffusealpha(1):zoom(0.867)
						s:linear(0.1):diffusealpha(1):zoom(0.667)
					end,
				},
				Def.Sprite {
					Texture=THEME:GetPathG("","_shared/message/GO"),
					InitCommand=function(s) s:diffusealpha(0) end,
					GoInCommand=function(s)
						s:diffusealpha(1):zoom(0)
						s:linear(0.1):zoom(0.418)
						s:linear(0.1):diffusealpha(1):zoomx(0.62):zoomy(0.64)
						s:linear(0.1):diffusealpha(1):zoomx(0.69):zoomy(0.71)
						s:linear(0.1):zoom(0.667)
					end,
				},
				Def.Sprite {
					Texture=THEME:GetPathG("","_shared/message/GO"),
					InitCommand=function(s) s:diffusealpha(0):blend(('BlendMode_Add')) end,
					GoInCommand=function(s) 
						s:diffusealpha(0):zoom(0)
						s:linear(0.1):zoom(1.2)
						s:linear(0.1):diffusealpha(0.5):zoomx(0.62):zoomy(0.64)
						s:linear(0.1):diffusealpha(0.5):zoomx(0.72):zoomy(0.74)
						s:linear(0.1):diffusealpha(0):zoom(0.92)
					end,
				},
			},
		},
	};
};	