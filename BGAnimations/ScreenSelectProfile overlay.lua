--[[
This script was taken from KENp's DDR X2 theme
and was recoded by FlameyBoy and Inorizushi
]]--

local ProfileInfoCache = {}
setmetatable(ProfileInfoCache, {__index =
function(table, ind)
    local out = {}
    local prof = PROFILEMAN:GetLocalProfileFromIndex(ind-1)
    out.DisplayName = prof:GetDisplayName()
    out.UserTable = prof:GetUserTable()
    rawset(table, ind, out)
    return out
end
})

local function LoadCard(cColor,cColor2,Player,IsJoinFrame)
	local t = Def.ActorFrame {
		
		Def.ActorFrame{
		--Background Stuff
			InitCommand=function(s) s:zoomy(0) end,
			OnCommand=function(s) s:linear(0.3):zoomy(1) end,
			OffCommand=function(s) 
				local slp if IsJoinFrame then slp = 0.1 else slp = 0.3 end 
				s:sleep(slp):linear(0.1):zoomy(0) 
			end,
			LoadActor(THEME:GetPathG("","ScreenSelectProfile/BG01"));
			LoadActor(THEME:GetPathG("","ScreenSelectProfile/BG02"))..{
				InitCommand=function(s) s:y(-10):zoomy(1.1) end,
			};
		};
		LoadActor(THEME:GetPathG("","_shared/stars"))..{
			InitCommand=function(s) s:diffusealpha(0):y(-55) end,
			OnCommand=function(s) 
				local difu if IsJoinFrame then difu = 0 else difu = 1 end
				s:sleep(0.87):diffusealpha(difu):linear(0.18):y(-17) 
			end,
			OffCommand=function(s) s:diffusealpha(0) end,
		};
		Def.ActorFrame{
		--Player decoration
			InitCommand=function(s) s:zoom(1.08):diffusealpha(0) end,
			OnCommand=function(s)
				local difu if IsJoinFrame then difu = 0 else difu = 1 end
				s:sleep(0.7):linear(0.18):diffusealpha(difu):zoom(1) 
			end,
			OffCommand=function(s) s:diffusealpha(0) end,
			LoadActor( THEME:GetPathG("","ScreenSelectProfile/"..Model().."profile") )..{
				InitCommand=function(s) s:y(-76) end,
			};
			LoadActor( THEME:GetPathG("","ScreenSelectProfile/"..Model()..Language().."dan") )..{
				InitCommand=function(s) s:y(50) end,
			};
			LoadActor( THEME:GetPathG("","ScreenSelectProfile/"..Model().."league") )..{
				InitCommand=function(s) s:y(154) end,
			};
		};
		Def.ActorFrame{
		--Player text
			OnCommand=function(s)
				local difu if IsJoinFrame then difu = 0 else difu = 1 end
				s:diffusealpha(0):sleep(0.87):linear(0.3):diffusealpha(difu)
			end,
			OffCommand=function(s) s:diffusealpha(0) end,
			Def.ActorFrame{
				InitCommand=function(s) s:y(60) end,
				Def.Sprite{ Texture=THEME:GetPathG("","ScreenSelectProfile/"..Language().."dan"),
					InitCommand=function(s) s:x(-56):animate(0) 
							if DanCourse() == "None"   then s:setstate(0)
						elseif DanCourse() == "Dan 01" then s:setstate(1)
						elseif DanCourse() == "Dan 02" then s:setstate(2)
						elseif DanCourse() == "Dan 03" then s:setstate(3)
						elseif DanCourse() == "Dan 04" then s:setstate(4)
						elseif DanCourse() == "Dan 05" then s:setstate(5)
						elseif DanCourse() == "Dan 06" then s:setstate(6)
						elseif DanCourse() == "Dan 07" then s:setstate(7)
						elseif DanCourse() == "Dan 08" then s:setstate(8)
						elseif DanCourse() == "Dan 09" then s:setstate(9)
						elseif DanCourse() == "Dan 10" then s:setstate(10)
						elseif DanCourse() == "Kaiden" then s:setstate(11)
						end
					end,
				};
				Def.Sprite{ Texture=THEME:GetPathG("","ScreenSelectProfile/"..Language().."dan"),
					InitCommand=function(s) s:x(136):animate(0) 
							if DanCourse() == "None"   then s:setstate(0)
						elseif DanCourse() == "Dan 01" then s:setstate(1)
						elseif DanCourse() == "Dan 02" then s:setstate(2)
						elseif DanCourse() == "Dan 03" then s:setstate(3)
						elseif DanCourse() == "Dan 04" then s:setstate(4)
						elseif DanCourse() == "Dan 05" then s:setstate(5)
						elseif DanCourse() == "Dan 06" then s:setstate(6)
						elseif DanCourse() == "Dan 07" then s:setstate(7)
						elseif DanCourse() == "Dan 08" then s:setstate(8)
						elseif DanCourse() == "Dan 09" then s:setstate(9)
						elseif DanCourse() == "Dan 10" then s:setstate(10)
						elseif DanCourse() == "Kaiden" then s:setstate(11)
						end
					end,
				};
			};
			Def.Sprite{ Texture=THEME:GetPathG("","ScreenSelectProfile/league"),
				InitCommand=function(s) s:xy(90,154):animate(0)
						if GoldenLeague() == "Bronze"   then s:setstate(1)
					elseif GoldenLeague() == "Silver" 	then s:setstate(2)
					elseif GoldenLeague() == "Gold" 	then s:setstate(3)
					else								     s:setstate(0)
					end
				end
			};
		};
		Def.ActorFrame{
			OnCommand=cmd(y,0;linear,0.3;y,-238;);
			OffCommand=function(s) 
				local slp if IsJoinFrame then slp = 0.1 else slp = 0.3 end 
				s:sleep(slp):linear(0.1):y(0):sleep(0):diffusealpha(0)
			end,
			LoadActor(THEME:GetPathG("","ScreenSelectProfile/"..Model().."upper"))..{
				InitCommand=function(s) s:valign(1):y(1) end,				
			};
			Def.Sprite{
				InitCommand=function(s) s:y(-27)
					if Player == PLAYER_1 then
						s:Load(THEME:GetPathG("","ScreenSelectProfile/P1"))
					else
						s:Load(THEME:GetPathG("","ScreenSelectProfile/P2"))
					end
				end,
			};
		};
		Def.ActorFrame{
			OnCommand=function(s) s:linear(0.3):y(224) end,
			OffCommand=function(s) 
				local slp if IsJoinFrame then slp = 0.1 else slp = 0.3 end 
				s:sleep(slp):linear(0.1):y(0):sleep(0):diffusealpha(0)
			end,
			LoadActor(THEME:GetPathG("","ScreenSelectProfile/"..Model().."bottom"))..{
				InitCommand=function(s) s:valign(0):y(-6) end,
			};
		};
};

	return t
