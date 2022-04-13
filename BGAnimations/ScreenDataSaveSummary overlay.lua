local x = Def.ActorFrame{

	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' or params.Name == 'Center' then
			MESSAGEMAN:Broadcast("StartButton");
			SCREENMAN:GetTopScreen():Finish();
		end;
	end;

};

function LoadPlayerStuff(Player)
	
	local t = {};
	local pn = (Player == PLAYER_1) and 1 or 2;
	local strpn = tostring(pn);
	
	t[#t+1] = Def.ActorFrame {
	OffCommand=cmd(linear,0.1;zoomy,0);
	LoadActor( THEME:GetPathG("","ScreenSelectProfile/BG01") ) .. {
			InitCommand=function(self)
				(cmd(shadowlength,0;zoomy,0))(self);
			end;
			OnCommand=cmd(linear,0.3;zoomy,1;);
		};
	LoadActor( THEME:GetPathG("","ScreenSelectProfile/BG02") ) .. {
			InitCommand=function(self)
				(cmd(y,-10;zoomy,0))(self);
			end;
			OnCommand=cmd(linear,0.3;zoomy,1.1;);
		};
	};
	t[#t+1] = LoadActor( THEME:GetPathG("","ScreenSelectProfile/"..Language().."datasave") )..{
      InitCommand=cmd(diffusealpha,0;zoom,0.75;y,-165);
      OnCommand=function(self)
        if IsJoinFrame then
          (cmd(linear,0.3;diffusealpha,0))(self);
        else
          self:sleep(0.7):linear(0.1):diffusealpha(1):zoom(1.1):linear(0.1):zoom(1)
        end
      end;
      OffCommand=function(self)
        self:diffusealpha(0)
      end;
    };
	t[#t+1] = LoadActor( THEME:GetPathB("GameDecoration","9 stars") )..{
		InitCommand=cmd(diffusealpha,0;zoom,0.75;y,-17);
		OnCommand=function(s) s:sleep(0.7):linear(0.1):diffusealpha(1):zoom(1.1):linear(0.1):zoom(1) end,
      OffCommand=function(self)
        self:diffusealpha(0)
      end;
    };
	t[#t+1] = LoadActor( THEME:GetPathG("","ScreenSelectProfile/"..Model().."profile_frame") )..{
		InitCommand=cmd(diffusealpha,0;zoom,0.5;y,-76);
		OnCommand=function(s) s:sleep(0.7):linear(0.1):diffusealpha(1):zoom(0.55):linear(0.1):zoom(0.5) end,
		OffCommand=function(s) s:diffusealpha(0) end,
	};
	t[#t+1] = LoadActor( THEME:GetPathG("","ScreenSelectProfile/"..Model().."golden_frame") )..{
		InitCommand=cmd(diffusealpha,0;zoom,0.5;y,154);
		OnCommand=function(s) s:sleep(0.7):linear(0.1):diffusealpha(1):zoom(0.55):linear(0.1):zoom(0.5) end,
		OffCommand=function(s) s:diffusealpha(0) end,
	};
	t[#t+1] = Def.Sprite{
		InitCommand=function(s) s:diffusealpha(0):zoom(0.3):x(43):y(154)
			if GoldenLeague() then
				s:Load(THEME:GetPathG("","ScreenSelectProfile/"..League().."icon"))
			end
		end,
		OnCommand=function(s) s:sleep(0.7):linear(0.1):diffusealpha(1) end,
		OffCommand=function(s) s:diffusealpha(0) end,
	};
	t[#t+1] = Def.Sprite{
		InitCommand=function(s) s:diffusealpha(0):zoom(0.667):x(120):y(154)
			if GoldenLeague() then
				s:Load(THEME:GetPathG("","ScreenSelectProfile/"..League().."sort"))
			end
		end,
		OnCommand=function(s) s:sleep(0.7):linear(0.1):diffusealpha(1) end,
		OffCommand=function(s) s:diffusealpha(0) end,
	};
	t[#t+1] = LoadActor(RegionFile())..{
		InitCommand=function(s) s:diffusealpha(0):x(130)
			if GetCurrentLanguage() == "English" or GetCurrentLanguage() == "Korean" then
				s:y(-82)
			else
				s:y(-81)
			end
		end,
		OnCommand=function(s)
			if GetCurrentLanguage() == "English" or GetCurrentLanguage() == "Korean" then
				s:sleep(0.7):linear(0.1):diffusealpha(1):zoom(1.1):linear(0.1):zoom(1)
			else
				s:sleep(0.7):linear(0.1):diffusealpha(1):zoom(1.1):linear(0.1):zoomx(1):zoomy(0.8)
			end
		end,
		OffCommand=function(s) s:diffusealpha(0) end,
	};
	t[#t+1] =Def.ActorFrame{
	Name="Topper";
	OnCommand=cmd(y,0;linear,0.3;y,-238;);
	OffCommand=function(self) self:linear(0.1):y(0):sleep(0):diffusealpha(0) end,
		LoadActor(THEME:GetPathG("","ScreenSelectProfile/"..Model().."upper_base"))..{
			InitCommand=function(s) s:valign(1):zoom(0.667) end,      
		};
		Def.Sprite{
			InitCommand=function(s) s:y(-27)
				if Player == PLAYER_1 then
					s:Load(THEME:GetPathG("","ScreenSelectProfile/PLAYER_1"))
				else
					s:Load(THEME:GetPathG("","ScreenSelectProfile/PLAYER_2"))
				end
			end,
		};
    };
    t[#t+1] =Def.ActorFrame{
	Name="Bottom";
	OnCommand=cmd(y,0;linear,0.3;y,224;);
	OffCommand=function(self) self:linear(0.1):y(0):sleep(0):diffusealpha(0) end,
		LoadActor(THEME:GetPathG("","ScreenSelectProfile/"..Model().."down_base"))..{
			InitCommand=function(s) s:valign(0):zoom(0.667) end,
		};
    };
	t[#t+1] = Def.ActorFrame {
		Name = 'SmallFrame';
		InitCommand=cmd(y,96);
	};
	
	t[#t+1] = LoadActor( THEME:GetPathG("","ScreenSelectProfile/"..Model()..Language().."gameskip") )..{
		Name = "FrameInstWord";
		InitCommand=cmd(x,8;y,273;zoom,1);
		OnCommand=cmd(diffusealpha,0;sleep,0.8;linear,0.3;diffusealpha,1);
		OffCommand=function(self)
		(cmd(stoptweening;linear,0.05;;diffusealpha,0))(self);
		end;
	};
	t[#t+1] = LoadFont("ProfileText 24px") .. {
		Name = 'SelectedProfileText';
    InitCommand=function(self)
      (cmd(uppercase,true;xy,-175,-83;halign,0;zoomy,0.7;diffusealpha,0;maxwidth,250))(self);
    end;
		OnCommand=cmd(sleep,0.7;linear,0.2;diffusealpha,1);
    OffCommand=function(self)
      self:diffusealpha(0)
    end;
	};
	t[#t+1] = LoadFont("ProfileText 24px") .. {
		Name = 'selectPlayerUID';
		InitCommand=cmd(uppercase,true;xy,-175,-54;halign,0;zoomy,0.7;diffusealpha,0);
    OnCommand=function(self)
      if IsJoinFrame then
        (cmd(linear,0.3;diffusealpha,0))(self);
      else
        self:sleep(0.7):linear(0.1):diffusealpha(1):zoomx(1.5):zoomy(1.2):linear(0.1):zoomx(1.25):zoomy(0.8)
      end
    end;
    OffCommand=function(self)
      self:diffusealpha(0)
    end;
	};
	return t;
