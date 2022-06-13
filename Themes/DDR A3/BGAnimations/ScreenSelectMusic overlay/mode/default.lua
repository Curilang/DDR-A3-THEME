local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;

return Def.ActorFrame {
	Def.Sprite{
		InitCommand=function(s) s:xy(SCREEN_LEFT+123,SCREEN_TOP+42):zoom(0.5) end,
		OnCommand=function(s) 
			s:Load(THEME:GetPathB("", "ScreenSelectMusic overlay/mode/"..GetCurrentModel().."/bg"));
			s:diffusealpha(0):sleep(0.3):linear(0.1):diffusealpha(1)
		end
	};
	Def.Sprite{
		InitCommand=function(s) s:xy(115,64) end,
		OnCommand=function(s) 
			if (GAMESTATE:GetNumPlayersEnabled() == 1 and GAMESTATE:GetNumSidesJoined() == 1) then
				s:Load(THEME:GetPathB("", "ScreenSelectMusic overlay/mode/"..GetCurrentModel().."/Style/SINGLE"))
			elseif (GAMESTATE:GetCurrentStyle():GetStyleType() == "StyleType_TwoPlayersTwoSides") then
				s:Load(THEME:GetPathB("", "ScreenSelectMusic overlay/mode/"..GetCurrentModel().."/Style/VERSUS"))
			elseif (GAMESTATE:GetCurrentStyle():GetStepsType() == 'StepsType_Dance_Double') then
				s:Load(THEME:GetPathB("", "ScreenSelectMusic overlay/mode/"..GetCurrentModel().."/Style/DOUBLE"))
			end
			s:zoomy(0):sleep(0.3):linear(0.1):zoomy(1)
		end
	};
	Def.Sprite{
		Texture=THEME:GetPathG("", "_shared/Style"),
		InitCommand=function(s) s:xy(157,61):zoom(0.55):pause():queuecommand("Set") end,
		SetCommand=function(self)
			if (GAMESTATE:GetNumPlayersEnabled() == 1 and GAMESTATE:GetNumSidesJoined() == 1) then
				self:setstate(0);
			elseif (GAMESTATE:GetCurrentStyle():GetStyleType() == "StyleType_TwoPlayersTwoSides") then
				self:setstate(1);
			elseif (GAMESTATE:GetCurrentStyle():GetStepsType() == 'StepsType_Dance_Double') then
				self:setstate(2);
			end;
		end;
		OnCommand=function(s) s:zoomy(0):sleep(0.3):linear(0.1):zoomy(0.55) end,
	};
	
	Def.Sprite{
		InitCommand=function(s) s:xy(96,30.5) end,
		OnCommand=function(self)
			if GAMESTATE:GetPlayMode() == 'PlayMode_Regular' then
				self:Load(THEME:GetPathB("", "ScreenSelectMusic overlay/mode/"..GetCurrentModel().."/Stage/"..ToEnumShortString(sStage)));
				self:diffusealpha(0):sleep(0.2):linear(0.2):diffusealpha(1);
			end;
		end;
	};
};
