class Pokemon {
  String name;
  String type;
  String type2;
  String fullType;
  int level;
  int health;
  int currHealth;
  int[] stats;
  int[] battleStats;
  String ability;
  Move[] moveSet;
  String nature;
  int[] pp;
  int[] currPP;
  int currMvPP;
  Boolean burn, freeze, paralysis, poison, sleep, attract, flinch, badlyPoisoned, bound, cantEscape, confusion, curse, drain, heal, recoil, leech, recover, repeat, protect, eCharge, wildfire;
  int attackSMp, attackSMn, defenseSMp, defenseSMn, spAttackSMp, spAttackSMn, spDefenseSMp, spDefenseSMn, speedSMp, speedSMn, accuracySMp, accuracySMn, evasionSMp, evasionSMn;
  float accuracy, evasion;
  String item;
  Trainer trainer;
  int sleepCounter;
  int confusionCounter;
  int poisonCounter;
  int wildfireCounter;
  float adjustedStages;
  boolean raidPokemon;
  boolean raidShield;
  int shieldHealth;
  boolean facedRaidShield;
  int shieldDamage;
  boolean max;
  int maxLevel;
  int maxTurns;
  String[] formerMove;
  Float[] formerAcc;
  String[] formerStatus;
  String[] formerStatus2;
  Float[] formerStatusProb;
  int[] formerPower;
  int turnsOut;
  Boolean sR;
  Battle battle;
  Boolean zMove;
  Boolean mega;
  Boolean hangry;
  Boolean charge;
  int chargeTurn;
  Boolean fly, dig;
  Boolean substitute;
  int subHealth;
  Boolean didHit;
  Boolean disguise;

  Pokemon (String n, String t, int l, int hp, 
    int att, int def, int satt, int sdef, int spd) {
    this.name = n;
    this.type = t;
    this.level = l;

    this.stats = new int[6];
    this.stats[0] = hp;
    this.stats[1] = att;
    this.stats[2] = def;
    this.stats[3] = satt;
    this.stats[4] = sdef;
    this.stats[5] = spd;

    this.battleStats = new int[6];

    this.calculateStats();

    this.health = calculateHealth();
    this.currHealth = this.health;

    this.ability = calculateAbility();

    this.fullType = this.type;
    
    if (this.type.indexOf("/") != -1) {
      this.type2 = this.type.substring(this.type.indexOf("/")+1, this.type.length());
      this.type = this.type.substring(0, this.type.indexOf("/"));
    } else 
    this.type2 = "";      
    
    this.moveSet = new Move[4];
    
    this.nature = "none";
    
    this.pp = new int[4];
    this.currPP = new int[4];
    this.currMvPP = 0;
    
    this.burn = this.freeze = this.paralysis = this.poison = this.sleep = this.attract = this.flinch = this.badlyPoisoned = this.recover = this.protect
      = this.bound = this.cantEscape = this.confusion = this.curse = this.heal = this.drain = this.recoil = this.leech = this.repeat = this.eCharge = this.wildfire = false;

    attackSMp = attackSMn = defenseSMp = defenseSMn = spAttackSMp = spAttackSMn = spDefenseSMp = spDefenseSMn = speedSMp
      = speedSMn = accuracySMp = accuracySMn = evasionSMp = evasionSMn = 2;

    this.accuracySMp = this.accuracySMn = this.evasionSMp = this.evasionSMn = 3;
    
    this.accuracy = this.evasion = 1;

    this.item = "none";

    this.sleepCounter = 0;
    this.confusionCounter = 0;
    this.poisonCounter = 1;
    this.wildfireCounter = 0;

    this.adjustedStages = 1;

    this.raidPokemon = false;
    this.raidShield = false;
    this.shieldHealth = 0;
    this.facedRaidShield = false;
    this.shieldDamage = 0;

    this.max = false;
    this.maxLevel = 0;
    this.maxTurns = 0;
    this.formerMove = new String[4];
    this.formerAcc = new Float[4];
    this.formerStatus = new String[4];
    this.formerStatus2 = new String[4];
    this.formerStatusProb = new Float[4];
    this.formerPower = new int[4];

    this.turnsOut = 0;

    this.sR = false;
    
    Trainer a = new Trainer("A");
    Trainer b = new Trainer("B");
    this.battle = new Battle(a, b);
    
    this.zMove = false;
    
    this.mega = false;
    
    this.hangry = false;
    
    this.charge = false;
    this.chargeTurn = 0;
    this.fly = this.dig = false;
    
    this.substitute = false;
    this.subHealth = 0;
    
    this.didHit = true;
  }

  void raidStats() {
    this.raidPokemon = true;

    this.stats[0] *= 2;
    this.health = stats[0];
    this.currHealth = stats[0];
    this.battleStats[0] = stats[0];
  }
  
  void nature(String n) {
    if (n.equals("Lonely")) {
      this.battleStats[1] *= 1.1;
      this.battleStats[2] *= 0.9;
    } else if (n.equals("Brave")) {
      this.battleStats[1] *= 1.1;
      this.battleStats[5] *= 0.9;
    } else if (n.equals("Adamant")) {
      this.battleStats[1] *= 1.1;
      this.battleStats[3] *= 0.9;
    } else if (n.equals("Naughty")) {
      this.battleStats[1] *= 1.1;
      this.battleStats[4] *= 0.9;
    }
    
    else if (n.equals("Bold")) {
      this.battleStats[2] *= 1.1;
      this.battleStats[1] *= 0.9;
    } else if (n.equals("Relaxed")) {
      this.battleStats[2] *= 1.1;
      this.battleStats[4] *= 0.9;
    } else if (n.equals("Impish")) {
      this.battleStats[2] *= 1.1;
      this.battleStats[3] *= 0.9;
    } else if (n.equals("Lax")) {
      this.battleStats[2] *= 1.1;
      this.battleStats[4] *= 0.9;
    }
    
    else if (n.equals("Timid")) {
      this.battleStats[5] *= 1.1;
      this.battleStats[1] *= 0.9;
    } else if (n.equals("Hasty")) {
      this.battleStats[5] *= 1.1;
      this.battleStats[2] *= 0.9;
    } else if (n.equals("Jolly")) {
      this.battleStats[5] *= 1.1;
      this.battleStats[3] *= 0.9;
    } else if (n.equals("Naive")) {
      this.battleStats[5] *= 1.1;
      this.battleStats[4] *= 0.9;
    }
    
    else if (n.equals("Modest")) {
      this.battleStats[3] *= 1.1;
      this.battleStats[1] *= 0.9;
    } else if (n.equals("Mild")) {
      this.battleStats[3] *= 1.1;
      this.battleStats[2] *= 0.9;
    } else if (n.equals("Quiet")) {
      this.battleStats[3] *= 1.1;
      this.battleStats[5] *= 0.9;
    } else if (n.equals("Rash")) {
      this.battleStats[3] *= 1.1;
      this.battleStats[4] *= 0.9;
    }
    
    else if (n.equals("Calm")) {
      this.battleStats[4] *= 1.1;
      this.battleStats[1] *= 0.9;
    } else if (n.equals("Genle")) {
      this.battleStats[4] *= 1.1;
      this.battleStats[2] *= 0.9;
    } else if (n.equals("Sassy")) {
      this.battleStats[4] *= 1.1;
      this.battleStats[5] *= 0.9;
    } else if (n.equals("Careful")) {
      this.battleStats[4] *= 1.1;
      this.battleStats[3] *= 0.9;
    }
    
    this.nature = n;
  }

