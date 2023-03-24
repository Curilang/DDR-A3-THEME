local function WheelMove(mov)
  local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel");
  mw:Move(mov)
end

local function InputHandler(event)
  local player = event.PlayerNumber
  local MusicWheel = SCREENMAN:GetTopScreen("ScreenSelectMusic"):GetChild("MusicWheel");
  if event.type == "InputEventType_Release" then return false end
  if MusicWheel ~= nil then
    if event.GameButton == "MenuLeft" and GAMESTATE:IsPlayerEnabled(player) then
      SOUND:PlayOnce(THEME:GetPathS("","_MusicWheel change"))
    end
    if event.GameButton == "MenuRight" and GAMESTATE:IsPlayerEnabled(player) then
      SOUND:PlayOnce(THEME:GetPathS("","_MusicWheel change"))
    end
    if event.GameButton == "MenuDown" and GAMESTATE:IsPlayerEnabled(player) and PREFSMAN:GetPreference("OnlyDedicatedMenuButtons") then
      if MusicWheel:GetSelectedType() == 'WheelItemDataType_Song' then
        WheelMove(3)
        if MusicWheel:GetSelectedType() ~= 'WheelItemDataType_Song' then
          WheelMove(-2)
          if MusicWheel:GetSelectedType() == "WheelItemDataType_Song" then
            WheelMove(2)
            if MusicWheel:GetSelectedType() ~= "WheelItemDataType_Song" then
              WheelMove(-1)
              if MusicWheel:GetSelectedType() == "WheelItemDataType_Song" then
                WheelMove(1)
              end
            end
          end
        end
    else
      MusicWheel:Move(1)
    end
    MusicWheel:Move(0)
    SOUND:PlayOnce(THEME:GetPathS("","_MusicWheel change"))
    end
    if event.GameButton == "MenuUp" and GAMESTATE:IsPlayerEnabled(player) and PREFSMAN:GetPreference("OnlyDedicatedMenuButtons") then
      if MusicWheel:GetSelectedType() == 'WheelItemDataType_Song' then
        WheelMove(-3)
        if MusicWheel:GetSelectedType() ~= 'WheelItemDataType_Song' then
          WheelMove(2)
          if MusicWheel:GetSelectedType() == "WheelItemDataType_Song" then
            WheelMove(-2)
            if MusicWheel:GetSelectedType() ~= "WheelItemDataType_Song" then
              WheelMove(1)
              if MusicWheel:GetSelectedType() == "WheelItemDataType_Song" then
                WheelMove(-1)
              end
            end
          end
        end
      else
        WheelMove(-1)
      end
      WheelMove(0)
      SOUND:PlayOnce(THEME:GetPathS("","_MusicWheel change"))
    end
  end
end

return Def.ActorFrame{
  OnCommand=function(self) SCREENMAN:GetTopScreen():AddInputCallback(InputHandler) end;
  OffCommand=function(self) SCREENMAN:GetTopScreen():RemoveInputCallback(InputHandler) end,
  SongChosenMessageCommand=function(self) self:playcommand("Off") end;
  SongUnchosenMessageCommand=function(self)
    self:sleep(0.5):queuecommand("On");
  end;
};