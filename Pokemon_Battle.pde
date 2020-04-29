void setup() {
  exit();

  //Move example = new Move("Name", Power Points, Power, Accuracy, "Type", "Damage Catagory");

  //Set up moves
  Move none = new Move("None", 0, 0, 0, "Normal", "Status", 0, "none", 0);

  //NORMAL type moves
  Move tackle = new Move("Tackle", 35, 40, 1, "Normal", "Physical", 0, "none", 0);
  Move pound = new Move("Pound", 35, 40, 1, "Normal", "Physical", 0, "none", 0);
  Move scratch = new Move("Scratch", 35, 40, 1, "Normal", "Physical", 0, "none", 0);
  Move smokescreen = new Move("Smokescreen", 20, 0, 0, "Normal", "Status", 0, "Accuracy-", 1);
  Move sing = new Move("Sing", 15, 0, 1, "Normal", "Status", 0, "Sleep", 1);
  Move quickAttack = new Move("Quick Attack", 30, 40, 1, "Normal", "Physical", 1, "none", 0);
  Move falseSwipe = new Move("False Swipe", 40, 40, 1, "Normal", "Physical", 0, "none", 0);
  Move viceGrip = new Move("Vice Grip", 30, 55, 1, "Normal", "Physical", 0, "none", 0);
  Move whirlwind = new Move("Whirlwind", 20, 0, 1, "Normal", "Status", -6, "Switch", 1);
  Move covet = new Move("Covet", 25, 60, 1, "Normal", "Physical", 0, "none", 0);
  Move refresh = new Move("Refresh", 20, 0, 0, "Normal", "Status", 0, "none", 0);
  Move wrap = new Move("Wrap", 20, 45, 0.9, "Normal", "Physical", 0, "Bound", 1);
  Move bind = new Move("Bind", 20, 45, 0.85, "Normal", "Physical", 0, "Bound", 1);
  Move furyAttack = new Move("Fury Attack", 20, 35, 0.85, "Normal", "Physical", 0, "none", 0);
  Move headbutt = new Move("Headbutt", 15, 70, 1, "Normal", "Physical", 0, "none", 0);
  Move slash = new Move("Slash", 20, 70, 1, "Normal", "Physical", 0, "none", 0);
  Move bodySlam = new Move("Body Slam", 15, 85, 1, "Normal", "Physical", 0, "Paralysis", 0.3);
  Move defenseCurl = new Move("Defense Curl", 40, 0, 0, "Normal", "Status", 0, "Defense+", 1);
  Move swift = new Move("Swift", 20, 60, 0, "Normal", "Special", 0, "none", 0);
  Move tailWhip = new Move("Tail Whip", 30, 0, 0, "Normal", "Status", 0, "Defense-", 1);
  Move harden = new Move("Harden", 30, 0, 0, "Normal", "Status", 0, "Defense+", 1);
  Move leer = new Move("Leer", 30, 0, 0, "Normal", "Status", 0, "Defense-", 1);
  Move supersonic = new Move("Supersonic", 20, 0, 0.55, "Normal", "Status", 0, "Confusion", 1);
  Move stomp = new Move("Stomp", 20, 65, 1, "Normal", "Physical", 0, "Flinch", 0.3);
  Move triAttack = new Move("Tri Attack", 10, 80, 1, "Normal", "Special", 0, "Burn/Freeze", 0.2);
  Move bide = new Move("Bjde", 10, 0, 1, "Normal", "Status", 0, "none", 0);
  Move thrash = new Move("Thrash", 10, 120, 1, "Normal", "Physical", 0, "none", 0);
  Move swordsDance = new Move("Swords Dance", 20, 0, 0, "Normal", "Status", 0, "Attack++", 1);
  Move takeDown = new Move("Take Down", 20, 90, 0.85, "Normal", "Physical", 0, "Recoil/0.25", 1);
  Move doubleTeam = new Move("Double Team", 15, 0, 0, "Normal", "Status", 0, "Evasion+", 1);
  Move hornAttack = new Move("Horn Attack", 25, 65, 1, "Normal", "Physical", 0, "none", 0);
  Move scaryFace = new Move("Scary Face", 10, 0, 1, "Normal", "Status", 0, "Speed--", 1);
  Move uproar = new Move("Uproar", 10, 90, 1, "Normal", "Special", 0, "none", 0);
  Move splash = new Move("Splash", 40, 0, 0, "Normal", "Status", 0, "none", 0);
  Move crushClaw = new Move("Crush Claw", 10, 75, 0.95, "Normal", "Physical", 0, "Defense-", 0.5);
  Move tickle = new Move("Tickle", 20, 0, 1, "Normal", "Status", 0, "Attack-/Defense-", 1);
  Move screech = new Move("Screech", 40, 0, 0.85, "Normal", "Status", 0, "Defense--", 1);
  Move doubleHit = new Move("Double Hit", 10, 70, 0.81, "Normal", "Physical", 0, "none", 0);
  Move shellSmash = new Move("Shell Smash", 15, 0, 0, "Normal", "Status", 0, "Sp.Attack++/Defense--", 1);
  Move recover = new Move("Recover", 16, 0, 0, "Normal", "Status", 0, "Recover", 1);

  //FIRE
  Move ember = new Move("Ember", 25, 40, 1, "Fire", "Special", 0, "Burn", 0.1);
  Move fireSpin = new Move ("Fire Spin", 15, 105, .85, "Fire", "Special", 0, "Bound", 1);
  Move fireFang = new Move("Fire Fang", 15, 65, 0.95, "Fire", "Physical", 0, "Flinch/Burn", 0.1);
  Move flameCharge = new Move("Flame Charge", 20, 50, 1, "Fire", "Special", 0, "none", 0);
  Move flameWheel = new Move("Flame Wheel", 20, 60, 1, "Fire", "Physical", 0, "Burn", 0.1);
  Move firePunch = new Move("Fire Punch", 15, 75, 1, "Fire", "Physical", 0, "Burn", 0.1);
  Move flameBurst = new Move("Flame Burst", 15, 70, 1, "Fire", "Special", 0, "none", 0);
  Move flareBlitz = new Move("Flare Blitz", 15, 120, 1, "Fire", "Physical", 0, "Recoil/0.33", 1);
  Move heatWave = new Move("Heat Wave", 10, 95, 0.9, "Fire", "Special", 0, "Burn", 0.1);

  //GRASS
  Move absorb = new Move("Absorb", 25, 20, 1, "Grass", "Special", 0, "Drain", 1);
  Move megaDrain = new Move("Mega Drain", 15, 40, 1, "Grass", "Special", 0, "Drain", 1);
  Move vineWhip = new Move("Vine Whip", 25, 45, 1, "Grass", "Physical", 0, "none", 0);
  Move leafage = new Move("Leafage", 40, 40, 1, "Grass", "Physical", 0, "none", 0);
  Move woodHammer = new Move("Wood Hammer", 15, 120, 1, "Grass", "Physical", 0, "Recoil/0.33", 1);
  Move stunSpore = new Move("Stun Spore", 30, 0, 0.75, "Grass", "Status", 0, "Parlysis", 1);
  Move sleepPowder = new Move("Sleep Powder", 30, 0, 0.75, "Grass", "Status", 0, "Sleep", 1);
  Move cottonSpore = new Move("Cotton Spore", 40, 0, 1, "Grass", "Status", 0, "Speed--", 1);
  Move bulletSeed = new Move("Bullet Seed", 30, 62, 1, "Grass", "Physical", 0, "none", 0);
  Move leechSeed = new Move("Leech Seed", 10, 0, 0.9, "Grass", "Status", 0, "Leech", 1);
  Move razorLeaf = new Move("Razor Leaf", 25, 55, 0.95, "Grass", "Physical", 0, "none", 0);

  //WATER
  Move waterGun = new Move("Water Gun", 25, 40, 1, "Water", "Special", 0, "none", 0);
  Move bubble = new Move("Bubble", 30, 40, 1, "Water", "Special", 0, "none", 0);
  Move waterPulse = new Move("Water Pulse", 20, 60, 1, "Water", "Special", 0, "Confusion", 0.2);
  Move aquaRing = new Move("Aqua Ring", 20, 0, 0, "Water", "Status", 0, "Heal", 1);
  Move surf = new Move("Surf", 15, 90, 1, "Water", "Special", 0, "none", 0);
  Move bubbleBeam = new Move("Bubble Beam", 20, 65, 1, "Water", "Special", 0, "Speed-", 0.1);
  Move hydroPump = new Move("Hydro Pump", 5, 110, 0.8, "Water", "Special", 0, "none", 0);

  //ROCK
  Move rollout = new Move("Rollout", 20, 30, 0.9, "Rock", "Physical", 0, "none", 0);
  Move rockTomb = new Move("Rock Tomb", 15, 60, 0.95, "Rock", "Physical", 0, "none", 0);
  Move rockThrow = new Move("Rock Throw", 15, 50, 0.9, "Rock", "Physical", 0, "none", 0);
  Move rockSlide = new Move("Rock Slide", 10, 75, 0.9, "Rock", "Physical", 0, "Flinch", 0.3);
  Move rockBlast = new Move("Rock Blast", 10, 100, 0.725, "Rock", "Physical", 0, "none", 0);

  //BUG
  Move struggleBug = new Move("Struggle Bug", 20, 50, 1, "Bug", "Special", 0, "Sp.Attack-", 1);
  Move bugBite = new Move("Struggle Bug", 20, 60, 1, "Bug", "Physical", 0, "none", 0);
  Move bugBuzz = new Move("Bug Buzz", 10, 90, 1, "Bug", "Special", 0, "Sp.Defense", 0.1);
  Move furyCutter = new Move("Fury Cutter", 20, 40, 0.95, "Bug", "Physical", 0, "none", 0);

  //POISON
  Move acid = new Move("Acid", 30, 40, 1, "Poison", "Special", 0, "none", 0);  
  Move poisonSting = new Move("Poison Sting", 35, 15, 1, "Poison", "Physical", 0, "Poison", 0.3);
  Move toxic = new Move("Toxic", 10, 0, 0.9, "Poison", "Status", 0, "Badly Pozisoned", 1);
  Move poisonPowder = new Move("Poison Powder", 35, 0, 0.75, "Poison", "Status", 0, "Poison", 1);
  Move poisonGas = new Move("Poison Gas", 40, 0, 0.9, "Poison", "Status", 0, "Poison", 1);
  Move sludge = new Move("Sludge", 20, 65, 1, "Poison", "Special", 0, "Poison", 0.3);  
  Move smog = new Move("Sludge", 20, 30, 0.7, "Poison", "Special", 0, "Poison", 0.4);  

  //DRAGON
  Move dragonRage = new Move("Dragon Rage", 10, 40, 1, "Dragon", "Special", 0, "none", 0);
  Move twister = new Move("Twister", 20, 40, 1, "Dragon", "Special", 0, "Flinch", 0.2);
  Move dragonBreath = new Move("Dragon Breath", 20, 60, 1, "Dragon", "Physical", 0, "Paralysis", 0.3);
  Move dragonPulse = new Move("Dragon Pulse", 10, 85, 1, "Dragon", "Special", 0, "none", 0);
  Move dragonDance = new Move("Dragon Dance", 20, 0, 0, "Dragon", "Status", 0, "Attack+/Speed+", 1);
  Move dragonClaw = new Move("Dragon Claw", 15, 80, 1, "Dragon", "Physical", 0, "none", 0);

  //FIGHTING
  Move vacuumWave = new Move("Vacuum Wave", 30, 40, 1, "Fighting", "Special", 1, "none", 0);
  Move karateChop = new Move("Karate Chop", 25, 50, 1, "Fighting", "Physical", 0, "none", 0);
  Move auraSphere = new Move("Aura Sphere", 20, 80, 0, "Fighting", "Special", 0, "none", 0);
  Move detect = new Move("Detect", 5, 0, 0, "Fighting", "Special", 4, "Dodge", 1);

  //DARK
  Move pursuit = new Move("Pursuit", 20, 40, 1, "Dark", "Physical", 0, "none", 0);
  Move bite = new Move("Bite", 25, 60, 1, "Dark", "Physical", 0, "Flinch", 0.3);
  Move lick = new Move("Lick", 30, 30, 1, "Dark", "Physical", 0, "Paralysis", 0.3);
  Move crunch = new Move("Crunch", 15, 80, 1, "Dark", "Physical", 0, "Defense", 0.2);
  Move feintAttack = new Move("Feint Attack", 20, 60, 0, "Dark", "Physical", 0, "none", 0);
  Move nightSlash = new Move("Night Slash", 15, 70, 1, "Dark", "Physical", 0, "none", 0);
  Move assurance = new Move("Assurance", 10, 60, 1, "Dark", "Physical", 0, "none", 0);
  Move honeClaws = new Move("Hone Claws", 15, 0, 0, "Dark", "Status", 0, "Attack+/Accuracy+", 1);
  Move snarl = new Move("Snarl", 15, 55, 0.95, "Dark", "Special", 0, "Sp.Attack-", 1);
  Move nastyPlot = new Move("Nasty Plot", 20, 0, 0, "Dark", "Status", 0, "Sp.Attack++", 1);

  //ICE
  Move mist = new Move("Mist", 30, 0, 1, "Ice", "Status", 0, "none", 0);
  Move icicleCrash = new Move("Icicle Crash", 10, 85, 0.9, "Ice", "Physical", 0, "Flinch", 0.3);
  Move icicleSpear = new Move("Icicle Spear", 30, 62, 1, "Ice", "Physical", 0, "none", 0);
  Move iceShard = new Move("Ice Shard", 30, 40, 1, "Ice", "Physical", 1, "none", 0);
  Move iceFang = new Move("Ice Fang", 15, 65, 0.95, "Ice", "Physical", 0, "Flinch/Freeze", 0.1);
  Move auroraBeam = new Move("Aurora Beam", 20, 65, 1, "Ice", "Special", 0, "Attack-", 0.1);
  Move iceBeam = new Move("Ice Beam", 10, 90, 1, "Ice", "Special", 0, "Freeze", 0.1);
  Move blizzard = new Move("Blizzard", 5, 110, 0.7, "Ice", "Special", 0, "Freeze", 0.1);
  Move icyWind = new Move("Icy Wind", 15, 55, 0.95, "Ice", "Special", 0, "Speed-", 1);
  Move icePunch = new Move("Ice Punch", 15, 75, 1, "Ice", "Physical", 0, "Freeze", 0.1);

  //GHOST
  Move confuseRay = new Move("Confuse Ray", 10, 0, 1, "Ghost", "Status", 0, "Confusion", 1);
  Move astonish = new Move("Astonish", 15, 30, 1, "Ghost", "Physical", 0, "Flinch", 0.3);
  Move hex = new Move("Hex", 10, 65, 1, "Ghost", "Special", 0, "none", 0);
  Move shadowSneak = new Move("Shadow Sneak", 15, 40, 1, "Ghost", "Physical", 1, "none", 0);
  Move shadowClaw = new Move("Shadow Claw", 15, 80, 1, "Ghost", "Physical", 0, "none", 0);

  //ELECTRIC
  Move thunderShock = new Move("Thunder Shock", 30, 40, 1, "Electric", "Special", 0, "Paralysis", 0.1);
  Move thunderWave = new Move("Thunder Wave", 20, 0, 0.9, "Electric", "Status", 0, "Paralysis", 1);
  Move thunderFang = new Move("Thunder Fang", 15, 65, 0.95, "Electric", "Physical", 0, "Flinch/Paralysis", 0.1);
  Move spark = new Move("Spark", 20, 65, 1, "Electric", "Physical", 0, "Paralysis", 0.3);
  Move thunderbolt = new Move("Thunderbolt", 15, 90, 1, "Electric", "Special", 0, "Paralysis", 0.1);
  Move thunderPunch = new Move("Thunder Punch", 15, 75, 1, "Electric", "Physical", 0, "Paralysis", 0.1);
  Move zapCannon = new Move("Zap Cannon", 5, 120, 0.5, "Electric", "Special", 0, "Paralysis", 1);

  //STEEL
  Move magnetBomb = new Move("Magnet Bomb", 20, 60, 0, "Steel", "Physical", 0, "none", 0);
  Move metalClaw = new Move("Metal Claw", 35, 50, 0.95, "Steel", "Physical", 0, "Attack+", 0.1);

  //FLYING
  Move gust = new Move("Gust", 35, 40, 1, "Flying", "Special", 0, "none", 0);
  Move peck = new Move("Peck", 35, 40, 1, "Flying", "Physical", 0, "none", 0);
  Move pluck = new Move("Pluck", 20, 60, 1, "Flying", "Physical", 0, "none", 0);
  Move hurricane = new Move("Hurricane", 10, 110, 0.7, "Ice", "Special", 0, "Confusion", 0.3);
  Move featherDance = new Move("Feather Dance", 15, 0, 1, "Flying", "Status", 0, "Attack--", 1);
  Move wingAttack = new Move("Wing Attack", 35, 60, 1, "Flying", "Physical", 0, "none", 0);
  Move airSlash = new Move("Air Slash", 15, 75, 0.95, "Flying", "Special", 0, "Flinch", 0.3);

  //GROUND
  Move boneClub = new Move("Bone Club", 20, 65, 0.85, "Ground", "Physical", 0, "none", 0);
  Move sandAttack = new Move("Sand Attack", 15, 0, 1, "Ground", "Status", 0, "Accuracy-", 1);
  Move mudSlap = new Move("Mud-Slap", 10, 20, 1, "Ground", "Special", 0, "Accuracy-", 1);
  Move bulldoze = new Move("Bulldoze", 20, 60, 1, "Ground", "Physical", 0, "Speed-", 1);
  Move mudShot = new Move("Mud Shot", 15, 55, 0.95, "Ground", "Special", 0, "Speed-", 1);
  Move earthPower = new Move("Earth Power", 10, 90, 1, "Ground", "Special", 0, "Sp.Defense-", 0.1);
  Move earthquake = new Move("Earthquake", 10, 100, 1, "Ground", "Physical", 0, "none", 0);
  Move mudBomb = new Move("Mud Bomb", 10, 65, 0.85, "Ground", "Special", 0, "Accuracy-", 0.3);

  //FAIRY
  Move charm = new Move("Charm", 20, 0, 1, "Fairy", "Status", 0, "none", 0);
  Move disarmingVoice = new Move("Disarming Voice", 15, 40, 0, "Fairy", "Special", 0, "none", 0);
  Move babyDollEyes = new Move("Baby-Doll Eyes", 30, 0, 1, "Fairy", "Status", 1, "Attack-", 1);
  Move fairyWind = new Move("Disarming Voice", 30, 40, 1, "Fairy", "Special", 0, "none", 0);

  //PSYCHIC
  Move teleport = new Move("Teleport", 20, 0, 0, "Psychic", "Status", 0, "run", 0);
  Move confusion = new Move("Confusion", 25, 50, 1, "Psychic", "Special", 0, "Confusion", 0.1);
  Move zenHeadbutt = new Move("Zen Headbutt", 15, 80, 0.9, "Psychic", "Physical", 0, "Flinch", 0.2);
  Move amnesia = new Move("Amnesia", 20, 0, 0, "Psychic", "Status", 0, "Sp.Defense++", 1);
  Move agility = new Move("Agility", 30, 0, 0, "Psychic", "Status", 0, "Speed++", 1);
  Move hypnosis = new Move("Hypnosis", 20, 0, 0.6, "Psychic", "Status", 0, "Sleep", 1);
  Move psybeam = new Move("Psybeam", 20, 65, 1, "Psychic", "Special", 0, "Confusion", 0.1);
  Move kinesis = new Move("Kinesis", 15, 0, 0.8, "Psychic", "Status", 0, "Accuracy-", 1);
  Move psychic = new Move("Psychic", 10, 90, 1, "Psychic", "Special", 0, "Sp.Defense-", 0.1);
  Move psyShock = new Move("Psyshock", 16, 80, 1, "Psychic", "Special", 0, "none", 0);
  Move calmMind = new Move("Calm Mind", 32, 0, 0, "Psychic", "Status", 0, "Sp.Attack+/Sp.Defense+", 1);

  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
  //                                                    (Base stats)
  //Pokemon example = new Pokemon("Name", "Type", level, hp, attack, defense, sp. attack, sp. defense, speed); 

  //Set up Pokemon and their movesets

  //TRAINER POKEMON

  //Level 36 Charizard
  Pokemon charizard = new Pokemon("Charizard", "Fire/Flying", 36, 78, 84, 78, 109, 85, 100); 
  charizard.moveSet(flareBlitz, dragonClaw, shadowClaw, airSlash);

  //Level 18 Scyther
  Pokemon scyther = new Pokemon("Scyther", "Bug/Flying", 18, 70, 110, 80, 55, 80, 105);
  scyther.moveSet(pursuit, vacuumWave, quickAttack, agility);

  //Level 34 Lapras
  Pokemon lapras = new Pokemon("Lapras", "Water/Ice", 34, 130, 85, 80, 85, 95, 60);
  lapras.moveSet(waterPulse, sing, iceBeam, bodySlam);

  //Level 26 Krabby
  Pokemon krabby = new Pokemon("Krabby", "Water", 26, 30, 105, 90, 25, 25, 50);
  krabby.moveSet(bubbleBeam, stomp, mudShot, metalClaw);

  //Level 17 Magnemite
  Pokemon magnemite = new Pokemon("Magnemite", "Electric/Steel", 17, 25, 35, 70, 95, 55, 45);
  magnemite.moveSet(thunderShock, magnetBomb, thunderWave, supersonic);

  //Level 19 Mimikyu
  Pokemon mimikyu = new Pokemon("Mimikyu", "Ghost/Fairy", 19, 55, 90, 80, 50, 105, 96);
  mimikyu.moveSet(woodHammer, shadowSneak, doubleTeam, babyDollEyes);


  //Level 38 Pidgeot
  Pokemon pidgeot = new Pokemon("Pidgeot", "Normal/Flying", 38, 83, 80, 75, 70, 70, 101);
  pidgeot.moveSet(hurricane, quickAttack, featherDance, twister);

  //Level 24 Arcanine
  Pokemon arcanine = new Pokemon("Arcanine", "Fire", 24, 90, 110, 80, 100, 80, 95);
  arcanine.moveSet(bite, thunderFang, fireFang, none);

  //Level 27 Braixen
  Pokemon braixen = new Pokemon("Braixen", "Fire", 27, 59, 59, 58, 90, 70, 73);
  braixen.moveSet(ember, scratch, flameCharge, psybeam);

  //Level 12 Cubone
  Pokemon cubone = new Pokemon("Cubone", "Ground", 12, 50, 50, 95, 40, 50, 35);
  cubone.moveSet(boneClub, headbutt, tailWhip, none);

  //Level 23 Espeon
  Pokemon espeon = new Pokemon("Espeon", "Psychic", 23, 65, 65, 60, 130, 95, 110);
  espeon.moveSet(psybeam, quickAttack, swift, babyDollEyes);

  //Level 20 Seel
  Pokemon seel = new Pokemon("Seel", "Water", 20, 65, 45, 55, 45, 70, 45);
  seel.moveSet(headbutt, icyWind, iceShard, surf);
  
  //Level 24 Snover
  Pokemon snover = new Pokemon("Snover", "Grass/Ice", 24, 60, 62, 50, 62, 60, 40);
  snover.moveSet(leer, icyWind, razorLeaf, iceShard);


  //Level 9 Diglett
  Pokemon diglett = new Pokemon("Diglett", "Ground", 9, 10, 55, 25, 35, 45, 95);
  diglett.moveSet(scratch, astonish, none, none);

  //Level 15 Spearow
  Pokemon spearow = new Pokemon("Spearow", "Normal/Flying", 13, 40, 60, 30, 31, 31, 70);
  spearow.moveSet(peck, pursuit, furyAttack, none);

  //Level 12 Weepinbell
  Pokemon weepinbell = new Pokemon("Weepinbell", "Grass/Poison", 12, 65, 90, 50, 85, 45, 55);
  weepinbell.moveSet(vineWhip, wrap, none, none);

  //Level 8 Mankey
  Pokemon mankey = new Pokemon("Mankey", "Fighting", 8, 40, 80, 35, 35, 45, 70);
  mankey.moveSet(covet, scratch, karateChop, none);

  //Level 14 Rhydon
  Pokemon rhydon = new Pokemon("Rhydon", "Rock/Ground", 14, 80, 85, 95, 30, 30, 25);
  rhydon.moveSet(hornAttack, scaryFace, tailWhip, none);

  //Level 9 Magikarp
  Pokemon magikarp = new Pokemon("Magikarp", "Water", 9, 20, 10, 55, 15, 20, 80);
  magikarp.moveSet(splash, none, none, none);


  //Level 21 Dratini
  Pokemon dratini = new Pokemon("Dratini", "Dragon", 21, 41, 64, 45, 50, 50, 50);
  dratini.moveSet(twister, wrap, dragonRage, thunderWave);

  //Level 24 Vileplume
  Pokemon vileplume = new Pokemon("Vileplume", "Grass/Poison", 24, 75, 80, 85, 110, 90, 50);
  vileplume.moveSet(megaDrain, acid, sleepPowder, toxic);

  //Level 9 Alolan Geodude
  Pokemon alolanGeodude = new Pokemon("Alolan Geodude", "Rock/Electric", 9, 40, 80, 100, 30, 30, 20);
  alolanGeodude.moveSet(rollout, tackle, none, none);

  //Level 28 Marshtomp
  Pokemon marshtomp = new Pokemon("Marshtomp", "Water/Ground", 28, 70, 85, 70, 60, 70, 50);
  marshtomp.moveSet(waterGun, mudBomb, rockSlide, surf); //Mud bomb

  //Level 13 Abra
  Pokemon abra = new Pokemon("Abra", "Psychic", 13, 25, 20, 15, 105, 55, 90);
  abra.moveSet(psychic, teleport, none, none);

  //Level 26 Snorlax
  Pokemon snorlax = new Pokemon("Snorlax", "Normal", 26, 160, 110, 65, 65, 110, 30);
  snorlax.moveSet(lick, amnesia, tackle, bodySlam);

  //Level 14 Ponyta
  Pokemon ponyta = new Pokemon("Ponyta", "Fire", 14, 50, 85, 55, 65, 65, 90);
  ponyta.moveSet(flameWheel, stomp, ember, tailWhip);

  //Level 21 Exeggcute
  Pokemon exeggcute = new Pokemon("Exeggcute", "Grass/Psychic", 21, 60, 40, 80, 60, 45, 40);
  exeggcute.moveSet(bulletSeed, uproar, leechSeed, stunSpore);


  //Level 13 Litten
  Pokemon litten = new Pokemon("Litten", "Fire", 13, 45, 65, 40, 60, 40, 70);
  litten.moveSet(ember, scratch, lick, none);

  //Level 21 Gastly
  Pokemon gastly = new Pokemon("Gastly", "Ghost/Poison", 21, 30, 35, 30, 100, 35, 80);
  gastly.moveSet(lick, confuseRay, hypnosis, none);

  //Level 11 Raichu
  Pokemon raichu = new Pokemon("Raichu", "Electric", 11, 60, 90, 55, 90, 80, 110);
  raichu.moveSet(thunderbolt, quickAttack, thunderShock, tailWhip);

  //Level 21 Vulpix
  Pokemon vulpix = new Pokemon("Vulpix", "Fire", 21, 38, 41, 40, 50, 65, 65);
  vulpix.moveSet(quickAttack, feintAttack, ember, confuseRay);


  //Level 17 Dartrix
  Pokemon dartrix = new Pokemon("Dartrix", "Grass/Flying", 17, 78, 75, 75, 70, 70, 52);
  dartrix.moveSet(leafage, peck, tackle, astonish);


  //Level 12 Popplio
  Pokemon popplio = new Pokemon("Popplio", "Water", 12, 50, 54, 54, 66, 56, 40);
  popplio.moveSet(waterGun, disarmingVoice, pound, babyDollEyes);

  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 

  //WILD POKEMON / NPC POKEMON

  //GENERATION 1

  //Level 32 Pidgeotto
  Pokemon pidgeotto = new Pokemon("Pidgeotto", "Normal/Flying", 32, 63, 60, 55, 50, 50, 71);
  pidgeotto.moveSet(gust, quickAttack, featherDance, twister);

  //Level 32 Charmeleon
  Pokemon charmeleon = new Pokemon("Charmeleon", "Fire", 32, 58, 64, 58, 80, 65, 80); 
  charmeleon.moveSet(dragonRage, flameBurst, fireFang, smokescreen);

  //Level 17 Pawniard
  Pokemon pawniard = new Pokemon("Pawniard", "Dark/Seel", 17, 45, 85, 70, 40, 40, 60);
  pawniard.moveSet(feintAttack, scratch, furyCutter, leer);

  //Level 25 Drowzee
  Pokemon drowzee = new Pokemon("Drowzee", "Psychic", 25, 60, 48, 45, 43, 90, 42);
  drowzee.moveSet(confusion, headbutt, hypnosis, pound);

  //Level 25 Kadabra
  Pokemon kadabra = new Pokemon("Kadabra", "Psychic", 25, 40, 35, 30, 120, 70, 105);
  kadabra.moveSet(confusion, psybeam, teleport, kinesis);

  //Level 16 Jigglypuff
  Pokemon jigglypuff = new Pokemon("Jigglypuff", "Normal/Fairy", 16, 115, 45, 20, 45, 25, 20);
  jigglypuff.moveSet(sing, defenseCurl, pound, none);

  //Level 10 Bellsprout
  Pokemon bellsprout = new Pokemon("Bellsprout", "Grass/Poison", 10, 50, 75, 35, 70, 30, 40);
  bellsprout.moveSet(vineWhip, wrap, none, none);

  //Level 16 Geodude
  Pokemon geodude = new Pokemon("Geodude", "Rock", 16, 40, 80, 100, 30, 30, 20);
  geodude.moveSet(rockThrow, rollout, none, defenseCurl);

  //Level 17 Graveler
  Pokemon graveler = new Pokemon("Graveler", "Rock/Ground", 17, 55, 95, 115, 45, 45, 35);
  graveler.moveSet(none, tackle, rollout, none);

  //Level 13 Sandshrew
  Pokemon sandshrew = new Pokemon("Sandshrew", "Ground", 13, 50, 75, 85, 20, 30, 40);
  sandshrew.moveSet(rollout, poisonSting, scratch, sandAttack);

  //Level 35 Articuno
  Pokemon articuno = new Pokemon("Articuno", "Ice/Flying", 35, 90, 85, 100, 95, 125, 85);
  articuno.moveSet(iceBeam, blizzard, agility, hurricane);

  //Level 24 Dugtrio
  Pokemon dugtrio = new Pokemon("Dugtrio", "Ground", 24, 35, 100, 50, 50, 70, 120);
  dugtrio.moveSet(triAttack, nightSlash, bulldoze, astonish);

  //Level 10 Onix
  Pokemon onix = new Pokemon("Onix", "Rock/Ground", 10, 35, 45, 160, 30, 45, 70);
  onix.moveSet(bind, tackle, rockThrow, none);

  //Level 13 Eevee
  Pokemon eevee = new Pokemon("Eevee", "Normal", 13, 55, 55, 50, 45, 65, 55);
  eevee.moveSet(covet, tackle, charm, refresh);

  //Level 18 Oddish
  Pokemon oddish = new Pokemon("Oddish", "Grass/Poison", 18, 45, 50, 55, 75, 65, 30);
  oddish.moveSet(megaDrain, sleepPowder, poisonPowder, toxic);

  //Level 23 Voltorb
  Pokemon voltorb = new Pokemon("Voltorb", "Electric", 23, 40, 30, 50, 55, 55, 100);
  voltorb.moveSet(spark, rollout, swift, none);

  //Level 25 Lt. Surge's Pikachu
  Pokemon ltPikachu = new Pokemon("Pikachu", "Electric", 25, 35, 55, 40, 50, 50, 90);
  ltPikachu.moveSet(spark, quickAttack, thunderWave, tailWhip);

  //Level 28 Lt. Raichu
  Pokemon ltRaichu = new Pokemon("Lt. Raichu", "Electric", 28, 60, 90, 55, 90, 80, 110);
  ltRaichu.moveSet(thunderbolt, quickAttack, thunderShock, tailWhip);

  //Level 9 Pikachu
  Pokemon pikachu = new Pokemon("Pikachu", "Electric", 9, 35, 55, 40, 50, 50, 90);

  pikachu.moveSet(thunderShock, quickAttack, none, none);
  //Level 21 Chansey
  Pokemon chansey = new Pokemon("Chansey", "Normal", 21, 250, 5, 5, 35, 105, 50);
  chansey.moveSet(pound, defenseCurl, tailWhip, none);

  //Level 21 Tauros
  Pokemon tauros = new Pokemon("Tauros", "Normal", 21, 75, 100, 95, 40, 70, 110);
  tauros.moveSet(hornAttack, pursuit, scaryFace, tailWhip);

  //Level 26 Noivern
  Pokemon noivern = new Pokemon("Noivern", "Flying/Dragon", 26, 85, 70, 80, 97, 80, 123);
  noivern.moveSet(dragonPulse, hurricane, supersonic, bite);

  //Level 29 Muk
  Pokemon muk = new Pokemon("Muk", "Poison", 29, 105, 105, 75, 65, 100, 50);
  muk.moveSet(sludge, mudSlap, harden, poisonGas);

  //Level 24 Koffing
  Pokemon koffing = new Pokemon("Koffing", "Poison", 24, 40, 65, 95, 60, 45, 35);
  koffing.moveSet(tackle, smog, smokescreen, assurance);

  //Level 31 Weezing
  Pokemon weezing = new Pokemon("Weezing", "Poison", 31, 65, 90, 120, 85, 70, 60);
  weezing.moveSet(sludge, smog, smokescreen, assurance);

  //Level 26 Sandslash
  Pokemon sandslash = new Pokemon("Sandslash", "Ground", 26, 75, 100, 110, 45, 55, 65);
  sandslash.moveSet(swift, crushClaw, defenseCurl, sandAttack);

  //Level 27 Cloyster
  Pokemon cloyster = new Pokemon("Cloyster", "Water/Ice", 27, 50, 95, 180, 85, 45, 70);
  cloyster.moveSet(shellSmash, hydroPump, icicleSpear, rockBlast);

  //Level 32 Vibrava

  Pokemon vibrava = new Pokemon("Vibrava", "Ground/Dragon", 32, 50, 70, 50, 50, 50, 70);
  vibrava.moveSet(dragonBreath, rockSlide, earthquake, screech);

  //Level 40 Latias
  Pokemon latias = new Pokemon("Latias", "Dragon/Psychic", 40, 80, 80, 90, 110, 130, 110);
  latias.moveSet(iceBeam, psyShock, calmMind, recover);

  //GALAR REIGON

  //NORMAL WEATHER

  //Level 16 Combee
  Pokemon combee = new Pokemon("Combee", "Bug/FLying", 16, 30, 30, 42, 30, 42, 70);
  combee.moveSet(gust, bugBite, none, none);

  //Level 21 Minccino
  Pokemon mincinno = new Pokemon("Mincinno", "Normal", 21, 55, 50, 40, 40, 40, 75);
  mincinno.moveSet(swift, sing, tickle, babyDollEyes);

  //Level 17 Skwovet
  Pokemon skwovet = new Pokemon("Skwovet", "Normal", 17, 70, 55, 55, 35, 35, 25);
  skwovet.moveSet(bite, tailWhip, none, none);

  //Level 17 Blipbug
  Pokemon blipbug = new Pokemon("Blipbug", "Normal", 17, 25, 20, 20, 25, 45, 45);
  blipbug.moveSet(struggleBug, none, none, none);

  //Level 16 Rookidee
  Pokemon rookidee = new Pokemon("Rookidee", "Flying", 16, 38, 47, 35, 33, 35, 57);
  rookidee.moveSet(peck, none, none, none);

  //Level 17 Nickit
  Pokemon nickit = new Pokemon("Nickit", "Dark", 17, 40, 28, 28, 47, 52, 50);
  nickit.moveSet(assurance, snarl, honeClaws, quickAttack);

  //Level 22 Galarian Ponyta
  Pokemon galarianPonyta = new Pokemon("Galarian Ponyta", "Psychic", 22, 50, 85, 55, 65, 65, 90);
  galarianPonyta.moveSet(confusion, fairyWind, tailWhip, agility);


  //IMPORTANT NPC POKEMON

  //CASSIE

  //Level 34 Shelgon
  Pokemon shelgon = new Pokemon("Shelgon", "Dragon", 34, 65, 95, 100, 60, 50, 50);
  shelgon.moveSet(dragonBreath, bite, headbutt, ember);

  //Level 31 Alolan Sandslash
  Pokemon alolanSandslash = new Pokemon("Alolan Sandslash", "Ice/Steel", 31, 75, 100, 120, 25, 65, 65);
  alolanSandslash.moveSet(icicleCrash, slash, icicleSpear, metalClaw);

  //Level 27 Arbok
  Pokemon arbok = new Pokemon("Arbok", "Poison", 27, 60, 95, 69, 65, 79, 80);
  arbok.moveSet(crunch, poisonSting, thunderFang, fireFang);

  //Level 34 Vaporeon
  Pokemon vaporeon = new Pokemon("Vaporeon", "Water", 34, 130, 65, 60, 110, 95, 65);
  vaporeon.moveSet(waterPulse, auroraBeam, quickAttack, aquaRing);


  //THE GUY

  //Level 26 Psyduck
  Pokemon psyduck = new Pokemon("Psyduck", "Water", 26, 50, 52, 48, 65, 50, 55);
  psyduck.moveSet(waterPulse, zenHeadbutt, confusion, scratch);


  //ASHLEY

  //Level 32 Gyarados
  Pokemon gyarados = new Pokemon("Gyarados", "Water/Flying", 32, 95, 125, 79, 60, 100, 81);
  gyarados.moveSet(bite, twister, thrash, iceFang);

  //Level 28 Lucario
  Pokemon lucario = new Pokemon("Lucario", "Fighting/Steel", 28, 70, 110, 70, 115, 70, 90);
  lucario.moveSet(auraSphere, quickAttack, detect, swordsDance);

  //Level 33 Ampharos
  Pokemon ampharos = new Pokemon("Ampharos", "Electric", 33, 90, 75, 85, 115, 90, 55);
  ampharos.moveSet(dragonPulse, firePunch, thunderPunch, takeDown);

  //Level 34 Tyranitar
  Pokemon tyranitar = new Pokemon("Tyranitar", "Rock/Dark", 34, 100, 134, 110, 95, 100, 61);
  tyranitar.moveSet(thrash, bite, thunderFang, iceFang);

  //Level 36 Altaria
  Pokemon altaria = new Pokemon("Altaria", "Dragon/Flying", 3629, 75, 70, 90, 70, 105, 80);
  altaria.moveSet(dragonBreath, sing, disarmingVoice, dragonDance);

  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 

  //Initiate trainers

  Trainer zofia = new Trainer("Zofia");
  Trainer jasmine = new Trainer("Jasmine");
  Trainer barnabas = new Trainer("Barnabas");
  Trainer nicholas = new Trainer("Nicholas");
  Trainer joanna = new Trainer("Joanna");
  Trainer stella = new Trainer("Stella");
  Trainer nina = new Trainer("Nina");

  Trainer theGuy = new Trainer("The Guy");
  Trainer cassie = new Trainer("Cassie");
  Trainer ashley = new Trainer("Ashley");

  Trainer ltSurge = new Trainer("Lt. Surge");
  Trainer nate = new Trainer("Nate");
  Trainer randomTrainer = new Trainer("Random");
  Trainer wild = new Trainer("Wild");

  zofia.addPokemon(charizard, scyther, lapras, magnemite, krabby, mimikyu);
  jasmine.addPokemon(pidgeot, arcanine, braixen, snover, espeon, seel);
  barnabas.addPokemon(diglett, spearow, weepinbell, mankey, magikarp, rhydon);
  nicholas.addPokemon(dratini, vileplume, ponyta, marshtomp, snorlax, abra);
  joanna.addPokemon(litten, gastly, raichu, vulpix);
  stella.addPokemon(dartrix);
  nina.addPokemon(popplio);

  theGuy.addPokemon(psyduck);
  cassie.addPokemon(shelgon, alolanSandslash, arbok, vaporeon);
  nate.addPokemon(ponyta, dugtrio);
  ashley.addPokemon(gyarados, lucario, ampharos, tyranitar, altaria);

  ltSurge.addPokemon(voltorb, ltPikachu, ltRaichu);
  randomTrainer.addPokemon(koffing, muk, koffing, weezing);
  wild.addPokemon(latias);

  printPokemon();
  printCharizard();

  //gyarados.moveSet(bite, twister, thrash, iceFang);
  //lucario.moveSet(auraSphere, quickAttack, detect, swordsDance);
  //ampharos.moveSet(dragonPulse, firePunch, thunderPunch, takeDown);
  //tyranitar.moveSet(thrash, bite, thunderFang, iceFang);
  //noivern.moveSet(dragonPulse, hurricane, supersonic, bite);
  //altaria.moveSet(dragonBreath, sing, disarmingVoice, dragonDance);

  //PLS UPDATE.
  //For fuschia gym | randomSeed(11); 
  randomSeed(18);

  Battle battle = new Battle(nicholas, joanna);
  
  //battle.move(arbok, 3, magnemite, 1);

  //arbok.useMove(crunch, charizard);

  //battle.move(arbok, 1, charizard, 0);

  //battle.move(arbok, 1, charizard, 0);

  //charizard.useMove(dragonClaw, sandslash);

  //sandslash.useMove(crushClaw, krabby);

  //battle.move(sandslash, 1, krabby, 0);

  //battle.move(sandslash, 1, krabby, 0);

  //battle.move(sandslash, 0, lapras, 0);

  //battle.move(arbok, 2, lapras, 1);

  //battle.move(arbok, 2, lapras, 2);

  //battle.move(arbok, 2, lapras, 0);
  //arbok.rest();
  //battle.move(arbok, 0, charizard, 0);

  //battle.move(arbok, 0, charizard, 2);

  //battle.move(arbok, 0, charizard, 3);

  //battle.move(drowzee, 2, vileplume, 0);

  //battle.move(drowzee, 2, vileplume, 0);

  //battle.move(drowzee, 0, vileplume, 0);

  //battle.move(drowzee, 0, vileplume, 0);

  //drowzee.useMove(hypnosis, snorlax);

  //battle.move(drowzee, 0, snorlax, 1);

  //battle.move(drowzee, 0, snorlax, 0);

  //battle.move(drowzee, 1, snorlax, 0);

  //battle.move(drowzee, 1, snorlax, 0);

  //battle.move(drowzee, 1, snorlax, 2);

  //nicholas.useItem("Sitrus Berry", snorlax);

  //battle.move(kadabra, 1, abra, 0);

  //kadabra.useMove(psybeam, dratini);

  //battle.move(kadabra, 0, dratini, 1);

  //nicholas.useItem("Sitrus Berry", dratini);

  //kadabra.useMove(confusion, vileplume);

  //battle.move(kadabra, 3, vileplume, 0);

  //battle.move(kadabra, 0, vileplume, 0);

  //battle.move(kadabra, 1, alolanGeodude, 0);

  //battle.move(kadabra, 3, snorlax, 1);

  //battle.move(kadabra, 1, snorlax, 0);

  //battle.move(kadabra, 1, snorlax, 1);

  //nicholas.useItem("Fresh Water", snorlax);

  //kadabra.useMove(confusion, snorlax);

  //battle.move(kadabra, 1, snorlax, 0);

  //battle.move(kadabra, 1, snorlax, 0);

  //battle.move(kadabra, 1, snorlax, 0);

  //battle.move(kadabra, 1, snorlax, 0);

  //battle.move(koffing, 2, espeon, 0);

  //battle.move(koffing, 3, espeon, 0);

  //battle.move(muk, 0, espeon, 0);

  //battle.move(muk, 0, espeon, 0);

  //jasmine.useItem("Sitrus Berry", espeon);

  //battle.move(muk, 0, espeon, 0);

  //battle.move(muk, 0, espeon, 0);

  //battle.move(muk, 0, cubone, 0);

  //battle.move(muk, 1, cubone, 0);

  //battle.move(muk, 1, cubone, 0);

  //battle.move(muk, 0, pidgeotto, 2);  

  //battle.move(muk, 0, pidgeotto, 3);



  //charizard.moveSet(flareBlitz, dragonClaw, shadowClaw, airSlash);

  //scyther.moveSet(pursuit, vacuumWave, quickAttack, falseSwipe);

  //lapras.moveSet(waterPulse, sing, iceShard, bodySlam);

  //krabby.moveSet(bubble, viceGrip, harden, metalClaw);

  //magnemite.moveSet(thunderShock, magnetBomb, thunderWave, supersonic);

  //mimikyu.moveSet(woodHammer, shadowSneak, doubleTeam, scratch);


  //pidgeotto.moveSet(gust, quickAttack, whirlwind, featherdance);

  //arcanine.moveSet(bite, thunderFang, fireFang, none);

  //braxien.moveSet(ember, scratch, flameCharge, tailWhip);

  //cubone.moveSet(boneClub, headbutt, tailWhip, none);

  //espeon.moveSet(confusion, quickAttack, sandAttack, babyDollEyes);

  //seel.moveSet(headbutt, icyWind, none, none);


  //dratini.moveSet(twister, wrap, dragonRage, thunderWave);

  //vileplume.moveSet(megaDrain, acid, sleepPowder, toxic);

  //alolanGeodude.moveSet(rollout, tackle, none, none);

  //marshtomp.moveSet(waterGun, mudShot, mudSlap, bide);

  //abra.moveSet(teleport, none, none, none);

  //snorlax.moveSet(lick, amnesia, tackle, none);

  //ponyta.moveSet(flameWheel, stomp, ember, tailWhip);

  //exeggcute.moveSet(bulletSeed, uproar, leechSeed, stunSpore);

  //alolanGeodude.moveSet(rollout, tackle, none, none);
}

