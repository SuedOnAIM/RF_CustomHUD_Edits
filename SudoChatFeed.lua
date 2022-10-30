-- Register the behaviour, originally by SteelRaven7 and edited by SudoName
behaviour("SudoChatFeed")

-- The max number of lines allowed
local maxLines = 7
local playerInvolvedMessageChanceBoost = 0.6

local friendlySquadStatusChance = 0.2;
local enemySquadStatusChance = 0.01;

local killerMessageChance = 0.3
local killedMessageChance = 0.2

local teamKillerMessageChance = 0.5
local teamKilledMessageChance = 0.2

local statusPostTime = 1
local statusPostTimeVariance = 5

local postTimeVariance = 1
local killerPostTime = 1
local killedPostTime = postTimeVariance + 0.3

local killerMessages = {
	"@%s sucks ass",
	"lol @%s got rekt",
	"ez",
	"get noscoped",
	"Wow @%s that was epic",
	"Hahaahaah @%s",
	"This is too easy...",
	"WAOW",
	"I clicked on your head, @%s",
	"get a refund on steam @%s",
    "uninstall the game",
    "are you even old enough to play this game",
    "gonna cry? maybe piss? shit and cum?",
    "sheeesh this gun OP",
    "i just nailed @%s like i nailed his mom",
    "i'm so gamer :)",
    "8=====D",
    "did you say you're good at this game @%s?",
    "wish emotes were working so i could hit the griddy",
    "sheeeeeeeesh",
    ":P",
    "that's going in my montage",
    "damn i should have clipped that",
    "my dead grandpa can play better than @%s",
    "lmfao",
    "XD",
    "nice choke",
    "is this a bot server? it's way too easy",
    "@%s got clapped",
    "domed",
    "bonk!",
    "can't help it if i'm just better than you @%s",
    "i don't even have as many hours as you @%s but i still kicked your ass",
    "pogchamp",
    "nice fail @%s",
    "i'll be your daddy ;)",
    "you got a foot fetish @%s bcuz you just tasted defeat",
    "lmao @%s watch that killcam please",
    "go back to cod lmfao",
    "<3 @%s",
    "kisses @%s gently",
    "are we playing with children lmao",
    "have you ever played a fps before @%s",
    "world_loudest_orgasm.mp3",
    "zamn, you're a sussy baka @%s :p",
    "you fell for my trap card @%s",
    "@%s get fucked lol",
    "@%s are you a girl",
    "when you're in a losing competition but your opponent is @%s",
    "damn this shit hitting hard",
    "get a new hobby lmao",
    "dunked on @%s",
    "@everyone, who is your favorite modder?",
    "easiest game of my life fr",
    "bro i'm finna nut",
    "@everyone hello chat :>",
    "@everyone, Admin here. Please do not announce to the server your intention to masturbate.",
    "@%s?",
    "skill issue @%s",
    "now that was an epic gamer moment",
    "FULL RELEASE!!!! THE FULL RELEASE IS REAL!!!!!!!!!!!!",
    "easier than your mom lol",
    "^_^",
    "i have hacks on btw lol",
    "please dont curse in chat",
    "@%s got a big fat L",
    "does @%s have a microphone because he choking on big nuts rn",
    "@%s lmao what you doing bro",
    "top 10 most embarrasing ways to die! number 15...",
}

local killedMessage = {
	"Oh come on...",
	"Wow, you are so good at this game @%s, you lifeless loser",
	"kys @%s",
	"Good kill lol",
	"bruh",
    "why are you so toxic",
	"go touch grass @%s",
    "at least my parents love me @%s",
    "@%s thought we were on the same team lol",
	"I'll get you for that @%s",
	"WTF WAS THAT BULLSHIT????",
	"HOW",
	"i almost had him wtf",
	"Oof @%s outta nowhere",
    "WWWWWWWWWAADDDSSSSDDDDDDDD",
    "i hope @%s has a pleasant day",
    "fuck i was eating",
    "use a real gun @%s",
    "why tf haven't the devs nerfed that gun",
    "quit camping like a bitch",
    "touch grass @%s",
    "go outside @%s and talk to some bitches",
    "@everyone, I want to announce that @%s is a fatherless, grassless, bitchless, human being",
    "I HATE THIS STUPID FUCKING GAME",
    "bruh my internet lagged",
    "lagggggggggggg",
    "can someone else please carry",
    "eat shit and die please :D",
    "would you kindly FUCK OFF @%s",
    "nice shot @%s",
    "why is the enemy team so full of sweats",
    "turn off your aimbot @%s",
    "@%s is hacking",
    "@%s mom a ho",
    "there is just no fucking way",
    "there's a skeleton in your flesh",
    "i shot @%s first wtf",
    "this server is lagging",
    "@%s has wallhacks",
    "sv_cheats enabled",
    "this shit game was not worth $60",
    "ong i should have bought cod instead",
    "bruh cyberpunk 2077 has less bugs than this game",
    "stop using that gun @%s",
    "man using the battlepass gun :X",
    "@%s hit the fucking griddy on me",
    "at least my dad is still a part of my life @%s",
    "FJKALSDJKLASFDALKSCFHB",
    "is that the real PlasticScot?",
    "my cat got in the way :(",
    "wtf my monitor just went black",
    "my mom's home so i have to get off the computer soon",
    "wtf everything is pink in this map",
    "touch grass @%s",
    "go outside @%s fr",
    "ong",
    "go shower @%s",
    "@%s are you BaronVonGames?",
    "@%s this is a pc only server. turn off your controller and use kbm like a real gamer",
    "my uncle works at steam and I'll tell him to ban you @%s",
    "skill based matchmaking is cancer",
    "@%s hit me harder than my dad hits my mom",
    "why am i in a server with max level sweats",
    "i am actually going to commit Kurt Cobain because of @%s",
}

