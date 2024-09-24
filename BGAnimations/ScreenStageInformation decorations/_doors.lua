local t = Def.ActorFrame{};

if IsGoldenLeague() then
	t[#t+1] = Def.ActorFrame{
	Def.ActorFrame{
		AnimCloseCommand=function(s) s:sleep(0.32):queuecommand("Close") end,
		CloseCommand=function(s) 
			local sound = THEME:GetPathS("","DoorClose")
			SOUND:PlayOnce(StreamingSound(sound)) 
		end,
		AnimOpenCommand=function(s) s:queuecommand("Open") end,
		OpenCommand=function(s)
			local sound = THEME:GetPathS("","DoorOpen")
			SOUND:PlayOnce(StreamingSound(sound)) 
		end,
	};
	Def.ActorFrame{
		Def.Quad{
			InitCommand=function(s) s:diffuse(color("#1f2e45")):FullScreen():diffusealpha(0) end,
			AnimCloseCommand=function(s) s:diffusealpha(1) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):linear(0.05):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"))..{
			InitCommand=function(s) s:Center():diffusealpha(0) end,
			AnimCloseCommand=function(s) 
				s:zoom(1.83):sleep(0.1):linear(0.2)
				s:zoom(1.63):diffusealpha(1):decelerate(0.7)
				s:zoom(1.33)
			end,
			AnimOpenCommand=function(s) 
				s:zoom(1.33):diffusealpha(1):linear(0.05):diffusealpha(0)
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"))..{
			InitCommand=function(s) s:Center():blend('BlendMode_Add'):diffusealpha(0) end,
			AnimCloseCommand=function(s)
				s:zoom(1.83):sleep(0.1):linear(0.2)
				s:zoom(1.63):diffusealpha(1):decelerate(0.7)
				s:zoom(1.33):diffusealpha(0)
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/shadow"))..{
			InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
			AnimCloseCommand=function(s) s:diffusealpha(1) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):linear(0.05):diffusealpha(0) end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/lines"),
			InitCommand=function(s) s:FullScreen():diffusealpha(0)
				local w = DISPLAY:GetDisplayWidth() / s:GetWidth();
				local h = DISPLAY:GetDisplayHeight() / s:GetHeight();
				s:customtexturerect(2,0.8,w,h):texcoordvelocity(0,1)
			end;
			AnimCloseCommand=function(s) s:diffusealpha(0.3) end,
			AnimOpenCommand=function(s) s:diffusealpha(0.5):linear(0.05):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/circle"))..{
			InitCommand=function(s) s:diffusealpha(0):xy(_screen.cx,_screen.cy-200):zoom(2.5):blend('BlendMode_Add'):spin():effectmagnitude(0,0,-10) end,
			AnimCloseCommand=function(s) s:diffusealpha(0):linear(0.3):diffusealpha(0.4) end, 
			AnimOpenCommand=function(s) s:diffusealpha(0.4):linear(0.05):diffusealpha(0) end, 
		};
		Def.ActorFrame{
			InitCommand=function(s) s:Center():blend('BlendMode_Add'):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:diffusealpha(0):sleep(0.1):linear(0.7):diffusealpha(0.6):linear(0.7):diffusealpha(0) end,
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"),
				AnimCloseCommand=function(s) s:sleep(0.1):linear(0.7):addx(100):addy(-60):linear(0.7):addx(100):addy(-60) end,
			};
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"),
				AnimCloseCommand=function(s) s:sleep(0.1):linear(0.7):addx(-60):addy(-100):linear(0.7):addx(-60):addy(-100) end,
			};
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"),
				AnimCloseCommand=function(s) s:sleep(0.1):linear(0.7):addx(100):addy(100):linear(0.7):addx(100):addy(100) end,
			};
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"),
				AnimCloseCommand=function(s) s:sleep(0.1):linear(0.7):addx(-100):addy(100):linear(0.7):addx(-100):addy(100) end,
			};
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"),
			InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy+119):diffusealpha(0) end,
			AnimCloseCommand=function(s)
				s:diffusealpha(1):zoom(1.167):decelerate(0.7):zoom(0.667):decelerate(0.12):y(_screen.cy+89)
			end,
			AnimOpenCommand=function(s) s:diffusealpha(1)
				s:y(_screen.cy+89):zoom(0.667):linear(0.25):addx(100):zoom(1):diffusealpha(0)
				s:sleep(0.1):addx(-100):y(_screen.cy+119)
			end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"),
			InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy+119):diffusealpha(0) end,
			AnimCloseCommand=function(s)
				s:diffusealpha(1):zoom(1.167):decelerate(0.7):diffusealpha(0):zoom(0.667)
			end,
			AnimOpenCommand=function(s) s:zoom(1.667):diffusealpha(0) end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"),
			InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy+119):rotationy(-180):diffusealpha(0) end,
			AnimCloseCommand=function(s)
				s:diffusealpha(1):zoom(1.167):decelerate(0.7):zoom(0.667):decelerate(0.12):y(_screen.cy+89)
			end,
			AnimOpenCommand=function(s) s:diffusealpha(1)
				s:y(_screen.cy+89):zoom(0.667):linear(0.25):addx(-100):zoom(1):diffusealpha(0)
				s:sleep(0.1):addx(100):y(_screen.cy+119)
			end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"),
			InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy+119):rotationy(-180):diffusealpha(0) end,
			AnimCloseCommand=function(s)
				s:diffusealpha(1):zoom(1.167):decelerate(0.7):diffusealpha(0):zoom(0.667)
			end,
			AnimOpenCommand=function(s) s:zoom(1.667):diffusealpha(0) end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"),
			InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy-120):rotationy(-180):rotationz(-180):diffusealpha(0) end,
			AnimCloseCommand=function(s)
				s:diffusealpha(1):zoom(1.167):decelerate(0.7):zoom(0.667):decelerate(0.12):y(_screen.cy-95)
			end,
			AnimOpenCommand=function(s) s:diffusealpha(1)
				s:y(_screen.cy-95):zoom(0.667):linear(0.25):addx(100):zoom(1):diffusealpha(0)
				s:sleep(0.1):addx(-100):y(_screen.cy-120)
			end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"),
			InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy-120):rotationy(-180):rotationz(-180):diffusealpha(0) end,
			AnimCloseCommand=function(s)
				s:diffusealpha(1):zoom(1.167):decelerate(0.7):diffusealpha(0):zoom(0.667)
			end,
			AnimOpenCommand=function(s) s:zoom(1.667):diffusealpha(0) end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"),
			InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy-120):rotationz(-180):diffusealpha(0) end,
			AnimCloseCommand=function(s)
				s:diffusealpha(1):zoom(1.167):decelerate(0.7):zoom(0.667):decelerate(0.12):y(_screen.cy-95)
			end,
			AnimOpenCommand=function(s) s:diffusealpha(1)
				s:y(_screen.cy-95):zoom(0.667):linear(0.25):addx(-100):zoom(1):diffusealpha(0)
				s:sleep(0.1):addx(100):y(_screen.cy-120)
			end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"),
			InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy-120):rotationz(-180):diffusealpha(0) end,
			AnimCloseCommand=function(s)
				s:diffusealpha(1):zoom(1.167):decelerate(0.7):diffusealpha(0):zoom(0.667)
			end,
			AnimOpenCommand=function(s) s:zoom(1.667):diffusealpha(0) end,
		};
		Def.ActorFrame{
			InitCommand=function(s) s:Center() end,
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/arrow"),
				InitCommand=function(s) s:rotationz(0):vertalign(bottom):blend('BlendMode_Add'):diffusealpha(0) end,
				AnimCloseCommand=function(s)
					s:zoom(0.367)
					s:sleep(0.06):decelerate(0.6):rotationz(720)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5):decelerate(0.2):addy(-105)
					s:zoom(0.667)
				end,
				AnimOpenCommand=function(s) s:rotationz(0):addy(105):linear(0.05):diffusealpha(0) end,
			};
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/arrow"),
				InitCommand=function(s) s:rotationz(90):vertalign(bottom):blend('BlendMode_Add'):diffusealpha(0) end,
				AnimCloseCommand=function(s)
					s:zoom(0.367)
					s:sleep(0.06):decelerate(0.6):rotationz(90+720)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5):decelerate(0.2):addx(340)
					s:zoom(0.667)
				end,
				AnimOpenCommand=function(s) s:rotationz(90):addx(-340):linear(0.05):diffusealpha(0) end,
			};
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/arrow"),
				InitCommand=function(s) s:rotationz(180):vertalign(bottom):blend('BlendMode_Add'):diffusealpha(0) end,
				AnimCloseCommand=function(s)
					s:zoom(0.367)
					s:sleep(0.06):decelerate(0.6):rotationz(180+720)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5):decelerate(0.2):addy(105)
					s:zoom(0.667)
				end,
				AnimOpenCommand=function(s) s:rotationz(180):addy(-105):linear(0.05):diffusealpha(0) end,
			};
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/arrow"),
				InitCommand=function(s) s:rotationz(270):vertalign(bottom):blend('BlendMode_Add'):diffusealpha(0) end,
				AnimCloseCommand=function(s)
					s:zoom(0.367)
					s:sleep(0.06):decelerate(0.6):rotationz(270+720)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5)
					s:sleep(0.06):diffusealpha(0)
					s:sleep(0.06):diffusealpha(0.5):decelerate(0.2):addx(-340)
					s:zoom(0.667)
				end,
				AnimOpenCommand=function(s) s:rotationz(270):addx(340):linear(0.05):diffusealpha(0) end,
			};
		};
	};
	Def.ActorFrame{
		InitCommand=function(s) s:CenterX() end,	
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/"..Model().."door"))..{
			InitCommand=function(s) s:zoom(0.667):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:y(SCREEN_TOP-30):sleep(0.68):linear(0.1):y(SCREEN_TOP+75):diffusealpha(1) end, 
			AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_TOP+75):linear(0.25):y(SCREEN_TOP-30):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/"..Model().."door"))..{
			InitCommand=function(s) s:rotationz(180):zoom(0.667):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:y(SCREEN_BOTTOM+30):sleep(0.68):linear(0.1):y(SCREEN_BOTTOM-75):diffusealpha(1) end, 
			AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_BOTTOM-75):linear(0.25):y(SCREEN_BOTTOM+30):diffusealpha(0) end,
		};
		Def.ActorFrame{
			InitCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0.9");effectperiod,0.47);
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/light"))..{
				InitCommand=function(s) s:zoom(0.667):diffusealpha(0) end,
				AnimCloseCommand=function(s) s:y(SCREEN_TOP-30):sleep(0.6):linear(0.1):y(SCREEN_TOP+61):sleep(0.3):linear(0.2):diffusealpha(1) end,
				AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_TOP+61):linear(0.25):y(SCREEN_TOP-44):diffusealpha(0) end,
			};
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/light"))..{
				InitCommand=function(s) s:rotationz(180):zoom(0.667):diffusealpha(0) end,
				AnimCloseCommand=function(s) s:y(SCREEN_BOTTOM+30):sleep(0.6):linear(0.1):y(SCREEN_BOTTOM-61):sleep(0.3):linear(0.2):diffusealpha(1) end, 
				AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_BOTTOM-61):linear(0.25):y(SCREEN_BOTTOM+44):diffusealpha(0) end,
			};
		};
	};
};
else
	t[#t+1] = Def.ActorFrame{
	Def.ActorFrame{
		AnimCloseCommand=function(s) s:sleep(0.32):queuecommand("Close") end,
		CloseCommand=function(s) 
			local sound = THEME:GetPathS("","DoorClose")
			SOUND:PlayOnce(StreamingSound(sound)) 
		end,
		AnimOpenCommand=function(s) s:queuecommand("Open") end,
		OpenCommand=function(s)
			local sound = THEME:GetPathS("","DoorOpen")
			SOUND:PlayOnce(StreamingSound(sound)) 
		end,
	};
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffusecolor(Color.Black):diffusealpha(0) end,
		AnimCloseCommand=function(s) s:diffusealpha(1) end,
		AnimOpenCommand=function(s) s:diffusealpha(1):linear(0.05):diffusealpha(0) end,
	};
	Def.ActorFrame{
		Def.Quad{
			InitCommand=function(s) s:FullScreen():diffuse(Color.White):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:diffusealpha(0.1) end,
			AnimOpenCommand=function(s) s:diffusealpha(0.1):linear(0.5):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/squares"))..{
			InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:sleep(0.6):linear(0.1):diffusealpha(0.06) end,
			AnimOpenCommand=function(s) s:diffusealpha(0.06):linear(0.05):diffusealpha(0) end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/lines"),
			InitCommand=function(self) self:FullScreen():diffusealpha(0)
				local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
				local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
				self:customtexturerect(2,0.8,w,h):texcoordvelocity(0,1)
			end;
			AnimCloseCommand=function(s) s:diffusealpha(0.5) end,
			AnimOpenCommand=function(s) s:diffusealpha(0.5):linear(0.05):diffusealpha(0) end,
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(CenterX);	
		LoadActor(THEME:GetPathG("","_doors/shadow"))..{
			InitCommand=function(s) s:zoomtowidth(SCREEN_WIDTH):y(SCREEN_TOP+30):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_TOP+71):diffusealpha(1) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_TOP+71):linear(0.15):y(SCREEN_TOP+30):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/shadow"))..{
			InitCommand=function(s) s:rotationx(180):zoomtowidth(SCREEN_WIDTH):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_BOTTOM-71):diffusealpha(1) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_BOTTOM-71):linear(0.15):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/center_circle"))..{
			InitCommand=function(s) s:y(_screen.cy-2.2):diffusealpha(0):fadeleft(0.1) end,
			AnimCloseCommand=function(s) s:zoom(0.347):rotationz(45):sleep(0.6):linear(0.7):rotationz(0):zoom(0.447):diffusealpha(0.5) end,
			AnimOpenCommand=function(s) s:diffusealpha(0.5):zoom(0.447):linear(0.15):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/center_circle"))..{
			InitCommand=function(s) s:y(_screen.cy-2.2):diffusealpha(0):fadeleft(0.1) end,
			AnimCloseCommand=function(s) s:zoom(0.647):rotationz(0):sleep(0.6):linear(0.7):rotationz(45):zoom(0.447):diffusealpha(0.5):linear(0.1):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/center_outline"))..{
			InitCommand=function(s) s:y(_screen.cy-2.2):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:zoom(0.3):sleep(0.6):linear(0.55):diffusealpha(0.5):zoom(0.447) end,
			AnimOpenCommand=function(s) s:diffusealpha(0.5):zoom(0.447):linear(0.15):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/center_lines_up"))..{
			InitCommand=function(s) s:y(_screen.cy-2.2):zoomy(0.447):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:zoomx(0.347):sleep(1.1):linear(0.2):zoomx(0.447):diffusealpha(1) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):zoomx(0.447):linear(0.15):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/center_lines_center"))..{
			InitCommand=function(s) s:y(_screen.cy-2.2):zoomy(0.447):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:zoomx(0.4):sleep(1.2):linear(0.2):zoomx(0.447):diffusealpha(1) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):zoomx(0.447):linear(0.15):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/flare.png"))..{
			InitCommand=function(s) s:zoom(0.4):x(-5):blend(Blend.Add):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:y(SCREEN_TOP+12):diffusealpha(0):sleep(1.034):linear(0.3):diffusealpha(1):diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.9")):effectperiod(0.02) end,
			AnimOpenCommand=function(s) s:linear(0.25):y(SCREEN_TOP-30):diffusealpha(0) end,
		};
		--Doors
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/top"))..{
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+30):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_TOP+61):diffusealpha(1) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_TOP+61):linear(0.25):y(SCREEN_TOP+30):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/bottom"))..{
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_BOTTOM-61):diffusealpha(1) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_BOTTOM-61):linear(0.25):y(SCREEN_BOTTOM-30):diffusealpha(0) end,			
		};
		--Squares
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/upquad"))..{
			InitCommand=function(s) s:zoom(0.667):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:y(SCREEN_TOP+61):cropleft(0.5):cropright(0.5):sleep(0.68):linear(0.1):diffusealpha(1):linear(1.5):cropleft(0):cropright(0) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_TOP+61):cropleft(0):cropright(0):linear(0.25):y(SCREEN_TOP+30):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/downquad"))..{
			InitCommand=function(s) s:zoom(0.667):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:y(SCREEN_BOTTOM-61):cropleft(0.5):cropright(0.5):sleep(0.68):linear(0.1):diffusealpha(1):linear(1.5):cropleft(0):cropright(0) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_BOTTOM-61):cropleft(0):cropright(0):linear(0.25):y(SCREEN_BOTTOM-30):diffusealpha(0) end,			
		};
		--Lights
		Def.ActorFrame{
		InitCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0.9");effectperiod,0.47);
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/lightup"))..{
				InitCommand=function(s) s:zoom(0.667):diffusealpha(0) end,
				AnimCloseCommand=function(s) s:y(SCREEN_TOP+61):sleep(0.8):linear(0.25):diffusealpha(1) end,
				AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_TOP+61):linear(0.25):y(SCREEN_TOP+30):diffusealpha(0) end,
			};
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/lightdown"))..{
				InitCommand=function(s) s:zoom(0.667):diffusealpha(0) end,
				AnimCloseCommand=function(s) s:y(SCREEN_BOTTOM-61):sleep(0.8):linear(0.25):diffusealpha(1) end,
				AnimOpenCommand=function(s) s:diffusealpha(1):y(SCREEN_BOTTOM-61):linear(0.25):y(SCREEN_BOTTOM-30):diffusealpha(0) end,				
			};
		};
	};
	LoadActor(THEME:GetPathG("","_doors/flare_center.png"))..{
		InitCommand=function(s) s:Center():FullScreen():blend(Blend.Add):diffusealpha(0) end,
		AnimOpenCommand=function(s) s:zoom(1):diffusealpha(0.5):linear(0.45):diffusealpha(0):zoom(6*1) end,
	};
};
end

return t;