void catchPokemon(Pokemon p, String pokeball, int catchRate) {
  if (pokeball.equals("Master Ball")) {
    println(p.name, "was caught!");
    println();
    return;
  }

  int n;

  if (pokeball.equals("Poke Ball"))
    n = int(random(0, 255));

  else if (pokeball.equals("Great Ball"))
    n = int(random(0, 200));

  else
    n = int(random(0, 150));

  if ((((p.sleep || p.freeze) && (n < 25)) || ((p.paralysis || p.burn || p.poison)) && (n < 12))) {
    println(p.name, "was caught!");
    println();
    return;
  }

  int x = 0;
  int d;
  int z;

  if (p.sleep || p.freeze) {
    x = 25;
  } else if (p.paralysis || p.burn || p.poison) {
    x = 12;
  } else if ((n - (x)) > catchRate) {
    println(p.name, "broke free!");
    println();
    return;
  }

  int m = int(random(0, 255));

  int f;

  if (pokeball.equals("Great Ball"))
    f = int(float(p.health*255*4)/(p.currHealth * 8));

  else
    f = int(float(p.health*255*4)/(p.currHealth * 12));

  if (f >= m) {
    println(p.name, "was caught!");
    println();
    return;
  } else {
    if (pokeball.equals("Poke Ball"))
      d = catchRate * 100 / 255;

    else if (pokeball.equals("Great Ball"))
      d = catchRate * 100 / 200;

    else
      d = catchRate * 100 / 150;

    if (d >= 256) {
      println("Wobble, wobble, wobble.");
      println();
    } else {
      if (p.sleep || p.freeze)
        z = int(float(d * f) / 255 + 10);
      else if (p.burn || p.poison || p.paralysis)
        z = int(float(d * f) / 255 + 5);
      else
        z = int(float(d * f) / 255);

      if (z < 10) {
        println("The ball misses!");
        println();
      } else if (z < 30) {
        println("Wobble.");
        println();
      } else if (z < 70) {
        println("Wobble, wobble.");
        println();
      } else {
        println("Wobble, wobble, wobble.");
        println();
      }
    }

    println(p.name, "broke free!");
    println();
    return;
  }
}