end;

--Update Internal Stuff
function UpdateInternal(self, Player)
	local pn = (Player == PLAYER_1) and 1 or 2;
	local style = (GAMESTATE:GetCurrentStyle():GetStepsType() == "StepsType_Dance_Single") and "S" or "D";
	local seltext = self:GetChild('SelectedProfileText');
	local joinframe = self:GetChild('JoinFrame');
	local smallframe = self:GetChild('SmallFrame');
	--local bigframe = self:GetChild('BigFrame');
	local selectRank = self:GetChild('selectRank');
	local selectPlayerUID = self:GetChild('selectPlayerUID');
	local selHonorPic = self:GetChild('selectedHonorPic');
	local selHonorName = self:GetChild('selectHonorName');
	local selPlayerUID;
	selPlayerUID = PROFILEMAN:GetProfile(Player):GetGUID();
	selectPlayerUID:settext(string.upper(string.sub(selPlayerUID,1,4).."-"..string.sub(selPlayerUID,5,8)));
	--bigframe:visible(true);
	seltext:settext(PROFILEMAN:GetProfile(Player):GetDisplayName());
end

if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
x[#x+1] = Def.ActorFrame {
			Name = 'P1Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X-214;y,SCREEN_CENTER_Y+9;zoom,0.667);
			OnCommand=function(self)
				UpdateInternal(self, PLAYER_1);
			end;
			OffCommand=cmd();
			children = LoadPlayerStuff(PLAYER_1);
		};
end
if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
x[#x+1] = Def.ActorFrame {
			Name = 'P2Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X+214;y,SCREEN_CENTER_Y+9;zoom,0.667);
			OnCommand=function(self)
				UpdateInternal(self, PLAYER_2);
			end;
			OffCommand=cmd();
			children = LoadPlayerStuff(PLAYER_2);
		};
end


return x;