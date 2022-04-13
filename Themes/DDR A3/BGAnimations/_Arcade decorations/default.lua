local t = Def.ActorFrame {};

t[#t+1] = LoadActor(THEME:GetPathB("","_Arcade decorations/icon"))..{
	InitCommand=function(s) s:zoom(0.655):x(SCREEN_RIGHT-29.3):y(SCREEN_TOP+115) end,
};

t[#t+1] = LoadActor(THEME:GetPathB("","_Arcade decorations/"..Language().."paseli"))..{
	InitCommand=function(s) s:zoom(0.667):xy(_screen.cx+355,_screen.cy+201) end,
};

t[#t+1] = LoadActor(THEME:GetPathB("","_Arcade decorations/"..Model().."base"))..{
	InitCommand=function(s) s:xy(_screen.cx,_screen.cy+187):setsize(386,56) end,
};
	
if not IsTitleMenu() then
	t[#t+1] = Def.Sprite{
		InitCommand=function(s) s:zoom(0.6):xy(_screen.cx,_screen.cy+186):queuecommand("Set") end,
		CoinInsertedMessageCommand=function(s) s:queuecommand("Set") end,
		SetCommand=function(s)
			if GAMESTATE:GetCoinMode() == 'CoinMode_Free' then
				s:Load(THEME:GetPathB("","_Arcade decorations/"..Model()..Language().."start"))
				s:diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#ffea00")):effectperiod(2.5)  
			elseif GAMESTATE:GetCoinMode() == "CoinMode_Home" then
				s:Load(THEME:GetPathB("","_Arcade decorations/"..Model()..Language().."start"))
				s:diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#ffea00")):effectperiod(2.5)  
			else
				if GAMESTATE:EnoughCreditsToJoin() == true then
					s:Load(THEME:GetPathB("","_Arcade decorations/"..Model()..Language().."start"))
					s:diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#ffea00")):effectperiod(2.5)  
				else
					s:Load(THEME:GetPathB("","_Arcade decorations/coin"))
					s:diffuseshift():effectcolor1(color("##ffffff")):effectcolor2(color("#b4ff01")):effectperiod(2.5)
				end
			end
		end
	};
	if GetCurrentModel() == "Gold" then
		t[#t+1] = Def.Sprite{
			InitCommand=function(s) s:zoom(0.6):xy(_screen.cx,_screen.cy+186):queuecommand("Set") end,
			CoinInsertedMessageCommand=function(s) s:queuecommand("Set") end,
			SetCommand=function(s)
				if GAMESTATE:GetCoinMode() == 'CoinMode_Free' then
					s:Load(THEME:GetPathB("","_Arcade decorations/"..Language().."button"))
				elseif GAMESTATE:GetCoinMode() == "CoinMode_Home" then
					s:Load(THEME:GetPathB("","_Arcade decorations/"..Language().."button"))
				else
					if GAMESTATE:EnoughCreditsToJoin() == true then
						s:Load(THEME:GetPathB("","_Arcade decorations/"..Language().."button"))
					end
				end
			end
		};
	end
end 

return t