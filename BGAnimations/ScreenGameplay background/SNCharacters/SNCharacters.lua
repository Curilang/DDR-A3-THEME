--DO NOT TRY TO LOAD THIS ACTOR DIRECTLY!!
--IT WILL NOT WORK!!

local t = Def.ActorFrame{};

local function setVisibility(self)
    local song = GAMESTATE:GetCurrentSong();
    local shouldShowBGScripts = false
    if song then
        shouldShowBGScripts = not song:HasBGChanges()
        if shouldShowBGScripts then
            local opts = GAMESTATE:GetSongOptionsObject('ModsLevel_Current')
            shouldShowBGScripts = not opts:StaticBackground()
        end
    end
    local bg = SCREENMAN:GetTopScreen():GetChild("SongBackground")
    if bg then
        bg:visible(not shouldShowBGScripts);
    end
    self:visible(shouldShowBGScripts);
end

t.OnCommand = setVisibility
t.CurrentSongChangedMessageCommand = setVisibility

local charName = (GAMESTATE:Env())['SNCharacter'..
    ToEnumShortString(GAMESTATE:GetMasterPlayerNumber())] or ""

local loadWorked = false
local potentialVideo = Characters.GetDancerVideo(charName)

if potentialVideo then
    loadWorked = true
	t[#t+1] = LoadActor( potentialVideo )..{
		InitCommand=cmd(FullScreen);	
	};

end
	
return {bg=t, worked=loadWorked};