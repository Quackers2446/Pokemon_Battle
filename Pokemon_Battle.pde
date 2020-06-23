void setup() {
  exit();

  //Move example = new Move("Name", Power Points, Power, Accuracy, "Type", "Damage Catagory");

  //Set up moveSet
  Move none = new Move("None", 100, 0, 0.01, "Normal", "Status", 0, "none", 0);

  //FAKE moveSet
  Move quack = new Move("Quack", 1, 0, 1, "Normal", "Status", 1, "Attack++/Defense-", 1);
  Move fatten = new Move("Fatten", 1, 0, 0, "Normal", "Status", 1, "Hp+/Defense++", 1);
  Move weightLoss = new Move("Weight Loss", 1, 0, 0, "Normal", "Status", 1, "Evasion+/Speed++", 1);
  Move oneWithTheWall = new Move("One with the Wall", 1, 0, 0, "Normal", "Status", 1, "Evasion+++", 1);

  //NORMAL type move
  Move tackle = new Move("Tackle", 35, 40, 1, "Normal", "Physical", 0, "none", 0);
  Move pound = new Move("Pound", 35, 40, 1, "Normal", "Physical", 0, "none", 0);
  Move scratch = new Move("Scratch", 35, 40, 1, "Normal", "Physical", 0, "none", 0);
  Move smokescreen = new Move("Smokescreen", 20, 0, 0, "Normal", "Status", 0, "Accuracy-", 1);
  Move sing = new Move("Sing", 15, 0, 1, "Normal", "Status", 0, "Sleep", 1);
  Move quickAttack = new Move("Quick Attack", 30, 40, 1, "Normal", "Physical", 1, "none", 0);
  Move extremeSpeed = new Move("Extreme Speed", 5, 80, 1, "Normal", "Physical", 2, "none", 0);
  Move falseSwipe = new Move("False Swipe", 40, 40, 1, "Normal", "Physical", 0, "none", 0);
  Move viceGrip = new Move("Vice Grip", 30, 55, 1, "Normal", "Physical", 0, "none", 0);
  Move whirlwind = new Move("Whirlwind", 20, 0, 1, "Normal", "Status", -6, "Switch", 1);
  Move covet = new Move("Covet", 25, 60, 1, "Normal", "Physical", 0, "none", 0);
  Move refresh = new Move("Refresh", 20, 0, 0, "Normal", "Status", 0, "none", 0);
  Move wrap = new Move("Wrap", 20, 45, 0.9, "Normal", "Physical", 0, "Repeat", 1);
  Move bind = new Move("Bind", 20, 45, 0.85, "Normal", "Physical", 0, "Repeat", 1);
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
  Move bide = new Move("Bide", 10, 0, 1, "Normal", "Status", 0, "none", 0);
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
  Move morningSun = new Move("Morning Sun", 5, 0, 0, "Normal", "Status", 0, "Recover", 1);
  Move chipAway = new Move("Chip Away", 20, 70, 1, "Normal", "Physical", 0, "none", 0);
  Move slam = new Move("Slam", 20, 80, 0.75, "Normal", "Physical", 0, "none", 0);
  Move snore = new Move("Snore", 15, 50, 1, "Normal", "Physical", 0, "Flinch", 0.3);
  Move tearfulLook = new Move("Tearful Look", 20, 0, 0, "Normal", "Status", 0, "Sp.Attack-/Attack-", 1);
  Move glare = new Move("Glare", 20, 0, 0, "Normal", "Status", 0, "Paralysis", 1);
  Move protect = new Move("Protect", 10, 0, 0, "Normal", "Status", 4, "Protect", 1);
  Move strength = new Move("Strength", 15, 80, 1, "Normal", "Physical", 0, "none", 0);
  Move nobleRoar = new Move("Noble Roar", 48, 0, 1, "Normal", "Status", 0, "Sp.Attack-/Attack-", 1);
  Move attract = new Move("Attract", 24, 0, 1, "Normal", "Status", 0, "Attract", 1);
  Move block = new Move("Block", 5, 0, 0, "Normal", "Status", 0, "none", 0);
  Move gigaImpact = new Move("Giga Impact", 5, 150, 0.9, "Normal", "Physical", 0, "none", 0);
  Move boomburst = new Move("Boomburst", 10, 140, 1, "Normal", "Physical", 0, "none", 0);
  Move doubleEdge = new Move("Double-Edge", 15, 120, 1, "Normal", "Physical", 0, "Recoil/0.33", 1);
  Move copyCat = new Move("Copy Cat", 0, 0, 0, "Normal", "Status", 0, "none", 0); //Filler
  Move substitute = new Move("Substitute", 16, 0, 0, "Normal", "Status", 0, "Substitute", 1);
  Move roar = new Move("Roar", 20, 0, 0, "Normal", "Status", 0, "Switch", 1);
  Move transform = new Move("Transform", 10, 0, 0, "Normal", "Status", 0, "Transform", 1);
  Move helpingHand = new Move("Helping Hand", 20, 0, 0, "Normal", "Status", 5, "HelpingHand", 1);
  Move spikes = new Move("Spikes", 32, 0, 0, "Normal", "Status", 0, "Spikes", 1);
  Move explosion = new Move("Explosion", 5, 250, 1, "Normal", "Physical", 0, "Explosion", 1);

  //FIRE
  Move ember = new Move("Ember", 25, 40, 1, "Fire", "Special", 0, "Burn", 0.1);
  Move fireSpin = new Move ("Fire Spin", 15, 35, .85, "Fire", "Special", 0, "Repeat", 1);
  Move fireFang = new Move("Fire Fang", 15, 65, 0.95, "Fire", "Physical", 0, "Flinch/Burn", 0.1);
  Move flameCharge = new Move("Flame Charge", 20, 50, 1, "Fire", "Special", 0, "Speed+", 1);
  Move flameWheel = new Move("Flame Wheel", 20, 60, 1, "Fire", "Physical", 0, "Burn", 0.1);
  Move firePunch = new Move("Fire Punch", 15, 75, 1, "Fire", "Physical", 0, "Burn", 0.1);
  Move flameBurst = new Move("Flame Burst", 15, 70, 1, "Fire", "Special", 0, "none", 0);
  Move flareBlitz = new Move("Flare Blitz", 15, 120, 1, "Fire", "Physical", 0, "Recoil/0.33", 1);
  Move heatWave = new Move("Heat Wave", 10, 95, 0.9, "Fire", "Special", 0, "Burn", 0.1);
  Move incinerate = new Move("Incinerate", 24, 60, 1, "Fire", "Special", 0, "DestroyItem", 1);
  Move flamethrower = new Move("Flamethrower", 15, 90, 1, "Fire", "Special", 0, "Burn", 0.1);
  Move overheat = new Move("Overheat", 8, 130, 0.9, "Fire", "Special", 0, "Sp.Attack--/Burn", 0.1);
  Move pyroBall = new Move("Pyro Ball", 5, 120, 0.9, "Fire", "Physical", 0, "Burn", 0.1);
  Move willOWisp = new Move("Will-O-Wisp", 15, 0, 0.85, "Fire", "Status", 0, "Burn", 1);

  //GRASS
  Move absorb = new Move("Absorb", 25, 20, 1, "Grass", "Special", 0, "Drain", 1);
  Move megaDrain = new Move("Mega Drain", 15, 40, 1, "Grass", "Special", 0, "Drain", 1);
  Move gigaDrain = new Move("Giga Drain", 15, 75, 1, "Grass", "Special", 0, "Drain", 1);
  Move vineWhip = new Move("Vine Whip", 25, 45, 1, "Grass", "Physical", 0, "none", 0);
  Move leafage = new Move("Leafage", 40, 40, 1, "Grass", "Physical", 0, "none", 0);
  Move woodHammer = new Move("Wood Hammer", 15, 120, 1, "Grass", "Physical", 0, "Recoil/0.33", 1);
  Move stunSpore = new Move("Stun Spore", 30, 0, 0.75, "Grass", "Status", 0, "Parlysis", 1);
  Move sleepPowder = new Move("Sleep Powder", 30, 0, 0.75, "Grass", "Status", 0, "Sleep", 1);
  Move cottonSpore = new Move("Cotton Spore", 40, 0, 1, "Grass", "Status", 0, "Speed--", 1);
  Move bulletSeed = new Move("Bullet Seed", 30, 25, 1, "Grass", "Physical", 0, "Repeat", 1);
  Move leechSeed = new Move("Leech Seed", 10, 0, 0.9, "Grass", "Status", 0, "Leech", 1);
  Move razorLeaf = new Move("Razor Leaf", 25, 55, 0.95, "Grass", "Physical", 0, "none", 0);
  Move synthesis = new Move("Synthesis", 16, 0, 0, "Grass", "Status", 0, "Recover", 1);
  Move petalBlizzard = new Move("Petal Blizzard", 24, 90, 1, "Grass", "Physical", 0, "none", 0);
  Move magicalLeaf = new Move("Magical Leaf", 32, 60, 0, "Grass", "Special", 0, "none", 0);
  Move gravApple = new Move("Grav Apple", 10, 80, 1, "Grass", "Physical", 0, "Sp.Defense-", 1);
  Move appleAcid = new Move("Apple Acid", 100, 80, 1, "Grass", "Special", 0, "Sp.Defense-", 1);
  Move aromatherapy = new Move("Aromatherapy", 5, 0, 0, "Grass", "Status", 0, "Cure", 1);
  Move hornLeech = new Move("Horn Leech", 10, 75, 1, "Grass", "Physical", 0, "Drain", 1);
  Move strengthSap = new Move("Strength Sap", 10, 0, 1, "Grass", "Status", 0, "StrengthSap", 1);
  Move drumBeating = new Move("Drum Beatin", 10, 80, 1, "Grass", "Physical", 0, "Speed-", 1);
  Move cottonGuard = new Move("Cotton Guard", 10, 0, 0, "Grass", "Status", 0, "Defense+++", 1);
  Move energyBall = new Move("Energy Ball", 10, 90, 1, "Grass", "Special", 0, "Sp.Defense-", 0.1);
  Move powerWhip = new Move("Power Whip", 10, 120, 0.85, "Grass", "Physical", 0, "none", 0);

  //WATER
  Move waterGun = new Move("Water Gun", 25, 40, 1, "Water", "Special", 0, "none", 0);
  Move bubble = new Move("Bubble", 30, 40, 1, "Water", "Special", 0, "none", 0);
  Move waterPulse = new Move("Water Pulse", 20, 60, 1, "Water", "Special", 0, "Confusion", 0.2);
  Move aquaRing = new Move("Aqua Ring", 20, 0, 0, "Water", "Status", 0, "Heal/0.06", 1);
  Move surf = new Move("Surf", 15, 90, 1, "Water", "Special", 0, "none", 0);
  Move bubbleBeam = new Move("Bubble Beam", 20, 65, 1, "Water", "Special", 0, "Speed-", 0.1);
  Move hydroPump = new Move("Hydro Pump", 5, 110, 0.8, "Water", "Special", 0, "none", 0);
  Move aquaTail = new Move("Aqua Tail", 10, 90, 0.9, "Water", "Physical", 0, "none", 0);
  Move aquaJet = new Move("Aqua Jet", 20, 40, 1, "Water", "Physical", 1, "none", 0);
  Move withdraw = new Move("Withdraw", 64, 0, 0, "Water", "Status", 0, "Defense+", 1);
  Move snipeShot = new Move("Snipe Shot", 15, 80, 1, "Water", "Special", 0, "none", 0);
  Move razorShell = new Move("Razor Shell", 10, 75, 0.95, "Water", "Physical", 0, "Defense-", 0.5);
  Move liquidation = new Move("Liquidation", 10, 85, 1, "Water", "Physical", 0, "Defense-", 0.2);
  Move brine = new Move("Brine", 10, 65, 1, "Water", "Special", 0, "none", 0);
  Move whirlpool = new Move("Whirlpool", 15, 35, 0.85, "Water", "Special", 0, "Repeat", 1);
  Move fishiousRend = new Move("Fishious Rend", 10, 85, 1, "Water", "Physical", 0, "FishiousRend", 1);

  //ROCK
  Move rollout = new Move("Rollout", 20, 30, 0.9, "Rock", "Physical", 0, "none", 0);
  Move rockTomb = new Move("Rock Tomb", 15, 60, 0.95, "Rock", "Physical", 0, "none", 0);
  Move rockThrow = new Move("Rock Throw", 15, 50, 0.9, "Rock", "Physical", 0, "none", 0);
  Move rockSlide = new Move("Rock Slide", 10, 75, 0.9, "Rock", "Physical", 0, "Flinch", 0.3);
  Move rockBlast = new Move("Rock Blast", 10, 25, 0.9, "Rock", "Physical", 0, "Repeat", 1);
  Move ancientPower = new Move("Ancient Power", 8, 60, 1, "Rock", "Special", 0, "Attack+/Sp.Attack+", 0.1);
  Move rockPolish = new Move("Rock Polish", 20, 0, 0, "Rock", "Status", 0, "Speed++", 1);
  Move stealthRock = new Move("Stealth Rock", 20, 0, 0, "Rock", "Status", 0, "StealthRock", 1);
  Move powerGem = new Move("Power Gem", 20, 80, 1, "Rock", "Special", 0, "none", 0);
  Move stoneEdge = new Move("Stone Edge", 8, 100, 0.8, "Rock", "Physical", 0, "none", 0);

  //BUG
  Move struggleBug = new Move("Struggle Bug", 20, 50, 1, "Bug", "Special", 0, "Sp.Attack-", 1);
  Move bugBite = new Move("Bug Bite", 20, 60, 1, "Bug", "Physical", 0, "StealBerry", 1);
  Move bugBuzz = new Move("Bug Buzz", 10, 90, 1, "Bug", "Special", 0, "Sp.Defense", 0.1);
  Move furyCutter = new Move("Fury Cutter", 20, 40, 0.95, "Bug", "Physical", 0, "none", 0);
  Move uTurn = new Move("U-Turn", 20, 70, 1, "Bug", "Physical", 0, "none", 0);
  Move infestation = new Move("Infestation", 20, 20, 1, "Bug", "Special", 0, "Repeat", 1);
  Move signalBeam = new Move("Signal Beam", 24, 75, 1, "Bug", "Special", 0, "Confusion", 0.1);
  Move firstImpression = new Move("First Impression", 10, 90, 1, "Bug", "Physical", 2, "none", 0);
  Move megahorn = new Move("Megahorn", 10, 120, 0.85, "Bug", "Physical", 0, "none", 0);
  Move pinMissile = new Move("Pin Missile", 20, 25, 0.95, "Bug", "Physical", 0, "Repeat", 1);

  //POISON
  Move acid = new Move("Acid", 30, 40, 1, "Poison", "Special", 0, "none", 0);  
  Move poisonSting = new Move("Poison Sting", 35, 15, 1, "Poison", "Physical", 0, "Poison", 0.3);
  Move toxic = new Move("Toxic", 10, 0, 0.9, "Poison", "Status", 0, "Badly Pozisoned", 1);
  Move poisonPowder = new Move("Poison Powder", 35, 0, 0.75, "Poison", "Status", 0, "Poison", 1);
  Move poisonGas = new Move("Poison Gas", 40, 0, 0.9, "Poison", "Status", 0, "Poison", 1);
  Move sludge = new Move("Sludge", 20, 65, 1, "Poison", "Special", 0, "Poison", 0.3);  
  Move smog = new Move("Smog", 20, 30, 0.7, "Poison", "Special", 0, "Poison", 0.4);  
  Move poisonJab = new Move("Poison Jab", 20, 80, 1, "Poison", "Physical", 0, "Poison", 0.3);
  Move acidArmor = new Move("Acid Armor", 20, 0, 0, "Poison", "Status", 0, "Defense++", 1);  
  Move coil = new Move("Coil", 32, 0, 0, "Poison", "Status", 0, "Attack+/Defense+", 1);  
  Move venoshock = new Move("Venoshock", 16, 65, 1, "Poison", "Special", 0, "none", 0);
  Move crossPoison = new Move("Cross Poison", 20, 60, 1, "Poison", "Physical", 0, "Poison", 0.1);
  Move sludgeWave = new Move("Sludge Wave", 10, 95, 1, "Poison", "Special", 0, "Poison", 0.1);
  Move gunkShot = new Move("Gunk Shot", 8, 120, 0.8, "Poison", "Physical", 0, "Poison", 0.3);

  //DRAGON
  Move dragonRage = new Move("Dragon Rage", 10, 40, 1, "Dragon", "Special", 0, "none", 0);
  Move twister = new Move("Twister", 20, 40, 1, "Dragon", "Special", 0, "Flinch", 0.2);
  Move dragonBreath = new Move("Dragon Breath", 20, 60, 1, "Dragon", "Physical", 0, "Paralysis", 0.3);
  Move dragonPulse = new Move("Dragon Pulse", 10, 85, 1, "Dragon", "Special", 0, "none", 0);
  Move dragonDance = new Move("Dragon Dance", 20, 0, 0, "Dragon", "Status", 0, "Attack+/Speed+", 1);
  Move dragonClaw = new Move("Dragon Claw", 15, 80, 1, "Dragon", "Physical", 0, "none", 0);
  Move breakingSwipe = new Move("Breaking Swipe", 24, 60, 1, "Dragon", "Physical", 0, "Attack-", 1);
  Move dualChop = new Move("Dual Chop", 15, 80, 0.9, "Dragon", "Physical", 0, "none", 0);
  Move dracoMeteor = new Move("Draco Meteor", 8, 130, 0.9, "Dragon", "Special", 0, "U.Sp.Attack--", 1);
  Move dragonTail = new Move("Dragon Tail", 10, 60, 0.9, "Dragon", "Physical", 0, "Switch", 1);
  Move dynamaxCannon = new Move("Dynamax Cannon", 8, 100, 1, "Dragon", "Special", 0, "none", 0);
  Move dragonRush = new Move("Dragon Rush", 10, 100, 0.75, "Dragon", "Physical", 0, "Flinch", 0.2);
  Move outrage = new Move("Outrage", 10, 120, 1, "Dragon", "Physical", 0, "Outrage", 1);

  //FIGHTING
  Move vacuumWave = new Move("Vacuum Wave", 30, 40, 1, "Fighting", "Special", 1, "none", 0);
  Move karateChop = new Move("Karate Chop", 25, 50, 1, "Fighting", "Physical", 0, "none", 0);
  Move auraSphere = new Move("Aura Sphere", 20, 80, 0, "Fighting", "Special", 0, "none", 0);
  Move detect = new Move("Detect", 5, 0, 0, "Fighting", "Special", 4, "Dodge", 1);
  Move closeCombat = new Move("Close Combat", 8, 120, 1, "Fighting", "Physical", 0, "U.Defense-/U.Sp.Defense-", 0);
  Move rockSmash = new Move("Rock Smash", 24, 40, 1, "Fighting", "Physical", 0, "Defense-", 0.5);
  Move hammerArm = new Move("Hammer Arm", 10, 100, 0.9, "Fighting", "Physical", 0, "U.Speed-", 1); 
  Move doubleKick = new Move("Double Kick", 30, 60, 1, "Fighting", "Physical", 0, "none", 0);
  Move lowSweep = new Move("Low Sweep", 20, 65, 1, "Fighting", "Physical", 0, "Speed-", 1);
  Move bulkUp = new Move("Bulk Up", 20, 0, 0, "Fighting", "Status", 0, "Attack+/Defense+", 1);
  Move superpower = new Move("Superpower", 5, 120, 1, "Fighting", "Physical", 0, "U.Attack-/U.Defense-", 1);
  Move drainPunch = new Move("Drain Punch", 16, 75, 1, "Fighting", "Physical", 0, "Drain", 1);
  Move powerUpPunch = new Move("Power-Up Punch", 20, 40, 1, "Fighting", "Physical", 0, "Attack+", 1);
  Move crossChop = new Move("Cross Chop", 5, 100, 0.8, "Fighting", "Physical", 0, "none", 0);
  Move focusBlast = new Move("Focus Blast", 8, 120, 0.7, "Fighting", "Special", 0, "Sp.Defense-", 0.1);
  Move forcePalm = new Move("Force Palm", 10, 60, 1, "Fighting", "Physical", 0, "none", 0.3);

  //DARK
  Move pursuit = new Move("Pursuit", 20, 40, 1, "Dark", "Physical", 0, "none", 0);
  Move bite = new Move("Bite", 25, 60, 1, "Dark", "Physical", 0, "Flinch", 0.3);
  Move lick = new Move("Lick", 30, 30, 1, "Dark", "Physical", 0, "Paralysis", 0.3);
  Move crunch = new Move("Crunch", 15, 80, 1, "Dark", "Physical", 0, "Defense", 0.2);
  Move feintAttack = new Move("Feint Attack", 20, 60, 0, "Dark", "Physical", 0, "none", 0);
  Move nightSlash = new Move("Night Slash", 15, 70, 1, "Dark", "Physical", 0, "none", 0);
  Move assurance = new Move("Assurance", 10, 60, 1, "Dark", "Physical", 0, "none", 0);
  Move thief = new Move("Thief", 40, 60, 1, "Dark", "Physical", 0, "Thief", 1);
  Move honeClaws = new Move("Hone Claws", 15, 0, 0, "Dark", "Status", 0, "Attack+/Accuracy+", 1);
  Move snarl = new Move("Snarl", 15, 55, 0.95, "Dark", "Special", 0, "Sp.Attack-", 1);
  Move nastyPlot = new Move("Nasty Plot", 20, 0, 0, "Dark", "Status", 0, "Sp.Attack++", 1);
  Move darkPulse = new Move("Dark Pulse", 15, 80, 1, "Dark", "Special", 0, "Flinch", 0.2);
  Move knockOff = new Move("Knock Off", 20, 65, 1, "Dark", "Physical", 0, "DestroyItem", 0);
  Move brutalSwing = new Move("Brutal Swing", 20, 60, 1, "Dark", "Physical", 0, "none", 0);
  Move suckerPunch = new Move("Sucker Punch", 5, 70, 1, "Dark", "Physical", 1, "none", 0);
  Move obstruct = new Move("Obstruct", 10, 0, 1, "Dark", "Status", 4, "Protect/Defense--", 1);

  //ICE
  Move mist = new Move("Mist", 30, 0, 1, "Ice", "Status", 0, "none", 0);
  Move icicleCrash = new Move("Icicle Crash", 10, 85, 0.9, "Ice", "Physical", 0, "Flinch", 0.3);
  Move icicleSpear = new Move("Icicle Spear", 30, 25, 1, "Ice", "Physical", 0, "Repeat", 1);
  Move iceShard = new Move("Ice Shard", 30, 40, 1, "Ice", "Physical", 1, "none", 0);
  Move iceFang = new Move("Ice Fang", 15, 65, 0.95, "Ice", "Physical", 0, "Flinch/Freeze", 0.1);
  Move auroraBeam = new Move("Aurora Beam", 20, 65, 1, "Ice", "Special", 0, "Attack-", 0.1);
  Move iceBeam = new Move("Ice Beam", 10, 90, 1, "Ice", "Special", 0, "Freeze", 0.1);
  Move blizzard = new Move("Blizzard", 5, 110, 1, "Ice", "Special", 0, "Freeze", 0.1);
  Move icyWind = new Move("Icy Wind", 15, 55, 0.95, "Ice", "Special", 0, "Speed-", 1);
  Move icePunch = new Move("Ice Punch", 15, 75, 1, "Ice", "Physical", 0, "Freeze", 0.1);
  Move auroraVeil = new Move("Aurora Veil", 20, 0, 0, "Ice", "Status", 0, "AuroraVeil", 1);

  //GHOST
  Move confuseRay = new Move("Confuse Ray", 10, 0, 1, "Ghost", "Status", 0, "Confusion", 1);
  Move astonish = new Move("Astonish", 15, 30, 1, "Ghost", "Physical", 0, "Flinch", 0.3);
  Move hex = new Move("Hex", 10, 65, 1, "Ghost", "Special", 0, "none", 0);
  Move shadowSneak = new Move("Shadow Sneak", 15, 40, 1, "Ghost", "Physical", 1, "none", 0);
  Move shadowClaw = new Move("Shadow Claw", 15, 80, 1, "Ghost", "Physical", 0, "none", 0);
  Move shadowPunch = new Move("Shadow Punch", 20, 60, 0, "Ghost", "Physical", 0, "none", 0);
  Move shadowBall = new Move("Shadow Ball", 15, 80, 0, "Ghost", "Special", 0, "Sp.Defense-", 0.2);
  Move spectralThief = new Move("Spectral Thief", 10, 90, 1, "Ghost", "Physical", 0, "SpectralThief", 1);

  //ELECTRIC
  Move thunderShock = new Move("Thunder Shock", 30, 40, 1, "Electric", "Special", 0, "Paralysis", 0.1);
  Move thunderWave = new Move("Thunder Wave", 20, 0, 0.9, "Electric", "Status", 0, "Paralysis", 1);
  Move thunderFang = new Move("Thunder Fang", 15, 65, 0.95, "Electric", "Physical", 0, "Flinch/Paralysis", 0.1);
  Move spark = new Move("Spark", 20, 65, 1, "Electric", "Physical", 0, "Paralysis", 0.3);
  Move thunderbolt = new Move("Thunderbolt", 15, 90, 1, "Electric", "Special", 0, "Paralysis", 0.1);
  Move thunder = new Move("Thunder", 10, 110, 0.7, "Electric", "Special", 0, "Paralysis", 0.3);
  Move thunderPunch = new Move("Thunder Punch", 15, 75, 1, "Electric", "Physical", 0, "Paralysis", 0.1);
  Move zapCannon = new Move("Zap Cannon", 5, 120, 0.5, "Electric", "Special", 0, "Paralysis", 1);
  Move auraWheel = new Move("Aura Wheel", 10, 110, 1, "Electric", "Special", 0, "Speed+", 1);
  Move wildCharge = new Move("Wild Charge", 15, 90, 1, "Electric", "Physical", 0, "Recoil/0.25", 1);
  Move nuzzle = new Move("Nuzzle", 20, 20, 1, "Electric", "Physical", 0, "Paralysis", 1);
  Move discharge = new Move("Discharge", 15, 80, 1, "Electric", "Special", 0, "Paralysis", 0.3);
  Move charge = new Move("Charge", 20, 0, 0, "Electric", "Status", 0, "E.Charge/Sp.Defense+", 1);
  Move boltStrike = new Move("Bolt Strike", 5, 130, 0.85, "Electric", "Physical", 0, "Paralysis", 0.2);

  //STEEL
  Move magnetBomb = new Move("Magnet Bomb", 20, 60, 0, "Steel", "Physical", 0, "none", 0);
  Move metalClaw = new Move("Metal Claw", 35, 50, 0.95, "Steel", "Physical", 0, "Attack+", 0.1);
  Move ironDefense = new Move("Iron Defense", 15, 0, 0, "Steel", "Status", 0, "Defense++", 1);
  Move mirrorShot = new Move("Mirror Shot", 10, 65, 0.85, "Steel", "Special", 0, "Accuracy-", 0.3);
  Move flashCannon = new Move("Flash Cannon", 16, 80, 1, "Steel", "Special", 0, "Sp.Defense-", 0.1);
  Move ironHead = new Move("Iron Head", 15, 80, 1, "Steel", "Physical", 0, "Flinch", 0.3);
  Move metalSound = new Move("Metal Sound", 40, 0, 0.85, "Steel", "Status", 0, "Sp.Defense--", 0);
  Move anchorShot = new Move("Anchor Shot", 20, 80, 1, "Steel", "Physical", 0, "none", 0);
  Move bulletPunch = new Move("Bullet Punch", 48, 40, 1, "Steel", "Physical", 1, "none", 0);

  //FLYING
  Move gust = new Move("Gust", 35, 40, 1, "Flying", "Special", 0, "none", 0);
  Move peck = new Move("Peck", 35, 40, 1, "Flying", "Physical", 0, "none", 0);
  Move pluck = new Move("Pluck", 20, 60, 1, "Flying", "Physical", 0, "none", 0);
  Move hurricane = new Move("Hurricane", 10, 110, 0.7, "Flying", "Special", 0, "Confusion", 0.3);
  Move featherDance = new Move("Feather Dance", 15, 0, 1, "Flying", "Status", 0, "Attack--", 1);
  Move wingAttack = new Move("Wing Attack", 35, 60, 1, "Flying", "Physical", 0, "none", 0);
  Move airSlash = new Move("Air Slash", 15, 75, 0.95, "Flying", "Special", 0, "Flinch", 0.3);
  Move acrobatics = new Move("Acrobatics", 15, 55, 1, "Flying", "Physical", 0, "none", 0);
  Move roost = new Move("Roost", 10, 0, 0, "Flying", "Status", 0, "Recover", 1);
  Move fly = new Move("Fly", 15, 90, 0.95, "Flying", "Physical", 0, "Charge", 1);
  Move bounce = new Move("Bounce", 8, 85, 0.85, "Flying", "Physical", 0, "Charge", 1);
  Move aerialAce = new Move("Aerial Ace", 32, 60, 0, "Flying", "Physical", 0, "none", 0);

  //GROUND
  Move boneClub = new Move("Bone Club", 20, 65, 0.85, "Ground", "Physical", 0, "none", 0);
  Move sandAttack = new Move("Sand Attack", 15, 0, 1, "Ground", "Status", 0, "Accuracy-", 1);
  Move mudSlap = new Move("Mud-Slap", 10, 20, 1, "Ground", "Special", 0, "Accuracy-", 1);
  Move bulldoze = new Move("Bulldoze", 20, 60, 1, "Ground", "Physical", 0, "Speed-", 1);
  Move mudShot = new Move("Mud Shot", 15, 55, 0.95, "Ground", "Special", 0, "Speed-", 1);
  Move earthPower = new Move("Earth Power", 10, 90, 1, "Ground", "Special", 0, "Sp.Defense-", 0.1);
  Move earthquake = new Move("Earthquake", 10, 100, 1, "Ground", "Physical", 0, "none", 0);
  Move mudBomb = new Move("Mud Bomb", 10, 65, 0.85, "Ground", "Special", 0, "Accuracy-", 0.3);
  Move dig = new Move("Dig", 10, 80, 1, "Ground", "Physical", 0, "Charge", 1);
  Move stompingTantrum = new Move("Stomping Tantrum", 16, 75, 1, "Ground", "Physical", 0, "StompingTantrum", 1);
  Move precipiceBlades = new Move("Precipice Blades", 10, 120, 0.85, "Ground", "Physical", 0, "none", 0);

  //FAIRY
  Move charm = new Move("Charm", 20, 0, 1, "Fairy", "Status", 0, "Attack--", 1);
  Move disarmingVoice = new Move("Disarming Voice", 15, 40, 0, "Fairy", "Special", 0, "none", 0);
  Move babyDollEyes = new Move("Baby-Doll Eyes", 30, 0, 1, "Fairy", "Status", 1, "Attack-", 1);
  Move drainingKiss = new Move("Draining Kiss", 10, 50, 1, "Fairy", "Special", 0, "Drain", 1);
  Move dazzlingGleam = new Move("Dazzling Gleam", 10, 80, 1, "Fairy", "Special", 0, "none", 0);
  Move fairyWind = new Move("Fairy Wind", 30, 40, 1, "Fairy", "Special", 0, "none", 0);
  Move moonblast = new Move("Moonblast", 15, 95, 1, "Fairy", "Special", 0, "Sp.Attack-", 0.3);
  Move playRough = new Move("Play Rough", 15, 95, 1, "Fairy", "Special", 0, "Sp.Attack-", 0.3);
  Move spiritBreak = new Move("Spirit Break", 15, 75, 1, "Fairy", "Physical", 0, "Sp.Attack-", 1);
  Move geomancy = new Move("Geomancy", 16, 0, 0, "Fairy", "Status", 0, "Geomancy", 1);

  //PSYCHIC
  Move teleport = new Move("Teleport", 20, 0, 0, "Psychic", "Status", 0, "Teleport", 0);
  Move cosmicPower = new Move("Cosmic Power", 32, 0, 0, "Psychic", "Status", 0, "Sp.Defense+/Defense+", 1);
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
  Move rest = new Move("Rest", 16, 0, 0, "Psychic", "Status", 0, "Rest", 1);
  Move futureSight = new Move("Future Sight", 10, 120, 1, "Psychic", "Special", 0, "none", 0);  
  Move mistBall = new Move("Mist Ball", 5, 70, 1, "Psychic", "Special", 0, "Special-", 0.5);  
  Move reflect = new Move("Reflect", 20, 0, 0, "Psychic", "Status", 0, "Reflect", 1);
  Move lightScreen = new Move("LightScreen", 30, 0, 0, "Psychic", "Status", 0, "LightScreen", 1); 
  Move psychicFangs = new Move("Psychic Fangs", 10, 85, 1, "Psychic", "Physical", 0, "PsychicFangs", 1);  

  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
  //                                                    (Base stats)
  //Pokemon example = new Pokemon("Name", "Type", level, hp, attack, defense, sp. attack, sp. dsefense, speed); 

  //Set up Pokemon and their moveSets

  //TRAINER POKEMON

  //ZOFIA
  
  //Level 62 Charizard
  Pokemon charizard = new Pokemon("Charizard", "Fire/Flying", 62, 78, 84, 78, 109, 85, 100); 
  charizard.moveSet(flamethrower, dragonClaw, roost, fly);
  charizard.nature("Adamant");

  //Level 39 Scyther
  Pokemon scyther = new Pokemon("Scyther", "Bug/Flying", 39, 70, 110, 80, 55, 80, 105);
  scyther.moveSet(pursuit, furyCutter, wingAttack, doubleTeam);
  scyther.nature("Jolly");

  //Level 59 Lapras
  Pokemon lapras = new Pokemon("Lapras", "Water/Ice", 59, 130, 85, 80, 85, 95, 60);
  lapras.moveSet(hydroPump, sing, iceBeam, thunder);
  lapras.nature("Modest");

  //Level 40 Kingler
  Pokemon kingler = new Pokemon("Kingler", "Water", 38, 55, 130, 115, 50, 50, 75);
  kingler.moveSet (bubbleBeam, stomp, mudShot, metalClaw);
  kingler.nature("Jolly");

  //Level 35 Magneton
  Pokemon magneton = new Pokemon("Magneton", "Electric/Steel", 35, 50, 60, 95, 120, 70, 70);
  magneton.moveSet(triAttack, flashCannon, zapCannon, metalSound);
  magneton.nature("Timid");

  //Level 46 Mimikyu
  Pokemon mimikyu = new Pokemon("Mimikyu", "Ghost/Fairy", 46, 55, 90, 80, 50, 105, 96);
  mimikyu.moveSet(woodHammer, shadowSneak, feintAttack, playRough);
  mimikyu.nature("Adamant");

  //Level 39 G-Max Drednaw
  Pokemon drednaw = new Pokemon("Drednaw", "Water/Rock", 39, 90, 115, 90, 48, 68, 74);
  drednaw.moveSet(rockPolish, rockSlide, razorShell, crunch);
  drednaw.nature("Jolly");
  drednaw.maxLevel = 2;

  //Level 47 Shiny Milotic
  Pokemon milotic = new Pokemon("Milotic", "Water", 47, 95, 60, 79, 100, 125, 81);
  milotic.moveSet(surf, dragonTail, recover, disarmingVoice);
  milotic.nature("Calm");
  milotic.maxLevel = 5;

  //Level 57 Xerneas
  Pokemon xerneas = new Pokemon("Xerneas", "Fairy", 57, 126, 131, 95, 131, 98, 99);
  xerneas.moveSet(moonblast, auroraBeam, geomancy, focusBlast);
  xerneas.nature("Modest");

  //Level 51 Morpeko
  Pokemon morpeko = new Pokemon("Morpeko", "Electric/Dark", 48, 58, 95, 58, 70, 58, 97);
  morpeko.moveSet(bulletSeed, auraWheel, thief, protect);
  morpeko.nature("Adamant");

  //Level 53 Ditto
  Pokemon ditto = new Pokemon("Ditto", "Normal", 52, 48, 48, 48, 48, 48, 48);
  ditto.moveSet(transform, none, none, none);
  ditto.nature("Relaxed");

  //Level 46 Dracovish
  Pokemon dracovish = new Pokemon("Dracovish", "Water/Dragon", 45, 90, 90, 100, 70, 80, 75);
  dracovish.moveSet(fishiousRend, crunch, psychicFangs, dragonRush);
  dracovish.nature("Brave");

  //Level 53 Krookodile
  Pokemon krookodile = new Pokemon("Krookodile", "Normal/Dark", 51, 95, 117, 80, 65, 70, 92);
  krookodile.moveSet(honeClaws, earthquake, crunch, dragonClaw);
  krookodile.nature("Jolly");
  
  //Level 52 Larvitar
  Pokemon larvitar = new Pokemon("Larvitar", "Rock/Ground", 52, 50, 64, 50, 45, 50, 41);
  larvitar.moveSet(earthquake, stoneEdge, crunch, thrash);
  larvitar.nature("Jolly");
  
  //Level 56 Groudon
  Pokemon groudon = new Pokemon("Groudon", "Ground", 56, 100, 150, 140, 100, 90, 90);
  groudon.moveSet(stealthRock, swordsDance, precipiceBlades, stoneEdge);
  groudon.nature("Adamant");

  //JASMINE
  
  //Level 61 Pidgeot
  Pokemon pidgeot = new Pokemon("Pidgeot", "Normal/Flying", 61, 83, 80, 75, 70, 70, 101);
  pidgeot.moveSet(hurricane, wingAttack, featherDance, twister);
  pidgeot.nature("Timid");

  //Level 45 Arcanine
  Pokemon arcanine = new Pokemon("Arcanine", "Fire", 45, 90, 110, 80, 100, 80, 95);
  arcanine.moveSet(bite, thunderFang, overheat, extremeSpeed);
  arcanine.nature("Jolly");

  //Level 52 Shinx
  Pokemon shinx = new Pokemon("Shinx", "Fire", 52, 45, 65, 34, 40, 34, 45);
  shinx.moveSet(thunderFang, crunch, roar, charge);
  shinx.nature("Adamant");

  //Level 33 Braixen
  Pokemon braixen = new Pokemon("Braixen", "Fire", 33, 59, 59, 58, 90, 70, 73);
  braixen.moveSet(ember, scratch, flameCharge, psybeam);

  //Level 12 Cubone
  Pokemon cubone = new Pokemon("Cubone", "Ground", 12, 50, 50, 95, 40, 50, 35);
  cubone.moveSet(boneClub, headbutt, tailWhip, none);

  //Level 38 Espeon
  Pokemon espeon = new Pokemon("Espeon", "Psychic", 38, 65, 65, 60, 130, 95, 110);
  espeon.moveSet(psybeam, quickAttack, futureSight, morningSun);
  espeon.nature("timid");

  //Level 24 Seel
  Pokemon seel = new Pokemon("Seel", "Water", 24, 65, 45, 55, 45, 70, 45);
  seel.moveSet(headbutt, iceBeam, iceShard, surf);

  //Level 51 Abomasnow
  Pokemon abomasnow = new Pokemon("Abomasnow", "Grass/Ice", 51, 90, 92, 75, 92, 85, 60);
  abomasnow.moveSet(woodHammer, blizzard, shadowBall, iceShard);
  abomasnow.nature("Modest");

  //Level 44 Alcremie
  Pokemon alcremie = new Pokemon("Alcremie", "Fairy", 44, 65, 60, 75, 110, 121, 64);
  alcremie.moveSet(dazzlingGleam, drainPunch, recover, gigaDrain);
  alcremie.nature("Bold");
  alcremie.maxLevel = 10;

  //Level 43 Falinks
  Pokemon falinks = new Pokemon("Falinks", "Fighting", 43, 65, 100, 100, 70, 60, 75);
  falinks.moveSet(megahorn, rockSmash, headbutt, protect);
  falinks.nature("Jolly");
  falinks.maxLevel = 0;

  //Level 49 Latias
  Pokemon latias = new Pokemon("Latias", "Dragon/Psychic", 49, 80, 80, 90, 110, 130, 110);
  latias.moveSet(dragonBreath, mistBall, calmMind, recover);
  latias.nature("Timid");
  latias.maxLevel = 2;

  //Level 49 Latios
  Pokemon latios = new Pokemon("Latios", "Dragon/Psychic", 49, 80, 80, 90, 110, 130, 110);
  latias.moveSet(psychic, dragonPulse, earthquake, roost);
  latias.nature("Naive");
  latias.maxLevel = 2;
  
  //NICHOLAS

  //Level 29 Vileplume
  Pokemon vileplume = new Pokemon("Vileplume", "Grass/Poison", 29, 75, 80, 85, 110, 90, 50);
  vileplume.moveSet(megaDrain, acid, sleepPowder, toxic);

  //Level 9 Alolan Geodude
  Pokemon alolanGeodude = new Pokemon("Alolan Geodude", "Rock/Electric", 9, 40, 80, 100, 30, 30, 20);
  alolanGeodude.moveSet(rollout, tackle, none, none);

  //Level 46 Swampert
  Pokemon swampert = new Pokemon("Swampert", "Water/Ground", 46, 100, 110, 90, 85, 90, 60);
  swampert.moveSet(hammerArm, mudBomb, rockSlide, surf);
  swampert.nature("Adamant");

  //Level 14 Abra
  Pokemon abra = new Pokemon("Abra", "Psychic", 14, 25, 20, 15, 105, 55, 90);
  abra.moveSet(psychic, teleport, none, none);

  //Level 16 Kadabra
  Pokemon kadabra = new Pokemon("Kadabra", "Psychic", 16, 40, 35, 30, 120, 70, 105);
  kadabra.moveSet(confusion, psybeam, teleport, kinesis);

  //Level 38 Snorlax
  Pokemon snorlax = new Pokemon("Snorlax", "Normal", 38, 160, 110, 65, 65, 110, 30);
  snorlax.moveSet(snore, flamethrower, rest, bodySlam);
  snorlax.nature("Careful");
  snorlax.maxLevel = 0;

  //Level 19 Ponyta
  Pokemon ponyta = new Pokemon("Ponyta", "Fire", 19, 50, 85, 55, 65, 65, 90);
  ponyta.moveSet(flameWheel, stomp, ember, tailWhip);

  //Level 21 Exeggcute
  Pokemon exeggcute = new Pokemon("Exeggcute", "Grass/Psychic", 21, 60, 40, 80, 60, 45, 40);
  exeggcute.moveSet(bulletSeed, uproar, leechSeed, stunSpore);

  //Level 50 Drakloak
  Pokemon drakloak = new Pokemon("Drakloak", "Dragon/Ghost", 50, 68, 80, 50, 60, 50, 105);
  drakloak.moveSet(dragonPulse, hex, uTurn, bite);
  drakloak.nature("Timid");

  //Level 32 Appletun
  Pokemon appletun = new Pokemon("Appletun", "Grass/Dragon", 32, 110, 85, 80, 100, 80, 30);
  appletun.moveSet(ironDefense, appleAcid, recover, bodySlam);

  //Level 31 Quagsire
  Pokemon quagsire = new Pokemon("Quagsire", "Water/Ground", 31, 95, 85, 85, 65, 65, 35);
  quagsire.moveSet(amnesia, mudBomb, slam, waterGun);

  //Level 41 Sirfetch'd
  Pokemon sirfetchd = new Pokemon("Sirfetch'd", "Fighting", 44, 62, 135, 95, 68, 82, 65);
  sirfetchd.moveSet(firstImpression, rockSmash, knockOff, ironDefense);

  //Level 36 Stonjourner
  Pokemon stonjourner = new Pokemon("Stonjourner", "Rock", 38, 100, 125, 135, 20, 20, 70);
  stonjourner.moveSet(rockSlide, stealthRock, stomp, block);
  stonjourner.nature("Jolly");

  //Level 50 Marshadow
  Pokemon marshadow = new Pokemon("Marshadow", "Ghost/Fighting", 50, 90, 125, 80, 90, 90, 125);
  marshadow.moveSet(closeCombat, spectralThief, icePunch, thunderPunch);
  marshadow.nature("Adamant");

  //Level 51 Riolu
  Pokemon riolu = new Pokemon("Riolu", "Fighting", 51, 40, 70, 40, 35, 40, 60);
  riolu.moveSet(metalClaw, forcePalm, swordsDance, quickAttack);
  riolu.nature("Adamant");
  
  //Level 56 Zekrom
  Pokemon zekrom = new Pokemon("Zekrom", "Dragon/Electric", 56, 100, 150, 120, 120, 100, 90);
  zekrom.moveSet(honeClaws, outrage, substitute, boltStrike);
  zekrom.nature("Adamant");

  //JOANNA
  //Level 13 Litten
  Pokemon litten = new Pokemon("Litten", "Fire", 13, 45, 65, 40, 60, 40, 70);
  litten.moveSet(ember, scratch, lick, none);

  //Level 56 Gengar
  Pokemon gengar = new Pokemon("Gengar", "Ghost/Poison", 56, 60, 65, 60, 130, 75, 110);
  gengar.moveSet(darkPulse, suckerPunch, hypnosis, shadowPunch);
  gengar.nature = "Timid";

  //Level 11 Raichu
  Pokemon raichu = new Pokemon("Raichu", "Electric", 11, 60, 90, 55, 90, 80, 110);
  raichu.moveSet(thunderbolt, quickAttack, thunderShock, tailWhip);

  //Level 29 Vulpix
  Pokemon vulpix = new Pokemon("Vulpix", "Fire", 29, 38, 41, 40, 50, 65, 65);
  vulpix.moveSet(quickAttack, feintAttack, flamethrower, confuseRay);

  //Level 48 Polteageist
  Pokemon polteageist = new Pokemon("Polteageist", "Ghost", 48, 60, 65, 65, 134, 114, 70);
  polteageist.moveSet(shadowBall, gigaDrain, suckerPunch, nastyPlot);
  polteageist.nature = "Timid";
  
  //Level 56 Articuno
  Pokemon articuno = new Pokemon("Articuno", "Ice/Flying", 56, 90, 85, 100, 95, 125, 85);
  articuno.moveSet(iceBeam, blizzard, agility, hurricane);
  articuno.nature = "Timid";

  //STELLA
  //Level 50 Flapple
  Pokemon flapple = new Pokemon("Flapple", "Grass/Dragon", 50, 70, 110, 80, 95, 60, 70);
  flapple.moveSet(ironDefense, gravApple, dragonDance, dragonPulse);

  //NINA
  //Level 12 Popplio
  Pokemon popplio = new Pokemon("Popplio", "Water", 12, 50, 54, 54, 66, 56, 40);
  popplio.moveSet(waterGun, disarmingVoice, pound, babyDollEyes);

  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 

  //WILD POKEMON / NPC POKEMON

  //GENERATION 1

  //Level 42 Hitmontop
  Pokemon hitmontop = new Pokemon("Hitmontop", "Fighting", 42, 50, 95, 95, 35, 110, 70);
  hitmontop.moveSet(closeCombat, pursuit, detect, none);

  //Level 47 Mantine
  Pokemon mantine = new Pokemon("Mantine", "Water/Flying", 47, 85, 40, 70, 80, 140, 70);
  mantine.moveSet(psybeam, roost, waterPulse, signalBeam);

  //Level 52 Steelix
  Pokemon steelix = new Pokemon("Steelix", "Steel/Ground", 52, 75, 85, 200, 55, 65, 30);
  steelix.moveSet(thunderFang, iceFang, fireFang, dragonBreath);

  //Level 44 Meganium
  Pokemon meganium = new Pokemon("Meganium", "Grass", 4, 80, 82, 100, 83, 100, 80);
  meganium.moveSet(petalBlizzard, poisonPowder, synthesis, magicalLeaf);

  //Level 45 Shuckle
  Pokemon shuckle = new Pokemon("Shuckle", "Bug/Rock", 45, 20, 10, 230, 10, 230, 5);
  shuckle.moveSet(withdraw, struggleBug, rest, rockThrow);

  //Level 41 Slugma
  Pokemon slugma = new Pokemon("Slugma", "Fire", 41, 40, 40, 40, 70, 40, 20);
  slugma.moveSet(harden, incinerate, ancientPower, smog);



  //Level 42 Haunter
  Pokemon haunter = new Pokemon("Haunter", "Ghost/Poison", 42, 45, 50, 45, 115, 55, 95);
  haunter.moveSet(lick, suckerPunch, hypnosis, shadowPunch);

  //Level 41 Snover
  Pokemon snover = new Pokemon("Snover", "Grass/Ice", 41, 60, 62, 50, 62, 60, 40);
  snover.moveSet(woodHammer, blizzard, razorLeaf, iceShard);

  //Level 32 Gastly
  Pokemon gastly = new Pokemon("Gastly", "Ghost/Poison", 32, 30, 35, 30, 100, 35, 80);
  gastly.moveSet(lick, confuseRay, hypnosis, suckerPunch);

  //Level 32 Pidgeotto
  Pokemon pidgeotto = new Pokemon("Pidgeotto", "Normal/Flying", 32, 63, 60, 55, 50, 50, 71);
  pidgeotto.moveSet(gust, quickAttack, featherDance, twister);

  //Level 32 Charmeleon
  Pokemon charmeleon = new Pokemon("Charmeleon", "Fire", 32, 58, 64, 58, 80, 65, 80); 
  charmeleon.moveSet(dragonRage, flameBurst, fireFang, smokescreen);

  //Level 17 Pawniard
  Pokemon pawniard = new Pokemon("Pawniard", "Dark/Steel", 17, 45, 85, 70, 40, 40, 60);
  pawniard.moveSet(feintAttack, scratch, furyCutter, leer);

  //Level 25 Drowzee
  Pokemon drowzee = new Pokemon("Drowzee", "Psychic", 25, 60, 48, 45, 43, 90, 42);
  drowzee.moveSet(confusion, headbutt, hypnosis, pound);

  //Level 29 Magnemite
  Pokemon magnemite = new Pokemon("Magnemite", "Electric/Steel", 29, 25, 35, 70, 95, 55, 45);
  magnemite.moveSet(spark, mirrorShot, thunderWave, supersonic);

  //Level 16 Jigglypuff
  Pokemon jigglypuff = new Pokemon("Jigglypuff", "Normal/Fairy", 16, 115, 45, 20, 45, 25, 20);
  jigglypuff.moveSet(sing, defenseCurl, pound, none);

  //Level 10 Bellsprout
  Pokemon bellsprout = new Pokemon("Bellsprout", "Grass/Poison", 10, 50, 75, 35, 70, 30, 40);
  bellsprout.moveSet(vineWhip, wrap, none, none);

  //Level 16 Geodude
  Pokemon geodude = new Pokemon("Geodude", "Rock", 16, 40, 80, 100, 30, 30, 20);
  geodude.moveSet(rockThrow, rollout, defenseCurl, none);

  //Level 17 Graveler
  Pokemon graveler = new Pokemon("Graveler", "Rock/Ground", 17, 55, 95, 115, 45, 45, 35);
  graveler.moveSet(tackle, rollout, defenseCurl, none);

  //Level 13 Sandshrew
  Pokemon sandshrew = new Pokemon("Sandshrew", "Ground", 13, 50, 75, 85, 20, 30, 40);
  sandshrew.moveSet(rollout, poisonSting, scratch, sandAttack);

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
  voltorb.moveSet(spark, rollout, swift, screech);

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
  chansey.moveSet(pound, defenseCurl, takeDown, recover);

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

  //Level 32 Porygon2
  Pokemon porygon2 = new Pokemon("Porygon2", "Normal", 32, 85, 80, 90, 105, 95, 60);
  porygon2.moveSet(zapCannon, psybeam, agility, recover);

  //Level 36 Marshtomp
  Pokemon marshtomp = new Pokemon("Marshtomp", "Water/Ground", 36, 70, 85, 70, 60, 70, 50);
  marshtomp.moveSet(protect, mudBomb, rockSlide, surf);

  //Level 36 Shelgon
  Pokemon shelgon = new Pokemon("Shelgon", "Dragon", 36, 65, 95, 100, 60, 50, 50);
  shelgon.moveSet(dragonBreath, crunch, zenHeadbutt, ember);

  //Level 25 Dratini
  Pokemon dratini = new Pokemon("Dratini", "Dragon", 25, 41, 64, 45, 50, 50, 50);
  dratini.moveSet(twister, slam, dragonRage, thunderWave);

  //IMPORTANT NPC POKEMON

  //CYNTHIA
  //Level 56 Duraludon
  Pokemon duraludon = new Pokemon("Duraludon", "Steel/Dragon", 56, 70, 95, 115, 120, 50, 85);
  duraludon.moveSet(dracoMeteor, flashCannon, thunderbolt, darkPulse);

  //Level 46 Inteleon
  Pokemon inteleon = new Pokemon("Inteleon", "Water", 46, 70, 85, 65, 125, 65, 120);
  inteleon.moveSet(uTurn, suckerPunch, snipeShot, tearfulLook);

  //Level 42 Centiscorch
  Pokemon centiscorch = new Pokemon("Centiscorch", "Fire/Bug", 39, 100, 115, 65, 90, 90, 65);
  centiscorch.moveSet(coil, flameWheel, bite, bugBite);

  //Level 42 Sandaconda
  Pokemon sandaconda = new Pokemon("Sandaconda", "Ground", 36, 72, 107, 125, 65, 70, 71);
  sandaconda.moveSet(dig, glare, brutalSwing, bulldoze);

  //Level 43 Toxtricity
  Pokemon toxtricity = new Pokemon("Toxtricity", "Electric/Poison", 43, 75, 98, 70, 114, 70, 75);
  toxtricity.moveSet(toxic, nobleRoar, screech, spark);

  //Level 51 Frosmoth
  Pokemon frosmoth = new Pokemon("Frosmoth", "Ice/Bug", 51, 70, 65, 60, 125, 90, 65);
  frosmoth.moveSet(bugBuzz, featherDance, auroraBeam, attract);

  //Level 25 Dragonair
  Pokemon dragonair = new Pokemon("Dragonair", "Dragon", 25, 61, 84, 65, 70, 70, 70);
  dragonair.moveSet(dragonTail, aquaTail, agility, thunderWave);

  //CASSIE
  //Level 57 Salamence
  Pokemon salamence = new Pokemon("Salamence", "Dragon/Flying", 57, 95, 135, 80, 110, 80, 100);
  salamence.moveSet(dragonDance, doubleEdge, roost, dragonClaw);

  //Level 48 Vaporeon
  Pokemon vaporeon = new Pokemon("Vaporeon", "Water", 48, 130, 65, 60, 110, 95, 65);
  vaporeon.moveSet(hydroPump, toxic, iceBeam, shadowBall);

  //Level 51 Aerodactyl
  Pokemon aerodactyl = new Pokemon("Aerodactyl", "Rock/Flying", 48, 80, 105, 65, 60, 75, 130);
  aerodactyl.moveSet(stoneEdge, aerialAce, earthquake, pursuit);

  //Level 56 Machamp
  Pokemon machamp = new Pokemon("Machamp", "Fighting", 56, 90, 130, 80, 65, 85, 55);
  machamp.moveSet(closeCombat, knockOff, strength, bulletPunch);

  //Level 51 Porygon-z
  Pokemon porygonZ = new Pokemon("Porygon-Z", "Normal", 51, 85, 80, 70, 135, 75, 90);
  porygonZ.moveSet(thunderbolt, iceBeam, nastyPlot, recover);

  //Level 53 Garbodor
  Pokemon garbodor = new Pokemon("Garbodor", "Poison", 53, 80, 95, 82, 60, 82, 75);
  garbodor.moveSet(gunkShot, stompingTantrum, spikes, toxic);

  //THE GUY
  //Level 26 Psyduck
  Pokemon psyduck = new Pokemon("Psyduck", "Water", 26, 50, 52, 48, 65, 50, 55);
  psyduck.moveSet(waterPulse, zenHeadbutt, confusion, scratch);

  //Level 48 Golduck
  Pokemon golduck = new Pokemon("Golduck", "Water", 48, 80, 82, 78, 95, 80, 85);
  golduck.moveSet(zenHeadbutt, amnesia, hydroPump, screech);


  //ASHLEY
  //Level 54 Gyarados
  Pokemon gyarados = new Pokemon("Gyarados", "Water/Flying", 54, 95, 125, 79, 60, 100, 81);
  gyarados.moveSet(bite, twister, thrash, iceFang);

  //Level 48 Lucario
  Pokemon lucario = new Pokemon("Lucario", "Fighting/Steel", 48, 70, 110, 70, 115, 70, 90);
  lucario.moveSet(auraSphere, metalClaw, detect, swordsDance);

  //Level 41 Ampharos
  Pokemon ampharos = new Pokemon("Ampharos", "Electric", 41, 90, 75, 85, 115, 90, 55);
  ampharos.moveSet(dragonPulse, firePunch, thunderPunch, cottonSpore);

  //Level 44 Pupitar
  Pokemon pupitar = new Pokemon("Pupitar", "Rock/Ground", 44, 70, 84, 70, 65, 70, 51);
  pupitar.moveSet(screech, chipAway, rockSlide, darkPulse);

  //Level 44 Tyranitar
  Pokemon tyranitar = new Pokemon("Tyranitar", "Rock/Dark", 44, 100, 134, 110, 95, 100, 61);
  tyranitar.moveSet(darkPulse, iceFang, thunderFang, screech);

  //Level 43 Altaria
  Pokemon altaria = new Pokemon("Altaria", "Dragon/Flying", 43, 75, 70, 90, 70, 105, 80);
  altaria.moveSet(dragonBreath, sing, disarmingVoice, dragonDance);

  //Level 42 Metang
  Pokemon metang = new Pokemon("Metang", "Steel/Psychic", 42, 60, 75, 100, 55, 80, 50);
  metang.moveSet(confusion, metalClaw, pursuit, takeDown);

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

  //Level 38 Doublade
  Pokemon doublade = new Pokemon("Doublade", "Steel/Ghost", 38, 59, 110, 150, 45, 49, 35);
  doublade.moveSet(ironHead, ironDefense, nightSlash, shadowSneak);

  //Level 21 Wooloo
  Pokemon wooloo = new Pokemon("Wooloo", "Normal", 21, 42, 40, 55, 40, 45, 48);
  wooloo.moveSet(defenseCurl, tackle, doubleKick, headbutt);

  //Level 22 Galarian Ponyta
  Pokemon galarianPonyta = new Pokemon("Galarian Ponyta", "Psychic", 22, 50, 85, 55, 65, 65, 90);
  galarianPonyta.moveSet(confusion, fairyWind, tailWhip, agility);

  //Level 42 Dreepy
  Pokemon dreepy = new Pokemon("Dreepy", "Dragon/Ghost", 42, 28, 60, 30, 40, 20, 82);
  dreepy.moveSet(astonish, infestation, quickAttack, bite);

  //Level 44 Stonjourner
  Pokemon raidStonjourner = new Pokemon("Raid Stonjourner", "Rock", 44, 100, 125, 135, 20, 20, 70);
  raidStonjourner.moveSet(rockSlide, stealthRock, stomp, block);
  //raidStonjourner.raidStats();
  //raidStonjourner.dynamax();

  //Level 55 Glalie
  Pokemon glalie = new Pokemon("Glalie", "Ice", 55, 80, 80, 80, 80, 80, 80);
  glalie.moveSet(crunch, blizzard, doubleTeam, astonish);

  //Level 60 Beartic
  Pokemon beartic = new Pokemon("Beartic", "Ice", 60, 95, 130, 80, 70, 80, 50);
  beartic.moveSet(blizzard, superpower, rest, brine);

  //Level 57 Rillaboom
  Pokemon rillaboom = new Pokemon("Rillaboom", "Grass", 57, 100, 125, 90, 60, 70, 85);
  rillaboom.moveSet(drumBeating, knockOff, boomburst, screech);

  //Level 57 Cinderace
  Pokemon cinderace = new Pokemon("Cinderace", "Fire", 57, 80, 116, 75, 65, 75, 119);
  cinderace.moveSet(pyroBall, doubleKick, bounce, agility);

  //Level 55 Orbeetle
  Pokemon orbeetle = new Pokemon("Orbeetle", "Bug/Psychic", 55, 60, 45, 110, 80, 120, 90);
  orbeetle.moveSet(hypnosis, bugBuzz, psychic, calmMind);

  //Level 54 Galarian Weezing
  Pokemon galarianWeezing = new Pokemon("Galarian Weezing", "Poison/Fairy", 54, 65, 90, 120, 85, 70, 60);
  galarianWeezing.moveSet(heatWave, fairyWind, sludge, assurance);

  //Level 56 Galarian Rapidash
  Pokemon galarianRapidash = new Pokemon("Galarian Rapidash", "Psychic", 56, 50, 85, 55, 65, 65, 90);
  galarianRapidash.moveSet(psychic, dazzlingGleam, megahorn, agility);

  //Level 58 Dubwool
  Pokemon dubwool = new Pokemon("Dubwool", "Normal", 58, 72, 80, 100, 60, 90, 88);
  dubwool.moveSet(cottonGuard, doubleKick, doubleEdge, copyCat);

  //Level 55 Boltund
  Pokemon boltund = new Pokemon("Boltund", "Electric", 55, 69, 90, 60, 90, 60, 121);
  boltund.moveSet(spark, crunch, charm, playRough);

  //RAID DEN POKEMON - ETERNATUS

  //Level 54 Runerigus
  Pokemon runerigus = new Pokemon("Runerigus", "Ground/Ghost", 54, 58, 95, 145, 50, 105, 30);
  runerigus.moveSet(shadowBall, hex, protect, brutalSwing);

  //Level 49 Polteageist-Phony
  Pokemon polteageistPhony = new Pokemon("Polteageist", "Ghost", 49, 60, 65, 65, 134, 114, 70);
  polteageistPhony.moveSet(shadowBall, gigaDrain, suckerPunch, protect);

  //Level 52 Grimmsnarl
  Pokemon grimmsnarl = new Pokemon("Grimmsnarl", "Dark/Fairy", 52, 95, 120, 65, 95, 75, 60);
  grimmsnarl.moveSet(spiritBreak, darkPulse, powerUpPunch, bulkUp);

  //Level 53 Cursola
  Pokemon cursola = new Pokemon("Cursola", "Ghost", 53, 60, 95, 50, 145, 130, 30);
  cursola.moveSet(hex, strengthSap, powerGem, ancientPower);

  //Level 60 Obstagoon
  Pokemon obstagoon = new Pokemon("Obstagoon", "Dark/Normal", 60, 93, 90, 101, 60, 81, 95);
  obstagoon.moveSet(crossChop, pinMissile, nightSlash, honeClaws);

  //Level 56 MorpekoR
  Pokemon morpekoR = new Pokemon("MorpekoR", "Electric/Dark", 56, 58, 95, 58, 70, 58, 97);
  morpekoR.moveSet(bulletSeed, auraWheel, crunch, protect);

  //Level 54 Chandelure
  Pokemon chandelure = new Pokemon("Chandelure", "Ghost", 54, 60, 55, 90, 145, 90, 80);
  chandelure.moveSet(fireSpin, hex, smog, willOWisp);

  //Level 54 Dusknoir
  Pokemon dusknoir = new Pokemon("Dusknoir", "Ghost", 54, 45, 100, 135, 65, 135, 45);
  dusknoir.moveSet(shadowBall, thunderPunch, firePunch, icePunch);

  //Level 52 Dhelmise
  Pokemon dhelmise = new Pokemon("Dhelmise", "Ghost/Grass", 52, 70, 131, 100, 86, 90, 40);
  dhelmise.moveSet(powerWhip, shadowBall, whirlpool, anchorShot);

  //Level 51 Mewtwo
  Pokemon mewtwo = new Pokemon("Mewtwo", "Psychic", 51, 106, 110, 90, 154, 90, 130);
  mewtwo.moveSet(auraSphere, psychic, recover, swift);

  //Level 62 Nihilego
  Pokemon nihilego = new Pokemon("Nihilego", "Rock/Poison", 62, 109, 53, 47, 127, 131, 103);
  nihilego.moveSet(stealthRock, sludgeWave, thunderbolt, dazzlingGleam);
  nihilego.nature("Timid");

  //Level 58 Wishiwashi
  Pokemon wishiwashi = new Pokemon("Wishiwashi-Solo", "Water", 51, 45, 20, 20, 25, 25, 40);
  wishiwashi.moveSet(hydroPump, iceBeam, feintAttack, mudShot);
  
  //Level 53 Wishiwashi2
  Pokemon wishiwashi2 = new Pokemon("Wishiwashi-Solo", "Water", 51, 45, 20, 20, 25, 25, 40);
  wishiwashi2.moveSet(hydroPump, iceBeam, feintAttack, waterGun);
  
  //Level 53 Wishiwashi3
  Pokemon wishiwashi3 = new Pokemon("Wishiwashi-Solo3", "Water", 51, 45, 20, 20, 25, 25, 40);
  wishiwashi3.moveSet(hydroPump, iceBeam, feintAttack, waterGun);
  
  //Level 53 Wishiwashi4
  Pokemon wishiwashi4 = new Pokemon("Wishiwashi-Solo4", "Water", 51, 45, 20, 20, 25, 25, 40);
  wishiwashi4.moveSet(hydroPump, iceBeam, feintAttack, waterGun);

  //Level 60 Eternatus
  Pokemon eternatus = new Pokemon("Eternatus", "Poison/Dragon", 60, 140, 85, 95, 145, 95, 130);
  eternatus.moveSet(dynamaxCannon, flamethrower, recover, venoshock);
  eternatus.nature("Modest");

  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 

  //Initiate trainers

  Trainer zofia = new Trainer("Zofia");
  Trainer jasmine = new Trainer("Jasmine");
  Trainer nicholas = new Trainer("Nicholas");
  Trainer joanna = new Trainer("Joanna");
  Trainer stella = new Trainer("Stella");

  Trainer cynthia = new Trainer("Cynthia");
  Trainer cassie = new Trainer("Cassie");
  Trainer ashley = new Trainer("Ashley");

  Trainer randomTrainer = new Trainer("Random");
  Trainer police = new Trainer("Police");
  Trainer wild = new Trainer("Wild");

  zofia.addPokemon(krookodile, xerneas, lapras, morpeko, ditto, mimikyu, kingler, groudon, larvitar);
  jasmine.addPokemon(pidgeot, shinx, falinks, latias, abomasnow, alcremie);
  nicholas.addPokemon(riolu, zekrom);
  joanna.addPokemon(litten, gengar, raichu, vulpix, polteageist, articuno);
  stella.addPokemon(flapple);

  cynthia.addPokemon(duraludon, inteleon, centiscorch, sandaconda, toxtricity, frosmoth);
  cassie.addPokemon(salamence, garbodor, aerodactyl, vaporeon, machamp, porygonZ);
  ashley.addPokemon(gyarados, lucario, ampharos, pupitar, altaria, metang);

  police.addPokemon(galarianWeezing, orbeetle, galarianRapidash, rillaboom, cinderace, dubwool);
  wild.addPokemon(charizard, eternatus, wishiwashi4, wishiwashi3, wishiwashi2, wishiwashi, nihilego, mewtwo, mimikyu, dhelmise, runerigus, dusknoir, chandelure, obstagoon, cursola, grimmsnarl, polteageistPhony);
  randomTrainer.addPokemon(dhelmise, dusknoir, obstagoon);

  printPokemon();
  printCharizard();

  zofia.giveItem("Sitrus Berry", magneton, milotic);
  zofia.giveItem("Leftovers", lapras, kingler, drednaw, morpeko);
  zofia.giveItem("Mimikium-Z", mimikyu);
  zofia.giveItem("Weakness Policy", xerneas);
  zofia.giveItem("Charizardite X", charizard);
  zofia.giveItem("Berry Juice", scyther);
  zofia.giveItem("Lum Berry", larvitar);
  zofia.giveItem("Choice Scarf", ditto);

  jasmine.giveItem("Sitrus Berry", latias);
  jasmine.giveItem("Leftovers", arcanine);
  jasmine.giveItem("Rocky Helmet", alcremie);
  jasmine.giveItem("Fightinium-Z", falinks);
  jasmine.giveItem("Pidgeotite", pidgeot);
  jasmine.giveItem("Abomanite", abomasnow);

  nicholas.giveItem("Sitrus Berry", vileplume, stonjourner, snorlax);
  nicholas.giveItem("Leftovers", drakloak, riolu);
  nicholas.giveItem("Marshadium-Z", drakloak);
  nicholas.giveItem("Swampertite", swampert);

  cassie.giveItem("Sitrus Berry", vaporeon);
  cassie.giveItem("Choice Band", aerodactyl);
  cassie.giveItem("Leftovers", porygonZ);
  cassie.giveItem("Flame Orb", machamp);
  cassie.giveItem("Rocky Helmet", garbodor);
  cassie.giveItem("Salamencite", salamence);

  ashley.giveItem("Sitrus Berry", gyarados, lucario, ampharos, pupitar, altaria, metang);
  joanna.giveItem("Sitrus Berry", vulpix);

  wild.giveItem("Black Sludge", nihilego);

  // // // // // // BATTLE DETAILS // // // // // // 

  randomSeed(54);

  Battle b = new Battle(zofia, cassie); 
  
  b.weather = "Primordial Sea";
  //Zofia's Health: 12/12
  //Jasmine's Health: 12/12
  //Nicholas's Health: 2/12
  //Joanna's Health: 12/12
  
  krookodile.currHealth = 0;
  xerneas.currHealth = 0;
  lapras.currHealth = lapras.health/2;
  mimikyu.currHealth = 0;
  groudon.currHealth = groudon.health/2;
    
  shinx.currHealth = 0;
  latias.currHealth = 0;
  abomasnow.currHealth = 136;
  alcremie.currHealth = 0;
    
  gengar.currHealth = 0;
  polteageist.currHealth = 67;
  
}

