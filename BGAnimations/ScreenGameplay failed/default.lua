local loader
if IsGoldenLeague() then
	loader = "GoldenLeague"
else
	loader = "Normal"
end
local AnimationSleep = 0

return Def.ActorFrame{ 
	Def.ActorFrame{
		StartTransitioningCommand=function(s) s:sleep(AnimationSleep+0.035):queuecommand("Play") end,
		PlayCommand=function(s) 
			local sound = THEME:GetPathS("","DoorClose")
			SOUND:PlayOnce(StreamingSound(sound)) 
		end,
	};
	Def.ActorFrame{
		StartTransitioningCommand=function(s) s:sleep(AnimationSleep+0.035):queuecommand("Play") end,
		PlayCommand=function(s) 
			local sound = THEME:GetPathS("","DoorFailed")
			SOUND:PlayOnce(StreamingSound(sound)) 
		end,
	};
	LoadActor(loader); 
	
	Def.Sprite{
		Texture=THEME:GetPathG("","_shared/message/RED"),
		InitCommand=cmd(x,_screen.cx;y,_screen.cy;blend,Blend.Add);
		OnCommand=function(s) s:diffusealpha(0):zoom(1):sleep(AnimationSleep+0.035):linear(0.264):diffusealpha(1):zoom(0.667) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_shared/message/FAILED"),
		InitCommand=function(s) s:diffusealpha(0):Center() end,
		OnCommand=function(s) 
			s:sleep(AnimationSleep+0.035):diffusealpha(1):zoom(0)
			s:linear(0.1):zoom(0.418)
			s:linear(0.1):diffusealpha(1):zoomx(0.62):zoomy(0.64)
			s:linear(0.1):diffusealpha(1):zoomx(0.69):zoomy(0.71)
			s:linear(0.1):zoom(0.667)
		end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_shared/message/FAILED"),
		InitCommand=function(s) s:diffusealpha(0):Center() end,
		OnCommand=function(s) 
			s:sleep(AnimationSleep+0.035):diffusealpha(0):zoom(0)
			s:linear(0.1):zoom(1.2)
			s:linear(0.1):diffusealpha(0.5):zoomx(0.62):zoomy(0.64)
			s:linear(0.1):diffusealpha(0.5):zoomx(0.72):zoomy(0.74)
			s:linear(0.1):diffusealpha(0):zoom(0.92)
		end,
	};
};