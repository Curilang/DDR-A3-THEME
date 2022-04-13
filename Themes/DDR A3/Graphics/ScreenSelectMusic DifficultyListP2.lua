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
	-- Def.Quad {
		-- InitCommand=cmd(y,-14;zoomto,164,2;fadeleft,8/164;faderight,8/164);
		-- OnCommand=cmd(diffuse,Color("Black");diffusealpha,0;linear,0.35;diffusealpha,0.5);
	-- };
	-- Def.Quad {
		-- InitCommand=cmd(y,24*(5)-10;zoomto,164,2;fadeleft,8/164;faderight,8/164);
		-- OnCommand=cmd(diffuse,Color("Black");diffusealpha,0;linear,0.35;diffusealpha,0.5);
	-- };
	Def.StepsDisplayList {
		Name="StepsDisplayListRow";
		
		
		
		CursorP1 = Def.ActorFrame {
			InitCommand=cmd(x,-80;player,PLAYER_1);
			PlayerJoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_1 then
					self:visible(true);
					(cmd(zoom,0;bounceend,0.3;zoom,1))(self);
				end;
			end;
			PlayerUnjoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_1 then
					self:visible(true);
					(cmd(bouncebegin,0.3;zoom,0))(self);
				end;
			end;
			LoadActor(THEME:GetPathG("_StepsDisplayListRow","Cursor")) .. {
				InitCommand=cmd(diffuse,PlayerColor(PLAYER_1);x,8;zoom,0.75);
			};
			LoadActor(THEME:GetPathG("_StepsDisplayListRow","arrow")) .. {
				InitCommand=cmd(x,20;diffuse,PlayerColor(PLAYER_1));
				OnCommand=cmd(thump,1;effectmagnitude,1,1.25,1;effectclock,'beat';);
			};
			LoadFont("Common Normal") .. {
				Text="P1";
				InitCommand=cmd(x,6;diffuse,0,0,0,1;shadowlength,1);
				OnCommand=cmd(zoomy,0.25;zoomx,0.15);
			};
		};
		CursorP2 = Def.ActorFrame {
			InitCommand=cmd(x,0;player,PLAYER_2);
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
			LoadActor(THEME:GetPathG("StepsDisplayListRow","highlight")) .. {
				InitCommand=cmd(blend,Blend.Add;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0.5"));
			};
			LoadActor("P2_cursor.png") .. {
				InitCommand=cmd(x,65;y,-2;draworder,1;zoom,0.85);
			};
		};
		CursorP1Frame = Def.Actor{
			ChangeCommand=cmd(stoptweening);
			InitCommand=cmd(diffusealpha,0);
		};
		CursorP2Frame = Def.Actor{
			ChangeCommand=cmd(stoptweening);
		};
	};
};