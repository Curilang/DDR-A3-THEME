local x = LoadFallbackB()

x[#x+1] = Def.ActorFrame{
	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' or params.Name == 'Center' then
			MESSAGEMAN:Broadcast("StartButton");
			SCREENMAN:GetTopScreen():Finish();
		end;
	end;
};

local function UpdateInternal(self,pn)
	local ProfileText = self:GetChild('ProfileText');
	local joinframe = self:GetChild('JoinFrame');
	local bigframe = self:GetChild('BigFrame');
	local ProfileUID = self:GetChild('ProfileUID');
	
	local PlayerUID = PROFILEMAN:GetProfile(pn):GetGUID();
	ProfileUID:settext(string.upper(string.sub(PlayerUID,1,4).."-"..string.sub(PlayerUID,5,8)));
	bigframe:visible(true);
	ProfileText:settext(PROFILEMAN:GetProfile(pn):GetDisplayName());
end

for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
	x[#x+1] = Def.ActorFrame{
		InitCommand=function(s) s:xy(pn==PLAYER_1 and _screen.cx-214 or _screen.cx+214,_screen.cy+9):zoom(0.667) end,
		OnCommand=function(s) UpdateInternal(s,pn) end,
		children = LoadPlayerStuff(pn);
	};
end

x[#x+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathS("","Profile In"))..{
		OnCommand=cmd(play);
	};
	LoadActor(THEME:GetPathS("","Profile Load"))..{
		OnCommand=cmd(sleep,0.35;queuecommand,"Play");
		PlayCommand=cmd(play);
	};
	LoadActor( THEME:GetPathS("","Profile Start") )..{
		OffCommand=cmd(play);
	};
};
  
return x,t;