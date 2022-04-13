local t = Def.ActorFrame {};

local numFastP1 = 0;
local numSlowP1 = 0;
local numFastP2 = 0;
local numSlowP2 = 0;

function ReadOrCreateFastNumForPlayer(PlayerUID, MyValue)
	local File = RageFileUtil:CreateRageFile()
	if File:Open("Save/TimingJudgements/"..PlayerUID.."_Fast.txt",1) then 
		local str = File:Read();
		MyValue =str;
	else
		File:Open("Save/TimingJudgements/"..PlayerUID.."_Fast.txt",2);
		File:Write("Visible");
		MyValue="Visible";
	end
	File:Close();
	return MyValue;
end

function SaveFastNumForPlayer( PlayerUID, MyValue)
	local File = RageFileUtil:CreateRageFile();
	File:Open("Save/TimingJudgements/"..PlayerUID.."_Fast.txt",2);
	File:Write(tostring(MyValue));
	File:Close();
end

function ReadOrCreateSlowNumForPlayer(PlayerUID, MyValue)
	local File = RageFileUtil:CreateRageFile()
	if File:Open("Save/TimingJudgements/"..PlayerUID.."_Slow.txt",1) then 
		local str = File:Read();
		MyValue =str;
	else
		File:Open("Save/TimingJudgements/"..PlayerUID.."_Slow.txt",2);
		File:Write("Visible");
		MyValue="Visible";
	end
	File:Close();
	return MyValue;
end

function SaveSlowNumForPlayer( PlayerUID, MyValue)
	local File = RageFileUtil:CreateRageFile();
	File:Open("Save/TimingJudgements/"..PlayerUID.."_Slow.txt",2);
	File:Write(tostring(MyValue));
	File:Close();
end

if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
t[#t+1] = LoadFont("_arial black 28px")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+0);
		JudgmentMessageCommand=function(self, param)
			if param.Player == PLAYER_1 then
				if param.TapNoteScore == 'TapNoteScore_W1' or 
				param.TapNoteScore == 'TapNoteScore_W5' or 
				param.TapNoteScore == 'TapNoteScore_Miss' or 
				param.TapNoteScore == 'TapNoteScore_HitMine' or 
				param.TapNoteScore == 'TapNoteScore_AvoidMine' or 
				param.HoldNoteScore then 
				else
					if param.Early then
						numFastP1=numFastP1+1;
						--self:settext("FastNum : "..numFastP1);
					else
						numSlowP1=numSlowP1+1;
					end
				end
			end
		end;
		OffCommand=function(self)
			-- SaveFastNumForPlayer(PROFILEMAN:GetProfile(PLAYER_1):GetGUID(),numFastP1);
			-- SaveSlowNumForPlayer(PROFILEMAN:GetProfile(PLAYER_1):GetGUID(),numSlowP1);
			
			setenv("numFastP1",numFastP1);
			setenv("numSlowP1",numSlowP1);
		end;
};
end;

if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
t[#t+1] = LoadFont("_arial black 28px")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+0);
		JudgmentMessageCommand=function(self, param)
			if param.Player == PLAYER_2 then
				if param.TapNoteScore == 'TapNoteScore_W1' or 
				param.TapNoteScore == 'TapNoteScore_W5' or 
				param.TapNoteScore == 'TapNoteScore_Miss' or 
				param.TapNoteScore == 'TapNoteScore_HitMine' or 
				param.TapNoteScore == 'TapNoteScore_AvoidMine' or 
				param.HoldNoteScore then 
				else
					if param.Early then
						numFastP2=numFastP2+1;
					else
						numSlowP2=numSlowP2+1;
					end
				end
			end
		end;
		OffCommand=function(self)
			-- SaveFastNumForPlayer(PROFILEMAN:GetProfile(PLAYER_2):GetGUID(),numFastP2);
			-- SaveSlowNumForPlayer(PROFILEMAN:GetProfile(PLAYER_2):GetGUID(),numSlowP2);
			setenv("numFastP2",numFastP2);
			setenv("numSlowP2",numSlowP2);
		end;
};
end;

return t;