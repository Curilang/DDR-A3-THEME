local StagesFolder="/DanceStages/"
local HasVideo = FILEMAN:DoesFileExist(GAMESTATE:GetCurrentSong():GetMusicPath():sub(1, -4).."avi") == false and FILEMAN:DoesFileExist(GAMESTATE:GetCurrentSong():GetMusicPath():sub(1, -4).."mp4") == false 

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:Center():fov(gFOV());
		Camera = self
			Camera:SetUpdateFunction(SlowMotion)
	end;
};

if HasVideo then


------- DANCESTAGE LOADER -------

local DanceStagesDir = FILEMAN:GetDirListing("/DanceStages/", true, false)
local DanceStageSelectedNumber = tonumber(GetUserPref("OptionRowStage"))

DanceStage = DanceStageSong()
if ReadPrefFromFile("OptionRowStage") ~= nil then
	if DanceStageSelectedNumber == 1 then
		DanceStage = DanceStageSong()
	elseif DanceStageSelectedNumber == 2 then
		DanceStage = DanceStagesDir[math.random(#DanceStagesDir)]
	else
		DanceStage = DanceStagesDir[tonumber(GetUserPref("OptionRowStage"))-2]
	end;
end;
------- DANCESTAGE CONFIGURATOR -------

function CheckStageConfigurationNumber(def,conf)
	local result = def or 0
	local filetoload = StagesFolder..DanceStage.."/MapCfg.cfg";
	local content = Config.Load(conf,filetoload)
	if content then result = tonumber(content) end
	return result
end


------- DANCESTAGE LOADER 1 -------

t[#t+1] = LoadActor(StagesFolder..DanceStage.."/LoaderA.lua" )

-------------- CHARACTERS --------------

t[#t+1] = LoadActor("Characters");

------- DANCESTAGE LOADER 2 -------

if FILEMAN:DoesFileExist(StagesFolder..DanceStage.."/LoaderB.lua") then
	t[#t+1] = LoadActor(StagesFolder..DanceStage.."/LoaderB.lua" )
end

------- CAMERA -------

t[#t+1] = LoadActor(StagesFolder..DanceStage.."/Cameras.lua" )


CamRan=1
local CameraRandomList = {}
	
for i = 1, NumCameras do
	CameraRandomList[i] = i
end
	
for i = 1, NumCameras do
	local CamRandNumber = math.random(1,NumCameras)
	local TempRand = CameraRandomList[i]
		CameraRandomList[i] = CameraRandomList[CamRandNumber]
		CameraRandomList[CamRandNumber] = TempRand
end


t[#t+1] = Def.Quad{
	OnCommand=function(self)
		self:visible(false)
		:queuemessage("Camera"..CameraRandomList[6]):sleep(WaitTime[CameraRandomList[6]]):queuecommand("TrackTime");
	end;
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
};

end;

return t;