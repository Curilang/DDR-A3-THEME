local t = Def.ActorFrame {};
-- speedkills
-- proof of concept for in-gameplay speed change
-- [ja] プ?イ?にハイスピを変更する概念実証コード
local speedkills_Initialized = false;
local speedMode = {
	PlayerNumber_P1 = 'x',
	PlayerNumber_P2 = 'x',
};
local maxBPM = {
	PlayerNumber_P1 = 0,
	PlayerNumber_P2 = 0,
};
local targetBPM = {
	PlayerNumber_P1 = 0,
	PlayerNumber_P2 = 0,
};
t[#t+1] = Def.ActorFrame {
	OnCommand = function(self)
		-- Get max BPM for M-Mod HACK
		-- [ja] 後述のHACKのために最大BPMを取得
		local pns = {
			'PlayerNumber_P1',
			'PlayerNumber_P2',
		};

		for _,v in pairs(pns) do
			if GAMESTATE:IsSideJoined(v) then
				local displayBPMs = {math.huge, 0}; -- Min, Max

				if GAMESTATE:IsCourseMode() then
					local trail = GAMESTATE:GetCurrentTrail(v);
					local entries = trail:GetTrailEntries();

					for i = 1, #entries do
						local song = entries[i]:GetSong();

						if not song:IsDisplayBpmSecret() then
							curDisplayBPMs = song:GetDisplayBpms();
							displayBPMs[1] = math.min(curDisplayBPMs[1], displayBPMs[1]);
							displayBPMs[2] = math.max(curDisplayBPMs[2], displayBPMs[2]);
						else
							displayBPMs[1] = -1;
						end;
					end;

					if displayBPMs[1] < 0 then
						maxBPM[v] = 0;
						displayBPMs = {math.huge, 0};

						for i = 1, #entries do
							local song = entries[i]:GetSong();

							curDisplayBPMs = song:GetDisplayBpms();
							displayBPMs[1] = math.min(curDisplayBPMs[1], displayBPMs[1]);
							displayBPMs[2] = math.max(curDisplayBPMs[2], displayBPMs[2]);
						end;
					end;
				else
					local song = GAMESTATE:GetCurrentSong();

					if not song:IsDisplayBpmSecret() then
						displayBPMs = song:GetDisplayBpms();
					else
						displayBPMs[1] = -1;
					end;

					if displayBPMs[1] < 0 then
						displayBPMs = song:GetTimingData():GetActualBPM();
					end;
				end;

				maxBPM[v] = displayBPMs[2];

				local MModHighCap = THEME:GetMetric("Player", "MModHighCap");

				if MModHighCap >= 0.5 then
					maxBPM[v] = math.min(maxBPM[v], MModHighCap);
				end;

				-- Get speed mode (x/m/C) and target BPM
				-- [ja] ハイスピの?ード (x/m/C) と目標BPMを取得
				local ps = GAMESTATE:GetPlayerState(v);
				local po = ps:GetPlayerOptions("ModsLevel_Preferred");

				local XMod = po:XMod() or 0;
				local MMod = po:MMod() or 0;

				-- [ja] コードを見る限りGetCMod()は正しく動作しない？
				-- local CMod = po:GetCMod();
				local modstring = ps:GetPlayerOptionsString("ModsLevel_Preferred");
				local CModString = string.match(modstring, "[Cc](%d+)") or "0";
				local CMod = tonumber(CModString);

				speedMode[v] = 'x';
				targetBPM[v] = XMod * maxBPM[v];

				if MMod >= 0.5 then
					speedMode[v] = 'm';
					targetBPM[v] = MMod;
				end;

				if CMod >= 0.5 then
					speedMode[v] = 'C';
					targetBPM[v] = CMod;
				end;

				-- debug message
				-- [ja] デバッグ用
				SCREENMAN:SystemMessage(string.format("%s: Speed: %s%.0f Max BPM: %.0f", v, speedMode[v], targetBPM[v], maxBPM[v]));
			end;
		end;

		speedkills_Initialized = true;
	end;
	CodeMessageCommand = function(self, params)
		
		local pn = params.PlayerNumber;
		local ps = GAMESTATE:GetPlayerState(pn);
		local po = ps:GetPlayerOptions("ModsLevel_Preferred");

		if not speedkills_Initialized then
			return;
		end;

		if speedMode[pn] == 'x' then
			-- X-Mod
			local speed = po:XMod() or 0;
			speed = math.floor(speed * 4 + 0.5) / 4;

			local speedDelta = 0;
			if params.Name == "SpeedUp" then
				speedDelta = 0.25;
			elseif params.Name == "SpeedDown" then
				speedDelta = -0.25;
			end;

			speed = math.max(0.5, math.min(speed + speedDelta, 10.0));
			targetBPM[pn] = speed * maxBPM[pn];

			local modstring = ps:GetPlayerOptionsString("ModsLevel_Preferred");

			-- HACK: Add "default, " to prevent crash
			-- [ja] ク?ッシ?を防ぐために「default, 」を付け加える
			modstring = "default, " .. modstring;
			modstring = modstring .. ", " .. speed .. "x";

			ps:SetPlayerOptions("ModsLevel_Preferred", modstring);

			-- 1.00x
			local xString = string.format("%.2fx", speed);
			-- 1.00x -> 1.0x
			xString = string.gsub(xString, "(%d+%.%d)0x", "%1x");
			-- 1.0x -> 1x
			xString = string.gsub(xString, "(%d+)%.0x", "%1x");
			
			if params.Name == "SpeedUp" or params.Name == "SpeedDown" then
				SCREENMAN:SystemMessage(string.format("%s: %s (m%.0f)", pn, xString, targetBPM[pn]));
			end;
		else
			-- C-Mod and M-Mod
			local speed = targetBPM[pn];
			speed = math.floor(speed / 50 + 0.5) * 50;

			local speedDelta = 0;
			if params.Name == "SpeedUp" then
				speedDelta = 50;
			elseif params.Name == "SpeedDown" then
				speedDelta = -50;
			end;

			speed = math.max(100, math.min(speed + speedDelta, 2000));
			targetBPM[pn] = speed;

			local modstring = ps:GetPlayerOptionsString("ModsLevel_Preferred");

			-- HACK: Add "default, " to prevent crash
			-- [ja] ク?ッシ?を防ぐために「default, 」を付け加える
			modstring = "default, " .. modstring;

			if speedMode[pn] == 'm' then
				-- [ja] BPMが0だとどう足掻いても速度が無限になるので?断
				if maxBPM[pn] == 0 then
					SCREENMAN:SystemMessage("m-Mod with 0 BPM, speed cannot be changed...");
					return;
				end;

				-- HACK: Add X-Mod, because M-Mod cannot be applied in gameplay
				-- [ja] M-Modはプ?イ?にはそのまま適用されないのでX-Modも付け加える
				modstring = modstring .. ", " .. (targetBPM[pn] / maxBPM[pn]) .. 'x';
			end;

			modstring = modstring .. ", " .. speedMode[pn] .. targetBPM[pn];

			ps:SetPlayerOptions("ModsLevel_Preferred", modstring);

			-- 1.00x
			local xString = string.format("%.2fx", targetBPM[pn] / maxBPM[pn]);
			-- 1.00x -> 1.0x
			xString = string.gsub(xString, "(%d+%.%d)0x", "%1x");
			-- 1.0x -> 1x
			xString = string.gsub(xString, "(%d+)%.0x", "%1x");

			local format = "%s: %s%.0f";
			if speedMode[pn] == 'm' then
				format = "%s: %s%.0f (%s)";
			end;

			if params.Name == "SpeedUp" or params.Name == "SpeedDown" then
				SCREENMAN:SystemMessage(string.format(format, pn, speedMode[pn], targetBPM[pn], xString));
			end;
		end;
		retrieveMeterType(); --In BGAnimations/ScreenGameplay decorations/OptionsHack.lua
		SetGameplayMeterType(pn); --In BGAnimations/ScreenGameplay decorations/OptionsHack.lua
	end;
};

return t