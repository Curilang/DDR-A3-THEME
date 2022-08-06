local t = Def.ActorFrame{};
local env = GAMESTATE:Env()
	
t[#t+1] = Def.ActorFrame{
    Def.ActorFrame{
		GainFocusCommand=function(s) s:linear(0.2):y(0) end,
		LoseFocusCommand=function(s) s:linear(0.2):y(102) end,
		Def.ActorFrame{
			InitCommand=cmd(diffusealpha,0;zoom,0.667;x,-11;y,-52);
			OnCommand=cmd(zoom,0;sleep,0.5;linear,0.1;diffusealpha,1.0;zoom,0.667;smooth,0.1;zoom,0.6;smooth,0.1;zoom,0.667);
			LoadActor(Model().."pad");
			LoadActor(Model().."pad")..{
				InitCommand=cmd(blend,Blend.Add);
				GainFocusCommand=cmd(smooth,0.3;diffusealpha,0.5;diffuseramp;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0");effectperiod,0.43);
				LoseFocusCommand=cmd(diffusealpha,0;stoptweening);
			};
		};
		LoadActor(Model().."character") ..{
			InitCommand=cmd(diffusealpha,0;zoom,0.667;x,-12;y,-51);
			OnCommand=cmd(sleep,0.6;linear,0.1;diffusealpha,1;zoomy,0.6;linear,0.1;zoomy,0.667;zoomx,0.9;linear,0.1;zoomx,0.667);
		};
		LoadActor(THEME:GetPathG("","_blank"))..{
			GainFocusCommand=cmd(queuecommand,"Play");
			PlayCommand=function(self)
				if self:GetVisible() then
					SOUND:PlayAnnouncer("ScreenSelectStyle comment Versus")
				end;
			end;
		};
	};
	LoadActor(Model()..Language().."title")..{
		InitCommand=cmd(diffusealpha,0;x,214;y,-115;zoom,1.415);
		MenuLeftP1MessageCommand=cmd(playcommand,"Change1");
		MenuLeftP2MessageCommand=cmd(playcommand,"Change1");
		MenuRightP1MessageCommand=cmd(playcommand,"Change1");
		MenuRightP2MessageCommand=cmd(playcommand,"Change1");
		MenuUpP1MessageCommand=cmd(playcommand,"Change1");
		MenuUpP2MessageCommand=cmd(playcommand,"Change1");
		MenuDownP1MessageCommand=cmd(playcommand,"Change1");
		MenuDownP2MessageCommand=cmd(playcommand,"Change1");
		OnCommand=function(self)
			if GAMESTATE:GetNumPlayersEnabled() == 1 then
				self:playcommand("Change1")
			else return end
		end;
		Change1Command=function(self)
		local env = GAMESTATE:Env()
			if env.VERSUSSELECT then
				self:queuecommand("GainFocus")
			else
				self:finishtweening():linear(0.1):cropright(1):sleep(0.3):queuecommand("Change2")
			end;
		end;
		Change2Command=cmd(zoom,1.415;cropright,1;diffusealpha,1;linear,0.2;cropright,0);
		GainFocusCommand=function(self)
			local env = GAMESTATE:Env()
				env.VERSUSSELECT = true
			self:stoptweening():linear(0.1):zoomy(0)
		end;
		LoseFocusCommand=function(self)
			local env = GAMESTATE:Env()
				env.VERSUSSELECT = false
		end;
		OffCommand=cmd(stoptweening;smooth,0.2;zoom,0;diffusealpha,0;);
	};
};


return t;