end

function LoadPlayerStuff(pn)
	local t = Def.ActorFrame {
		--No Player yet
		Def.ActorFrame {
			Condition=not IsDataSaveSummary();
			Name = 'JoinFrame';
			LoadCard(Color('Outline'),color('0,0,0,0'),pn,true);
			LoadActor( THEME:GetPathG("","ScreenSelectProfile/"..Model().."press") ) .. {
				InitCommand=cmd(zoomy,0;diffuseshift;effectcolor1,Color('White');effectcolor2,color("#A5A6A5"));
				OnCommand=cmd(x,0;y,-15;sleep,0.5;linear,0.1;zoomx,1;zoomy,1);
				OffCommand=function(s) s:linear(0.1):zoomy(0):diffusealpha(0) end,
			};
		};
		--Player
		Def.ActorFrame {
			Name = 'BigFrame';
			LoadCard(PlayerColor(),color('1,1,1,1'),pn,false);
			Def.Sprite{
				InitCommand=function(s) s:y(-165) 
					if IsDataSaveSummary() then 
						s:Load(THEME:GetPathG("","ScreenSelectProfile/"..Language().."datasave"))
					else
						s:Load(THEME:GetPathG("","ScreenSelectProfile/"..Language().."dataload"))
					end
				end,
				OnCommand=function(s) s:diffusealpha(0):sleep(0.87):linear(0.3):diffusealpha(1) end,
				OffCommand=function(s) s:diffusealpha(0) end,
			};
		};
		--Player deco
		Def.Sprite{
			InitCommand=function(s) 
				if IsDataSaveSummary() then 
					s:Load(THEME:GetPathG("","ScreenSelectProfile/"..Model()..Language().."gameskip"))
					s:xy(10,271) 
				else
					s:Load(THEME:GetPathG("","ScreenSelectProfile/"..Model()..Language().."gamestart"))
					s:xy(2,271)
				end
			end,
				OnCommand=function(s) s:diffusealpha(0):sleep(0.87):linear(0.3):diffusealpha(1) end,
				OffCommand=function(s) s:diffusealpha(0) end,
		};
		LoadFont("ProfileText 24px") .. {
			Name = 'ProfileText';
			InitCommand=function(s) s:uppercase(true):xy(-175,-83):halign(0):zoomy(0.7):maxwidth(245) end,
				OnCommand=function(s) s:diffusealpha(0):sleep(0.87):linear(0.3):diffusealpha(1) end,
				OffCommand=function(s) s:diffusealpha(0) end,
		};
		LoadFont("ProfileText 24px") .. {
			Name = 'ProfileUID';
			InitCommand=function(s) s:uppercase(true):xy(-175,-53):halign(0):zoomy(0.7) end,
				OnCommand=function(s) s:diffusealpha(0):sleep(0.87):linear(0.3):diffusealpha(1) end,
				OffCommand=function(s) s:diffusealpha(0) end,
		};
	};
	return t;
