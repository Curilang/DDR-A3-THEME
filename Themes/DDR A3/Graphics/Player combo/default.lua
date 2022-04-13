local c;
local cf;
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");
local Pulse = THEME:GetMetric("Combo", "PulseCommand");
local PulseLabel = THEME:GetMetric("Combo", "PulseLabelCommand");
local LowerJudge={0,0};
local p=((player=='PlayerNumber_P1') and 1 or 2);

local NumberMinZoom = THEME:GetMetric("Combo", "NumberMinZoom");
local NumberMaxZoom = THEME:GetMetric("Combo", "NumberMaxZoom");
local NumberMaxZoomAt = THEME:GetMetric("Combo", "NumberMaxZoomAt");

local LabelMinZoom = THEME:GetMetric("Combo", "LabelMinZoom");
local LabelMaxZoom = THEME:GetMetric("Combo", "LabelMaxZoom");

local t = Def.ActorFrame {
	Def.ActorFrame {
		Name="ComboFrame";
		LoadFont( "combo", "marv" ) .. {
			Name="NumberW1";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadFont( "combo", "perf" ) .. {
			Name="NumberW2";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadFont( "combo", "great" ) .. {
			Name="NumberW3";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadFont( "combo", "good") .. {
			Name="NumberNormal";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadActor("combo") .. {
			Name="LabelW1";
			InitCommand=function(s) s:pause():setstate(0) end,
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		LoadActor("combo") .. {
			Name="LabelW2";
			InitCommand=function(s) s:pause():setstate(1) end,
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		LoadActor("combo") .. {
			Name="LabelW3";
			InitCommand=function(s) s:pause():setstate(2) end,
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		LoadActor("combo") .. {
			Name="LabelNormal";
			InitCommand=function(s) s:pause():setstate(3) end,
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
	};
	InitCommand = function(self)
		c = self:GetChildren();
		cf = c.ComboFrame:GetChildren();
		cf.NumberW1:visible(false);
		cf.NumberW2:visible(false);
		cf.NumberW3:visible(false);
		cf.NumberNormal:visible(false);
		cf.LabelW1:visible(false);
		cf.LabelW2:visible(false);
		cf.LabelW3:visible(false);
		cf.LabelNormal:visible(false);
		LowerJudge[p]=0;
	end;
	JudgmentMessageCommand = function(self,params)
		if params.Player ~= player then return end;
		if params.TapNoteScore=='TapNoteScore_W1' and LowerJudge[p]<1 then
			LowerJudge[p]=1;
		elseif params.TapNoteScore=='TapNoteScore_W2' and LowerJudge[p]<2 then
			LowerJudge[p]=2;
		elseif params.TapNoteScore=='TapNoteScore_W3' and LowerJudge[p]<3 then
			LowerJudge[p]=3;
		elseif params.TapNoteScore=='TapNoteScore_W4' and LowerJudge[p]<4 then
			LowerJudge[p]=4;
		elseif params.TapNoteScore=='TapNoteScore_CheckpointMiss' 
			or params.TapNoteScore=='TapNoteScore_W5' 
			or params.TapNoteScore=='TapNoteScore_Miss' then
			LowerJudge[p]=0;
		end;
	end;
	ComboCommand=function(self, param)
		local iCombo = param.Combo;

		if not iCombo or iCombo < ShowComboAt then
		--if false then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(false);
			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(false);
			return;
		end

		cf.LabelW1:visible(false);
		cf.LabelW2:visible(false);
		cf.LabelW3:visible(false);
		cf.LabelNormal:visible(false);

	  --param.Zoom = scale( iCombo, 0, 100, 0.38, 0.38 );
	  --param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, NumberMinZoom, 1.05 )
	  --param.Zoom = clamp( param.Zoom, NumberMinZoom, NumberMaxZoom );
	  --param.Zoom = clamp( param.Zoom, 0.38, 0.48 );
		----------------------------------------------------------------------
		param.LabelZoom = scale( iCombo, 0, 4, 0.67, 0.67 );
		param.LabelZoom = clamp( param.LabelZoom, 0.67, 0.67);
		
		cf.NumberW1:settext( string.format("%i", iCombo) );
		cf.NumberW2:settext( string.format("%i", iCombo) );
		cf.NumberW3:settext( string.format("%i", iCombo) );
		cf.NumberNormal:settext( string.format("%i", iCombo) );





		local Number_X = 0;
		local Number_Y = 0;
		local Label_X =  0;
		local Label_Y =  0;

--1 to 9
		if iCombo < 10 then
		param.Zoom = scale( iCombo, 0, 4, 0.38, 0.38 );
		param.Zoom = clamp( param.Zoom, 0.38, 0.38 );
			Number_X = -35;
			Number_Y = 4;
		    Label_X =  -26;
		end

--10 to 100
		if iCombo > 9 then
		param.Zoom = scale( iCombo, 0, 4, 0.40, 0.40 );
		param.Zoom = clamp( param.Zoom, 0.39, 0.39 );
			Number_X = -9;
			Number_Y = 5;
		    Label_X = -1;

		end
		
		if iCombo > 19 then
		param.Zoom = scale( iCombo, 0, 4, 0.40, 0.40 );
		param.Zoom = clamp( param.Zoom, 0.40, 0.40 );
			Number_X = -9;
			Number_Y = 5;
		    Label_X = 1;
		end
		if iCombo > 29 then
		param.Zoom = scale( iCombo, 0, 4, 0.41, 0.41 );
		param.Zoom = clamp( param.Zoom, 0.41, 0.41 );
			Number_X = -5;
			Number_Y = 5;
		    Label_X = 1;
		end
		if iCombo > 39 then
		param.Zoom = scale( iCombo, 0, 4, 0.425, 0.425 );
		param.Zoom = clamp( param.Zoom, 0.425, 0.425 );
			Number_X = -3;
			Number_Y = 5;
		    Label_X = 6;
		end
		if iCombo > 49 then
		param.Zoom = scale( iCombo, 0, 4, 0.435, 0.435 );
		param.Zoom = clamp( param.Zoom, 0.435, 0.435 );
			Number_X = -2;
			Number_Y = 5;
		    Label_X = 6;
		end
		if iCombo > 59 then
		param.Zoom = scale( iCombo, 0, 4, 0.45, 0.45 );
		param.Zoom = clamp( param.Zoom, 0.45, 0.45 );
			Number_X = 0;
			Number_Y = 5;
		    Label_X = 8;
		end
		if iCombo > 69 then
		param.Zoom = scale( iCombo, 0, 4, 0.46, 0.46 );
		param.Zoom = clamp( param.Zoom, 0.46, 0.46 );
			Number_X = 2;
			Number_Y = 5;
		    Label_X = 10;
		end
		if iCombo > 79 then
		param.Zoom = scale( iCombo, 0, 4, 0.48, 0.48 );
		param.Zoom = clamp( param.Zoom, 0.48, 0.48 );		
			Number_X = 2;
			Number_Y = 5;
		    Label_X = 12;
		end
		if iCombo > 89 then
		param.Zoom = scale( iCombo, 0, 4, 0.50, 0.50 );
		param.Zoom = clamp( param.Zoom, 0.50, 0.50 );
			Number_X = 5;
			Number_Y = 5;
		    Label_X = 14;
		end
		if iCombo > 99 then
			param.Zoom = scale( iCombo, 0,  4, 0.55, 0.55 );
			param.Zoom = clamp( iCombo, 0.55, 0.55 );

			Number_X = 43;
			Number_Y = 5;
			Label_X = 58;
			Label_Y = 0;

		end

		if iCombo > 999 then
			param.Zoom = scale( iCombo, 0,  4, 0.478, 0.478 );
			param.Zoom = clamp( param.Zoom, 0.478, 0.478 );
			Number_X = 63;
			Number_Y = 5;
			Label_X = 70;
			Label_Y = 0;
		end

		if iCombo > 9999 then
			param.Zoom = scale( iCombo, 0,  4, 0.478, 0.478 );
			param.Zoom = clamp( param.Zoom, 0.478, 0.478 );
			Number_X = 69;
			Number_Y = -54;
			Label_X = 70;
			Label_Y = 0;
		end

		if iCombo > 99999 then
			param.Zoom = scale( iCombo, 0,  4, 0.478, 0.478 );
			param.Zoom = clamp( param.Zoom, 0.478, 0.478 );
			Number_X = 69;
			Number_Y = -54;
			Label_X = 70;
			Label_Y = 0;
			
		end

		if iCombo > 999999 then
			param.Zoom = scale( iCombo, 0,  4, 0.478, 0.478 );
			param.Zoom = clamp( param.Zoom, 0.478, 0.478 );
			Number_X = 69;
			Number_Y = -54;
			Label_X = 70;
			Label_Y = 0;
		end
		
		cf.NumberW1:x(Number_X);
		cf.NumberW2:x(Number_X);
		cf.NumberW3:x(Number_X);
		cf.NumberNormal:x(Number_X);
		
		cf.NumberW1:y(Number_Y);
		cf.NumberW2:y(Number_Y);
		cf.NumberW3:y(Number_Y);
		cf.NumberNormal:y(Number_Y);

		cf.LabelW1:x(Label_X);
		cf.LabelW2:x(Label_X);
		cf.LabelW3:x(Label_X);
		cf.LabelNormal:x(Label_X);

		cf.LabelW1:y(Label_Y);
		cf.LabelW2:y(Label_Y);
		cf.LabelW3:y(Label_Y);
		cf.LabelNormal:y(Label_Y);







		if LowerJudge[p]==1 then
			cf.NumberW1:visible(true);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(false);

			cf.LabelW1:visible(true);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(false);
		elseif LowerJudge[p]==2 then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(true);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(false);

			cf.LabelW1:visible(false);
			cf.LabelW2:visible(true);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(false);
		elseif LowerJudge[p]==3 then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(true);
			cf.NumberNormal:visible(false);

			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(true);
			cf.LabelNormal:visible(false);
		elseif LowerJudge[p]==4 then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(true);

			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(true);
		else
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(false);

			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(false);
		end
		-- Pulse
		Pulse( cf.NumberW1, param );
		Pulse( cf.NumberW2, param );
		Pulse( cf.NumberW3, param );
		Pulse( cf.NumberNormal, param );
		PulseLabel( cf.LabelW1, param );
		PulseLabel( cf.LabelW2, param );
		PulseLabel( cf.LabelW3, param );
		PulseLabel( cf.LabelNormal, param );
		-- Milestone Logic
	end;
};

return t;