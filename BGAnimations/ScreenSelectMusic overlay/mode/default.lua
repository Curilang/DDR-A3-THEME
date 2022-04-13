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
		InitCommand=function(s) s:xy(SCREEN_LEFT+126,SCREEN_TOP+42):zoom(0.5) end,
		OnCommand=function(s) 
			s:Load(THEME:GetPathB("", "ScreenSelectMusic overlay/mode/"..GetCurrentModel().."/bg"));
			s:diffusealpha(0):sleep(0.3):linear(0.1):diffusealpha(1)
		end
	};
	Def.Sprite{
		InitCommand=function(s) s:xy(118,64) end,
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
		InitCommand=function(s) s:xy(99,30.5) end,
		OnCommand=function(self)
			if GAMESTATE:GetPlayMode() == 'PlayMode_Regular' then
				self:Load(THEME:GetPathB("", "ScreenSelectMusic overlay/mode/"..GetCurrentModel().."/Stage/"..ToEnumShortString(sStage)));
				self:diffusealpha(0):sleep(0.2):linear(0.2):diffusealpha(1);
			end;
		end;
	};
	-- LoadActor( "stageeffect01" )..{
		-- InitCommand=cmd(x,SCREEN_LEFT+123;y,SCREEN_TOP+77;zoom,14;);
		-- OnCommand=cmd(zoomy,0;linear,0.1;zoomy,1.5;customtexturerect,0,0,20,1;texcoordvelocity,5,0);
		-- OffCommand=cmd(linear,0.1;zoomy,1.5);
		
	-- };
	-- LoadActor( "stageeffect02" )..{
		-- InitCommand=cmd(x,SCREEN_LEFT+113;y,SCREEN_TOP+79;zoom,14;);
		-- OnCommand=cmd(zoomy,0;linear,0.1;zoomy,1.5;customtexturerect,0,0,10,1;texcoordvelocity,-1,0;playcommand,"Animate");
		-- OffCommand=cmd(stopeffect;stoptweening;linear,0.1;zoomy,1.5);
		-- AnimateCommand=cmd(linear,0.3;addx,20;linear,1.5;addx,-20;linear,0.6;addx,5;linear,1.3;addx,-5;linear,0.6;addx,15;linear,0.5;addx,-15;queuecommand,"Animate");
	-- };
};
