-- Register the behaviour, originally by SteelRaven7 and edited by SudoName
behaviour("SudoChatFeed")

-- The max number of lines allowed
local maxLines = 10
local playerInvolvedMessageChanceBoost = 0.4

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
    "Can everyone please not use swear words. My mom said you'll go to HECK if you say them.",
    "LIVE @%s REACTION",
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
    "common @%s L",
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
    "Does your ass ever get jealous of the amount of shit that comes out of your mouth?",
    "弱",
    "爆头",
    "Que foda gostosa foi essa",
    "Eu sou muito foda em Ravenfield",
    "( ͡° ͜ʖ ͡°)",
    "Go jump off a cliff @%s",
    "LLUUUUUUUUUULLLLLLL GET DUNKED STINKY IDIOTQADCSADASA",
    "Good, that's one less loose end :)",
    "Your hud sucks, @%s",
    "It's past you're bedtime go to sleep",
    "MY FPSSSSSSSSS",
    "Screw You UNITY!!!!",
    "dominated you crap basket",
    "thx for standin' still wanker",
    "i never realy was on your side.... ",
    "you were quick as a little bunny @%s",
    "good that's one less loose ends",
    "you are ded, not big suprise",
    "that's what you get for spamming 'E' you runt",
    "your precious sandvich won't save you now, fatty",
    "your precious toys wont save you now next time",
    "next time you bloody ask before you stand on my flag",
    "here's a scemmathics for you, my ass!",
    "drunk on the battlefield doesn't be a way to be @%s",
    "pop goes the weasel!",
    "i am the strongest in the universe!",
    "tick tock, time's up",
    "hohoho motherfucker",
    "hipikaye motherfucker",
    "predictable",
    "@%s was an imposter all along",
    "you can go to hell without me",
    "all of your heads were around 12ft tall",
    "thx for drinking my jarate",
    "i will send my condolences to your kangaroo wife",
    "Ooops! that's not medicine",
    "medic, MEDIC, mediiic......hahahahaha! ",
    "sandvich and meee gonna kiiick youurrr asss",
    "hey overalls, you suck",
    "diagnosis, you suck",
    "you almost hurt me to death that time :D",
    "hey look @%s just shapeshift into a dead guy",
    "you're good at killing many people @%s, but it seems you can't defeat a single man huh? ",
    "give up your evil ways @%s, and for your sake, i hope we never meet again",
    "if god had wanted you to live he would not have created ME!",
    "useless cabrón",
    "you're nothing but a lower-class scum @%s ",
    "i don't need you anymore",
    "the word 'rum' , and the word 'death', should means the same thing to you",
    "this thing ain't autopilot son",
    "here lies @%s who ran pass, and died a virgin",
    "can you feel ze schadenfreude?",
    "oops! zat vas not medizin",
    "did zat sting? SAW-ry! ",
    "come over here, i promise i will heal you :) ",
    "auf wiedersehen, schweinehounds! ",
    "auf wiedersehen, dumpkopfs!",
    "Go cry to you're mommy! >:)",
    "Crawl back to your mother's womb so she can abort you",
    "Noooooo, i almost had the nuke :(",
    "Hey, @%s when the sudo is sudo. HAHAHA, i'm such a comedian",
    "You're six feet under, mate!",
    "Kick @%s, bad skillz",
    "####### you ######",
    "how's the weather down there at the bottom of the scoreboard, @%s?",
    "uses meta guns and still dies LMAO",
    "imagine going 2 and 34 and still talking shit",
    "@%s when you hear the thunder.... And when the storm, comes for you....... Remember me... ",
    "lmao you fuckin suck",
    "haha",
    "get gud lmao",
    "got somebody",
    "you just got trolled",
    "wow what an idiot LOL",
    "stupid",
    "ur mom!!!!!",
    "gottem",
    "yo guys i got @%s",
    "average quicksilver user",
    "imagine using an lmg and still dying",
    "lol",
    "youre mother",
    "bam",
    "bro they should nerf this weapon bullshit",
    "dudes at the top of the leaderboard and still dies lmao",
    "switch to your rifle you idiot",
    "LMAO",
    "ez kill",
    "you almost heal me to death that time :D",
    "thx for the med box, genius",
    "thx for the ammo box mate",
    "this one's for 15 years ago mate",
    "hahahahhaa tirahin ko mama ni @%s maya",
    "mas mataas pa k/d ko kesa grades mo bobo",
    "jutay ka pang supot kang tanginaka",
    "this point is mine, do you understand that?",
    "how's that feel ya blockhead",
    "here's what i have but you don't, a functioning liver, depth perception, and a pulse",
    "this is @%s rainbow's make me cry :')",
    "They can bury you in the tomb of an unskilled @%s",
    "i murder your toys as well",
    "hello again, dumbbell",
    "you disgust me",
    "I'm back you subnormal halfwit",
    "sometimes you just need a little less gun",
    "ain't that a cute little gun",
    "slither back to hell, coward",
    "That's what my daddy taught me to do to backstabbers",
    "you are going to need, muuuuch bigger gun",
    "you, yes YOU, you are DED",
    "go back to japan and perform that senpuku of yours",
    "You just got dominated, Sputnik",
    "Stars and Stripes beats Hammer and Sickle. Look it up!",
    "Go play your pinko chess game with the Devil, Commie!",
    "This American boot just kicked your ass back to Russia!",
    "get out from our country you capitalist pig!",
    "we soviets are equal in unity to kick your capitalist ass back from where you're belong!",
    "BANZAAAAAIIIIII",
    "Banzai",
    "Tally-ho on the bandits",
    "Tally frickin' ho",
    "SIERA-HOTEL!!!",
    "we have you surrounded at least from this side!",
    "cope and seethe",
    "average German player",
    "average american player",
    "zomber scum",
    "go back to arcade",
    "bing chiling",
    "i am a god gamer",
    "I ain't no punk bitch!",
    "That one's going in my cringe compilation!",
    "That the best you got, @%s?",
    "Bet that hurt!",
    "You gonna bitch, @%s?",
    "cry more, @%s!",
    "You fuckin trash, @%s",
    "STUPID MOTHERFUCKER!",
    "I fucked you up good, @%s",
    "Foolishness, @%s...",
    "Oh, I understand. You want more of THIS!",
    "YOU LOUSY BASTARD!",
    "Fucked up his day!",
    "LOL you're fucking DEAD!",
    "Jingle bells, @%s is retarded!",
    "Time for some Mountain Dew!",
    "Yeah, fuck you buddy!",
    "EAT THAT shit!",
    "BWHAHAHAHAHA you're over all the floor!",
    "HAHAHAHA @%s just ragdolled so hard!",
    "You play like a noob, @%s!",
    "@%s? more like little shit eating bitchass",
    "YOU GO SQUISH NOW",
    "Enjoy being dead, motherfucker!",
    "Send the fucker into a BODYBAG!",
    "That's right, SUCK ON THIS!",
    "whos the bitch now fucker",
    "I took @%s mofucking out!",
    "Oh man... @%s, I just kicked your ass!",
    "You deserved to died, asshole!",
    "Badda-bing, Badda-boom!",
    "That's right, that just happened!",
    "What a fucking bitch you are @%s, it's a damn good thing I wiped your sorry ass off the earth!",
    "@%s my ass yo, I just fucked this guy up!",
    "Holy smegma, Batman!",
    "You got PWNED!",
    "Hell yeah!",
    "Fuck that, asshole!",
    "Yeah I wasted it, baby gravy ain't go anywhere.",
    "@%s, you got NOTHING!",
    "Notify his next of kin, because they're next!",
    "One down, 50 billion to go!",
    "imagine being the worst player in the game and still talking trash ♥♥♥♥",
    "You fucked m8",
    "2 ez 4 me",

}

