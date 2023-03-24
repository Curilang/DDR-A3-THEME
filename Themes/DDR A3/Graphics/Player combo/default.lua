local c;
local cf;
local cfInv;
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
			Font="combo marv",
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		Def.BitmapText{
			Name="NumberW2";
			Font="combo perf",
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		Def.BitmapText{
			Name="NumberW3";
			Font="combo great",
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		Def.BitmapText{
			Name="NumberW4";
			Font="combo good",
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

		param.LabelZoom = scale( iCombo, 0, 4, 0.67, 0.67 );
		param.LabelZoom = clamp( param.LabelZoom, 0.67, 0.67);

--1 to 9
		if iCombo < 10 then
			param.Zoom = scale( iCombo, 0, 4, 0.38, 0.38 );
			param.Zoom = clamp( param.Zoom, 0.38, 0.38 );
		end
		if iCombo > 9 then
			param.Zoom = scale( iCombo, 0, 4, 0.39, 0.39 );
			param.Zoom = clamp( param.Zoom, 0.39, 0.39 );
		end
		
		if iCombo > 19 then
			param.Zoom = scale( iCombo, 0, 4, 0.40, 0.40 );
			param.Zoom = clamp( param.Zoom, 0.40, 0.40 );
		end
		if iCombo > 29 then
			param.Zoom = scale( iCombo, 0, 4, 0.41, 0.41 );
			param.Zoom = clamp( param.Zoom, 0.41, 0.41 );
		end
		if iCombo > 39 then
			param.Zoom = scale( iCombo, 0, 4, 0.425, 0.425 );
			param.Zoom = clamp( param.Zoom, 0.425, 0.425 );
		end
		if iCombo > 49 then
			param.Zoom = scale( iCombo, 0, 4, 0.435, 0.435 );
			param.Zoom = clamp( param.Zoom, 0.435, 0.435 );
		end
		if iCombo > 59 then
			param.Zoom = scale( iCombo, 0, 4, 0.45, 0.45 );
			param.Zoom = clamp( param.Zoom, 0.45, 0.45 );
		end
		if iCombo > 69 then
			param.Zoom = scale( iCombo, 0, 4, 0.46, 0.46 );
			param.Zoom = clamp( param.Zoom, 0.46, 0.46 );
		end
		if iCombo > 79 then
			param.Zoom = scale( iCombo, 0, 4, 0.48, 0.48 );
			param.Zoom = clamp( param.Zoom, 0.48, 0.48 );		
		end
		if iCombo > 89 then
			param.Zoom = scale( iCombo, 0, 4, 0.50, 0.50 );
			param.Zoom = clamp( param.Zoom, 0.50, 0.50 );
		end
		if iCombo > 99 then
			param.Zoom = scale( iCombo, 0,  4, 0.55, 0.55 );
			param.Zoom = clamp( param.Zoom, 0.55, 0.55 );
		end
		if iCombo > 999 then
			param.Zoom = scale( iCombo, 0,  4, 0.478, 0.478 );
			param.Zoom = clamp( param.Zoom, 0.478, 0.478 );
		end
		
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
