local t = Def.ActorFrame {};

function ReadAndWritePlayerOldData(PlayerUID, StyleEnumName)
	local RadarFile = RageFileUtil:CreateRageFile()
	local ValueTable= {};
	-- Read RadarValue From File
	
	if RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."1.txt",1) then --Stram--
		local str = RadarFile:Read();
		ValueTable[1] =tonumber(str);
	else
		RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."1.txt",2);
		RadarFile:Write("0.0");
		ValueTable[1]=0;
	end
	
	if RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."2.txt",1) then --Voltage--
		local str = RadarFile:Read();
		ValueTable[2] =tonumber(str);
	else
		RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."2.txt",2);
		RadarFile:Write("0.0");
		ValueTable[2]=0;
	end
	
	if RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."3.txt",1) then --Air--
		local str = RadarFile:Read();
		ValueTable[3] =tonumber(str);
		setenv(PlayerUID.."_"..StyleEnumName.."3P",str);
	else
		RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."3.txt",2);
		RadarFile:Write("0.0");
		ValueTable[3]=0;
	end

	if RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."4.txt",1) then --Freeze--
		local str = RadarFile:Read();
		ValueTable[4] =tonumber(str);
	else
		RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."4.txt",2);
		RadarFile:Write("0.0");
		ValueTable[4]=0;
	end

	if RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."5.txt",1) then --Chaos--
		local str = RadarFile:Read();
		ValueTable[5] =tonumber(str);
	else
		RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."5.txt",2);
		RadarFile:Write("0.0");
		ValueTable[5]=0;
	end	
	
	RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."1P.txt",2);
	RadarFile:Write(tostring(ValueTable[1]));
	RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."2P.txt",2);
	RadarFile:Write(tostring(ValueTable[2]));
	RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."3P.txt",2);
	RadarFile:Write(tostring(ValueTable[3]));
	RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."4P.txt",2);
	RadarFile:Write(tostring(ValueTable[4]));
	RadarFile:Open("Save/MyGrooveRadar/"..PlayerUID.."_"..StyleEnumName.."5P.txt",2);
	RadarFile:Write(tostring(ValueTable[5]));
		
	RadarFile:Close();
	
	
	
	local LV = 0;
	
	local DanceLVFile = RageFileUtil:CreateRageFile()
	if DanceLVFile:Open("Save/DanceLV/"..PlayerUID.."_"..StyleEnumName.."P.txt",1) then --LV--
		local str = DanceLVFile:Read();
		LV = tonumber(str);
		DanceLVFile:Close();
	else
		DanceLVFile:Open("Save/DanceLV/"..PlayerUID.."_"..StyleEnumName.."P.txt",2) 
		DanceLVFile:Write("0.0");
		DanceLVFile:Close();	
	end
	
	
	if DanceLVFile:Open("Save/DanceLV/"..PlayerUID.."_"..StyleEnumName.."P_Old.txt",2)  then --LV Old--
		DanceLVFile:Write(LV);
		DanceLVFile:Close();		
	end
	
	
	
	
end;


if GAMESTATE:IsPlayerEnabled(PLAYER_1) then --SaveRadarValue and SP DP LV Value
t[#t+1]=Def.Quad {
		InitCommand=cmd(Center;diffuse,color("1,1,1,0");zoomto,1,1);
		OnCommand=function(self)
			local PlayerUID = PROFILEMAN:GetProfile(PLAYER_1):GetGUID();
			
			ReadAndWritePlayerOldData(PlayerUID, "S");
			ReadAndWritePlayerOldData(PlayerUID, "D");
		end;
	};
end;

if GAMESTATE:IsPlayerEnabled(PLAYER_2) then --SaveRadarValue and SP DP LV Value
t[#t+1]=Def.Quad {
		InitCommand=cmd(Center;diffuse,color("1,1,1,0");zoomto,1,1);
		OnCommand=function(self)
			local PlayerUID = PROFILEMAN:GetProfile(PLAYER_2):GetGUID();
			
			ReadAndWritePlayerOldData(PlayerUID, "S");
			ReadAndWritePlayerOldData(PlayerUID, "D");
		end;
	};
end;



return t;