void printPokemon() {
  //Need two forward slashes for each forward slash, 
  //otherwise, the program mistakes them as failed escape sequences
  println("    _.----.        ____                  ___    ___     ____");
  println("_,-'       `.     |    |  /`.           |   \\  /   |   |    \\  |`.");
  println("\\      __    \\    '-.  | /   `.  ___    |    \\/    |   '-.   \\ |  |");
  println(" \\.    \\ \\   |  __  |  |/    ,','_  `.  |          | __  |    \\|  |");
  println("   \\    \\/   /,' _`.|      ,' / / / /   |          ,' _`.|     |  |");
  println("    \\     ,-'/  /   \\    ,'   | \\/ / ,`.|         /  /   \\  |     |");
  println("     \\    \\ |   \\_/  |   `-.  \\    `'  /|  |    ||   \\_/  | |\\    |");
  println("      \\    \\ \\      /       `-.`.___,-' |  |\\  /| \\      /  | |   |");
  println("       \\    \\ `.__,'|  |`-._    `|      |__| \\/ |  `.__,'|  | |   |");
  println("        \\_.-'       |__|    `-._ |              '-.|     '-.| |   |");
  println("                                `'                            '-._|");
  println();
}

void printCharizard() {
  println();
  println("                   .'-,.__");
  println("                 `.     `.  ,");
  println("              .--'  .._,''-' `.");
  println("             .    .'         `'");
  println("             `.   /          ,'");
  println("               `  '--.   ,-''");
  println("                `'`   |  \\");
  println("                   -. \\, |");
  println("                    `--Y.'      ___.");
  println("                         \\     L._, \\");
  println("               _.,        `.   <  <\\                _");
  println("             ,' '           `, `.   | \\            ( `");
  println("          ../, `.            `  |    .\\`.           \\ \\_");
  println("         ,' ,..  .           _.,'    ||\\l            )  ''.';");
  println("        , ,'   \\           ,'.-.`-._,'  |           .  _._`.");
  println("      ,' /      \\ \\        `' ' `--/   | \\          / /   ..\\");
  println("    .'  /        \\ .         |\\__ - _ ,'` `        / /     `.`.");
  println("    |  '          ..         `-...-'  |  `-'      / /        . `.");
  println("    | /           |L__           |    |          / /          `. `.");
  println("   , /            .   .          |    |         / /             ` `");
  println("  / /          ,. ,`._ `-_       |    |  _   ,-' /               ` \\");
  println(" / .           \\'`_/. `-_ \\_,.  ,'    +-' `-'  _,        ..,-.    \\`.");
  println(".  '         .-f    ,'   `    '.       \\__.---'     _   .'   '     \\ \\");
  println("' /          `.'    l     .' /          \\..      ,_|/   `.  ,'`     L`");
  println("|'      _.-''` `.    \\ _,'  `            \\ `.___`.''`-.  , |   |    | \\");
  println("||    ,'      `. `.   '       _,...._        `  |    `/ '  |   '     .|");
  println("||  ,'          `. ;.,.---' ,'       `.   `.. `-'  .-' /_ .'    ;_   ||");
  println("|| '              V      / /           `   | `   ,'   ,' '.    !  `. ||");
  println("||/            _,-------7 '              . |  `-'    l         /    `||");
  println(". |          ,' .-   ,' ||               | .-.        `.      .'     ||");
  println(" `'        ,'    `'.'    |               |    `.        '. -.'       `'");
  println("          /      ,'      |               |,'    \\-.._,.'/'");
  println("          .     /        .               .       \\    .''");
  println("        .`.    |         `.             /         :_,'.'");
  println("          \\ `...\\   _     ,'-.        .'         /_.-'");
  println("           `-.__ `,  `'   .  _.>----''.  _  __  /');");
  println("                .'        /''          |  ''   '_');");
  println("               /_|.-'\\ ,'.             '.'`__'-( \\");
  println("                 / ,'''\\,'               `/  `-.|'mh");
  println();
  println();
  println();
}

