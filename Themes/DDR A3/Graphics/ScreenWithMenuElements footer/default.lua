local t = Def.ActorFrame{};
local screenName = Var "LoadingScreen"

local footerTextImage
if screenName == "ScreenSelectMusic" then
	footerTextImage = Language().."selmus"
elseif screenName == "ScreenEvaluationNormal" then
	footerTextImage = Language().."eval"
elseif screenName == "ScreenEvaluationSummary" then
	footerTextImage = Language().."esum"
end

if footerTextImage then
	t[#t+1] = LoadActor(GetCurrentModel().."/base") .. {
		InitCommand=cmd(zoom,0.667;y,11);
	};
	t[#t+1] = LoadActor(GetCurrentModel().."/"..footerTextImage)..{
		InitCommand=cmd(zoom,0.667;xy,0.5,12);
	};
end

return t;