return Def.ActorFrame{
	InitCommand=function(s) s:CenterX():y(SCREEN_BOTTOM-117):zoom(0.667) end,
	Def.Sprite{
		Name="In this game, use your feet and dance to the beat.",
		Texture="tex1",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(0):sleep(5.8):diffusealpha(1):sleep(6):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="Step on the arrows and follow the rhythm. Don't match the timing with your eyes,",
		Texture="tex1",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(1):sleep(12):diffusealpha(1):sleep(4.7):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="feel the rhythm with your soul.",
		Texture="tex1",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(16.8):diffusealpha(1):sleep(3):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="Com'on, let me hear you say",
		Texture="tex2",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(0):sleep(20):diffusealpha(1):sleep(2):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="RIGHT!",
		Texture="tex2",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(1):sleep(22):diffusealpha(1):sleep(2):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="LEFT!",
		Texture="tex2",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(24):diffusealpha(1):sleep(2):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="UP! UP!",
		Texture="tex3",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(0):sleep(26):diffusealpha(1):sleep(2):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="DOWN! DOWN!",
		Texture="tex3",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(1):sleep(28):diffusealpha(1):sleep(2):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="UP! UP! UP!",
		Texture="tex3",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(30):diffusealpha(1):sleep(4):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="I wanna hear you say “DOWN”!",
		Texture="tex3",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(3):sleep(34):diffusealpha(1):sleep(6):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="Oh Yeah! Oh Yeah! Place your feet on the left and right arrows.",
		Texture="tex4",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(0):sleep(40.5):diffusealpha(1):sleep(4):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="Don't return your feet to the center. Just keep standing there!",
		Texture="tex4",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(1):sleep(44.6):diffusealpha(1):sleep(4.4):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="Com'on, let me hear you say",
		Texture="tex2",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(0):sleep(50):diffusealpha(1):sleep(2):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="RIGHT!",
		Texture="tex2",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(1):sleep(52):diffusealpha(1):sleep(2):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="LEFT!",
		Texture="tex2",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(54):diffusealpha(1):sleep(2):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="RIGHT! LEFT!",
		Texture="tex5",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(0):sleep(56):diffusealpha(1):sleep(2):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="LEFT! RIGHT!",
		Texture="tex5",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(1):sleep(58):diffusealpha(1):sleep(2):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="RIGHT! LEFT! LEFT!",
		Texture="tex5",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(60):diffusealpha(1):sleep(4):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="LEFT! RIGHT! RIGHT!",
		Texture="tex5",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(3):sleep(64):diffusealpha(1):sleep(4):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="I wanna hear you say",
		Texture="tex6",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(0):sleep(68):diffusealpha(1):sleep(2):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="RIGHT! RIGHT! LEFT! LEFT! RIGHT! LEFT! RIGHT!",
		Texture="tex6",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(1):sleep(70):diffusealpha(1):sleep(7.8):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="JUMP!",
		Texture="tex6",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(78):diffusealpha(1):sleep(1.8):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="JUMP!",
		Texture="tex6",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(80):diffusealpha(1):sleep(1.8):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="JUMP!",
		Texture="tex6",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(82):diffusealpha(1):sleep(1.8):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="Let me hear you say",
		Texture="tex7",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(0):sleep(84.5):diffusealpha(1):sleep(1.5):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="DOWN! DOWN! RIGHT!",
		Texture="tex7",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(1):sleep(86):diffusealpha(1):sleep(0.8):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="D D R !",
		Texture="tex7",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(87):diffusealpha(1):sleep(0.8):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="DOWN! DOWN! RIGHT!",
		Texture="tex7",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(1):sleep(88):diffusealpha(1):sleep(0.8):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="D D R !",
		Texture="tex7",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(89):diffusealpha(1):sleep(1.3):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="Let me hear you say",
		Texture="tex7",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(0):sleep(92.5):diffusealpha(1):sleep(1.5):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="DOWN! DOWN! RIGHT!",
		Texture="tex7",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(1):sleep(94):diffusealpha(1):sleep(0.8):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="D D R !",
		Texture="tex7",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(95):diffusealpha(1):sleep(0.8):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="DOWN! DOWN! RIGHT!",
		Texture="tex7",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(1):sleep(96):diffusealpha(1):sleep(0.8):diffusealpha(0) end,
	};
	Def.Sprite{
		Name="D D R !",
		Texture="tex7",
		InitCommand=function(s) s:animate(0):diffusealpha(0) end,
		OnCommand=function(s) s:setstate(2):sleep(97):diffusealpha(1):sleep(1.3):diffusealpha(0) end,
	};
};