////Describing the trainers
//cassie.describe();  
//jasmine.describe();

////Describing the pokemon and their moves
//alolanSandslash.describe();
//alolanSandslash.printMoves();

//pidgeotto.describe();
//pidgeotto.printMoves();

////Automatic battle
//Battle round1 = new Battle(cassie, jasmine);
//round1.start1v1(alolanSandslash, 0, pidgeotto, 3);

////See the aftermath
//alolanSandslash.describe();
//pidgeotto.describe();

////Describe trainers
//cassie.describe();
//zofia.describe();

////Describe the pokemon and their moves
//charizard.describe();
//charizard.printMoves();

////Automatic battle
//Battle round2 = new Battle(cassie, zofia);
//round2.start1v1(alolanSandslash, 0, charizard, 1);

////Describe Pokemon & Berry Giving
//charizard.describe();
//charizard.giveBerry("Sitrus", zofia);

//arbok.describe();
//arbok.printMoves();

////Rematch: Manual Battle
//round2.move(arbok, 1, charizard, 0);
//round2.move(arbok, 1, charizard, 1);
//round2.move(arbok, 1, charizard, 1);
//round2.move(arbok, 1, charizard, 0);
//round2.move(arbok, 0, charizard, 1);
//round2.move(arbok, 2, charizard, 0);

//if (charizard.currHealth > 0 && arbok.currHealth > 0) {
//  round2.move(arbok, 0, charizard, 1);
//}

//if (charizard.currHealth > 0 && arbok.currHealth > 0) {
//  round2.move(arbok, 2, charizard, 0);
//}

////Aftermath

//cassie.describe();
//zofia.describe();

//pidgeotto.rest();
//alolanSandslash.rest();
//charizard.rest();
//arbok.rest();