local teamKillerMessages = {
	"Oh noooo, sorry!",
	"Oops my bad @%s",
	"Sorry @%s",
	"Oops!",
	"Sorry @%s, it won't happen again",
	"Aww @%s I'm sorry!",
	"sry",
	"sry @%s",
    "misclick :X",
    "why did you walk in front of me you dumb fuck",
    "@%s move tf out of my way",
    "get trolled @%s",
    "dont get in my way next time",
    "omg sorry!!!",
    "i thought you were an enemy",
    "ecks dee @%s",
    "@%s fucking scared me",
    "soz @%s",
    "XD",
    "i will kill you again if you do that @%s",
    "@%s got some nice cheeks",
    "it was a prank bro",
    "@%s",
    "sorry @%s everything is pink in my game",
    "lol",
    "lmao",
    "@%s i don't trust fr*nch not sorry",
    "lo",
    ":x",
    "sorry @%s misclick",
    "bruh moment",
    "wtf this server has friendly fire?",
    "UwU @%s",
    "are you a girl?",
    "hey babe *shits aggresively*",
    "my b",
    "oh shit wrong guy",
    "jesus fucking christ",
    "what just happened???",
    "hrngg i'm trying to play the game but @%s cheeks got me acting sussy",
}

local teamKilledMessages = {
	"watch it @%s",
	"Stop teamkilling",
	"bro @%s",
    "bruh @%s",
	"Stop it @%s",
	"Aww @%s come on...",
	"@%s...",
	"...",
    "dude be careful next time",
    "@%s same team dumbass",
    "we're teammates",
    "votekick @%s",
    "PLEASE votekick @%s",
    "stg if you do that again i am kicking you",
    "come back here @%s you motherfucker",
    "fatherless behaviour @%s",
    "@admin, kick @%s",
    "@%s do you need to get glasses?",
    "its ok @%s",
    "YOU FUCKING PIECE OF SHIT @%s",
    "@%s is being a little bitch a bannable offense",
    "were you too busy sucking dick to see me?",
    "@%s are you colorblind?",
    "oh, the misery... everyone wants to be... my enemy",
    "man...",
    "least toxic ravenfield player fr",
    "i just spawned @%s",
    "i hate public lobbies so damn much",
    "@%s is sus",
    "BOO! Gottem!",
    "thank you so much daddy @%s <3",
    "hit me harder @%s",
    "i always get the worst fucking teammates stg",
    "no wonder @%s is fatherless",
    "lol",
    "but why @%s",
    "anyone want to erp in vc?",
    "lo",
    "I CAN'T TAKE THIS SHIT ANYMORE MAN",
    "@%s go commit unalive",
    "i'm gonna find where you live and shove my foot so far up your ass you'll be tasting feet in the hospital",
    "i'm expecting a written apology",
    "why is there friendly fire on",
    "L team fr",
    "I swear to Allah if i get teamkilled one more time",
    "report @%s for teamkilling",
    "is tk banned in this server",
    "can i revenge kill @%s",
    "Allah, save me from these infidels",
}

function SudoChatFeed:Start()
	-- Run when behaviour is created
	GameEvents.onActorDied.AddListener(self, "OnActorDied")
	GameEvents.onSquadAssignedNewOrder.AddListener(self, "OnSquadAssignedNewOrder");

	self.text = self.targets.text

	-- Create empty lines
	self.lines = {}
	for i=1,maxLines do
		self.lines[i] = ""
	end
	self:UpdateText()
end

