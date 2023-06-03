local t = Def.ActorFrame{};
local screenName = Var "LoadingScreen"

local disp_stage

if PREFSMAN:GetPreference("EventMode") then
	disp_stage = "EVENT";
	--Final
elseif GAMESTATE:GetCurrentStageIndex() == PREFSMAN:GetPreference("SongsPerPlay") then
	disp_stage = "FINAL";
	--Extra1
elseif GAMESTATE:GetCurrentStageIndex() == PREFSMAN:GetPreference("SongsPerPlay")+1 then
	disp_stage = "EXTRA";
	--Extra2
elseif GAMESTATE:GetCurrentStageIndex() == PREFSMAN:GetPreference("SongsPerPlay")+2 then
	disp_stage = "ENCORE";
else
	if GAMESTATE:GetCurrentStageIndex() == 1 then
		disp_stage = "FIRST";
	elseif GAMESTATE:GetCurrentStageIndex() == 2 then
		disp_stage = "SECOND";
	elseif GAMESTATE:GetCurrentStageIndex() == 3 then
		disp_stage = "THIRD";
	elseif GAMESTATE:GetCurrentStageIndex() == 4 then
		disp_stage = "FOURTH";
	end;
end;

local headerTextImage
if screenName == "ScreenSelectProfile" then
	headerTextImage = "LOGIN.png"
elseif screenName == "ScreenSelectStyle" then
	headerTextImage = "STYLE.png"
elseif screenName == "ScreenEvaluationNormal" then
	headerTextImage = disp_stage
elseif screenName == "ScreenEvaluationSummary" then
	headerTextImage = "TOTAL"
elseif screenName == "ScreenDataSaveSummary" then
	headerTextImage = "LOGOUT.png"
elseif screenName == "ScreenEditMenu" then
	headerTextImage = "EDIT.png"	
end

if headerTextImage then
	t[#t+1] = LoadActor(Model().."base")..{
		InitCommand=function(self)
			self:y(-9)
			self:zoom(0.667)
		end;
	};
	t[#t+1] = LoadActor(Model()..headerTextImage)..{
		InitCommand=function(self)
			self:y(-11)
			if disp_stage == "ENCORE" then
				self:setsize(270,27)
			else
				self:setsize(340,27)
			end
		end;
	};
end;

return t;
