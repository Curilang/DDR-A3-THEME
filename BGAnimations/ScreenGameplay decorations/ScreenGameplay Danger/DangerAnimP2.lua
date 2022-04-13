local filter
if GAMESTATE:GetCurrentStyle():GetStepsType() == 'StepsType_Dance_Double' then
	filter = "dance_danger_filter0000_filter_double.png"
else
	filter = "dance_danger_filter0000_filter.png"
end;

local StyleX
if GAMESTATE:GetCurrentStyle():GetStepsType() == 'StepsType_Dance_Double' then
	StyleX = 270
else	
	StyleX = 142
end;

return Def.ActorFrame{
	Def.ActorFrame{
		Name="Danger";
		Def.ActorFrame{
			Name="Danger";
			HealthStateChangedMessageCommand=function(self, param)
				if param.PlayerNumber == PLAYER_2 then
					if param.HealthState == "HealthState_Danger" then
						self:RunCommandsOnChildren(cmd(playcommand,"Show"))
					else
						self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
					end
				end
			end;
			--BG
			LoadActor(filter)..{
				InitCommand=function(s) s:zoom(0.667):y(_screen.cy):blend('BlendMode_Add'):diffusealpha(0) end,
				ShowCommand=function(s) s:diffusealpha(0.5) end,
				HideCommand=function(s) s:diffusealpha(0) end,
			};
			--Left
			LoadActor("dance_danger0000_rope")..{
				InitCommand=function(s) s:x(-StyleX):y(_screen.cy):zoomx(0.6):zoomy(1):customtexturerect(0,0,1,2):texcoordvelocity(0,-0.5):diffusealpha(0) end,
				ShowCommand=function(s) s:diffusealpha(0.85) end,
				HideCommand=function(s) s:diffusealpha(0) end,
			};
			LoadActor("dance_danger0000_danger")..{
				InitCommand=function(s) s:x(-StyleX):y(_screen.cy+5):zoom(0.6):diffusealpha(0) end,
				ShowCommand=function(s) s:diffusealpha(1) end,
				HideCommand=function(s) s:diffusealpha(0) end,
			};
			LoadActor("dance_danger0000_danger")..{
				InitCommand=function(s) s:x(-StyleX):y(_screen.cy+5):zoom(0.6):diffusealpha(0):blend('BlendMode_Add'):heartbeat():effectmagnitude(1.1,1,0):effectperiod(0.7) end,
				ShowCommand=function(s) s:diffusealpha(0.4) end,
				HideCommand=function(s) s:diffusealpha(0) end,
			};
			--Right
			LoadActor("dance_danger0000_rope")..{
				InitCommand=function(s) s:x(StyleX):y(_screen.cy):zoomx(0.6):zoomy(1):customtexturerect(0,0,1,2):texcoordvelocity(0,-0.5):diffusealpha(0) end,
				ShowCommand=function(s) s:diffusealpha(0.85) end,
				HideCommand=function(s) s:diffusealpha(0) end,
			};
			LoadActor("dance_danger0000_danger")..{
				InitCommand=function(s) s:x(StyleX):y(_screen.cy+5):zoom(0.6):diffusealpha(0) end,
				ShowCommand=function(s) s:diffusealpha(1) end,
				HideCommand=function(s) s:diffusealpha(0) end,
			};
			LoadActor("dance_danger0000_danger")..{
				InitCommand=function(s) s:x(StyleX):y(_screen.cy+5):zoom(0.6):diffusealpha(0):blend('BlendMode_Add'):heartbeat():effectmagnitude(1.1,1,0):effectperiod(0.7) end,
				ShowCommand=function(s) s:diffusealpha(0.4) end,
				HideCommand=function(s) s:diffusealpha(0) end,
			};
		};
	};
};