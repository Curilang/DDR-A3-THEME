local loader
if IsGoldenLeague() then
	loader = "GoldenLeague"
else
	loader = "Normal"
end

return Def.ActorFrame{ 
	LoadActor(loader);
	
	Def.Sprite{
		Texture=THEME:GetPathG("","_shared/message/RED"),
		InitCommand=function(s) s:Center():blend(Blend.Add):zoom(0.667) end,
		OnCommand=function(s) s:linear(0.1):zoomy(0)end,
	};
	Def.Sprite{	
		Texture=THEME:GetPathG("","_shared/message/FAILED"),
		InitCommand=function(s) s:Center():zoom(0.667) end,
		OnCommand=function(s) s:linear(0.09):zoomx(1):zoomy(0) end,
	};
};