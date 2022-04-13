local bgScripts = dofile(THEME:GetAbsolutePath("BGAnimations/ScreenGameplay background/SNCharacters/SNCharacters.lua"))
if bgScripts.worked then
    return bgScripts.bg
else
    return Def.ActorFrame{}
end