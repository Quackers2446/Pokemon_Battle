class Pokemon {
  String name;
  String type;
  String type2;
  int level;
  int health;
  int currHealth;
  int[] stats;
  int[] battleStats;
  Move[] moveSet;
  Boolean burn, freeze, paralysis, poison, sleep, flinch, badlyPoisoned, bound, cantEscape, confusion, curse, drain, heal, recoil;
  int attackSM, defenseSM, spAttackSM, spDefenseSM, speedSM, accuracySM, evasionSM;
  String berry;
  String trainer;
  int sleepCounter;
  int confusionCounter;
  int poisonCounter;
  float adjustedStages;
  
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
    
    if (this.type.indexOf("/") != -1)
      this.type2 = this.type.substring(this.type.indexOf("/")+1, this.type.length());
    
    else 
      this.type2 = "";
      
    this.burn = this.freeze = this.paralysis = this.poison = this.sleep = this.flinch = this.badlyPoisoned
    = this.bound = this.cantEscape = this.confusion = this.curse = this.heal = this.drain = this.recoil = false;
    
    this.attackSM = this.defenseSM = this.spAttackSM = this.spDefenseSM = this.speedSM = 2;
    this.accuracySM = this.evasionSM = 3;
    
    this.berry = "none";
    
    this.trainer = "No one";
    
    this.sleepCounter = 0;
    this.confusionCounter = 0;
    this.poisonCounter = 1;
    
    this.adjustedStages = 1;
  }
  
  void rest() {
    this.currHealth = this.health;
    for (int i = 0; i < this.moveSet.length; i++) {
      this.moveSet[i].currPowerPoints = this.moveSet[i].powerPoints;
    }
    for (int i = 0; i < 6; i++) {
      this.battleStats[i] = this.stats[i];
    }
    
    this.burn = this.freeze = this.paralysis = this.poison = this.sleep = this.flinch = this.badlyPoisoned
    = this.bound = this.cantEscape = this.confusion = this.curse = this.heal = this.drain = this.recoil = false;
  }
  
  //assuming perfect ivs and evs, calculate stats
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
    
  void describe() {
    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
    println("Name:\t", this.name);
    println("Trainer:\t", this.trainer);
    println("Type:\t", this.type);
    println("Level:\t", this.level);
    println("Health:\t", this.currHealth+"/"+this.health);
    
    println();
    
    println("HP \tATT \tDEF \tS.ATT \tS.DEF \tSPD");
    
    for (int i = 0; i < 6; i++) {
      print(stats[i] + "\t");
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
      }
      else {
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
    float randomP = random(0,1);
    float randomC = random(0,1);
    float randomF = random(0,1);
    float criticalRandom = random(0,100);
    
    mv.currPowerPoints -= 1;
    
    if (mv.currPowerPoints >= 0) {
      if ((chanceToHit <= ((mv.accuracy*100)*(this.adjustedStages))) || mv.accuracy == 0) {   
        if (!this.flinch && !this.sleep && (!(this.paralysis && (randomP <= 0.25)) || (this.type.equals("Electric") || this.type2.equals("Electric"))) 
        && (!(this.confusion && (randomC <= 0.33)) && (!(this.freeze && (randomF <= 0.2)) || (this.type.equals("Ice") || this.type2.equals("Ice"))))) {
          if (mv.damageCatagory.equals("Physical")) {
            if (this.burn && (!this.type.equals("Fire") || !this.type2.equals("Fire"))) {
              damage = int((((((((2*this.level)/5)+2) * mv.power * (float(this.battleStats[1]) / target.battleStats[2]))/50)+2) * modifier)/2);
            }
            
            else
              damage = int(((((((2*this.level)/5)+2) * mv.power * (float(this.battleStats[1]) / target.battleStats[2]))/50)+2) * modifier);
            
            if (criticalRandom <= 4.17)
              damage *= 1.5;
            target.currHealth -= damage;
            
            if (mv.name.equals("False Swipe")) {
              if (target.currHealth < 1) {
                target.currHealth = 1;
              }
            }
          }
  
          else if (mv.damageCatagory.equals("Special")) {
            damage = int(((((((2*this.level)/5)+2)* mv.power * (float(this.battleStats[3]) /target.battleStats[4]))/50)+2) * modifier);
            
            if (criticalRandom <= 4.17)
              damage *= 1.5;
              
            target.currHealth -= damage;
          }
          
          else {
            damage = 0;  
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
          
          if (criticalRandom <= 4.17) {
            println("Critical Hit!");
            println();
          }
          
          println(this.name, "uses", mv.name, "and hits", target.name, "for", str(damage), "damage!", target.name, "now has", target.currHealth, "health! ("
          + int((float(target.currHealth)/target.health)*100) + "%)");
          
          mv.condition(this, target);
          
          if (target.drain) {
            this.currHealth += int(damage/2);
            
            if (this.currHealth > this.health) {
              this.currHealth = this.health;
            }
            
            println();
            println(this.name, "is healed by", mv.name, "and heals", str(int(damage/2)), "health! (" + int((float(this.currHealth)/this.health)*100) + "%)");
            
            target.drain = false;
          }
        }
        
        else {
          if (this.flinch) {
            this.flinch = false;
            println(this.name, "cannot move!");
          }
          if (this.paralysis) {
            println(this.name, "was fully paralyzed!");
          }
          if (this.sleep) {
            if (this.sleepCounter > 0) {
              this.sleepCounter -= 1;
              println(this.name, "is sleeping...");
            }
            else {
              this.sleep = false;
              println(this.name, "woke up!");
            }
          }
          if (this.confusion) {
            if (this.confusionCounter > 0) {
              this.confusionCounter -= 1;
              this.currHealth -= int((((((2*this.level)/5)+2) * 40 * (float(this.battleStats[1]) / this.battleStats[2]))/50)+2);
              
              println(this.name, "hurt itself in it's confusion!", this.name, "has", this.currHealth, "health! (" + int((float(this.currHealth)/this.health)*100) + "%)");
            }
            else {
              this.confusion = false;
              println(this.name, "is no longer confused!");
            }
          }
        }
      }
      else {
        println(this.name, "missed!", target.name, "has", target.currHealth, "health! (" + int((float(target.currHealth)/target.health)*100) + "%)");
      } 
    }
    
    else {
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
      }
    }
    
    if (target.currHealth < 1) {
      println();
      println(target.name, "has fainted!", this.name, "wins the battle!");
      target.currHealth = 0;
    }
  }
}