function SudoChatFeed:OnSquadAssignedNewOrder(squad, order)

	local chance = friendlySquadStatusChance;
	if squad.leader.team ~= Player.team then
		chance = enemySquadStatusChance;
	end

	if not RandomChance(chance) then
		return
	end

	local messageSource = squad.leader;
	local memberCount = #squad.members;
	if squad.hasPlayerLeader then
		if(memberCount == 1) then
			return
		else
			messageSource = squad.members[2]
			memberCount = memberCount - 1;
		end
	end

	local subject = "We are "
	if #squad.members == 1 then
		subject = "I am "
	end

	local verb = "";

	if order.type == OrderType.Attack then
		verb = "heading to "
	elseif order.type == OrderType.Defend then
		verb = "staying at "
	elseif order.type == OrderType.Roam then
		verb = "checking out "
	else
		return
	end

	local message = subject .. verb .. string.lower(order.targetPoint.name)

	if squad.squadVehicle ~= nil then
		message = message .. " using " .. string.lower(squad.squadVehicle.name)
	end

	local delay = statusPostTime + math.random() * statusPostTimeVariance
	self:PushMessageAfterDelay(messageSource, message, delay)

	if messageSource.team ~= Player.team then
		self:PushMessageAfterDelay(messageSource, "wrong team chat :X", delay + 2)
	end
end

function SudoChatFeed:OnActorDied(actor, killer, isSilent)
	if isSilent then
		return
	end

	if killer ~= nil and actor ~= killer then
    	--self:PushBoldLine(GetActorString(killer) .. " killed " .. GetActorString(actor))

		if actor.team == killer.team then
			self:OnTeamKill(actor, killer)
		else
			self:OnKill(actor, killer)
		end

    else
    	--self:PushBoldLine(GetActorString(actor) .. " died")
    end
end

function RandomChance(chance)
	return math.random() < chance
end

function SudoChatFeed:OnKill(actor, killer)
	local baseChance = 0
	if actor.isPlayer or killer.isPlayer then
		baseChance = playerInvolvedMessageChanceBoost
	end

	if RandomChance(baseChance + killerMessageChance) then
		self:FormatBotMessage(killer, actor, killerMessages, killerPostTime + math.random() * postTimeVariance)
	end

	if RandomChance(baseChance + killedMessageChance) then
		self:FormatBotMessage(actor, killer, killedMessage, killedPostTime + math.random() * postTimeVariance)
	end
end

function SudoChatFeed:OnTeamKill(actor, killer)
	local baseChance = 0
	if actor.isPlayer or killer.isPlayer then
		baseChance = playerInvolvedMessageChanceBoost
	end

	if RandomChance(baseChance + teamKillerMessageChance) then
		self:FormatBotMessage(killer, actor, teamKillerMessages, killerPostTime + math.random() * postTimeVariance)
	end

	if RandomChance(baseChance + teamKilledMessageChance) then
		self:FormatBotMessage(actor, killer, teamKilledMessages, killedPostTime + math.random() * postTimeVariance)
	end
end

function SudoChatFeed:FormatBotMessage(from, to, messageCollection, delay)
	if from.isPlayer then
		return
	end

	local message = string.format(GetRandomEntry(messageCollection), to.name)

	if to.isPlayer then
		-- Highlight messages directed to the player
		message = "<b>"..message.."</b>"
	end

	self:PushMessageAfterDelay(from, message, delay)
end

function SudoChatFeed:PushMessageAfterDelay(from, message, delay)
	self.script.StartCoroutine(function() self.PushMessageAfterDelayCoroutine(self, from, message, delay) end)
end

function SudoChatFeed:PushMessageAfterDelayCoroutine(from, message, delay)
	coroutine.yield(WaitForSeconds(delay))
	self:PushMessage(from, message)
end

function GetActorString(actor)
	local color = ColorScheme.GetTeamColorBrighter(actor.team)
	color = Color.Lerp(color, Color.white, 0.5)

	return ColorScheme.RichTextColorTag(color) .. actor.name .. "</color>"
end

function SudoChatFeed:PushLine(line)
	for i=1,maxLines-1 do
		self.lines[i] = self.lines[i+1]
	end
	self.lines[maxLines] = line

	self:UpdateText()
end

function SudoChatFeed:PushBoldLine(line)
	self:PushLine("<b>"..line.."</b>")
end

function SudoChatFeed:PushMessage(actor, message)
	self:PushLine(GetActorString(actor) .. ": " .. message)
end

function SudoChatFeed:UpdateText()
	local finalString = ""

	for i=1,maxLines do
		if self.lines[i] ~= "" then
			finalString = finalString .. self.lines[i] .. "\n"
		end
	end

	self.text.text = finalString
end

function GetRandomEntry(collection)
	return collection[math.random(#collection)]
end