  void dynamax() {
    this.max = true;

    if (!this.raidPokemon) {
      this.health *= (1.5 + (this.maxLevel*0.05));
      this.currHealth *= (1.5 + (this.maxLevel*0.05));
      this.battleStats[0] = this.health;
    }
    
    for (int i = 0; i < 4; i++) {
      this.moveSet[i].status = "";
      this.moveSet[i].status2 = "Max-Move";

      if (this.moveSet[i].damageCatagory.equals("Status")) {
        this.moveSet[i].name = "Max Guard";
        this.moveSet[i].status = "Protect";
      } else if (this.moveSet[i].type.equals("Normal")) {
        this.moveSet[i].name = ("Max Strike");
        this.moveSet[i].status = "Speed-";
      } else if (this.moveSet[i].type.equals("Fighting")) {
        this.moveSet[i].name = ("Max Knuckle");
        this.moveSet[i].status = "Attack+";
      } else if (this.moveSet[i].type.equals("Flying")) {
        this.moveSet[i].name = ("Max Airstream");
        this.moveSet[i].status = "Speed+";
      } else if (this.moveSet[i].type.equals("Poison")) {
        this.moveSet[i].name = ("Max Ooze");
        this.moveSet[i].status = "Sp.Attack+";
      } else if (this.moveSet[i].type.equals("Ground")) {
        this.moveSet[i].name = ("Max Quake");
        this.moveSet[i].status = "Sp.Defense+";
      } else if (this.moveSet[i].type.equals("Rock")) {
        this.moveSet[i].name = ("Max Rockfall");
        this.moveSet[i].status = "Sandstorm";
      } else if (this.moveSet[i].type.equals("Bug")) {
        this.moveSet[i].name = ("Max Flutterby");
        this.moveSet[i].status = "Sp.Attack-";
      } else if (this.moveSet[i].type.equals("Ghost")) {
        this.moveSet[i].name = ("Max Phantasm");
        this.moveSet[i].status = "Defense-";
      } else if (this.moveSet[i].type.equals("Steel")) {
        this.moveSet[i].name = ("Max Steelspike");
        this.moveSet[i].status = "Defense+";
      } else if (this.moveSet[i].type.equals("Fire")) {
        if (this.name.equals("Gmax Charizard")) {
          this.moveSet[i].name = ("G-Max Wildfire");
          this.moveSet[i].status = "Wildfire";
        } else {
          this.moveSet[i].name = ("Max Flare");
          this.moveSet[i].status = "Harsh Sunlight";
        }
      } else if (this.moveSet[i].type.equals("Water")) {
        if (this.name.equals("Drednaw")) {
          this.moveSet[i].name = ("G-Max Stonesurge");
          this.moveSet[i].status = "StealthRock";
        } else {
          this.moveSet[i].name = ("Max Geyser");
          this.moveSet[i].status = "Rain";
        }
      } else if (this.moveSet[i].type.equals("Grass")) {
        this.moveSet[i].name = ("Max Overgrowth");
        this.moveSet[i].status = "Grassy Terrain";
      } else if (this.moveSet[i].type.equals("Electric")) {
        this.moveSet[i].name = ("Max Lightning");
        this.moveSet[i].status = "Electric Terrain";
      } else if (this.moveSet[i].type.equals("Psychic")) {
        this.moveSet[i].name = ("Max Mindstorm");
        this.moveSet[i].status = "Psychic Terrain";
      } else if (this.moveSet[i].type.equals("Ice")) {
        this.moveSet[i].name = ("Max Hailstorm");
        this.moveSet[i].status = "Hail";
      } else if (this.moveSet[i].type.equals("Dragon")) {
        this.moveSet[i].name = ("Max Wyrmwind");
        this.moveSet[i].status = "Attack-";
      } else if (this.moveSet[i].type.equals("Dark")) {
        this.moveSet[i].name = ("Max Darkness");
        this.moveSet[i].status = "Sp.Defense-";
      } else if (this.moveSet[i].type.equals("Fairy")) {
        if (this.name.equals("Alcremie")) {
          this.moveSet[i].name = ("G-Max Finale");
          this.moveSet[i].status = "Heal";
          this.moveSet[i].status2 = "0.16";
        } else {
          this.moveSet[i].name = ("Max Starfall");
          this.moveSet[i].status = "Misty Terrain";
        }
      }

      this.moveSet[i].statusProb = 1;

      this.moveSet[i].power *= 1.5;
    }
  }

  void unmax() {
    this.max = false;
    this.health = this.stats[0];
    this.currHealth /= (1.5 + (this.maxLevel*0.05));
    this.battleStats[0] = this.stats[0];

    for (int i = 0; i < 4; i++) {
      this.moveSet[i].name = this.formerMove[i];
      this.moveSet[i].accuracy = this.formerAcc[i];
      this.moveSet[i].status = this.formerStatus[i];
      this.moveSet[i].status2 = this.formerStatus2[i];
      this.moveSet[i].statusProb = this.formerStatusProb[i];
      this.moveSet[i].power = this.formerPower[i];
    }

    this.maxTurns = 0;
  }
  
