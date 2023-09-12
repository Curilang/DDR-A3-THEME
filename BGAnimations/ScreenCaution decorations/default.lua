return Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=function(s) s:Center():zoom(0.667) end,
		Def.Quad{
			InitCommand=function(s) s:diffusealpha(0):setsize(900,385):diffuse(color("#dddfe0")) end,
			OnCommand=function(s) 
				s:zoomy(0):sleep(0.6):linear(0.1):zoomy(1):diffusealpha(1)
				s:linear(0.1):diffusealpha(0.75)
				s:linear(0.1):diffuse(color("0.25,0.25,0.35,0.25"))
				s:blend(Blend.Multiply):sleep(6.8)
				s:queuecommand("GoOff") 
			end,
			GoOffCommand=function(s) 
				s:linear(0.1):blend(Blend.Normal)
				s:zoomx(2):zoomy(0)
				s:diffuse(color("#dddfe0"))
				s:diffusealpha(1)
			end,
		},
		Def.Sprite{
			Texture=Language().."txt.png",
			InitCommand=function(s) s:diffusealpha(0) end,
			OnCommand=function(s) 
				s:zoomy(0):sleep(0.6):diffusealpha(1)
				s:linear(0.1):zoomy(1):sleep(7)
				s:linear(0.1):zoomx(1.5):zoomy(0):sleep(0):diffusealpha(0)
			end,
		},
		Def.ActorFrame{
			OnCommand=function(s) s:sleep(7):queuecommand("Stop") end,
			StopCommand=function(s) s:stoptweening():diffusealpha(0) end,
				LoadActor("header eff.png")..{
					InitCommand=function(s) s:y(-214):diffusealpha(0):zoomx(0.94) end,
					OnCommand=function(s) s:sleep(0.7):queuecommand("Anim") end,
					AnimCommand=function(s) 
						s:zoomy(1):sleep(0.2):linear(0.4):diffusealpha(1)
						s:linear(0.7):zoomy(1.3):diffusealpha(0)
						s:queuecommand("Anim") 
					end,
				},
				LoadActor("header eff.png")..{
					InitCommand=function(s) s:y(214):diffusealpha(0):zoomx(0.94) end,
					OnCommand=function(s) s:sleep(0.7):queuecommand("Anim") end,
					AnimCommand=function(s) 
						s:zoomy(-1):sleep(0.2):linear(0.4):diffusealpha(1)
						s:linear(0.7):zoomy(-1.3):diffusealpha(0)
						s:queuecommand("Anim") 
					end,
				},
		},
		LoadActor("footer.png")..{
			InitCommand=function(s) s:diffusealpha(0) end,
			OnCommand=function(s) 
				s:y(0):zoomx(2):sleep(0.5):diffusealpha(1)
				s:linear(0.1):zoomx(1):linear(0.1):y(214):sleep(7)
				s:linear(0.1):zoomx(2):y(0):sleep(0.05):diffusealpha(0)
			end,
		},
		Def.Sprite{
			Texture="header.png",
			InitCommand=function(s) s:diffusealpha(0) end,
			OnCommand=function(s) 
				s:y(0):zoomx(2):sleep(0.5):diffusealpha(1):linear(0.1):zoomx(1)
				s:linear(0.1):y(-214):sleep(7)
				s:linear(0.1):zoomx(2):y(0):sleep(0.05):diffusealpha(0) 
			end,
		},
	};
};