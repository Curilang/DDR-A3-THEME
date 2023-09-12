local c;
local cf;
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");
local Pulse = THEME:GetMetric("Combo", "PulseCommand");
local PulseLabel = THEME:GetMetric("Combo", "PulseLabelCommand");
local xxState;

local NumberMinZoom = THEME:GetMetric("Combo", "NumberMinZoom");
local NumberMaxZoom = THEME:GetMetric("Combo", "NumberMaxZoom");
local NumberMaxZoomAt = THEME:GetMetric("Combo", "NumberMaxZoomAt");

local LabelMinZoom = THEME:GetMetric("Combo", "LabelMinZoom");
local LabelMaxZoom = THEME:GetMetric("Combo", "LabelMaxZoom");

--you can pass nil to this function, it acts the same as passing nothing
--however, i think that passing nil makes the intent clearer -tertu
local function cfShowOnly(...)
	local cfMembersToShow = {...}

	--build an inverse version of the argument table to speed up lookup
	local cfMTSInv = {}
	for _, name in pairs(cfMembersToShow) do
		cfMTSInv[name] = true
	end

	for name, a in pairs(cf) do
		--"if the name of this actor was passed, make it visible, otherwise
		--hide it"
		a:visible(cfMTSInv[name] == true)
	end
end

local t = Def.ActorFrame {
	Def.ActorFrame {
		Name="ComboFrame";
		Def.BitmapText{
			Name="NumberW1";
			Font="A3/combo marv",
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		Def.BitmapText{
			Name="NumberW2";
			Font="A3/combo perf",
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		Def.BitmapText{
			Name="NumberW3";
			Font="A3/combo great",
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		Def.BitmapText{
			Name="NumberW4";
			Font="A3/combo good",
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		Def.BitmapText{
			Name="NumberNormal";
			Font="A3/combo normal",
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		Def.Sprite{
			Name="LabelW1";
			Texture="combo",
			InitCommand=function(s) s:pause():setstate(0) end,
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		Def.Sprite{
			Name="LabelW2";
			Texture="combo",
			InitCommand=function(s) s:pause():setstate(1) end,
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		Def.Sprite{
			Name="LabelW3";
			Texture="combo",
			InitCommand=function(s) s:pause():setstate(2) end,
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		Def.Sprite{
			Name="LabelW4";
			Texture="combo",
			InitCommand=function(s) s:pause():setstate(3) end,
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		Def.Sprite{
			Name="LabelNormal";
			Texture="combo",
			InitCommand=function(s) s:pause():setstate(4) end,
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
	};
	InitCommand = function(self)
		c = self:GetChildren();
		cf = c.ComboFrame:GetChildren();
		-- Inclu
		cfShowOnly(nil);
	end;
	ComboCommand=function(self, param)
		if not xxState then
			cfShowOnly(nil);
			return;
		end
		if param.Misses then
			cfShowOnly(nil);
			return;
		end
		local iCombo = param.Combo;
		if not iCombo or iCombo < ShowComboAt then
			cfShowOnly(nil);
			return;
		end

		local Number = xxState.Number;
		local Label = xxState.Label

		local NumberZoom;
		local LabelZoom = 0.67
		
		 if iCombo < 10 then NumberZoom = 0.38 end
		  if iCombo > 9 then NumberZoom = 0.39 end
		 if iCombo > 19 then NumberZoom = 0.4 end
		 if iCombo > 29 then NumberZoom = 0.41 end
		 if iCombo > 39 then NumberZoom = 0.425 end
		 if iCombo > 49 then NumberZoom = 0.435 end
		 if iCombo > 59 then NumberZoom = 0.45 end
		 if iCombo > 69 then NumberZoom = 0.46 end
		 if iCombo > 79 then NumberZoom = 0.48 end
		 if iCombo > 89 then NumberZoom = 0.5 end
		 if iCombo > 99 then NumberZoom = 0.55 end
		if iCombo > 999 then NumberZoom = 0.478 end
		
		--Number
		param.Zoom = scale( iCombo, 0, 4, NumberZoom, NumberZoom );
		param.Zoom = clamp( param.Zoom, NumberZoom, NumberZoom );
		
		--Combo
		param.LabelZoom = scale( iCombo, 0, 4, LabelZoom, LabelZoom );
		param.LabelZoom = clamp( param.LabelZoom, LabelZoom, LabelZoom);

		cfShowOnly(Number, Label);

		-- Pulse
		Pulse( cf[Number], param );
		PulseLabel( cf[Label], param)
		
		local cstr = tostring(iCombo);
		cf[Number]:settext( cstr );
		
	end;
	AfterStatsEngineMessageCommand=function(s, param)
		if param.Player ~= player then return end;
		xxState = param.Data.XXComboState;
	end;
};

return t;