  void mega() {
    this.mega = true;
    
    if (this.name.equals("Pidgeot")) {
      this.name = "Mega Pidgeot";
      this.ability = "No Guard";
      
      this.stats[0] = 83;
      this.stats[1] = 80;
      this.stats[2] = 80;
      this.stats[3] = 135;
      this.stats[4] = 80;
      this.stats[5] = 121;
    }
    if (this.name.equals("Charizard")) {
      if (this.item.equals("Charizardite Y")) {
        this.name = "Mega Charizard Y";
        this.ability = "Drought";
        
        this.stats[0] = 78;
        this.stats[1] = 104;
        this.stats[2] = 78;
        this.stats[3] = 159;
        this.stats[4] = 115;
        this.stats[5] = 100;
      } else {
        this.name = "Mega Charizard X";
        this.ability = "Tough Claws";
        this.type2 = "Dragon";
        
        this.stats[0] = 78;
        this.stats[1] = 130;
        this.stats[2] = 111;
        this.stats[3] = 130;
        this.stats[4] = 85;
        this.stats[5] = 100;
      }
    }
    
    if (this.name.equals("Blastoise")) {
      this.name = "Mega Blastoise";
      this.ability = "Mega Launcher";
        
      this.stats[0] = 79;
      this.stats[1] = 103;
      this.stats[2] = 120;
      this.stats[3] = 135;
      this.stats[4] = 115;
      this.stats[5] = 78;
    }
    
    if (this.name.equals("Swampert")) {
      this.name = "Mega Swampert";
      this.ability = "Swift Swim";
      
      this.stats[0] = 100;
      this.stats[1] = 150;
      this.stats[2] = 110;
      this.stats[3] = 95;
      this.stats[4] = 110;
      this.stats[5] = 70;
    }

    if (this.name.equals("Aerodactyl")) {
      this.name = "Mega Aerodactyl";
      this.ability = "Tough Claws";
      
      this.stats[0] = 80;
      this.stats[1] = 135;
      this.stats[2] = 85;
      this.stats[3] = 70;
      this.stats[4] = 95;
      this.stats[5] = 150;
    }
    
    if (this.name.equals("Steelix")) {
      this.name = "Mega Steelix";
      this.ability = "Sand Force";
      
      this.stats[0] = 75;
      this.stats[1] = 125;
      this.stats[2] = 230;
      this.stats[3] = 55;
      this.stats[4] = 95;
      this.stats[5] = 30;
    }
    
    if (this.name.equals("Abomasnow")) {
      this.name = "Mega Abomasnow";
      this.ability = "Snow Warning";
      
      this.stats[0] = 90;
      this.stats[1] = 132;
      this.stats[2] = 105;
      this.stats[3] = 132;
      this.stats[4] = 105;
      this.stats[5] = 30;
    }
    
    if (this.name.equals("Salamence")) {
      this.name = "Mega Salamence";
      this.ability = "Aerilate";
      
      this.stats[0] = 95;
      this.stats[1] = 145;
      this.stats[2] = 130;
      this.stats[3] = 120;
      this.stats[4] = 90;
      this.stats[5] = 120;
    }
    
    if (this.name.equals("Wishiwashi-Solo")) {
      this.name = "Wishiwashi-School";
      this.ability = "Schooling";
      
      this.stats[0] = 45;
      this.stats[1] = 145;
      this.stats[2] = 130;
      this.stats[3] = 140;
      this.stats[4] = 135;
      this.stats[5] = 30;
    }
    
    if (this.name.equals("Groudon")) {
      this.name = "Primal Groudon";
      this.ability = "Desolate Land";
      this.type2 = "Fire";
      
      this.stats[0] = 100;
      this.stats[1] = 180;
      this.stats[2] = 160;
      this.stats[3] = 150;
      this.stats[4] = 90;
      this.stats[5] = 90;
    }
    
    if (this.name.equals("Eternatus")) {
      this.name = "Eternamax Eternatus";
      this.ability = "Pressure";

      this.stats[0] = 255;
      this.stats[1] = 115;
      this.stats[2] = 250;
      this.stats[3] = 125;
      this.stats[4] = 250;
      this.stats[5] = 130;
    }
    
    this.calculateStats();
    this.calculateHealth();
  }
  
  void unmega() {
    if (this.name.equals("Wishiwashi-School")) {
      this.name = "Wishiwashi-Solo";
      this.ability = "Schooling";
      
      this.stats[0] = 45;
      this.stats[1] = 20;
      this.stats[2] = 20;
      this.stats[3] = 25;
      this.stats[4] = 25;
      this.stats[5] = 40;
    }
    
    if (this.name.equals("Eternamax Eternatus")) {
      this.name = "Eternatus";
      this.ability = "Pressure";

      this.stats[0] = 140;
      this.stats[1] = 85;
      this.stats[2] = 95;
      this.stats[3] = 145;
      this.stats[4] = 95;
      this.stats[5] = 130;
    }
    
    this.calculateStats();
    this.calculateHealth();
  }
  
  void useZMove() {
    zMove = true;
    
    if (this.item.equals("Mimikium-Z")) {
      for (int i = 0; i < 4; i++) {
        if (this.moveSet[i].name.equals("Play Rough")) {
          this.moveSet[i].status = "";
          
          this.moveSet[i].name = "Let's Snuggle Forever";
          this.moveSet[i].status2 = "Z-Move";
          this.moveSet[i].power = 190;
          this.moveSet[i].accuracy = 0;
          
          this.moveSet[i].statusProb = 0;
        }
      }
    } else if (this.item.equals("Snorium-Z")) {
      for (int i = 0; i < 4; i++) {
        if (this.moveSet[i].name.equals("Giga Impact")) {
          this.moveSet[i].status = "";
          
          this.moveSet[i].name = "Pulverizing Pancake";
          this.moveSet[i].status2 = "Z-Move";
          this.moveSet[i].power = 210;
          this.moveSet[i].accuracy = 0;
          
          this.moveSet[i].statusProb = 0;
        }
      }
    } else if (this.item.equals("Marshadium-Z")) {
      for (int i = 0; i < 4; i++) {
        if (this.moveSet[i].name.equals("Spectral Thief")) {
          this.moveSet[i].status = "";
          
          this.moveSet[i].name = "Soul-Stealing 7-Star Strike";
          this.moveSet[i].status2 = "Z-Move";
          this.moveSet[i].power = 195;
          this.moveSet[i].accuracy = 0;
          
          this.moveSet[i].statusProb = 0;
        }
      }
    } else if (this.item.equals("Fightinium-Z")) {
      for (int i = 0; i < 4; i++) {
        if (this.moveSet[i].type.equals("Fighting")) {
          this.moveSet[i].status = "";
          
          this.moveSet[i].name = "All-Out Pummeling";
          this.moveSet[i].status2 = "Z-Move";
          this.moveSet[i].power = zMovePower(this.moveSet[i].power);
          this.moveSet[i].accuracy = 0;
          
          this.moveSet[i].statusProb = 0;
        }
      }
    }
  }
  
  int zMovePower(int p) {
    if (p < 55)
      p = 100;
    else if (p < 65)
      p = 120;
    else if (p < 75)
      p = 140;
    else if (p < 85)
      p = 160;
    else if (p < 95)
      p = 175;
    else if (p < 100)
      p = 180;
    else if (p < 125)
      p = 190;
    else if (p < 130)
      p = 195;
    else
      p = 200;
    
    return p;
  }
  
  void unZMove() {
    this.zMove = false;

    for (int i = 0; i < 4; i++) {
      this.moveSet[i].name = this.formerMove[i];
      this.moveSet[i].accuracy = this.formerAcc[i];
      this.moveSet[i].status = this.formerStatus[i];
      this.moveSet[i].status2 = this.formerStatus2[i];
      this.moveSet[i].statusProb = this.formerStatusProb[i];
      this.moveSet[i].power = this.formerPower[i];
    }
  }

  
  Pokemon copyOnto(Pokemon user) {
    Pokemon p = new Pokemon(this.name, this.fullType, this.level, this.battleStats[0], this.battleStats[1], this.battleStats[2], this.battleStats[3], this.battleStats[4], this.battleStats[5]);
    
    user.moveSet(this.moveSet[0], this.moveSet[1], this.moveSet[2], this.moveSet[3]);
    
    return p;
  }
  
  void switchOut() {
    this.turnsOut = 0;
    this.unmax();

    for (int i = 0; i < 6; i++) {
      this.battleStats[i] = this.stats[i];
    }
  }

  void rest() {
    this.currHealth = this.health;
    for (int i = 0; i < this.moveSet.length; i++) {
      this.currPP[i] = this.pp[i];
    }
    for (int i = 0; i < 6; i++) {
      this.battleStats[i] = this.stats[i];
    }

    this.burn = this.freeze = this.paralysis = this.poison = this.sleep = this.attract = this.flinch = this.badlyPoisoned = this.recover = this.protect
      = this.bound = this.cantEscape = this.confusion = this.curse = this.heal = this.drain = this.recoil = this.leech = this.repeat = this.wildfire = false;
  }

