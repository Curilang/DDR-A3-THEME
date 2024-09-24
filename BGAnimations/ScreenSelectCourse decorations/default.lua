local t = LoadFallbackB();

local function InputHandler(event)
	local player = event.PlayerNumber
	local MusicWheel = SCREENMAN:GetTopScreen("ScreenSelectMusic"):GetChild("MusicWheel");
	local overlay = SCREENMAN:GetTopScreen()
	if event.type == "InputEventType_Release" then return false end
	if event.DeviceInput.button == "DeviceButton_left mouse button" then
		MESSAGEMAN:Broadcast("MouseLeftClick")
	  end
end

t[#t+1] = Def.Actor{
	OnCommand=function(s)
		SCREENMAN:GetTopScreen():SetPrevScreenName("ScreenTitleMenu")
		local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
		local SB = mw:GetChild("ScrollBar")
		if not SB then return end
		SB:visible(false)
		mw:zbuffer(true):SetDrawByZPosition(true)
		SCREENMAN:GetTopScreen():AddInputCallback(InputHandler)
	end,
	OffCommand=function(self)
		SCREENMAN:GetTopScreen():RemoveInputCallback(InputHandler)
		local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
			mw:sleep(0.05):diffusealpha(1):sleep(0.05):diffusealpha(0):sleep(0.05):diffusealpha(0.5):sleep(0.05):diffusealpha(0):sleep(0.05):diffusealpha(0.25):sleep(0.05):linear(0.05):diffusealpha(0)
	end,
	MouseLeftClickMessageCommand = function(self)
		if ThemePrefs.Get("Touch") == true then
		  self:queuecommand("PlayTopPressedActor")
		end
	end;
	PlayTopPressedActorCommand = function(self)
		playTopPressedActor()
		resetPressedActors()
	end;
	CodeMessageCommand = function(self,params)
		if params.Name == "Back" then
			GAMESTATE:SetCurrentPlayMode("PlayMode_Regular")
			SCREENMAN:GetTopScreen():Cancel()
		end
	end
};

t[#t+1] = StandardDecorationFromFileOptional("Footer","Footer");

return t;