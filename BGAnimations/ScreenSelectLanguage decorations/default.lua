local t = Def.ActorFrame{
	LoadActor(THEME:GetPathB("","ModDate.lua"));
};
local xspacing = 40
local curIndex = 2;
local LangItems = { "jp", "en", "kor" };

local function MakeRowItem(LangItems, idx)
    return Def.ActorFrame{
        Name="Item"..idx;
        BeginCommand=function(s) s:playcommand(idx == curIndex and "GainFocus" or "LoseFocus") end,
        MoveScrollerMessageCommand=function(s,p)
            SCREENMAN:SystemMessage(curIndex)
            if curIndex == idx then
				s:playcommand("GainFocus")
			else
				s:playcommand("LoseFocus")
            end
        end,
        Def.ActorFrame{
            Def.Sprite{
                Texture="back",
            };
            Def.Sprite{
                Texture="color",
                InitCommand=function(s) s:blend(Blend.Add) end,
                GainFocusCommand=function(s) s:finishtweening():diffusealpha(1):diffuseshift():effectcolor1(Alpha(Color.White,0.75))
                    :effectcolor2(Alpha(Color.White,0.5)):effectperiod(0.3)
                end,
                LoseFocusCommand=function(s) s:finishtweening():stopeffect():diffusealpha(0.5) end,
            };
            Def.Sprite{
                Texture="line",
                InitCommand=function(s) s:visible(false):zoomx(0.97):zoomy(0.9) end,
                GainFocusCommand=function(s) s:visible(true):queuecommand("Animate") end,
                AnimateCommand=function(s) s:finishtweening():linear(0.15):zoom(1):linear(0.15):zoomx(0.97):zoomy(0.9)
                    :linear(0.15):zoom(1):linear(0.15):zoomx(0.97):zoomy(0.9):sleep(2):queuecommand("Animate") end,
                LoseFocusCommand=function(s) s:stopeffect():visible(false) end,
            };
        };
        Def.Sprite{
            Texture=LangItems,
        };  
    };
end

local ItemList = {};
for i=1,#LangItems do
    ItemList[#ItemList+1] = MakeRowItem(LangItems[i],i)
end

local function input(event, param)
    if not event.PlayerNumber or not event.button then
        return false
    end

    if event.type ~= "InputEventType_Release" then
        if  event.GameButton == "Start" then
            SetUserPref("OptionRowLanguage",LangItems[curIndex])
            SOUND:PlayOnce(THEME:GetPathS("common","start"))
            Language()
            SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen")
        elseif event.GameButton == "Back" then
            SOUND:StopMusic()
            SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToPrevScreen")
        elseif event.GameButton == "MenuRight" or event.GameButton == "MenuUp" then
            if curIndex >= #LangItems then
                curIndex = #LangItems
            else
                curIndex = curIndex+1
            end
            SOUND:PlayOnce(THEME:GetPathS("","x_frz_expln_soft"))
        elseif event.GameButton == "MenuLeft" or event.GameButton == "MenuDown" then
            if curIndex == 1 then
                curIndex = 1
            else
                curIndex = curIndex-1
            end
            SOUND:PlayOnce(THEME:GetPathS("","x_frz_expln_soft"))
        end
        MESSAGEMAN:Broadcast("MoveScroller");
    end
    return false
end

t[#t+1] = Def.ActorFrame{
    InitCommand=function(s) s:Center():queuecommand("Capture") end,
    CaptureCommand=function(s)
        SOUND:PlayOnce(THEME:GetPathS("","x_frz_expln_soft"))
		SCREENMAN:GetTopScreen():AddInputCallback(input)
    end,
    Def.ActorFrame{
        OffCommand=function(s) s:linear(0.2):zoomy(0) end,
        Def.Sprite{
            Texture=Model().."base",
			InitCommand=function(s) s:zoom(0.667):x(0.7) end,
			OnCommand=function(s) s:zoomy(0):linear(0.2):zoomy(0.667) end,
        };
        Def.ActorScroller{
            InitCommand=function(s) s:zoom(0.67):y(-36) end,
            OffCommand=function(s) s:visible(false) end,
            SecondsPerItem=0;
            NumItemsToDraw=10;
            TransformFunction=function(s,ofc,itemIndex,numItems)
                s:x((ofc*280)-280);
            end,
            children=ItemList;
        };
    };
    Def.ActorFrame{
        Name="Top",
        InitCommand=function(s) s:x(1):y(-102):zoomx(0.67):zoomy(0) end,
        OnCommand=function(s) s:linear(0.2):zoomy(0.67) end,
        OffCommand=function(s) s:linear(0.2):zoomy(0) end,
        Def.Sprite{
            Texture=THEME:GetPathG("","ScreenSelectProfile/"..Model().."upper"),
        };
        Def.Sprite{
            BeginCommand=function(s) s:playcommand("MoveScroller") end,
            MoveScrollerMessageCommand=function(s)
                if curIndex == 1 then
                    s:Load(THEME:GetPathB("ScreenSelectLanguage","decorations/lang_jp"))
                elseif curIndex == 2 then
                    s:Load(THEME:GetPathB("ScreenSelectLanguage","decorations/lang_en"))
                else
                    s:Load(THEME:GetPathB("ScreenSelectLanguage","decorations/lang_kor"))
                end
            end
        };
    };
    Def.ActorFrame{
        Name="Bottom",
        InitCommand=function(s) s:x(1):y(116):zoomx(0.67):zoomy(0) end,
        OnCommand=function(s) s:linear(0.2):zoomy(0.67) end,
        OffCommand=function(s) s:linear(0.2):zoomy(0) end,
        Def.Sprite{
            Texture=THEME:GetPathG("","ScreenSelectProfile/"..Model().."bottom"),
        };
        Def.Sprite{
            BeginCommand=function(s) s:playcommand("MoveScroller") end,
            MoveScrollerMessageCommand=function(s)
                if curIndex == 1 then
                    s:Load(THEME:GetPathB("ScreenSelectLanguage","decorations/"..Model().."japanese"))
                elseif curIndex == 2 then
                    s:Load(THEME:GetPathB("ScreenSelectLanguage","decorations/"..Model().."english"))
                else
                    s:Load(THEME:GetPathB("ScreenSelectLanguage","decorations/"..Model().."korean"))
                end
            end
        };
    };
}

return t;