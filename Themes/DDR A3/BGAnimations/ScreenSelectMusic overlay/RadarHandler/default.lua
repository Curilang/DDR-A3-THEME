local pn = ({...})[1] --only argument to file
local GR = {
    {0,-80, "Stream"}, --STREAM
    {-82,-34, "Voltage"}, --VOLTAGE
    {-68,32, "Air"}, --AIR
    {68,32, "Freeze"}, --FREEZE
    {82,-34, "Chaos"}, --CHAOS
};

local label = Def.ActorFrame{};

for i,v in ipairs(GR) do
    label[#label+1] = Def.ActorFrame{
        OnCommand=function(s)
            s:xy(v[1],v[2])
            :diffusealpha(0):sleep(0.2):linear(0.1):diffusealpha(0.75):linear(0.1):diffusealpha(0):linear(0.1):diffusealpha(1)
        end;
        Def.ActorFrame{
            Def.Sprite{
				Texture=Model().."items",
				OnCommand=function(s) s:animate(0):setstate(i-1):y(2) end,
			};
        };
         Def.BitmapText{
            Font="_russell square 16px";
            InitCommand=function(s) s:strokecolor(color("#1f1f1f")):xy(18,22):halign(1) end,
            SetCommand=function(s)
                local song = GAMESTATE:GetCurrentSong();
                if GAMESTATE:GetCurrentSong() then
                    local steps = GAMESTATE:GetCurrentSteps(pn)
                    local st = GAMESTATE:GetCurrentStyle():GetStepsType()
                    local Value = ""
                    if DDR_groove_radar_values[st][song:GetDisplayMainTitle()] ~= nil then
                        local tablev = DDR_groove_radar_values[st][song:GetDisplayMainTitle()]
                        Value = tablev[ToEnumShortString(steps:GetDifficulty())][i]
                    else
                        Value = math.floor(steps:GetRadarValues(pn):GetValue('RadarCategory_'..v[3])*100)
                    end
                    s:settext(Value)
                else
                    s:settext("0")
                end
            end,
            CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
            ["CurrentSteps"..ToEnumShortString(pn).."ChangedMessageCommand"]=function(s) s:queuecommand("Set") end,
            ["CurrentTrail"..ToEnumShortString(pn).."ChangedMessageCommand"]=function(s) s:queuecommand("Set") end,
        };
    };
end

return Def.ActorFrame{
    OnCommand=function(s) s:diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
    Def.ActorFrame{
        LoadActor("circle")..{
            OnCommand=function(s) s:zoom(0):sleep(0.4):linear(0.3):zoom(1) end,
        };
		label;
		create_ddr_groove_radar("radar",0,0,pn,120,color("#ffcf00"),{color("#ffcf00"),color("#ffcf00"),color("#ffcf00"),color("#ffcf00"),color("#ffcf00")})..{
            OnCommand=function(s) s:diffusealpha(0.75):zoom(0):sleep(0.4):linear(0.3) end,
			SetCommand=function(s)
				if GAMESTATE:GetCurrentSong() then
					if DDR_groove_radar_values[GAMESTATE:GetCurrentStyle():GetStepsType()][GAMESTATE:GetCurrentSong():GetDisplayMainTitle()] ~= nil then
						s:zoom(1) 
					else
						s:zoom(0.5)
					end
				end
			end,
			CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
            ["CurrentSteps"..ToEnumShortString(pn).."ChangedMessageCommand"]=function(s) s:queuecommand("Set") end,
            ["CurrentTrail"..ToEnumShortString(pn).."ChangedMessageCommand"]=function(s) s:queuecommand("Set") end,
		};
    };
};