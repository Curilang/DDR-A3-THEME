PREFSMAN:SetPreference('SongBackgrounds', true)
GAMESTATE:GetSongOptionsObject("ModsLevel_Preferred"):RandomBGOnly(false)

return Def.ActorFrame { 
	Def.Actor{
		OnCommand=function(self)
		Language()
		Model()
		MenuTimer()
		SelectMusicBGM()
		local coins = GAMESTATE:GetCoins()
			if coins >= 1 then
				GAMESTATE:InsertCoin(-coins)
			end
		end;
	};
	Def.Quad{
		InitCommand=function(s) s:diffuse(Color("White")):setsize(SCREEN_WIDTH,SCREEN_HEIGHT):Center() end,
	};
};