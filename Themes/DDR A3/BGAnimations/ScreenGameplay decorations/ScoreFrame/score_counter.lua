local args = {...}
local player = args[1]
local short_plr = ToEnumShortString(player)

local rn_type = "RollingNumbers"
local data_source = "AScoring"

if IsEXScore() then
	rn_type = "RollingNumbersEXScore"
    data_source = "EXScore"
end

local metrics_prefix = "ScoreCustom"..short_plr
local loading_screen = Var "LoadingScreen"
local last_value = 0

return Def.ActorFrame{
	Def.RollingNumbers{
		Name="ScoreCounter"..short_plr,
		Font=THEME:GetPathF("ScreenGameplay","Score"),
		InitCommand=function(s) 
			s:Load(rn_type)
			s:xy(player==PLAYER_1 and (IsEXScore() and 69 or 7.5) or (IsEXScore() and 69 or 10 ),-7)
			s:zoomx(0.556):zoomy(0.29) 
		end,
		AfterStatsEngineMessageCommand=function(s,p)
			if p.Player == player then
				local value = p.Data[data_source].Score 
				if value~=last_value then 
					s:targetnumber(value) 
				last_value = value 
				end 
			end
		end
	},
	
};
