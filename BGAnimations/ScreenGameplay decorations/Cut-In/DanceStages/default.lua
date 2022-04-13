local t = Def.ActorFrame{};

for _, pn in ipairs(GAMESTATE:GetEnabledPlayers()) do
	if FILEMAN:DoesFileExist("/Characters/"..GAMESTATE:GetCharacter(pn):GetDisplayName().."/Cut-In") then
		if FILEMAN:DoesFileExist(GAMESTATE:GetCurrentSong():GetMusicPath():sub(1, -4).."avi") == false and FILEMAN:DoesFileExist(GAMESTATE:GetCurrentSong():GetMusicPath():sub(1, -4).."mp4") == false then
			t[#t+1] = LoadActor("Animation", pn)..{
				InitCommand=function(self) self:CenterY()
					if GAMESTATE:GetCurrentStyle():GetStyleType() == "StyleType_TwoPlayersTwoSides" then
						self:x(_screen.cx)
					elseif PREFSMAN:GetPreference('Center1Player') and GAMESTATE:GetNumPlayersEnabled() == 1 and GAMESTATE:GetNumSidesJoined() == 1  then
						self:x(pn==PLAYER_1 and _screen.cx+300 or _screen.cx-280)
					elseif GAMESTATE:GetCurrentStyle():GetStepsType() == 'StepsType_Dance_Double' then
						self:x(pn== PLAYER_1 and _screen.cx-340 or _screen.cx+350);
					else
						self:x(pn== PLAYER_1 and _screen.cx+190 or _screen.cx-190);
					end
				end;
			};
		end;
	end;
end;

return t;