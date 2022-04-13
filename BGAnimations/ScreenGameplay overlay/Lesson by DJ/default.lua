local SMSleep

if GetUserPref("OptionRowSongTiming")=='DDR' or IsHowToPlay() then
	SMSleep = 0
else
	SMSleep = 2
end

return Def.ActorFrame{
	InitCommand=function(s) s:x(_screen.cx):y(SCREEN_BOTTOM-117):zoom(0.667) end,
	LoadActor("IN THIS GAME.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+5.8):diffusealpha(1)
		s:sleep(6):diffusealpha(0) end,
	};
	LoadActor("STEP ON THE ARROWS.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+12):diffusealpha(1)
		s:sleep(4.7):diffusealpha(0) end,
	};
	LoadActor("FEEL THE RHYTHM.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+16.8):diffusealpha(1)
		s:sleep(3):diffusealpha(0) end,
	};
	LoadActor("COM'ON.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+20):diffusealpha(1)
		s:sleep(2):diffusealpha(0) end,
	};
	LoadActor("RIGHT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+22):diffusealpha(1)
		s:sleep(2):diffusealpha(0) end,
	};
	LoadActor("LEFT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+24):diffusealpha(1)
		s:sleep(2):diffusealpha(0) end,
	};
	LoadActor("UP! UP!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+26):diffusealpha(1)
		s:sleep(2):diffusealpha(0) end,
	};
	LoadActor("DOWN! DOWN!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+28):diffusealpha(1)
		s:sleep(2):diffusealpha(0) end,
	};
	LoadActor("UP! UP! UP!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+30):diffusealpha(1)
		s:sleep(4):diffusealpha(0) end,
	};
	LoadActor("SAY DOWN!.png")..{
		InitCommand=function(s) 
		s:y(-10):diffusealpha(0):sleep(34):diffusealpha(1)
		s:sleep(6):diffusealpha(0) end,
	};
	LoadActor("OH YEAH! OH YEAH!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+40.5):diffusealpha(1)
		s:sleep(4):diffusealpha(0) end,
	};
	LoadActor("DON'T RETURN.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+44.6):diffusealpha(1)
		s:sleep(4.4):diffusealpha(0) end,
	};
	--Com'on, let me hear you say
	LoadActor("COM'ON.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+50):diffusealpha(1)
		s:sleep(2):diffusealpha(0) end,
	};
	LoadActor("RIGHT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+52):diffusealpha(1)
		s:sleep(2):diffusealpha(0) end,
	};
	LoadActor("LEFT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+54):diffusealpha(1)
		s:sleep(2):diffusealpha(0) end,
	};
	LoadActor("RIGHT! LEFT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+56):diffusealpha(1)
		s:sleep(2):diffusealpha(0) end,
	};
	LoadActor("LEFT! RIGHT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+58):diffusealpha(1)
		s:sleep(2):diffusealpha(0) end,
	};
	LoadActor("RIGHT! LEFT! LEFT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+60):diffusealpha(1)
		s:sleep(4):diffusealpha(0) end,
	};
	LoadActor("LEFT! RIGHT! RIGHT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+64):diffusealpha(1)
		s:sleep(3.6):diffusealpha(0) end,
	};
	LoadActor("I WANNA.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+68):diffusealpha(1)
		s:sleep(2):diffusealpha(0) end,
	};
	LoadActor("RIGHT! RIGHT! LEFT! LEFT! RIGHT! LEFT! RIGHT!.png")..{
		InitCommand=function(s) 
		s:y(-10):diffusealpha(0):sleep(70):diffusealpha(1)
		s:sleep(7.8):diffusealpha(0) end,
	};
	LoadActor("JUMP!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+78):diffusealpha(1)
		s:sleep(1.8):diffusealpha(0) end,
	};
	LoadActor("JUMP!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+80):diffusealpha(1)
		s:sleep(1.8):diffusealpha(0) end,
	};
	LoadActor("JUMP!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+82):diffusealpha(1)
		s:sleep(1.8):diffusealpha(0) end,
	};
	LoadActor("LET ME.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+84.5):diffusealpha(1)
		s:sleep(1.5):diffusealpha(0) end,
	};
	LoadActor("DOWN! DOWN! RIGHT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+86):diffusealpha(1)
		s:sleep(0.8):diffusealpha(0) end,
	};
	LoadActor("D D R !.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+87):diffusealpha(1)
		s:sleep(0.8):diffusealpha(0) end,
	};
	LoadActor("DOWN! DOWN! RIGHT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+88):diffusealpha(1)
		s:sleep(0.8):diffusealpha(0) end,
	};
	LoadActor("D D R !.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+89):diffusealpha(1)
		s:sleep(1.3):diffusealpha(0) end,
	};
	LoadActor("LET ME.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+92.5):diffusealpha(1)
		s:sleep(1.5):diffusealpha(0) end,
	};
	LoadActor("DOWN! DOWN! RIGHT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+94):diffusealpha(1)
		s:sleep(0.8):diffusealpha(0) end,
	};
	LoadActor("D D R !.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+95):diffusealpha(1)
		s:sleep(0.8):diffusealpha(0) end,
	};
	LoadActor("DOWN! DOWN! RIGHT!.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+96):diffusealpha(1)
		s:sleep(0.8):diffusealpha(0) end,
	};
	LoadActor("D D R !.png")..{
		InitCommand=function(s) 
		s:diffusealpha(0):sleep(SMSleep+97):diffusealpha(1)
		s:sleep(1.3):diffusealpha(0) end,
	};
};