  //assuming perfect ivs and evs = calculate stats
  int calculateHealth() {
    int h = int(((((this.stats[0] + 31)*2 + int(sqrt(252)/4))*this.level)/100)) + this.level + 10;
    this.stats[0] = h;
    this.battleStats[0] = h;
    return h;
  }

  void calculateStats() {
    for (int i = 1; i < 6; i++) {
      int stat = int(((((this.stats[i] + 31)*2 + int(sqrt(252)/4))*this.level)/100)) + 5;
      this.stats[i] = stat;
      this.battleStats[i] = stat;
    }
  }

  void resetHealth() {
    this.currHealth = this.health;
  }

  void resetStats() {
    for (int i = 0; i < 6; i++) {
      this.battleStats[i] = this.stats[i];
    }
  }

  String calculateAbility() {
    String a = "none";

    if (this.name.equals("Charmander") || this.name.equals("Charmeleon") || this.name.equals("Charizard")
      || this.name.equals("Fennekin") || this.name.equals("Braxien") || this.name.equals("Delphox") || 
      this.name.equals("Litten") || this.name.equals("Torracat") || this.name.equals("Incineroar"))
      a = "Blaze";

    else if (this.name.equals("Squirtle") || this.name.equals("Wartortle") || this.name.equals("Blastoise")
      || this.name.equals("Mudkip") || this.name.equals("Marshtomp") || this.name.equals("Swampert") || 
      this.name.equals("Popplio") || this.name.equals("Brionne") || this.name.equals("Primarina"))
      a = "Torrent";

    else if (this.name.equals("Bulbasaur") || this.name.equals("Ivysaur") || this.name.equals("Venusaur")
      || this.name.equals("Snivy") || this.name.equals("Servine") || this.name.equals("Serperior") || 
      this.name.equals("Grookey") || this.name.equals("Thwackey") || this.name.equals("Rillaboom"))
      a = "Overgrowth";

    else if (this.name.equals("Scyther") || this.name.equals("Scizor") || this.name.equals("Beedrill")
      || this.name.equals("Heracross") || this.name.equals("Blipbug") || this.name.equals("Dottler") || 
      this.name.equals("Orbeetle") || this.name.equals("Grubbin") || this.name.equals("Volcarona"))
      a = "Swarm";

    else if (this.name.equals("Mimikyu")) {
      a = "Disguise";
      this.disguise = true;
    }

    else if (this.name.equals("Tyranitar") || this.name.equals("Mega Tyranitar") || this.name.equals("Gigalith"))
      a = "Sand Stream";

    else if (this.name.equals("Applin") || this.name.equals("Flapple") || this.name.equals("Appletun"))
      a = "Ripen";

    else if (this.name.equals("Gastly") || this.name.equals("Haunter") || this.name.equals("Gengar") || 
      this.name.equals("Koffing") || this.name.equals("Weezing") || this.name.equals("Vibrava") || 
      this.name.equals("Flygon") || this.name.equals("Galarian Weezing") || this.name.equals("Latias") ||
      this.name.equals("Latios") || this.name.equals("Rotom-Frost") || this.name.equals("Rotom-Fan") || 
      this.name.equals("Rotom-Mow") || this.name.equals("Rotom-Wash") || this.name.equals("Rotom-Heat"))
      a = "Levitate";

    else if (this.name.equals("Dratini") || this.name.equals("Ekans") || this.name.equals("Arbok") || 
      this.name.equals("Dragonair") || this.name.equals("Silicobra") || this.name.equals("Sandaconda")
       || this.name.equals("Pupitar"))
      a = "Shed Skin";

    else if (this.name.equals("Munchlax") || this.name.equals("Snorlax") || this.name.equals("Seel") || 
      this.name.equals("Dewgong") || this.name.equals("Alolan Rattata") || this.name.equals("Appletun"))
      a = "Thick Fat";

    else if (this.name.equals("Abra") || this.name.equals("Kadabra") || this.name.equals("Alakazam")
      || this.name.equals("Farfetch'd") || this.name.equals("Drowzee") || this.name.equals("Hypno") || 
      this.name.equals("Hitmonchan") || this.name.equals("Kangaskhan") || this.name.equals("Zubat") || 
      this.name.equals("Golbat") || this.name.equals("Crobat") || this.name.equals("Riolu") || 
      this.name.equals("Lucario"))
      a = "Inner Focus";

    else if (this.name.equals("Pidgey") || this.name.equals("Pidgeotto") || this.name.equals("Pidgeot")
      || this.name.equals("Spearow") || this.name.equals("Fearow") || this.name.equals("Rookidee") || 
      this.name.equals("Corvisquire") || this.name.equals("Sentret") || this.name.equals("Furret"))
      a = "Keen Eye";

    else if (this.name.equals("Ekans") || this.name.equals("Arbok") || this.name.equals("Growlithe")
      || this.name.equals("Arcanine") || this.name.equals("Tauros") || this.name.equals("Gyarados") || 
      this.name.equals("Litten") || this.name.equals("Torracat") || this.name.equals("Incineroar")
      || this.name.equals("Shinx") || this.name.equals("Mawile"))
      a = "Intimidate";

    else if (this.name.equals("Marshadow") || this.name.equals("Smeargle") || this.name.equals("Cinccino")
      || this.name.equals("Minccino") || this.name.equals("Toxtricity") || this.name.equals("Meowth") || 
      this.name.equals("Alolan Meowth") || this.name.equals("Persian") || this.name.equals("Alolan Persian"))
      a = "Technician";
      
    else if (this.name.equals("Lapras") || this.name.equals("Krabby") || this.name.equals("Kingler")
      || this.name.equals("Drednaw") || this.name.equals("Falinks"))
      a = "Shell Armor";
      
    else if (this.name.equals("Mega Charizard X") || this.name.equals("Mega Aerodactyl"))
      a = "Tough Claws";
      
    else if (this.name.equals("Magneton") || this.name.equals("Onix") || this.name.equals("Steelix")
      || this.name.equals("Shuckle") || this.name.equals("Magnezone"))
      a = "Sturdy";
      
    else if (this.name.equals("Milotic") || this.name.equals("Sylveon") || this.name.equals("Clefable"))
      a = "Cute Charm";

    else if (this.name.equals("Snover") || this.name.equals("Abomasnow") || this.name.equals("Mega Abomasnow"))
      a = "Snow Warning";
    
    else if (this.name.equals("Vileplume") || this.name.equals("Venusaur") || this.name.equals("Exeggcute")
     || this.name.equals("Seedot") || this.name.equals("Leafeon"))
      a = "Chlorophyll";
      
    else if (this.name.equals("Dreepy") || this.name.equals("Drakloak") || this.name.equals("Dragapult"))
      a = "Clear Body";
      
    else if (this.name.equals("Xerneas"))
      a = "Fairy Aura";
    
    else if (this.name.equals("Sirfetch'd") || this.name.equals("Lucario") || this.name.equals("Machamp"))
      a = "Steadfast";
      
    else if (this.name.equals("Morpeko"))
      a = "Hunger Switch";
      
    else if (this.name.equals("Ditto"))
      a = "Imposter";
      
    else if (this.name.equals("Groudon"))
      a = "Drought";
      
    else if (this.name.equals("Wishiwashi-Solo"))
      a = "Schooling";
      
    else if (this.name.equals("Dragonite") || this.name.equals("Lugia"))
      a = "Multiscale";
      
    else if (this.name.equals("Dracozolt") || this.name.equals("Flapple") || this.name.equals("Durant")) {
      a = "Hustle";
    }
      
    else if (this.name.equals("Kyogre") || this.name.equals("Primal Kyogre"))
      a = "Primordial Sea";
      
    else if (this.name.equals("Eternatus") || this.name.equals("Absol") || this.name.equals("Corviknight")
     || this.name.equals("Aerodactyl") || this.name.equals("Mewtwo") || this.name.equals("Articuno"))
      a = "Pressure";
      
    else if (this.name.equals("Krookodile") || this.name.equals("Krokorok") || this.name.equals("Camerupt")
     || this.name.equals("Primeape") || this.name.equals("Tauros") || this.name.equals("Crabominable"))
      a = "Anger Point";
      
    else if (this.name.equals("Nihilego") || this.name.equals("Celesteela") || this.name.equals("Buzzwole")
     || this.name.equals("Pheromosa") || this.name.equals("Xurkitree") || this.name.equals("Kartana")
     || this.name.equals("Guzzlord") || this.name.equals("Poipole") || this.name.equals("Naganadel")
     || this.name.equals("Stakataka") || this.name.equals("Blacephalon"))
      a = "Beast Boost";
      
    return a;
  }

