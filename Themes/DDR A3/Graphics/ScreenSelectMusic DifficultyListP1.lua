return Def.ActorFrame {
	CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if song then
-- 			self:setaux(0);
			self:playcommand("TweenOn");
		elseif not song and self:GetZoomX() == 1 then
-- 			self:setaux(1);
			self:playcommand("TweenOff");
		end;
	end;
	Def.StepsDisplayList {
		Name="StepsDisplayListRow";



		CursorP1 = Def.ActorFrame {
			InitCommand=cmd(addx,2;addy,-2;draworder,999;horizalign,center;vertalign,middle;player,PLAYER_1);
			PlayerJoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_1 then
					self:visible(true);
				end;
			end;
			PlayerUnjoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_1 then
					self:visible(false);
				end;
			end;
			LoadActor(THEME:GetPathG("StepsDisplayListRow","highlight")) .. {
				InitCommand=cmd(blend,Blend.Add;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0.5"));
			};
		};
		CursorP2 = Def.ActorFrame {
			InitCommand=cmd(x,80;player,PLAYER_2);
			PlayerJoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_2 then
					self:visible(true);
					(cmd(zoom,0;bounceend,0.3;zoom,1))(self);
				end;
			end;
			PlayerUnjoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_2 then
					self:visible(true);
					(cmd(bouncebegin,0.3;zoom,0))(self);
				end;
			end;
			LoadActor(THEME:GetPathG("_StepsDisplayListRow","Cursor")) .. {
				InitCommand=cmd(zoom,0.75;zoomx,-0.75;);
			};
			LoadFont("Common Normal") .. {
				Text="P2";
				InitCommand=cmd(x,-6;diffuse,0,0,0,1;shadowlength,1);
				OnCommand=cmd(zoomy,0.25;zoomx,0.15);
			};
		};
		CursorP1Frame = Def.Actor{
			ChangeCommand=cmd(stoptweening);
		};
		CursorP2Frame = Def.Actor{
			ChangeCommand=cmd(stoptweening);
			InitCommand=cmd(diffusealpha,0);
		};
	};
};
