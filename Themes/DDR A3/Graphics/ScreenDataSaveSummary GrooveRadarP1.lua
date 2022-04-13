local tt={};
--Get parameter
tt[1],tt[2],tt[3],tt[4],tt[5],tt[6],tt[7] = ...
local style = "S";
local past = "";

if tt[6]==1 then
	style = "S";
else
	style = "D";
end

if tt[7] ==1 then
	past = "P";
else
	past = "";
end

local function ReadOrCreateRadarValueForPlayer(PlayerUID, ValueTable)

	local RadarFile = RageFileUtil:CreateRageFile()
	-- Read RadarValue From File
	
	if RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..style.."1"..past..".txt",1) then --Stram--
		local str = RadarFile:Read();
		ValueTable[1] =tonumber(str);
	else
		RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..style.."1"..past..".txt",2);
		RadarFile:Write("0.0");
		ValueTable[1]=0;
	end
	
	if RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..style.."2"..past..".txt",1) then --Voltage--
		local str = RadarFile:Read();
		ValueTable[2] =tonumber(str);
	else
		RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..style.."2"..past..".txt",2);
		RadarFile:Write("0.0");
		ValueTable[2]=0;
	end
	
	if RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..style.."3"..past..".txt",1) then --Air--
		local str = RadarFile:Read();
		ValueTable[3] =tonumber(str);
	else
		RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..style.."3"..past..".txt",2);
		RadarFile:Write("0.0");
		ValueTable[3]=0;
	end

	if RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..style.."4"..past..".txt",1) then --Freeze--
		local str = RadarFile:Read();
		ValueTable[4] =tonumber(str);
	else
		RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..style.."4"..past..".txt",2);
		RadarFile:Write("0.0");
		ValueTable[4]=0;
	end

	if RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..style.."5"..past..".txt",1) then --Chaos--
		local str = RadarFile:Read();
		ValueTable[5] =tonumber(str);
	else
		RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..style.."5"..past..".txt",2);
		RadarFile:Write("0.0");
		ValueTable[5]=0;
	end	
		
	RadarFile:Close();
end

local function radarSet(self)

	self:SetFromValues(PLAYER_1,tt);
	self:visible(true);	
	
	if GAMESTATE:IsHumanPlayer(PLAYER_1) then
		self:visible(true);
		local PlayerUID = PROFILEMAN:GetProfile(PLAYER_1):GetGUID();  --取得uid
		ReadOrCreateRadarValueForPlayer(PlayerUID,tt);
		self:SetFromValues(PLAYER_1,tt);
	else
		self:visible(false);
	end
end



local t = Def.ActorFrame {

	Name="Radar",
	InitCommand=cmd(Center),

	Def.GrooveRadar {
		OnCommand=function(self, params)
			(cmd(zoom,0;sleep,0.583;decelerate,0.150;zoom,1.1))(self);
			self:queuecommand('UpdateInternal2');
		end;

		UpdateInternal2Command=function(self)
			radarSet(self);
		end;
		OffCommand=cmd(sleep,0.00;decelerate,0.167;zoom,0)
		
	},
	
	
}

return t