end

local function UpdateInternal3(self, Player)
	local pn = (Player == PLAYER_1) and 1 or 2;
	local frame = self:GetChild(string.format('P%uFrame', pn));
	local ProfileText = frame:GetChild('ProfileText');
	local joinframe = frame:GetChild('JoinFrame');
	local bigframe = frame:GetChild('BigFrame');
	local ProfileUID = frame:GetChild('ProfileUID');
	
	if GAMESTATE:IsHumanPlayer(Player) then
		frame:visible(true);
		if MEMCARDMAN:GetCardState(Player) == 'MemoryCardState_none' then
			joinframe:visible(false);
			bigframe:visible(false);
			ProfileText:visible(true);
      ProfileUID:visible(true);

			local ind = SCREENMAN:GetTopScreen():GetProfileIndex(Player);
			if ind > 0 then
				local profile = PROFILEMAN:GetLocalProfileFromIndex(ind-1);

				bigframe:visible(true);
				ProfileText:settext(ProfileInfoCache[ind].DisplayName);

				local selPlayerUID = profile:GetGUID();
				ProfileUID:settext(string.upper(string.sub(selPlayerUID,1,4).."-"..string.sub(selPlayerUID,5,8)));

				local profileID = PROFILEMAN:GetLocalProfileIDFromIndex(ind-1)
				local prefs = ProfilePrefs.Read(profileID)
				if SN3Debug then
					ProfilePrefs.Save(profileID)
				end

			else
				if SCREENMAN:GetTopScreen():SetProfileIndex(Player, 1) then
					bigframe:visible(false);
					self:queuecommand('UpdateInternal2');
				else
					joinframe:visible(false);
					bigframe:visible(false);
					ProfileText:settext('No profile');
					ProfileUID:settext('------------');
				end;
			end;
		else
			--using card
			ProfileText:settext('CARD');
			SCREENMAN:GetTopScreen():SetProfileIndex(Player, 0);
		end;
	else
		joinframe:visible(true);
		ProfileText:visible(false);
		ProfileUID:visible(false);
		bigframe:visible(false);
	end;
end;

local screen = Var("LoadingScreen")
local t = Def.ActorFrame {
	StorageDevicesChangedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' or params.Name == 'Center' then
			MESSAGEMAN:Broadcast("StartButton");
			if not GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -1);
			else
				SCREENMAN:GetTopScreen():Finish();
			end;
		end;
		if params.Name == 'Up' or params.Name == 'Up2' or params.Name == 'DownLeft' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 1 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind - 1 ) then
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Down' or params.Name == 'Down2' or params.Name == 'DownRight' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 0 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind + 1 ) then
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Back' then
			if GAMESTATE:GetNumPlayersEnabled()==0 then
				SCREENMAN:GetTopScreen():Cancel();
			else
				MESSAGEMAN:Broadcast("BackButton");
				SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -2);
			end;
		end;
	end;

	PlayerJoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	PlayerUnjoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	OnCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	UpdateInternal2Command=function(self)
		UpdateInternal3(self, PLAYER_1);
		UpdateInternal3(self, PLAYER_2);
	end;

	children = {
		Def.ActorFrame {
			Name = 'P1Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X-214;y,SCREEN_CENTER_Y+9;zoom,0.667);
			OffCommand=cmd();
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd(zoomx,0.667;zoomy,0.15;linear,0.175;zoomy,0.667;))(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_1);
		};
		Def.ActorFrame {
			Name = 'P2Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X+214;y,SCREEN_CENTER_Y+9;zoom,0.667);
			OffCommand=cmd();
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					(cmd(zoomx,0.667;zoomy,0.15;linear,0.175;zoomy,0.667;))(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_2);
		};
		-- sounds
		LoadActor( THEME:GetPathS("Common","start") )..{
			StartButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("Profile","start") )..{
			StartButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("Common","cancel") )..{
			BackButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("Profile","Move") )..{
			DirectionButtonMessageCommand=cmd(play);
		};
	};
};


return t;