  void describe() {
    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
    println("Name:\t\t", this.name);
    if (this.trainer != null)
      println("Trainer:\t", this.trainer.name);
    println("Type:\t\t", this.type + "/" + this.type2);
    println("Level:\t\t", this.level);
    println("Health:\t\t", this.currHealth+"/"+this.health);
    println();
    println("Ability:\t", this.ability);
    println("Item:\t\t", this.item);
    println("Nature:\t\t", this.nature);

    println();

    println("HP \tATT \tDEF \tS.ATT \tS.DEF \tSPD");

    for (int i = 0; i < 6; i++) {
      print(battleStats[i] + "\t");
    }
    println();

    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
    println();
  }

  void printMoves() {
    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");    
    println(this.name + "'s Moveset:");
    println();
    println("Name:\t\tPP:\tPower:\tAccuracy: \tDamage Catagory:");

    for (int i = 0; i < 4; i++) {
      if (moveSet[i].name.length() > 6) {
        println(moveSet[i].name + " \t" + str(this.currPP[i]) + "/" + str(moveSet[i].powerPoints) + " \t" + 
          str(moveSet[i].power) + " \t" + str(round(moveSet[i].accuracy*100)) + 
          "% \t\t" + moveSet[i].damageCatagory);
      } else {
        println(moveSet[i].name + " \t\t" + str(this.currPP[i]) + "/" + str(moveSet[i].powerPoints) + " \t" + 
          str(moveSet[i].power) + " \t" + str(round(moveSet[i].accuracy*100)) + 
          "% \t\t" + moveSet[i].damageCatagory);
      }
    }

    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
    println();
  }

  void moveSet(Move mv1, Move mv2, Move mv3, Move mv4) {
    this.moveSet[0] = mv1;
    this.moveSet[1] = mv2;
    this.moveSet[2] = mv3;
    this.moveSet[3] = mv4;

    this.formerMove[0] = mv1.name;
    this.formerMove[1] = mv2.name;
    this.formerMove[2] = mv3.name;
    this.formerMove[3] = mv4.name;
    
    this.formerAcc[0] = mv1.accuracy;
    this.formerAcc[1] = mv2.accuracy;
    this.formerAcc[2] = mv3.accuracy;
    this.formerAcc[3] = mv4.accuracy;

    this.formerStatus[0] = mv1.status;
    this.formerStatus[1] = mv2.status;
    this.formerStatus[2] = mv3.status;
    this.formerStatus[3] = mv4.status;

    this.formerStatus2[0] = mv1.status2;
    this.formerStatus2[1] = mv2.status2;
    this.formerStatus2[2] = mv3.status2;
    this.formerStatus2[3] = mv4.status2;

    this.formerStatusProb[0] = mv1.statusProb;
    this.formerStatusProb[1] = mv2.statusProb;
    this.formerStatusProb[2] = mv3.statusProb;
    this.formerStatusProb[3] = mv4.statusProb;

    this.formerPower[0] = mv1.power;
    this.formerPower[1] = mv2.power;
    this.formerPower[2] = mv3.power;
    this.formerPower[3] = mv4.power;
    
    this.pp[0] = mv1.powerPoints;
    this.pp[1] = mv2.powerPoints;
    this.pp[2] = mv3.powerPoints;
    this.pp[3] = mv4.powerPoints;
    
    this.currPP[0] = mv1.powerPoints;
    this.currPP[1] = mv2.powerPoints;
    this.currPP[2] = mv3.powerPoints;
    this.currPP[3] = mv4.powerPoints;
  }
  
  void attackTrainer(Move mv) {
    if (mv.damageCatagory.equals("Special"))
      println(this.name, "dealt", int(random(0,mv.power/10)*this.stats[3]/100), "damage.");
    
    else
      println(this.name, "dealt", int(random(0,mv.power/10)*this.stats[1]/100), "damage.");
  }
  