void catchPokemon(Trainer t, Pokemon p, String pokeball, int catchRate) {
  Float bonusBall = 1.0;

  if (pokeball.equals("Master Ball")) {
    println("* * *", p.name, "was caught!! * * *");
    println();
    return;
  } else if (pokeball.equals("Poke Ball"))
    bonusBall = 1.0;

  else if (pokeball.equals("Great Ball"))
    bonusBall = 1.5;

  else
    bonusBall = 2.0;

  Float bonusStatus = 1.0;

  if (p.sleep || p.freeze)
    bonusStatus = 2.5;

  else if (p.paralysis || p.burn || p.poison || p.badlyPoisoned)
    bonusStatus = 1.5;

  int a = int(((((3*p.health)-(2*p.currHealth))*catchRate*bonusBall)/float(3*p.health)) * bonusStatus);
  int b = int(65536 / pow((255/a), 0.1875));

  println("Trying to get below", b);

  int rand = int(random(0, 65535));
  int counter = 0;

  while (rand <= b) {
    if (counter == 3) {
      println("* * * Gotcha!", p.name, "was caught! * * *");
      println();
      return;
    }

    println("Wobble :", rand);
    println();
    rand = int(random(0, 65535));
    counter += 1;
  }

  println(rand);

  if (counter == 0)
    println("* * *", t.name + ", Oh no! The Pokémon broke free! * * *");

  else if (counter == 1)
    println("* * *", t.name + ", Aww! It appeared to be caught! * * *");

  else if (counter == 2)
    println("* * *", t.name + ", Aargh! Almost had it! * * *");

  else if (counter == 3)
    println("* * *", t.name + ", Gah! It was so close, too! * * *");

  println();
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
