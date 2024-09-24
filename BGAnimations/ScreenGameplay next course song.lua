local t = Def.ActorFrame {};

t[#t+1] = Def.Actor {
	ChangeCourseSongInMessageCommand=function(self)
		self:sleep(BeginOutDelay()):queuecommand('Shutter')
	end,
	ShutterCommand=function(self)
		local delay = THEME:GetMetric('ScreenGameplay', 'NextCourseSongDelay')
		MESSAGEMAN:Broadcast('NextCourseSong')
		self:sleep(delay)
	end,
};

return t

-- local Stage = Def.ActorFrame{
	-- BeginCommand=function(s) s:playcommand("Set") end,
	-- CurrentSongChangedMessageCommand=function(s) s:finishtweening():playcommand("Set") end,
-- };

-- if GAMESTATE:IsCourseMode() then
	-- Stage[#Stage+1] = Def.Sprite{
		-- SetCommand=function(self)
			-- local CourseIndex = GAMESTATE:GetLoadingCourseSongIndex()+2
			-- local TrailEntries = #GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber()):GetTrailEntries()
			-- local GetMessage = FormatNumberAndSuffix(tostring(CourseIndex))
				-- if CourseIndex == TrailEntries then 
					-- self:Load(THEME:GetPathG("","_shared/message/Final"))
				-- elseif GetMessage == "2nd" then
					-- self:Load(THEME:GetPathG("","_shared/message/2nd"))
				-- elseif GetMessage == "3rd" then
					-- self:Load(THEME:GetPathG("","_shared/message/3rd"))
				-- elseif GetMessage == "4th" then
					-- self:Load(THEME:GetPathG("","_shared/message/4th"))
				-- else
					-- self:Load(THEME:GetPathG("","_shared/message/ENJOY"))
				-- end
		-- end,
		-- DoneLoadingNextSongMessageCommand=function(s) s:queuecommand("Set") end,
	-- };
-- end

-- local SleepPlus = 1.35
-- return Def.ActorFrame{
	-- t;
	-- Def.ActorFrame{
		-- ChangeCourseSongInMessageCommand=function(s) s:sleep(SleepPlus):queuecommand("Play") end,
		-- PlayCommand=function(s) 
			-- local sound = THEME:GetPathS("ScreenStageInformation","StageSound")
			-- SOUND:PlayOnce(StreamingSound(sound)) 
		-- end,
	-- };
	-- Def.ActorFrame{
		-- ChangeCourseSongInMessageCommand=function(s) s:sleep(SleepPlus+1.55):queuecommand("Play") end,
		-- PlayCommand=function(s) 
			-- local sound = THEME:GetPathS("ScreenStageInformation","JacketSound")
			-- SOUND:PlayOnce(StreamingSound(sound)) 
		-- end,
	-- };

	
	-- Def.ActorFrame{
		-- InitCommand=function(s) s:xy(140,80):zoom(0.667) end,
		-- Def.Sprite{
			-- Texture=THEME:GetPathG("","_shared/message/BLUE"),
			-- InitCommand=function(s) s:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+10):zoom(1):diffusealpha(0) end,
			-- ChangeCourseSongInMessageCommand=function(self) self:sleep(SleepPlus)
				-- self:diffusealpha(1);
				-- self:zoomx(1);
				-- self:zoomy(1);
				-- self:linear(0.1);
				-- self:diffusealpha(1);
				-- self:zoomx(1.2);
				-- self:zoomy(1.2);
				-- self:linear(0.1);
				-- self:diffusealpha(1);
				-- self:zoomx(1.1);
				-- self:zoomy(1.1);
				-- self:sleep(0.3);
				-- self:sleep(0.1);
				-- self:linear(0.1);
				-- self:zoomx(1);
				-- self:zoomy(1);
				-- self:sleep(0.85);
				-- self:linear(0.04);
				-- self:diffusealpha(0);
				-- self:zoomx(0.8*1.2);
				-- self:zoomy(0);
			-- end;
		-- };
		-- Stage..{
			-- InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+5);
			-- ChangeCourseSongInMessageCommand=function(self) self:zoom(1):diffusealpha(0):sleep(SleepPlus)
				-- :diffusealpha(1):linear(0.1):diffusealpha(1)
				-- :zoomx(1.1):zoomy(1.2):linear(0.1)
				-- :zoomx(1.2):zoomy(1.1):linear(0.15)
				-- :zoomx(1.15):zoomy(1.1):sleep(0.3):linear(0.1)
				-- :zoomx(1):zoomy(1)
				-- :sleep(0.8):linear(0.04):diffusealpha(0.2):zoomx(1.8*2):zoomy(0);
			-- end;
		-- };
		-- Stage..{
			-- InitCommand=cmd(x,SCREEN_CENTER_X-0;y,SCREEN_CENTER_Y;blend,Blend.Add);
			-- ChangeCourseSongInMessageCommand=function(self) self:zoom(0.9):diffusealpha(0):sleep(SleepPlus)
				-- :diffusealpha(0.5):zoom(1.5):linear(0.1):diffusealpha(0.5)
				-- :zoomx(1.1):zoomy(1.2):linear(0.15)
				-- :zoomx(1.5):zoomy(1.8):linear(0.15)
				-- :zoomx(2):zoomy(2.1):diffusealpha(0);
			-- end;
		-- };
	-- };
	
	
	-- Def.Quad{
		-- InitCommand=function(s) s:FullScreen():diffusecolor(Color.White):diffusealpha(0) end,
		-- ChangeCourseSongInMessageCommand=function(s) s:sleep(SleepPlus+0.164):linear(0.2):diffusealpha(0.7):linear(0.3):diffusealpha(0) end,
	-- };
	
-- };