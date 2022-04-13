--ReadPaneControl
function ReadOrCreatePaneControlForPlayerSide(PlayerUID)
	local PaneControlFile = RageFileUtil:CreateRageFile()
	local MyValue2 = "";
	if PaneControlFile:Open("Save/PaneControl/"..PlayerUID.."_PlayerSide.txt",1) then 
		MyValue2 = PaneControlFile:Read();
	else
		PaneControlFile:Open("Save/PaneControl/"..PlayerUID.."_PlayerSide.txt",2);
		PaneControlFile:Write("ClosePanes");
		MyValue2="";
	end
	PaneControlFile:Close();
	return MyValue2;
end


function ReadOrCreatePaneControlForAnotherSide(PlayerUID)
	local PaneControlFile = RageFileUtil:CreateRageFile()
	local MyValue2 = "";
	if PaneControlFile:Open("Save/PaneControl/"..PlayerUID.."_AnotherSide.txt",1) then 
		MyValue2 = PaneControlFile:Read();
		
	else
		PaneControlFile:Open("Save/PaneControl/"..PlayerUID.."_AnotherSide.txt",2);
		PaneControlFile:Write("ClosePanesA");
		MyValue2="";
	end
	PaneControlFile:Close();
	return MyValue2;
end

--SavePaneControl
function SavePaneControl( PlayerUID, MyValue, Mode)
	if Mode == "PlayerSide" then
		local PaneControlFile3 = RageFileUtil:CreateRageFile();
		PaneControlFile3:Open("Save/PaneControl/"..PlayerUID.."_PlayerSide.txt",2);
		PaneControlFile3:Write(tostring(MyValue));
		PaneControlFile3:Close();
	elseif Mode == "AnotherSide" then
		local PaneControlFile4 = RageFileUtil:CreateRageFile();
		PaneControlFile4:Open("Save/PaneControl/"..PlayerUID.."_AnotherSide.txt",2);
		PaneControlFile4:Write(tostring(MyValue));
		PaneControlFile4:Close();
		
	end
end;
----------------------------------------------------------------------------



