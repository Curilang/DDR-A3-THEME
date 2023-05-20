--Thank you for using this project.
--Please consider all the effort that has been made, so remember to play fair.
--Enjoy! See you later alligator.
--Author: Enciso0720
--Last Update: 20220126

-- Tweaked by Jose_Varela as it has become so mangled by Enciso.

local StagesFolder="/DanceStages/"
local DanceStage = DSLoader()

local CamRan = 1
local CameraRandomList = {}

-- These can become local variables, but because these loaded externally via the stages as a global
-- variable, I can't really do much here.
-- local NumCameras=tonumber(12)
-- local WaitTime = {7,7,7,7,7,7,7,7,7,7,7,7}

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:Center():fov(gFOV())
		Camera = self
		
		-- Perform the stage load. If there's BG Changes, then do not load at all.
		if #GAMESTATE:GetCurrentSong():GetBGChanges() > 0 then return end
		
		-- Setup the slow motion.
		Camera:SetUpdateFunction(SlowMotion)

		-- If it doesn't have a stage, perform the load here.
		self:AddChildFromPath( StagesFolder .. DanceStage .. "/LoaderA.lua" )

		-- Perform the character load.
		if not (GetUserPref("SelectCharacter"..PLAYER_1) == "None") or (GetUserPref("SelectCharacter"..PLAYER_2) == "None") then
			self:AddChildFromPath( THEME:GetPathB("ScreenGameplay","background/DanceStages/Characters.lua") )
		end

		if FILEMAN:DoesFileExist(StagesFolder..DanceStage.."/LoaderB.lua") then
			self:AddChildFromPath( StagesFolder..DanceStage.."/LoaderB.lua" )
		end

		if FILEMAN:DoesFileExist(StagesFolder..DanceStage.."/Cameras.lua") then
			self:AddChildFromPath( StagesFolder..DanceStage.."/Cameras.lua" )
		end

		for i = 1, NumCameras do
			CameraRandomList[i] = i
		end
		
		for i = 1, NumCameras do
			local CamRandNumber = math.random(1,NumCameras)
			local TempRand = CameraRandomList[i]
				CameraRandomList[i] = CameraRandomList[CamRandNumber]
				CameraRandomList[CamRandNumber] = TempRand
		end
	end,

	Def.Quad{
		InitCommand=function(self)
		end,
		OnCommand=function(self)
			if #GAMESTATE:GetCurrentSong():GetBGChanges() > 0 then return end
			self:visible(false)
			:queuemessage("Camera"..CameraRandomList[6]):sleep(WaitTime[CameraRandomList[6]]):queuecommand("TrackTime")
		end,
		TrackTimeCommand=function(self)
		DEDICHAR:SetTimingData()
		self:sleep(1/60)
		self:queuemessage("Camera"..CameraRandomList[CamRan]):sleep(WaitTime[CameraRandomList[CamRan]])
			CurrentStageCamera = CurrentStageCamera
				CamRan=CamRan+1
				if CamRan==NumCameras then
					CamRan = 1
				end
			self:queuecommand("TrackTime")
		end,
	}
}

return t