local killedMessage = {
	"Oh come on...",
	"Wow, you are so good at this game @%s, you lifeless loser",
	"kys @%s",
	"Good kill lol",
	"bruh",
    "so glad i pirated this shit and didnt buy it",
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
    "FUCK YOU I AM GOING TO BREAK THIS PIECE OF SHIT CONTROLLER",
    "@%s are you BaronVonGames?",
    "@%s this is a pc only server. turn off your controller and use kbm like a real gamer",
    "my uncle works at steam and I'll tell him to ban you @%s",
    "skill based matchmaking is cancer",
    "@%s hit me harder than my dad hits my mom",
    "why am i in a server with max level sweats",
    "i am actually going to commit Kurt Cobain because of @%s",
    "@%s去你的",
    "@%s傻逼",
    "他妈的鸟",
    "太坑爹了!",
    "@%s妈死了",
    "@%s NMSL",
    "@%s NCM",
    "@%s妥妥的",
    "宅男去运动",
    "你他妈的去死吧",
    "肏你妈",
    "傻缺",
    "傻帽儿",
    "贱人",
    "贱货",
    "@%s密麻麻石蜡",
    "@%snmsl",
    "@%s我测你们码",
    "@%s你tm真该死啊",
    "@%s你王元你马口尼",
    "@%s飞鸟牡丹配, 袅梦神离",
    "@%s你户口本上是不是只有你一个人",
    "@%s有战术的",
    "@%s战术大师是吧",
    "@%s开挂的没马玩意",
    "@%s挂也开了, 马也似了",
    "@%s你说的对, 但是ravenfield是一款后面的我忘了",
    "到达世界最高城, castle, 哎呀这不@%s吗, 还是看看远处的丁真吧家人们",
    "@％s你的素养很差，玩ravenfield不玩genshin impact说明你人生很失败",
    "cnm guabi nmmsl",
    "ni xian kai de",
    "guan li yuan zai bu zai, ti yi xia",
    "6",
    "Yo estoy puesto pa ti y tú te me quita' Diablo', qué piquete la chamaquita El corazón lo puso en la neverita Dice que este verano se queda solita @%s",
    "@%s que te la pique un pollo",
    "Seu cu de burro",
    "Foda-se essa merda",
    "Nem fodendo",
    "Caralho!",
    "отвали, мудак, бля!",
    "Иди на хуй",
    "Хуй c горы",
    "Мочи перхоти",
    "Ok now i'm actually going to start trying",
    "MY PIIIINNNNNNGGGGG",
    "@%s your IP is 192.0.2.1",
    "I was reloading",
    "Go KYS @%s",
    "My streak :(",
    "IT WAS A MISINPUT!!!!!!!!!!!!!!!!!!!",
    "NNNNNNNNNNNNNNOOOOOOOOOOOOOOOOOOOOOOOOO",
    "TF2 is much better that this bullshit",
    "By Allah, i have been murdered!",
    "I'm going to commit sepuku due to you, @%s",
    "SteelRaven7, pls fix",
    "Sudo, plz fix",
    "SteelRaven7, pls nerf :)",
    "is that the real sudoname?",
    "VOTEKICK @%s HE'S USING AIMBOT",
    "nice walls, @%s",
    "hacker",
    "imagine smurfing @%s",
    "fatherless garret user",
    "w+m1",
    "this game sucks, call of duty is better",
    "this game sucks, i'm going back to valorant",
    "i bet you can't do that again without your hacks, @%s",
    "reported. have fun getting banned, @%s.",
    "yo wtf? they need to nerf that shit.",
    "are you kidding me right now bro?",
    "Who was that that shot me!?",
    "fire! Fire! FIRE! ",
    "OH I'M BURNING I'M BURNING",
    "you cannot burn me i'm already on fire",
    "has anyone seen that one guy that shot my ass?",
    "YOUUU MONNNKKEEEEEYYYYYY!!!",
    "injured!? How can i be injured!? By a lower-class scum!? ",
    "i can't take it anymore",
    "i wont stand for this, I WILL NOT STAND FOR THIS!!",
    "I'TS THE DEVILS WORK!!",
    "damn what a fucking tryhard",
    "d-DAAAARRNNN!!",
    "how dare you, HOW DARE YOU!!",
    "DON'T YOU DARE TO MOCK MEEEE!!",
    "aaaaargh, sooo many little man on this team ):( ",
    "that's it you're FINISHED!! ",
    "i'll just play another game that's better than this",
    "one hp, just ONE HP!!",
    "YOU MUST DIEEE BY MY HAAAAAANNNDDDD!!!",
    "i will bury you so completely, the earth will turn over a thousand time before you're body's dug up",
    "hey wait, WHAT ABOUT MEEEEEEEE!!????!?!?",
    "piss off you yuppie",
    "Ejecting!!",
    "were going down, everyone for themselves",
    "were INOP",
    "welp time to bail the hell out of here",
    "What do you have to show yourself @%s ? blood? gold? a broken throne?",
    "how does it feels to not have a contry? to not have borders to devine yourself against the world?",
    "@%s live a life you can be proud of.... ",
    "where's our support?",
    "WHERE THE HELL ARE THE SUPPORT?!?",
    "WERE GETTING TORN UP OUT HERE, WHERE ARE THE REINFORCEMENTS!?!",
    "the enemy's pushing us back! ",
    "Stand on the bloody flag you halfwit!!",
    "STAND....ON...THE...POINT!!!....MAGGOTS!!! ",
    "my skill is WASTED on this team ):( ",
    "argh that was rubbish",
    "ahh piss",
    "this is not good",
    "stealthy little bastard",
    "why will anyone stab me in the back!? ",
    "velcome to the 've lose vonce again' fest",
    "DUMPKOPFS!! ",
    "from now on, loosing is verboten",
    "our flag has been drop! ",
    "WE ARE BEING OVERRUUUUUN!!! ",
    "NEED BACKUUP!! ",
    "I'M HURT!!",
    "OUUUCH...i mean....i'm dead",
    "in one hour, those of you who are still alive will envy........THE DEAD!",
    "beeep booop, im malfuctioning beeep booooop",
    "i did what i could :'(",
    "jarate??......NOOOOOOOOOOO!!!",
    "get out of there, i don't want to lose anymore men because of this one bloodthirsty dog",
    "my 50 thousand dollars suit is burned",
    "cap the fucking point morron!",
    "who was that? Who shot me down!?",
    "adjust our tactics and reform the attack pattern, were make em pay for that",
    "do you understand what you're doing!? You're getting in a way of world peace!",
    "damn this guy's an overachiever",
    "oh shit, i've got contact on @%s, all arrays concentrate on him!",
    "we gonna get out of here right now!, @%s is here and he and his friends are gonna kill us all!",
    "what, WHAT!? I've survived those guys once already!",
    "were gonna finished this, and were gonna find you",
    "congratulations on your first kill @%s",
    "YOU WILL BE KILLED BY MEEEEEE!!!",
    "damn nice shot",
    "STEELRAVEN7 PLEASE GIVE ME THE AA-AA",
    "i have your ip address",
    "ow",
    "hey that was mean :(",
    "motherfuck",
    "uhhh i think i died",
    "ARE YOU KIDDING!?!!?!?!",
    "ouchie",
    "bruh",
    "fuck this im gonna go play cod",
    "i know where you live",
    "how are you this good??",
    "VOTEKICK @%s HES USING WALL HACKS",
    "goddamn @%s you are good",
    "im at your doorstep",
    "yo guys can somebody get @%s",
    "holy shit is that the actual sofa??",
    "nani?",
    "NANIIII!?",
    "is this, the legendary super swine!?",
    "jesus, where'd these guys come from!?",
    "imagine using a fucking op weapon",
    "that just ain't right",
    "now i've seen everything",
    "sentry down!",
    "dispenser down!",
    "teleporter down!",
    "BAAAADD",
    "very bad",
    "aww crap",
    "awwww, crapbaskets",
    "we failed men",
    "i will not tolerate failure on my team",
    "我在A一打五, 你的B进满人",
    "WDNMD",
    "这个老六我真的糊了",
    "我柜子动了，我不玩了",
    "defend the D point!!!!!",
    "su11 so OP bro",
    "ima revnge bom uu!!!! (:",
    "my team sucks",
    "o shit",
    "wow i suck",
    "HAHHAHAHAHAHAAHHAHAHAHHAHAHHAH",
    "attack @%s",
    "enemy over there",
    "oops",
    "uh oh",
    "HOLY SHIT DUDE!",
    "WHERE WAS THAT GUYS?!?!",
    "FUCK THIS GAME!!!",
    "OH GOD IM DEAD SOMEBODY CALL 911",
    "CYKA BLYAT!",
    "Enjoy it while you can, @%s",
    "got nothing better to do but sweat on ravenfield?",
    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "@%s is SO lucky...",
    "Are you shitting me right now??",
    "you motherfucker stop hacking or im gonna report you!!",
    "@%s stop being a dumbass!",
    "And then there's THIS ASSHOLE!",
    "Okay then...",
    "Somebody report @%s for using exploits!",
    "Next time, I'll get you @%s!",
    "you bitch ass looking mf",
    "@%s son of dog",
    "choke on smegma, man.",
    "FUCK YOU FUCKING CHEATER. CHOKE ON A PASTOR'S COK YOU STUPID SHIT",
    "I'm gonna sue you!",
    "my computer's shitting itself right now",
    "Dude that goddamn hitbox!",
    "IF SOME GODDAMN SHITHEAD KEEP KILLING ME WITH ANOTHER OP WEAPON I SWEAR TO FUCKING GOD",
    "WTF WHERE WAS I JUST GOT SHOT FROM",
    "@%s you slutty bitch",
    "@%s you gay head",
    "nice hack you fucking asshole",
    "I SWEAR TO FUCKNG GOD @%s, IF YOU DON'T TURN OFF THE GODDAMN CHEAT, I WILL FUCKING BOMB YOUR ASSES YOU FUCKERS!",
    "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU",
    "Kill someone else plooz, @%s!",
    "Stop killing me, @%s!",
    "this game is absolutely fucked, Battlefield 4 is better than this shit",

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
    "笑死我了",
    "@%s, i live in ur walls",
    "I got a good chuckle after that one, i'm coming after you.",
    "whoops sorry about that",
    "uhhhhhh",
    "bro you were blocking my shot wdym",
    "sorry",
    "dude you were right next to the grenade",
    "sorry i was trying to poke you because i really want to talk to you",
    "wait melee does one hit kill??",
    "oh crap, forgot you are low on health",
    "GET ON THE BLOODY POINT!!",
    "GET IN THE POINT YOU IDIOT!!",
    "DO YOU WANT US TO LOSE!?",
    "Wait, you can kill teammate in this game?",
    "Whoops!",
    "Move, knuckleheads, MOVE!!!",
    "Don't play in the gunfight, @%s!",
    "Well... shit.",
    "Fuck I though @%s was the enemy",
    "Are you on my team @%s??? OH FUCK ME, SORRY!",
    "omg i should have to check the map because i keep accidentally teamkilling...",
    "Sorry @%s, wasn't paying attention!",
    "Hey uhhhhh... @%s my fault.",
    "oh shit, that was friendly lol",
    "Crap, I've made a mistake...",
    "That was not a enemy, my bad!",
    "Get out of the way, @%s!",
    "how tf did i just teamkilled someone",
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
    "举报@%s",
    "@%s新手吗?",
    "Estás a meter água",
    "@%s você vai morrer",
    "Desenmerda-te @%s",
    "o que o cu tem a ver com as calças?",
    "Porra, tu tá de sacanagem comigo!",
    "ты чё, сука, охуел, бля?",
    "Мудак",
    "@%s is a spy",
    "@%s is not one of us",
    "@%s ain't on our side",
    "which of you numbnuts let us down? ",
    "that @%s is a bloody traitor",
    "whoever's done that one that's his fault",
    "are you trying to sex me or what!? ",
    "what even are you, my boyfriend!?",
    "spy around here",
    "there's a spy creepin' around here",
    "hey guys it's a spy",
    "it seems that i'm not the only spy",
    "there's an impostor among us",
    "a double-agent is hiding amongst our ranks",
    "i've never heard that callsign in the files @%s",
    "you don't even in the databases, so why are you here?",
    "yo there's spy over here",
    "achtung! Spy!",
    "Dear god! Poor @%s, the finest mind of his generation, come to such an end",
    "Whoops, i dropped my mouse :[",
    "It must've been a sad day when you crawled out of the abortion bucket",
    "votekick @%s he's griefing",
    "DUDE IM ON YOUR TEAM WTF",
    "somebody kick @%s hes tking",
    "one of the players of all time",
    "wtf man",
    "bro got the impostor role",
    "kys",
    "literally 1984",
    "putanginamo @%s",
    "uy gago bat ako tinamaan mo",
    "sheteng inang yan",
    "spy's sappin' my sentry",
    "spy's sappin' my dispenser",
    "spy's sappin my teleporter",
    "'friendly fire will not be tolerated'",
    "enough fun being troll yet?",
    "^^;",
    "差不多得了",
    "go back to 1.0 air AB",
    "Eyeballs, Mark I, Try using them",
    "You mind not killin' my men?!",
    "Would you mind @%s? Not killing my man.",
    "Hey dude, friendly fire's active!",
    "I'm on your team, you fuck!",
    "Go back to driver's ed, @%s!",
    "SERIOUSLY?!?!?!",
    "Watch where you're going, @%s!",
    "What the hell dumbass?!",
    "A favor @%s! Don't kill my man!",
    "And if you love it, if you STOP KILLING MANS!!!",
    "Jesus christ buddy, what the fuck!",
    "FUCKING HELL BRAH, FUCK ME!",
    "Pay attention, @%s!",
    "You asshole! I was right in front of you!",
    "SOMEBODY STOP @%s NOW!",
    "Stop berserk, @%s!",
    "You moron, @%s!",
    "wtf this game has a friendly fire turned on permanently? Fucking hell!",
    "Look... try shooting some damn enemy players instead of me!",
    "Somebody stop @%s!!!",
    "Hey @%s, stop it!",
    "STOP IT @%s, YOU GODDAMN PRICK",
    "STOP TEAMKILLING MOTHERFUCKER!!!",
    "FRIENDLY FIRE!",
    "@%s YOU PIECE OF SHIT!",
    "@%s what is wrong with you?!",
    "STOP WITH THE TEAMKILLING!!!",
    "My man are NOT the enemy!",
    "Hey, do I owe your money?!",
    "What the fuck are you shooting at???",
    "Think about where you shooting you fuckwit! you just killed your own man!",
    "Stop killing your own goddamn man!",
    "Will you cut that shit out?!",
    "Can you please stop the motherfucking teamkilling?!",
    "OH DAMN MAN, WHAT THE HELL!",
    "@%s is gone LOCO!",
    "ARE YOU GONNA WANT US TO LOSE?!",
    "best a4e player?",
    "best f5c player?",
    "attack the D point",
    
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

	local subject = "we are "
	if #squad.members == 1 then
		subject = "i am "
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