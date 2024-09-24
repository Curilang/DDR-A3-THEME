--Code from home theme (StepMania 5.1new)
local transform = function(self,offsetFromCenter,itemIndex,numItems)
	self:y( offsetFromCenter * 33 )
	if offsetFromCenter < -1 or offsetFromCenter > 4 then
		self:diffusealpha(0)
	elseif offsetFromCenter < 0 or offsetFromCenter > 3 then
		self:diffusealpha(0)
	end
end

--Code from Midflight Digital
return Def.CourseContentsList {
	InitCommand=function(s) s:y(_screen.cy+10):zoom(0.667) end,
	
	MaxSongs = 999;
	NumItemsToDraw = 6;
	ShowCommand=function(s) s:linear(0.3):diffusealpha(1) end,
	HideCommand=function(s) s:linear(0.3):diffusealpha(0) end,
	SetCommand=function(self)
		self:pause()
		self:finishtweening()
		self:SetFromGameState();
		self:SetCurrentAndDestinationItem(0);
		self:SetPauseCountdownSeconds(1);
		self:SetSecondsPauseBetweenItems( 1 );
		self:SetTransformFromFunction(transform)
		if GAMESTATE:GetCurrentCourse():GetEstimatedNumStages() > 4 then
			self:SetDestinationItem(GAMESTATE:GetCurrentCourse():GetEstimatedNumStages()-4);
			seconds = self:GetSecondsToDestination();
			self:queuecommand("Reset");
		else
		end;
	end;
	ResetCommand=function(self)
		self:sleep(seconds+5):queuecommand("Set");
	end;
	CurrentTrailP1ChangedMessageCommand=function(s) s:playcommand("Set") end,
	CurrentTrailP2ChangedMessageCommand=function(s) s:playcommand("Set") end,

	Display = Def.ActorFrame {
		InitCommand=function(s) s:setsize(1,33) end,
		OnCommand=function(s) s:diffusealpha(0):linear(0.2):diffusealpha(1) end,
		Def.ActorFrame{
			InitCommand=function(s) s:xy(-210,-36) end,
			LoadFont("_wheelnames 28px") .. {
				InitCommand=function(s) s:maxwidth(220):halign(0) end,
				SetSongCommand=function(self, params)
					if params.Secret ==true then
						self:settext("??????");
					else
						if params.Song then
							self:settext(params.Song:GetDisplayFullTitle());
						end;
					end;
				end;
			};
			Def.ActorFrame{
				InitCommand=function(s) s:x(245) end,
				Def.Quad{
					InitCommand=function(s) s:setsize(23,23) end,
					SetSongCommand=function(self, params)
						if params.PlayerNumber ~= GAMESTATE:GetMasterPlayerNumber() then return end
						self:diffuse( CustomDifficultyToColor(params.Difficulty) );
					end,
				};
				LoadFont("_impact 32px") .. {
					SetSongCommand=function(self, params)
						if params.PlayerNumber ~= GAMESTATE:GetMasterPlayerNumber() then return end
						self:settext( params.Meter ):strokecolor(Color.Black):zoom(0.7)
					end;
				};
			};
		};
	};
	
};
