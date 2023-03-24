local pn = ({...})[1] --only argument to file
local GR = {
    {0,-80, "Stream"}, --STREAM
    {-82,-34, "Voltage"}, --VOLTAGE
    {-68,32, "Air"}, --AIR
    {68,32, "Freeze"}, --FREEZE
    {82,-34, "Chaos"}, --CHAOS
};

local t = Def.ActorFrame{};

for i,v in ipairs(GR) do
    t[#t+1] = Def.ActorFrame{
        OnCommand=function(s)
            s:xy(v[1],v[2])
            :diffusealpha(0):sleep(0.2):linear(0.1):diffusealpha(0.75):linear(0.1):diffusealpha(0):linear(0.1):diffusealpha(1)
        end;
        Def.Sprite{
			Texture=Model().."items",
			OnCommand=function(s) s:animate(0):setstate(i-1):y(2) end,
		};
        Def.BitmapText{
            Font="GrooveRadar numbers";
            InitCommand=function(s) s:xy(18,22):halign(1) end,
			SetCommand=function(s)
                local song = GAMESTATE:GetCurrentSong();
                    if song then
                        local steps = GAMESTATE:GetCurrentSteps(pn)
                        local value = lookup_ddr_radar_values(song, steps, pn)[i]
                        s:settext(math.floor(value*100+0.5))
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
	LoadActor("circle")..{
		OnCommand=function(s) s:zoom(0):sleep(0.4):linear(0.3):zoom(1) end,
	};
	t;
    create_ddr_groove_radar("radar",0,0,pn,120,color("#ffcf00"),{color("#ffcf00"),color("#ffcf00"),color("#ffcf00"),color("#ffcf00"),color("#ffcf00")}, "accelerate", 0.133)..{
		OnCommand=function(s) s:diffusealpha(0.75):zoom(0):sleep(0.4):linear(0.3):zoom(1) end,
	};
};