local diff = Def.ActorFrame{};
local score = Def.ActorFrame{};
local detail = Def.ActorFrame{};
local score = Def.ActorFrame{}
local Radar = Def.ActorFrame{};
local NoPane = Def.ActorFrame{};
local Shock = Def.ActorFrame{};

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	diff[#diff+1] = loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/Difficulty"))(pn)..{
		InitCommand=function(s) s:xy(pn==PLAYER_1 and SCREEN_LEFT+94 or SCREEN_RIGHT-94,_screen.cy-97):zoom(0.667) end,
	};
	Radar[#Radar+1] = loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/RadarHandler"))(pn)..{
		InitCommand=function(s) s:xy(pn==PLAYER_1 and SCREEN_LEFT+86 or SCREEN_RIGHT-86,_screen.cy+24):zoom(0.667) end,
	}
	score[#score+1] = loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/Scores/default.lua"))(pn)..{
		InitCommand=function(s) s:xy(pn==PLAYER_1 and SCREEN_LEFT+114 or SCREEN_RIGHT-114,_screen.cy+53):zoom(0.667) end,
		OnCommand=function(s)
			if GAMESTATE:IsPlayerEnabled(pn) then
				local PlayerUID = PROFILEMAN:GetProfile(pn):GetGUID();
				if ReadOrCreatePaneControlForPlayerSide(PlayerUID)=="OpenPanes3" then
					s:addx(pn==PLAYER_1 and -500 or 500):sleep(0.5):decelerate(0.5):addx(pn==PLAYER_1 and 500 or -500)
					s:linear(0.5);
					s:diffusealpha(1);
				elseif ReadOrCreatePaneControlForPlayerSide(PlayerUID)=="OpenPanes1" or ReadOrCreatePaneControlForPlayerSide(PlayerUID)=="ClosePanes" then
					s:diffusealpha(0);
				end;
			end;
		end,
		CodeMessageCommand=function(self,params)
			local player = params.PlayerNumber
			if player == pn then
				if params.Name=="OpenPanes3"then
					self:linear(0.15);
					self:diffusealpha(1);
				elseif params.Name=="ClosePanes" or params.Name=="OpenPanes1" then
					self:linear(0.15);
					self:diffusealpha(0);
				end;
			end
			local style = GAMESTATE:GetCurrentStyle():GetStyleType()
			local PlayerUID = PROFILEMAN:GetProfile(player):GetGUID();
			if player==pn then
				if params.Name=="OpenPanes1" then
					SavePaneControl( PlayerUID, params.Name, "PlayerSide");
				elseif params.Name=="OpenPanes3"then
					SavePaneControl( PlayerUID, params.Name, "PlayerSide");
				elseif params.Name=="ClosePanes" 
				then
					SavePaneControl( PlayerUID, params.Name, "PlayerSide");
				end;
			end;
		end,
		CurrentSongChangedMessageCommand=function(s)
			if GAMESTATE:GetCurrentSong() then
				s:visible(true)
			else
				s:visible(false)
			end
		end,
	};
	NoPane[#NoPane+1] = loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/NoPane/default.lua"))(pn)..{
		InitCommand=function(s)
			s:xy(pn==PLAYER_1 and SCREEN_LEFT+73 or SCREEN_RIGHT-73,_screen.cy+167):zoom(0.533) end,
		OnCommand=function(s)
			if GAMESTATE:IsPlayerEnabled(pn) then
				local PlayerUID = PROFILEMAN:GetProfile(pn):GetGUID();
				if ReadOrCreatePaneControlForPlayerSide(PlayerUID)=="ClosePanes" then
					s:addx(pn==PLAYER_1 and -500 or 500):sleep(0.5):decelerate(0.5):addx(pn==PLAYER_1 and 500 or -500)
					s:linear(0.5);
					s:diffusealpha(1);
				elseif ReadOrCreatePaneControlForPlayerSide(PlayerUID)=="OpenPanes1" or ReadOrCreatePaneControlForPlayerSide(PlayerUID)=="OpenPanes3" then
					s:diffusealpha(0);
				end;
			end;
		end,
		CodeMessageCommand=function(self,params)
			local player = params.PlayerNumber
			if player == pn then
				if params.Name=="ClosePanes"then
					self:linear(0.15);
					self:diffusealpha(1);
				elseif params.Name=="OpenPanes3" or params.Name=="OpenPanes1" then
					self:linear(0.15);
					self:diffusealpha(0);
				end;
			end
			local style = GAMESTATE:GetCurrentStyle():GetStyleType()
			local PlayerUID = PROFILEMAN:GetProfile(player):GetGUID();
			if player==pn then
				if params.Name=="OpenPanes1" then
					SavePaneControl( PlayerUID, params.Name, "PlayerSide");
				elseif params.Name=="OpenPanes3"then
					SavePaneControl( PlayerUID, params.Name, "PlayerSide");
				elseif params.Name=="ClosePanes" then
					SavePaneControl( PlayerUID, params.Name, "PlayerSide");
				end;
			end;
		end,
	};
	detail[#detail+1] = loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/detail/default.lua"))(pn)..{
		InitCommand=function(s)
			s:xy(pn==PLAYER_1 and SCREEN_LEFT+107 or SCREEN_RIGHT-107,_screen.cy+153):zoom(0.667)
		end,
		OnCommand=function(s)
			if GAMESTATE:IsPlayerEnabled(pn) then
				local PlayerUID = PROFILEMAN:GetProfile(pn):GetGUID();
				if ReadOrCreatePaneControlForPlayerSide(PlayerUID)=="OpenPanes1" then
					s:addx(pn==PLAYER_1 and -500 or 500):sleep(0.5):decelerate(0.5):addx(pn==PLAYER_1 and 500 or -500)
					s:linear(0.5);
					s:diffusealpha(1);
				elseif ReadOrCreatePaneControlForPlayerSide(PlayerUID)=="OpenPanes3" or ReadOrCreatePaneControlForPlayerSide(PlayerUID)=="ClosePanes" then
					s:diffusealpha(0);
				elseif ReadOrCreatePaneControlForPlayerSide(PlayerUID)=="OpenPanes2" then
					if GAMESTATE:IsCourseMode() == false then
						s:diffusealpha(0);
					end
				end;
			end;
		end,
		CodeMessageCommand=function(self,params)
			local player = params.PlayerNumber
			if player == pn then
				if params.Name=="OpenPanes1"then
					self:linear(0.15);
					self:diffusealpha(1);
				elseif params.Name=="ClosePanes" or params.Name=="OpenPanes3" or params.Name=="OpenPanes2" then
					self:linear(0.15);
					self:diffusealpha(0);
				elseif  params.Name=="OpenPanes2" then
					if GAMESTATE:IsCourseMode() == false then
						self:linear(0.15);
						self:diffusealpha(0);
					end
				end;
			end
			local style = GAMESTATE:GetCurrentStyle():GetStyleType()
			local PlayerUID = PROFILEMAN:GetProfile(player):GetGUID();
			if player==pn then
				if params.Name=="OpenPanes1" then
					SavePaneControl( PlayerUID, params.Name, "PlayerSide");
				elseif params.Name=="OpenPanes2"then
					SavePaneControl( PlayerUID, params.Name, "PlayerSide");
				elseif params.Name=="OpenPanes3"then
					SavePaneControl( PlayerUID, params.Name, "PlayerSide");
				elseif params.Name=="ClosePanes" 
				then
					SavePaneControl( PlayerUID, params.Name, "PlayerSide");
				end;
			end;
		end,
		CurrentSongChangedMessageCommand=function(s)
			if GAMESTATE:GetCurrentSong() then
				s:visible(true)
			else
				s:visible(false)
			end
		end,
	};
	Shock[#Shock+1] = loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/ShockArrows/default.lua"))(pn)..{
		InitCommand=function(s) s:xy(pn==PLAYER_1 and SCREEN_LEFT+86 or SCREEN_RIGHT-86,_screen.cy+36):zoom(0.667) end,
	};
end

local TwoPart = Def.ActorFrame{
	StartSelectingStepsMessageCommand=function(s) s:AddChildFromPath(THEME:GetPathB("ScreenSelectMusic","overlay/TwoPartDiff")) end,
	SongUnchosenMessageCommand=function(s) 
		s:sleep(0.2):queuecommand("Remove")
	end,
	RemoveCommand=function(s) s:RemoveChild("TwoPartDiff") end,
};

return Def.ActorFrame{
	OffCommand=function(s) s:finishtweening() end,
	TwoPart;
	loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/Info"))()..{
		OnCommand=function(s) s:zoom(0.667):y(57):diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
	};
	loadfile(THEME:GetPathB("ScreenSelectMusic","overlay/mode"))()..{
		OnCommand=function(s) s:zoom(0.667):diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
	};
	diff;
	detail;
	score;
	Radar;
	NoPane;
	Shock;
}