  void useMove(Move mv, Pokemon target) {
    float random = random(0.85, 1.0);
    float typeEf = mv.typeEffectiveness(target);
    float modifier = random*typeEf;
    int damage = 0;
    float chanceToHit = random(0, 100);
    float randomP = random(0, 1);
    float randomC = random(0, 1);
    float randomF = random(0, 1);
    float randomA = random(0, 1);
    int randomRepeat = int(random(2, 5));
    float criticalRandom = random(0, 100);
    boolean condition = true;
    int orgPower = mv.power;
    float formerMvA = mv.accuracy;
    int indexMv = 0;
    
    for (int i = 0; i < 3; i++) {
      if (this.moveSet[i] == mv) {
        indexMv = i;
      }
    }
    
    this.currPP[indexMv] -= 1;
    
    if (this.ability.equals("No Guard") || target.ability.equals("No Guard")) {
      mv.accuracy = 0;
    }
    
    if (this.ability.equals("Hustle")) {
      mv.accuracy *= 0.8;
    }
    
    //if (target.raidPokemon && !target.raidShield && !target.facedRaidShield) {
    //  if ((target.currHealth < int((float(target.health)*2)/3)) && !target.raidShield) {
    //    println(target.name, "has set up a barrier!");
    //    println();
    //    target.raidShield = true;
    //    target.shieldHealth = 2;
    //    target.facedRaidShield = true;
    //  }
    //}

    if (this.max) {
      if ((this.maxTurns == 0) && !raidPokemon) {
        println("* * *", this.name, "grew enourmous! * * *");
        println();
      }
    }
    
    if (this.currPP[indexMv] >= 0) {
      if ((chanceToHit <= ((mv.accuracy*100)*(this.accuracy * target.evasion))) || mv.accuracy == 0) {   
        if (!(this.flinch && !this.ability.equals("Inner Focus")) && !this.sleep && !(this.attract && (randomA <= 0.5)) && (!(this.paralysis && (randomP <= 0.25)) || (this.type.equals("Electric") || this.type2.equals("Electric"))) 
          && !(this.confusion && (randomC <= 0.33)) && (!this.freeze)) {
          
          int randomAttract = int(random(0,3));
                   
          if (target.ability.equals("Cute Charm") && randomAttract == 0 && !this.attract) {
            this.attract = true;
            println(this.name, "was infatuated by", target.name + "!");
            println();
          }
          
          //STAB
          if (mv.type.equals(this.type) || mv.type.equals(this.type2)) {
            mv.power *= 1.5;
          }
          
          //Charge
          if (mv.type.equals("Electric") && this.eCharge) {
            println(mv.name, "was electrically charged!");
            mv.power *= 2;
            this.eCharge = false;
          }
          
          //Rain
          if (mv.type.equals("Water") && (battle.weather.equals("Rain") || battle.weather.equals("Primordial Sea"))) {
            mv.power *= 1.5;
          } else if (mv.type.equals("Fire") && battle.weather.equals("Rain")) {
            mv.power *= 0.5;
          } else if (mv.type.equals("Fire") && battle.weather.equals("Primordial Sea")) {
            mv.power = 0;
            println("The flame drizzled out in the raging sea!");
          } 
          
          //Harsh Sunlight
          if (mv.type.equals("Water") && battle.weather.equals("Harsh Sunlight")) {
            mv.power *= 0.5;
          } else if (mv.type.equals("Water") && battle.weather.equals("Extremely Harsh Sunlight")) {
            mv.power = 0;
            println("The water evaporated into thin air!");
          } else if (mv.type.equals("Fire") && (battle.weather.equals("Harsh Sunlight") || battle.weather.equals("Extremely Harsh Sunlight"))) {
            mv.power *= 1.5;
          }
          
          //Misty Terrain
          if (this.battle != null) {
          if (mv.type.equals("Dragon") && battle.terrain.equals("Misty Terrain")) {
            mv.power *= 0.5;
          }
          }
          
          //Fairy Aura
          if (mv.type.equals("Fairy") && (this.ability.equals("Fairy Aura") || target.ability.equals("Fairy Aura"))) {
            mv.power *= 1.33;
          }
          
          //Does not check for contact -> OP
          if (this.ability.equals("Tough Claws") && mv.damageCatagory.equals("Physical")) {
            mv.power *= 1.33;
          }
          
          //Life Orb
          if (this.item.equals("Life Orb")) {
            mv.power *= 1.3;
          }
          
          //Hustle
          if (this.ability.equals("Hustle")) {
            mv.power *= 1.5;
          }
          
          //Bolt Beak
          if (mv.name.equals("Bolt Beak") && (this.battleStats[5] > target.battleStats[5])) {
            mv.power *= 2;
          }
          
          
          if (this.ability.equals("Technician") && mv.power <= 60)
            mv.power *= 1.5;

          if (mv.damageCatagory.equals("Physical")) {
            if (this.burn && (!this.type.equals("Fire") || !this.type2.equals("Fire"))) {
              damage = int((((((((2*this.level)/5)+2) * mv.power * (float(this.battleStats[1]) / target.battleStats[2]))/50)+2) * modifier)/2);
            } else
              damage = int(((((((2*this.level)/5)+2) * mv.power * (float(this.battleStats[1]) / target.battleStats[2]))/50)+2) * modifier);
          } else if (mv.damageCatagory.equals("Special")) {
            if (mv.name.equals("Psyshock"))
              damage = int(((((((2*this.level)/5)+2)* mv.power * (float(this.battleStats[3]) /target.battleStats[2]))/50)+2) * modifier);
            else
              damage = int(((((((2*this.level)/5)+2)* mv.power * (float(this.battleStats[3]) /target.battleStats[4]))/50)+2) * modifier);
          } else {
            damage = 0;
          }
          
          mv.power = orgPower;
          
          if (target.fly && !(mv.name.equals("Hurricane") || mv.name.equals("Gust") || mv.name.equals("Thunder") || 
          mv.name.equals("Smack Down") || mv.name.equals("Sky Uppercut")) && !target.ability.equals("No Guard") &&
          target.chargeTurn == 2) {
            damage = 0;
            
            target.chargeTurn = 0;
            target.fly = false;
            
            println(target.name, "flew above the attack!");
          } 
          
          else if (target.dig && !(mv.name.equals("Earthquake")) && !target.ability.equals("No Guard") &&
          target.chargeTurn == 2) {
            damage = 0;
            
            target.chargeTurn = 0;
            target.dig = false;
            
            println(target.name, "burrowed under the attack!");
          }
          
          if (typeEf == 4) {
            println(mv.name, "is super duper effective!");
          } else if (typeEf >= 2) {
            println(mv.name, "is super effective!");
          } else if (typeEf == 1) {
          } else if (typeEf > 0) {
            println(mv.name, "is not very effective.");
          } else {
            println(mv.name, "is ineffective.");
            if (mv.accuracy != 0)
              condition = false;
          }

          if ((criticalRandom <= 4.17) && !target.ability.equals("Shell Armor")) {
            println("Critical Hit!");
            println();
            damage *= 1.5;
            
            if (target.ability.equals("Anger Point") && target.attackSMp != 6) {
              target.attackSMp = 6;
              target.battleStats[1] = int(float((target.attackSMp)*target.stats[1])/2);
              
              println(target.name + "'s attack rose to it's max!", target.battleStats[1]);
            }
          }
          
          if (typeEf >= 2 && target.item.equals("Weakness Policy")) {
            println();
            println(target.name + "'s Weakness Policy took in effect!");
            
            if (target.spAttackSMp < 6) {
              println(target.name + "'s special attack greatly rose!");
  
              target.spAttackSMp += 2;
              target.battleStats[3] = int(float((target.spAttackSMp)*target.stats[3])/2);
            }
            if (target.attackSMp < 6) {
              println(target.name + "'s attack greatly rose!");
  
              target.attackSMp += 2;
              target.battleStats[1] = int(float((target.attackSMp)*target.stats[1])/2);
            }
            println();
          }

          if (((this.ability.equals("Blaze") && mv.type.equals("Fire")) || (this.ability.equals("Torrent") && mv.type.equals("Water")) 
            || (this.ability.equals("Overgrowth") && mv.type.equals("Grass"))  || (this.ability.equals("Swarm") && mv.type.equals("Bug"))) 
            && (this.currHealth <= (this.health/3)))
            damage *= 1.5;

          if (target.ability.equals("Thick Fat") && (mv.type.equals("Ice")) || (mv.type.equals("Fire")))
            damage /= 2;

          if (target.ability.equals("Disguise") && target.disguise) {
            damage = 0;
            target.currHealth -= target.health/8;
            println(target.name + "'s disguise was busted! Mimikyu took", target.health/8, "damage!");
            
            target.disguise = false;
          }
          
          if (this.ability.equals("Mega Launcher") && mv.damageCatagory.equals("Special")) {
            damage *= 1.5;
          }
          
          if (mv.name.equals("Hex") && (target.burn || target.freeze || target.paralysis || target.poison || target.sleep || target.badlyPoisoned
          || target.confusion)) {
            damage *= 2;
          }
          
          if (mv.name.equals("Dynamax Cannon") && target.max) {
            damage *= 2;
          }

          if (target.ability.equals("Levitate") && mv.type.equals("Ground")) {
            damage = 0;
            condition = false;
            println(target.name, "is levitating!");
          }
          
          if (target.ability.equals("Multiscale") && (target.currHealth == target.health)) {
            damage /= 2;
          }
          
          if (!this.didHit && mv.name.equals("Stomping Tantrum")) {
            println("Stomping Tantrum's power was doubled!");
            damage *= 2;
          }
          
          if (((target.currHealth == target.health) && damage > target.health)&& this.ability.equals("Sturdy")) {
            damage = target.health - 1;
            
            println(target.name, "is sturdy!");
          }
          
          if (target.substitute) {
            if (damage > this.subHealth) {
              damage = this.subHealth;
              target.substitute = false;
              target.subHealth = 0;
              
              println(mv.name, "broke", target.name + "'s substitute!");
            }
            else if (damage > 0) {
              target.subHealth -= damage;
              damage = 0;
              
              println(target.name + "'s substitute took damage!");
            }
          }
          
          if (target.protect) {
            damage = 0;

            println(target.name, "is protected!");
            println();
            
            condition = false;

            target.protect = false;
          }
          
          if (target.trainer.reflect && mv.damageCatagory.equals("Physical")) {
            damage /= 2;
          }
          
          if (target.trainer.lightScreen && mv.damageCatagory.equals("Special")) {
            damage /= 2;
          }
          
          if (target.trainer.auroraVeil) {
            damage /= 2;
          }
          
          if (this.battle != null) {
          if ((mv.name.equals("Rest") || mv.status.equals("Sleep")) && this.battle.terrain.equals("Misty Terrain")) {
            condition = false;
            println("The mist kept the pokemon awake.");
          }
          }

          if (target.raidShield && target.raidPokemon) {
            if (target.shieldHealth > 0) {
              if (damage > 0) {
                if (mv.status2.equals("Max-Move"))
                  target.shieldHealth -= 1;
                  
                target.shieldHealth -= 1;
                this.shieldDamage += int(float(damage)/3);
                println(this.name, "hit", target.name + "'s shield and depleted its strength!");
                println();
                println("The barrier now has", target.shieldHealth, "bars!");
                println();
                condition = false;
                damage = 0;
              } else {
                println(mv.name, "had no effect.");
                println();
              }
            } else {
              println("The barrier has broken!");
              target.currHealth -= this.shieldDamage;
              println(target.name, "took", (this.shieldDamage), "damage!", target.name + "'s defense and special defense fell!");
              println();
              target.battleStats[2] = int(target.stats[2]*0.65);
              target.battleStats[4] = int(target.stats[4]*0.65);
              target.raidShield = false;
            }
          }

          if (condition)
            mv.condition(this, target);
            
          condition = true;
                    
          if (this.repeat) {
            for (int i = 0; i < randomRepeat; i++) {
              target.currHealth -= damage;

              println(this.name, "uses", mv.name, "and hits", target.name, "for", str(damage), "damage! (" + int((float((target.currHealth + damage) - target.currHealth)/target.health)*100) + "%)", target.name, "now has", target.currHealth, "health! ("
                + int((float(target.currHealth)/target.health)*100) + "%)");
                
              if ((i == 0) && target.ability.equals("Multiscale")) {
                damage *= 2;
              }
            }
            println();
            println(mv.name, "was used", randomRepeat, "times!");
            this.repeat = false;
            
          } else if (this.charge && this.chargeTurn == 1 && !(this.fly || this.dig)) {
            if (mv.name.equals("Fly")) {
              this.fly = true;
              println(this.name, "flew into the sky!");
            } else if (mv.name.equals("Dig")) {
              this.dig = true;
              println(this.name, "dug into the ground!");
            }
            
            this.chargeTurn = 2;
            println(this.name, "charged", mv.name + "!");
          }
          else {
            if (this.charge)
              this.charge = false;
            
            if (damage > 0) {
              target.currHealth -= damage;
  
              println(this.name, "uses", mv.name, "and hits", target.name, "for", str(damage), "damage! (" + int((float((target.currHealth + damage) - target.currHealth)/target.health)*100) + "%)", target.name, "now has", target.currHealth, "health! ("
                + int((float(target.currHealth)/target.health)*100) + "%)");
            }
            else {
              println(this.name, "uses", mv.name, "on", target.name + "!");
            }
          }
          
          this.didHit = true;
          
          float r = random(0, 1);
          
          //Shed Skin + Misty Terrain
          if (this.ability.equals("Shed Skin") && (r <= 0.33)) {
            this.burn = this.freeze = this.paralysis = this.poison = this.sleep = this.badlyPoisoned
              = this.confusion = this.drain = this.leech = false;

            println();
            println(this.name, "shed it's skin and was cured of all non-volatile conditions!");
          }
          
          if (this.battle != null) {
            if (this.battle.terrain.equals("Misty Terrain")) {
              this.burn = this.freeze = this.paralysis = this.poison = this.sleep = this.badlyPoisoned
              = this.confusion = this.drain = this.leech = false;
            }
          }

          if (this.drain) {
            this.currHealth += int(damage/2);

            if (this.currHealth > this.health) {
              this.currHealth = this.health;
            }

            println();
            println(this.name, "is healed by", mv.name, "and heals", str(int(damage/2)), "health! (" + int((float(this.currHealth)/this.health)*100) + "%)");

            this.drain = false;
          }
        } else { 
          if (this.flinch) {
            this.flinch = false;
            println(this.name, "cannot move!");
          }
          if (this.freeze) {
            float randFreeze = random(0,1);
            println("BrrrrRrRRR, COLD!", this.name, "cannot move from the sheer frozen death that is freezing.");
            if (randFreeze <= 0.2) {
              this.freeze = false;
              println(this.name, "warmed up and thawed!");
            }
          }
          if (this.paralysis) {
            println(this.name, "was fully paralyzed!");
          }
          if (this.sleep) {
            if (this.sleepCounter > 1) {
              this.sleepCounter -= 1;
              println(this.name, "is sleeping...");
            } else {
              this.sleep = false;
              println(this.name, "is about to wake up!");
            }

            if (mv.name.equals("Snore")) {
              damage = int(((((((2*this.level)/5)+2)* mv.power * (float(this.battleStats[3]) /target.battleStats[4]))/50)+2) * modifier);
              target.currHealth -= damage;

              println(this.name, "uses", mv.name, "and hits", target.name, "for", str(damage), "damage! (" + int((float((target.currHealth + damage) - target.currHealth)/target.health)*100) + "%)", target.name, "now has", target.currHealth, "health! ("
                + int((float(target.currHealth)/target.health)*100) + "%)");
            }
          }
          if (this.attract) {
            println(this.name, "is immobilized by love!");
          }
          if (this.confusion) {
            if (this.confusionCounter > 0) {
              this.confusionCounter -= 1;
              this.currHealth -= int((((((2*this.level)/5)+2) * 40 * (float(this.battleStats[1]) / this.battleStats[2]))/50)+2);

              println(this.name, "hurt itself in it's confusion!", this.name, "has", this.currHealth, "health! (" + int((float(this.currHealth)/this.health)*100) + "%)");
            } else {
              this.confusion = false;
              println(this.name, "is no longer confused!");
            }
          }
        }
      } else {
        println(this.name, "missed!", target.name, "has", target.currHealth, "health! (" + int((float(target.currHealth)/target.health)*100) + "%)");
        this.didHit = false;
      }
    } else {
      println("This move has run out of PP.");
    }

    if (target.currHealth > 0) {
      //Rocky Helmet
      if (mv.damageCatagory.equals("Physical") && target.item.equals("Rocky Helmet")) {
        this.currHealth -= this.stats[0]/6;
        println(this.name, "is hurt by the rocky helmet, and takes", str(int(float(this.stats[0])/6)), "damage! (" + int((float(this.currHealth)/this.health)*100) + "%)");
      }
      
      if (target.burn && (!target.type.equals("Fire") || !target.type2.equals("Fire"))) {
        target.currHealth -= int(float(target.stats[0])/16);
        println();
        println(target.name, "is hurt by the burn, and takes", str(int(float(target.stats[0])/16)), "damage! (" + int((float(target.currHealth)/target.health)*100) + "%)");
      }
      
      if (target.wildfire && (!target.type.equals("Fire") || !target.type2.equals("Fire"))) {
        target.currHealth -= int(float(target.stats[0])/6);
        println();
        println(target.name, "is burned by the flaming wildfire, and takes", str(int(float(target.stats[0])/16)), "damage! (" + int((float(target.currHealth)/target.health)*100) + "%)");
        target.wildfireCounter -= 1;
      } 
      
      if ((target.wildfireCounter < 1) && target.wildfire) {
        println();
        println("The wildfire around", target.name, "dissipated!");
        target.wildfire = false;
      }

      if (target.poison && (!target.type.equals("Poison") || !target.type.equals("Steel") || !target.type2.equals("Poison") || !target.type2.equals("Steel"))) {
        target.currHealth -= int(float(target.stats[0])/16);
        println();
        println(target.name, "is hurt by poison, and takes", str(int(float(target.stats[0])/16)), "damage! (" + int((float(target.currHealth)/target.health)*100) + "%)");
      }

      if (target.leech && (!target.type.equals("Grass") || !target.type2.equals("Grass"))) {
        target.currHealth -= int(float(target.stats[0])/8);
        this.currHealth += int(float(target.stats[0])/8);

        if (this.currHealth > this.health)
          this.currHealth = this.health;

        println();
        println(target.name, "is sapped by leech seed, and takes", str(int(float(target.stats[0])/8)), "damage! (" + int((float(target.currHealth)/target.health)*100) + "%)");
        println();
        println(this.name, "gains", str(int(float(target.stats[0])/8)), "health! (" + int((float(this.currHealth)/this.health)*100) + "%)");
      }

      if (target.badlyPoisoned && (!target.type.equals("Poison") || !target.type.equals("Steel") || !target.type2.equals("Poison") || !target.type2.equals("Steel"))) {
        target.currHealth -= int((float(target.stats[0]*this.poisonCounter))/16);
        println();
        println(target.name, "is badly hurt by poison, and takes", str(int((float(target.stats[0]*this.poisonCounter))/16)), "damage! (" + int((float(target.currHealth)/target.health)*100) + "%)");
        this.poisonCounter += 1;
      }

      if (this.heal) {
        int amtHealed = int(this.health*float(mv.status2));
        this.currHealth += int(this.health*float(mv.status2));

        if (this.currHealth > this.health) {
          amtHealed = 0;
          this.currHealth = this.health;
        }

        println();
        println(this.name, "is healed and heals", str(amtHealed), "health! (" + int((float(this.currHealth)/this.health)*100) + "%)");

        if (!mv.name.equals("Aqua Ring")) {
          this.heal = false;
        }
      }

      if (target.recoil) {
        Float percent = float(mv.status2);

        this.currHealth -= int(damage*percent);

        println();
        println(this.name, "takes", str(int(damage*percent)), "damage from recoil! (" + int((float(this.currHealth)/this.health)*100) + "%)");

        target.recoil = false;
      }
      
      if (this.item.equals("Life Orb")) {
        this.currHealth -= this.stats[0]/10;
        
        println();
        println(str(this.stats[0]/10), "health was sapped away from", this.name + "! (" + int((float(this.currHealth)/this.health)*100) + "%)");

      }
    }
    
    if (mv.name.equals("Explosion")) {
      this.currHealth = 0;
    }
    
    if (target.currHealth < 1) {
      println();
      println(target.name, "has fainted!", this.name, "wins the battle!");
      target.currHealth = 0;
      
      if (this.ability.equals("Beast Boost")) {
        int highest = 0;
        int highestStat = 0;
        
        for (int i = 1; i < 6; i++) {
          if (this.battleStats[i] > highest) {
            highest = this.battleStats[i];
            highestStat = i;
          }
        }
        
        println();
        String[] stringStats = {"Health", "Attack", "Defense", "Sp.Attack", "Sp.Defense", "Speed"};
        
        println("Beast boost raised", this.name + "'s", stringStats[highestStat] + "!");
        
        if (stringStats[highestStat].equals("Attack")) {
          if (this.attackSMp < 6) {
            println(this.name + "'s attack rose!");

            this.attackSMp += 1;
            this.battleStats[1] = int(float((this.attackSMp)*this.stats[1])/2);
          }
        } else if (stringStats[highestStat].equals("Defense")) {
          if (this.defenseSMp < 6) {
            println(this.name + "'s defense rose!");
            
            this.defenseSMp += 1;
            this.battleStats[2] = int(float((this.defenseSMp)*this.stats[2])/2);
          }
        } else if (stringStats[highestStat].equals("Sp.Attack")) {
          if (this.spAttackSMp < 6) {
            println(this.name + "'s special attack rose!");

            this.spAttackSMp += 1;
            this.battleStats[3] = int(float((this.spAttackSMp)*this.stats[3])/2);
          }
        } else if (stringStats[highestStat].equals("Sp.Defense")) {
          if (this.spDefenseSMp < 6) {
            println(this.name + "'s special defense rose!");

            this.spDefenseSMp += 1;
            this.battleStats[4] = int(float((this.spDefenseSMp+1)*this.stats[4])/2);
          }
        } else if (stringStats[highestStat].equals("Speed")) {
          if (this.speedSMp < 6) {
            println(this.name + "'s speed rose!");
            
            this.speedSMp += 1;
            this.battleStats[5] = int(float((this.speedSMp)*this.stats[5])/2);
          }
        }
      }
    }

    if (this.max) {
      if (this.raidPokemon) {
      } else {
        if ((this.maxTurns < 2)) {
          this.maxTurns += 1;
        } else {
          println();

          this.unmax();

          println("* * *", this.name, "returned back to their original size!", this.name, "now has", this.currHealth, "health! ("+ int((float(this.currHealth)/this.health)*100) + "%) * * *");
        }
      }
    }

    if (this.name.equals("Wishiwashi-School") && this.currHealth < this.health/4) {
      this.unmega();
      
      println("* * *", this.name, "returned back to it's solo form!", "* * *");
    }
    
    if (zMove)
      unZMove();
      
    mv.accuracy = formerMvA;
  }
}
