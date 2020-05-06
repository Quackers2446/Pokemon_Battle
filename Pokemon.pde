class Pokemon {
  String name;
  String type;
  String type2;
  int level;
  int health;
  int currHealth;
  int[] stats;
  int[] battleStats;
  String ability;
  Move[] moveSet;
  Boolean burn, freeze, paralysis, poison, sleep, flinch, badlyPoisoned, bound, cantEscape, confusion, curse, drain, heal, recoil, leech, recover, repeat, protect;
  int attackSMp, attackSMn, defenseSMp, defenseSMn, spAttackSMp, spAttackSMn, spDefenseSMp, spDefenseSMn, speedSMp, speedSMn, accuracySMp, accuracySMn, evasionSMp, evasionSMn;
  String item;
  String trainer;
  int sleepCounter;
  int confusionCounter;
  int poisonCounter;
  float adjustedStages;
  boolean raidPokemon;
  boolean raidShield;
  int shieldHealth;
  boolean facedRaidShield;
  int shieldDamage;
  boolean max;
  int maxLevel;
  int maxTurns;

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

    if (this.type.indexOf("/") != -1) {
      this.type2 = this.type.substring(this.type.indexOf("/")+1, this.type.length());
      this.type = this.type.substring(0, this.type.indexOf("/"));
    } else 
    this.type2 = "";

    this.burn = this.freeze = this.paralysis = this.poison = this.sleep = this.flinch = this.badlyPoisoned = this.recover = this.protect
      = this.bound = this.cantEscape = this.confusion = this.curse = this.heal = this.drain = this.recoil = this.leech = this.repeat = false;

    attackSMp = attackSMn = defenseSMp = defenseSMn = spAttackSMp = spAttackSMn = spDefenseSMp = spDefenseSMn = speedSMp
      = speedSMn = accuracySMp = accuracySMn = evasionSMp = evasionSMn = 2;

    this.accuracySMp = this.accuracySMn = this.evasionSMp = this.evasionSMn = 3;

    this.item = "none";

    this.trainer = "No one";

    this.sleepCounter = 0;
    this.confusionCounter = 0;
    this.poisonCounter = 1;

    this.adjustedStages = 1;

    this.raidPokemon = false;
    this.raidShield = false;
    this.shieldHealth = 0;
    this.facedRaidShield = false;
    this.shieldDamage = 0;
    
    this.max = false;
    this.maxLevel = 0;
    this.maxTurns = 0;
  }

  void raidStats() {
    this.raidPokemon = true;

    int h = int(((((((this.stats[0] + 31)*2 + int(sqrt(252)/4))*this.level)/100)) + this.level + 10)*2.25);
    this.stats[0] = h;
    this.health = h;
    this.currHealth = h;
    this.battleStats[0] = h;
  }
  
  void dynamax() {
    this.max = true;
    this.health *= (1.5 + (this.maxLevel*0.05));
    this.currHealth *= (1.5 + (this.maxLevel*0.05));
    this.battleStats[0] = this.health;
    
    for (int i = 0; i < 4; i++) {
      if (this.moveSet[i].damageCatagory.equals("Status")) {
        this.moveSet[i].name = "Max Guard";
      }
      else if (this.moveSet[i].type.equals("Normal")) {
        this.moveSet[i].name = ("Max Strike");
      }
      else if (this.moveSet[i].type.equals("Fighting")) {
        this.moveSet[i].name = ("Max Knuckle");
      }
      else if (this.moveSet[i].type.equals("Flying")) {
        this.moveSet[i].name = ("Max Airstream");
      }
      else if (this.moveSet[i].type.equals("Poison")) {
        this.moveSet[i].name = ("Max Ooze");
      }
      else if (this.moveSet[i].type.equals("Ground")) {
        this.moveSet[i].name = ("Max Quake");
      }
      else if (this.moveSet[i].type.equals("Rock")) {
        this.moveSet[i].name = ("Max Rockfall");
      }
      else if (this.moveSet[i].type.equals("Bug")) {
        this.moveSet[i].name = ("Max Flutterby");
      }
      else if (this.moveSet[i].type.equals("Ghost")) {
        this.moveSet[i].name = ("Max Phantasm");
      }
      else if (this.moveSet[i].type.equals("Steel")) {
        this.moveSet[i].name = ("Max Steelspike");
      }
      else if (this.moveSet[i].type.equals("Fire")) {
        this.moveSet[i].name = ("Max Flare");
      }
      else if (this.moveSet[i].type.equals("Water")) {
        this.moveSet[i].name = ("Max Geyser");
      }
      else if (this.moveSet[i].type.equals("Grass")) {
        this.moveSet[i].name = ("Max Overgrowth");
      }
      else if (this.moveSet[i].type.equals("Electric")) {
        this.moveSet[i].name = ("Max Lightning");
      }
      else if (this.moveSet[i].type.equals("Psychic")) {
        this.moveSet[i].name = ("Max Mindstorm");
      }
      else if (this.moveSet[i].type.equals("Ice")) {
        this.moveSet[i].name = ("Max Hailstorm");
      }
      else if (this.moveSet[i].type.equals("Dragon")) {
        this.moveSet[i].name = ("Max Wyrmwind");
      }
      else if (this.moveSet[i].type.equals("Dark")) {
        this.moveSet[i].name = ("Max Darkness");
      }
      else if (this.moveSet[i].type.equals("Fairy")) {
        this.moveSet[i].name = ("Max Starfall");
      }
      
      this.moveSet[i].power *= 1.5;
    }
  }
  
  void unmax() {
    this.max = false;
    this.health = this.stats[0];
    this.currHealth /= (1.5 + (this.maxLevel*0.05));
    this.battleStats[0] = this.stats[0];
  }

  void rest() {
    this.currHealth = this.health;
    for (int i = 0; i < this.moveSet.length; i++) {
      this.moveSet[i].currPowerPoints = this.moveSet[i].powerPoints;
    }
    for (int i = 0; i < 6; i++) {
      this.battleStats[i] = this.stats[i];
    }

    this.burn = this.freeze = this.paralysis = this.poison = this.sleep = this.flinch = this.badlyPoisoned = this.recover = this.protect
      = this.bound = this.cantEscape = this.confusion = this.curse = this.heal = this.drain = this.recoil = this.leech = this.repeat = false;
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

    else if (this.name.equals("Mimikyu"))
      a = "Disguise";

    else if (this.name.equals("Tyranitar") || this.name.equals("Mega Tyranitar") || this.name.equals("Gigalith"))
      a = "Sand Stream";
    
    else if (this.name.equals("Applin") || this.name.equals("Flapple") || this.name.equals("Appletun"))
      a = "Ripen";
      
    else if (this.name.equals("Gastly") || this.name.equals("Haunter") || this.name.equals("Gengar") || 
      this.name.equals("Koffing") || this.name.equals("Weezing") || this.name.equals("Vibrava") || 
      this.name.equals("Flygon") || this.name.equals("Galarian Weezing"))
      a = "Levitate";

    else if (this.name.equals("Dratini") || this.name.equals("Ekans") || this.name.equals("Arbok") || 
      this.name.equals("Dragonair") || this.name.equals("Silicobra") || this.name.equals("Sandaconda"))
      a = "Shed Skin";

    else if (this.name.equals("Munchlax") || this.name.equals("Snorlax") || this.name.equals("Seel") || 
      this.name.equals("Dewgong") || this.name.equals("Alolan Rattata") || this.name.equals("Appletun"))
      a = "Thick Fat";

    else if (this.name.equals("Abra") || this.name.equals("Kadabra") || this.name.equals("Alakazam")
      || this.name.equals("Farfetch'd") || this.name.equals("Drowzee") || this.name.equals("Hypno") || 
      this.name.equals("Hitmonchan") || this.name.equals("Kangaskhan") || this.name.equals("Dragonite")
      || this.name.equals("Zubat") || this.name.equals("Golbat") || this.name.equals("Crobat"))
      a = "Inner Focus";

    else if (this.name.equals("Pidgey") || this.name.equals("Pidgeotto") || this.name.equals("Pidgeot")
      || this.name.equals("Spearow") || this.name.equals("Fearow") || this.name.equals("Rookidee") || 
      this.name.equals("Corvisquire") || this.name.equals("Sentret") || this.name.equals("Furret"))
      a = "Keen Eye";

    else if (this.name.equals("Ekans") || this.name.equals("Arbok") || this.name.equals("Growlithe")
      || this.name.equals("Arcanine") || this.name.equals("Tauros") || this.name.equals("Gyarados") || 
      this.name.equals("Litten") || this.name.equals("Torracat") || this.name.equals("Incineroar"))
      a = "Intimidate";

    else if (this.name.equals("Lapras") || this.name.equals("Krabby") || this.name.equals("Kingler")
      || this.name.equals("Drednaw"))
      a = "Shell Armor";

    return a;
  }

  void describe() {
    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
    println("Name:\t", this.name);
    println("Trainer:\t", this.trainer);
    println("Type:\t", this.type + "/" + this.type2);
    println("Level:\t", this.level);
    println("Health:\t", this.currHealth+"/"+this.health);
    println();
    println("Ability:\t", this.ability);
    println("Item:\t", this.item);

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
      if (moveSet[i].name.length() > 9) {
        println(moveSet[i].name + " \t" + str(moveSet[i].currPowerPoints) + "/" + str(moveSet[i].powerPoints) + " \t" + 
          str(moveSet[i].power) + " \t" + str(round(moveSet[i].accuracy*100)) + 
          "% \t" + moveSet[i].damageCatagory);
      } else {
        println(moveSet[i].name + " \t\t" + str(moveSet[i].currPowerPoints) + "/" + str(moveSet[i].powerPoints) + " \t" + 
          str(moveSet[i].power) + " \t" + str(round(moveSet[i].accuracy*100)) + 
          "% \t" + moveSet[i].damageCatagory);
      }
    }

    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
    println();
  }

  void moveSet(Move mv1, Move mv2, Move mv3, Move mv4) {
    moveSet = new Move[4];
    moveSet[0] = mv1;
    moveSet[1] = mv2;
    moveSet[2] = mv3;
    moveSet[3] = mv4;
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
    int randomRepeat = int(random(2, 5));
    float criticalRandom = random(0, 100);
    boolean condition = true;
    int orgPower = mv.power;

    mv.currPowerPoints -= 1;

    if (target.raidPokemon && !target.raidShield && !target.facedRaidShield) {
      if ((target.currHealth < int((float(target.health)*2)/3)) && !target.raidShield) {
        println(target.name, "has set up a barrier!");
        println();
        target.raidShield = true;
        target.shieldHealth = 3;
        target.facedRaidShield = true;
      }
    }
    
    if (this.max) {
      if (this.maxTurns == 0) {
        println("* * *", this.name, "grew enourmous! * * *");
        println();
      }
    }
    
    if (mv.currPowerPoints >= 0) {
      if ((chanceToHit <= ((mv.accuracy*100)*(this.adjustedStages))) || mv.accuracy == 0) {   
        if (!(this.flinch && !this.ability.equals("Inner Focus")) && !this.sleep && (!(this.paralysis && (randomP <= 0.25)) || (this.type.equals("Electric") || this.type2.equals("Electric"))) 
          && (!(this.confusion && (randomC <= 0.33)) && (!(this.freeze && (randomF <= 0.2)) || (this.type.equals("Ice") || this.type2.equals("Ice"))))) {

          if (mv.type.equals(this.type) || mv.type.equals(this.type2)) {
            mv.power *= 1.5;
          }

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

          if (mv.type.equals(this.type) || mv.type.equals(this.type2)) {
            mv.power = orgPower;
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
          }

          if ((criticalRandom <= 4.17) && !target.ability.equals("Shell Armor")) {
            println("Critical Hit!");
            println();
            damage *= 1.5;
          }

          if (((this.ability.equals("Blaze") && mv.type.equals("Fire")) || (this.ability.equals("Torrent") && mv.type.equals("Water")) 
            || (this.ability.equals("Overgrowth") && mv.type.equals("Grass"))  || (this.ability.equals("Swarm") && mv.type.equals("Bug"))) 
            && (this.currHealth <= (this.health/3)))
            damage *= 1.5;

          if (target.ability.equals("Thick Fat") && (mv.type.equals("Ice")) || (mv.type.equals("Fire")))
            damage /= 2;

          if (target.ability.equals("Disguise") && (target.currHealth == target.health) && (damage > 0)) {
            damage = 0;
            target.currHealth -= target.health/8;
            println(target.name + "'s disguise was busted! Mimikyu took", target.health/8, "damage!");
            println();
          }

          if (target.ability.equals("Levitate") && mv.type.equals("Ground")) {
            damage = 0;
            condition = false;
            println(target.name, "is levitating!");
            println();
          }

          if (target.protect) {
            damage = 0;

            println(target.name, "is protected!");
            println();

            target.protect = false;
          }

          if (target.raidShield && target.raidPokemon) {
            if (target.shieldHealth > 0) {
              if (damage > 0) {
                target.shieldHealth -= 1;
                this.shieldDamage += int(float(damage)/3);
                println(this.name, "hit", target.name + "'s shield and depleted one bar of it's strength!");
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
            }
            println();
            println(mv.name, "was used", randomRepeat, "times!");
            this.repeat = false;
          } else {
            target.currHealth -= damage;

            println(this.name, "uses", mv.name, "and hits", target.name, "for", str(damage), "damage! (" + int((float((target.currHealth + damage) - target.currHealth)/target.health)*100) + "%)", target.name, "now has", target.currHealth, "health! ("
              + int((float(target.currHealth)/target.health)*100) + "%)");
          }

          float r = random(0, 1);
          if (this.ability.equals("Shed Skin") && (r <= 0.33)) {
            if ((this.burn || this.freeze || this.paralysis || this.poison || this.sleep || this.badlyPoisoned || this.confusion || this.drain || this.leech)) {
              this.burn = this.freeze = this.paralysis = this.poison = this.sleep = this.badlyPoisoned
                = this.confusion = this.drain = this.leech = false;

              println();
              println(this.name, "shed it's skin and was cured of all non-volatile conditions!");
            }
          }

          if (target.drain) {
            this.currHealth += int(damage/2);

            if (this.currHealth > this.health) {
              this.currHealth = this.health;
            }

            println();
            println(this.name, "is healed by", mv.name, "and heals", str(int(damage/2)), "health! (" + int((float(this.currHealth)/this.health)*100) + "%)");

            target.drain = false;
          }
        } else { 
          if (this.flinch) {
            this.flinch = false;
            println(this.name, "cannot move!");
          }
          if (this.paralysis) {
            println(this.name, "was fully paralyzed!");
          }
          if (this.sleep) {
            if (this.sleepCounter > 1) {
              this.sleepCounter -= 1;
            } else {
              this.sleep = false;
            }
            println(this.name, "is sleeping...");

            if (mv.name.equals("Snore")) {
              damage = int(((((((2*this.level)/5)+2)* mv.power * (float(this.battleStats[3]) /target.battleStats[4]))/50)+2) * modifier);
              target.currHealth -= damage;

              println(this.name, "uses", mv.name, "and hits", target.name, "for", str(damage), "damage! (" + int((float((target.currHealth + damage) - target.currHealth)/target.health)*100) + "%)", target.name, "now has", target.currHealth, "health! ("
                + int((float(target.currHealth)/target.health)*100) + "%)");
            }
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
      }
    } else {
      println("This move has run out of PP.");
    }

    if (target.currHealth > 0) {
      if (target.burn && (!target.type.equals("Fire") || !target.type2.equals("Fire"))) {
        target.currHealth -= int(float(target.health)/16);
        println();
        println(target.name, "is hurt by the burn, and takes", str(int(float(target.health)/16)), "damage! (" + int((float(target.currHealth)/target.health)*100) + "%)");
      }

      if (target.poison && (!target.type.equals("Poison") || !target.type.equals("Steel") || !target.type2.equals("Poison") || !target.type2.equals("Steel"))) {
        target.currHealth -= int(float(target.health)/16);
        println();
        println(target.name, "is hurt by poison, and takes", str(int(float(target.health)/16)), "damage! (" + int((float(target.currHealth)/target.health)*100) + "%)");
      }

      if (target.leech && (!target.type.equals("Grass") || !target.type2.equals("Grass"))) {
        target.currHealth -= int(float(target.health)/8);
        this.currHealth += int(float(target.health)/8);

        if (this.currHealth > this.health)
          this.currHealth = this.health;

        println();
        println(target.name, "is sapped by leech seed, and takes", str(int(float(target.health)/8)), "damage! (" + int((float(target.currHealth)/target.health)*100) + "%)");
        println();
        println(this.name, "gains", str(int(float(target.health)/8)), "health! (" + int((float(this.currHealth)/this.health)*100) + "%)");
      }

      if (target.badlyPoisoned && (!target.type.equals("Poison") || !target.type.equals("Steel") || !target.type2.equals("Poison") || !target.type2.equals("Steel"))) {
        target.currHealth -= int((float(target.health*this.poisonCounter))/16);
        println();
        println(target.name, "is badly hurt by poison, and takes", str(int((float(target.health*this.poisonCounter))/16)), "damage! (" + int((float(target.currHealth)/target.health)*100) + "%)");
        this.poisonCounter += 1;
      }

      if (target.heal) {
        this.currHealth += int(float(this.health)/16);

        if (this.currHealth > this.health) {
          this.currHealth = this.health;
        }

        println();
        println(this.name, "is healed and heals", str(int(float(this.health)/16)), "health! (" + int((float(this.currHealth)/this.health)*100) + "%)");
      }

      if (target.recoil) {
        Float percent = float(mv.status2);

        this.currHealth -= int(damage*percent);

        if (this.currHealth > this.health) {
          this.currHealth = this.health;
        }

        println();
        println(this.name, "takes", str(int(damage*percent)), "damage from recoil! (" + int((float(this.currHealth)/this.health)*100) + "%)");

        target.recoil = false;
      }
    }

    if (target.currHealth < 1) {
      println();
      println(target.name, "has fainted!", this.name, "wins the battle!");
      target.currHealth = 0;
    }
    
    if (this.max) {
      if (this.maxTurns < 3) {
        this.maxTurns += 1;
      }
      else {
        println();
        
        println("* * *", this.name, "returned back to their original size!", this.name, "now has", this.currHealth, "health! ("+ int((float(this.currHealth)/this.health)*100) + "%) * * *");
        
        this.unmax();
      }
    }
  }
}
