local AnimationSleep = 1.35

local loader
if IsGoldenLeague() then
	loader = "GoldenLeague"
else
	loader = "Normal"
end

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
		PlayCommand=function(s) SOUND:PlayAnnouncer("stage sound X");
								SOUND:PlayAnnouncer("stage sound SN");
								SOUND:PlayAnnouncer("stage cleared");
		end,
	};
	LoadActor(loader); 
	Def.Quad{
		InitCommand=function(s) s:diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep+2.3) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_shared/message/BLUE"),
		InitCommand=function(s) s:Center():blend(('BlendMode_Add')) end,
		OnCommand=function(s) s:diffusealpha(0):zoom(1):sleep(AnimationSleep+0.035):linear(0.264):diffusealpha(1):zoom(0.667) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_shared/message/"..ClearedToLoad()),
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
		Texture=THEME:GetPathG("","_shared/message/"..ClearedToLoad()),
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