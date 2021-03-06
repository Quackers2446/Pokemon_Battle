class Move {
  String name;
  int powerPoints;
  int currPowerPoints;
  int power;
  float accuracy;
  String type;
  String damageCatagory;
  int priority;
  String status;
  String status2;
  float statusProb;
  float status2Prob;
  int counter;

  float[][] typeChart =              
    // norm  fght  fly   pois  grnd  rock  bug   ghst  stel  fire  wter  grss  elec  psyc  ice   drag  dark fair
  /* norm */     {
    {
      1, 2, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    }
    , 
    /* fght */       {
      1, 1, 2, 1, 1, 0.5, 0.5, 1, 1, 1, 1, 1, 1, 2, 1, 1, 0.5, 2
    }
    , 
    /* fly  */       {
      1, 0.5, 1, 1, 0, 2, 0.5, 1, 1, 1, 1, 0.5, 2, 1, 2, 1, 1, 1
    }
    , 
    /* pois */       {
      1, 0.5, 1, 0.5, 2, 1, 0.5, 1, 1, 1, 1, 0.5, 1, 2, 1, 1, 1, 0.5
    }
    , 
    /* grnd */       {
      1, 1, 1, 0.5, 1, 0.5, 1, 1, 1, 1, 2, 2, 0, 1, 2, 1, 1, 1
    }
    , 
    /* rock */       {
      0.5, 2, 0.5, 0.5, 2, 1, 1, 1, 2, 0.5, 2, 2, 1, 1, 1, 1, 1, 1
    }
    , 
    /* bug  */       {
      1, 0.5, 2, 1, 0.5, 2, 1, 1, 1, 2, 1, 0.5, 1, 1, 1, 1, 1, 1
    }
    , 
    /* ghst */       {
      0, 0, 1, 0.5, 1, 1, 0.5, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1
    }
    , 
    /* stel */       {
      0.5, 2, 0.5, 0, 2, 0.5, 0.5, 1, 0.5, 2, 1, 0.5, 1, 0.5, 0.5, 0.5, 1, 0.5
    }
    ,
    /* fire */       {
      1, 1, 1, 1, 2, 2, 0.5, 1, 0.5, 0.5, 2, 0.5, 1, 1, 0.5, 1, 1, 0.5
    }
    , 
    /* wter */       {
      1, 1, 1, 1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 2, 2, 1, 0.5, 1, 1, 1
    }
    , 
    /* grss */       {
      1, 1, 2, 2, 0.5, 1, 2, 1, 1, 2, 0.5, 0.5, 0.5, 1, 2, 1, 1, 1
    }
    , 
    /* elec */       {
      1, 1, 0.5, 1, 2, 1, 1, 1, 0.5, 1, 1, 1, 0.5, 1, 1, 1, 1, 1
    }
    , 
    /* psyc */       {
      1, 0.5, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 0.5, 1, 1, 2, 1
    }
    , 
    /* ice  */       {
      1, 2, 1, 1, 1, 2, 1, 1, 2, 2, 1, 1, 1, 1, 0.5, 1, 1, 1
    }
    , 
    /* drag */       {
      1, 1, 1, 1, 1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 1, 2, 2, 1, 2
    }
    , 
    /* dark */       {
      1, 2, 1, 1, 1, 1, 2, 0.5, 1, 1, 1, 1, 1, 0, 1, 1, 0.5, 2
    }
    , 
    /* fair */       {
      1, 0.5, 1, 2, 1, 1, 0.5, 1, 2, 1, 1, 1, 1, 1, 1, 0, 0.5, 1
    }
  };
  // norm  fght  fly   pois  grnd  rock  bug   ghst  stel  fire  wter  grss  elec  psyc  ice   drag  dark fair

  Move (String n, int pp, int p, float a, String t, String dC, int pri, String s, float sp) {
    this.name = n;
    this.powerPoints = pp;
    this.currPowerPoints = powerPoints;
    this.power = p;
    this.accuracy = a;
    this.type = t;
    this.damageCatagory = dC;
    this.priority = pri;
    this.status = s;
    this.statusProb = sp;
    
    if (this.status.indexOf("/") != -1)
      this.status2 = this.status.substring(this.status.indexOf("/")+1, this.status.length());
    
    else 
      this.status2 = "";
      
    this.counter = 0;
    this.status2Prob = this.statusProb;
  }
  
  void describe() {
    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");    
    println(this.name);
    println();
    println("PP:\tPower:\tAccuracy: \tDamage Catagory:");

    println( str(this.currPowerPoints) + "/" + str(this.powerPoints) + " \t" + str(this.power) + " \t" + str(round(this.accuracy*100)) + "% \t" + this.damageCatagory);
    println();
    
    println("Effects:", this.status, this.status2);

    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
    println();
  }

  void condition (Pokemon user, Pokemon target) {
    String firstStatus = this.status;
    Float randomP = random(0,1);
    
    if (this.status.indexOf("/") != -1) {
      firstStatus = this.status.substring(0, this.status.indexOf("/"));
    }
    
    float chance;
    if (firstStatus.equals("")) {
    } else {
      if (firstStatus.equals("Burn")) {
        chance = random(0, 1);

        if (chance <= this.statusProb && !target.burn) {
          println(target.name, "was burned!");
          
          target.burn = true;
        }
      } else if (firstStatus.equals("Freeze")) {
        chance = random(0, 1);

        if (chance <= this.statusProb && !target.freeze && !(target.type.equals("Ice") || target.type2.equals("Ice"))) {
          println(target.name, "was frozen!");
          
          target.freeze = true;
        }
      } else if (firstStatus.equals("Paralysis") && !(target.type.equals("Electric") || target.type2.equals("Electric"))) {
        chance = random(0, 1);

        if (chance <= this.statusProb && !target.paralysis) {
          target.battleStats[5] = int(target.battleStats[5]*0.75);
          target.paralysis = true;
          
          println(target.name, "was paralyzed!");
        }
      } else if (firstStatus.equals("Poison") && !target.poison) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "was poisoned!");
          
          target.poison = true;
        }
      } else if (firstStatus.equals("Badly Poisoned") && !target.badlyPoisoned) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "was badly poisoned!");
          
          target.poisonCounter = 1;
          target.badlyPoisoned = true;
        }
      } else if (firstStatus.equals("Sleep") && !target.sleep) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "fell asleep!");
          
          target.sleepCounter = int(random(1,3));
          target.sleep = true;
        }
      } else if (firstStatus.equals("Attract") && !target.attract) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "fell in love with", this.name + "!");
          
          target.attract = true;
        }
      } else if (firstStatus.equals("Leech") && !target.leech) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "was seeded!");
          
          target.leech = true;
        }
      } else if (firstStatus.equals("Flinch") && !target.flinch && !target.ability.equals("Inner Focus")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          
          println(target.name, "flinched!");
          
          if (target.ability.equals("Steadfast")) {
            if (target.speedSMp < 6) {
              println(target.name, "is steadfast! Their speed rose!");
              
              target.speedSMp += 1;
              target.battleStats[5] = int(float((target.speedSMp)*target.stats[5])/2);
            }
          }
          
          target.flinch = true;
        }
      } else if (firstStatus.equals("Confusion") && !target.confusion) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "was confused!");
        
          target.confusionCounter = int(random(1, 4));
          target.confusion = true;
        }
      } else if (firstStatus.equals("Recoil")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.recoil = true;
        }
      } else if (firstStatus.equals("Hp+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.currHealth += user.stats[0]/8;
          
          println(user.name + "'s bulk rose to", user.currHealth + "!");
        }
      } else if (firstStatus.equals("Attack-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.attackSMn < 6) {
            println(target.name + "'s attack fell!");
            
            target.attackSMn += 1;
            target.battleStats[1] = int(float(2*target.stats[1])/(target.attackSMn));
          }
        }
      } else if (firstStatus.equals("U.Attack-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.attackSMn < 6) {
            println(user.name + "'s attack fell!");
            
            user.attackSMn += 1;
            user.battleStats[1] = int(float(2*user.stats[1])/(user.attackSMn));
          }
        }
      } else if (firstStatus.equals("Attack--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.attackSMn < 6) {
            println(target.name + "'s attack greatly fell!");
            
            target.attackSMn += 2;
            target.battleStats[1] = int(float(2*target.stats[1])/(target.attackSMn));
          }
        }
      } else if (firstStatus.equals("Attack+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.attackSMp < 6) {
            println(user.name + "'s attack rose!");

            user.attackSMp += 1;
            user.battleStats[1] = int(float((user.attackSMp)*user.stats[1])/2);
          }
        }
      } else if (firstStatus.equals("Attack++")) {
        chance = random(0, 1);
        
        if (chance <= this.statusProb) {
          if (user.attackSMp < 6) {
            println(user.name + "'s attack greatly rose!");

            user.attackSMp += 2;
            user.battleStats[1] = int(float((user.attackSMp)*user.stats[1])/2);
          }
        }
      } else if (firstStatus.equals("Sp.Attack+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spAttackSMp < 6) {
            println(user.name + "'s special attack rose!");

            user.spAttackSMp += 1;
            user.battleStats[3] = int(float((user.spAttackSMp)*user.stats[3])/2);
          }
        }
      } else if (firstStatus.equals("Sp.Attack++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spAttackSMp < 6) {
            println(user.name + "'s special attack greatly rose!");

            user.spAttackSMp += 2;
            user.battleStats[3] = int(float((user.spAttackSMp)*user.stats[3])/2);
          }
        }
      } else if (firstStatus.equals("Sp.Attack-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.spAttackSMn < 6) {
            println(target.name + "'s special attack fell!");
            
            target.spAttackSMn += 1;
            target.battleStats[3] = int((2*target.stats[3])/float(target.spAttackSMn));
          }
        }
      } else if (firstStatus.equals("Sp.Attack--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.spAttackSMn < 6) {
            println(target.name + "'s special attack greatly fell!");
            
            target.spAttackSMn += 2;
            target.battleStats[3] = int((2*target.stats[3])/float(target.spAttackSMn));
          }
        }
      } else if (firstStatus.equals("Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.defenseSMn < 6) {
            println(target.name + "'s defense fell!");
            
            target.defenseSMn += 1;
            target.battleStats[2] = int((2*target.stats[2])/float(target.defenseSMn));
          }
        }
      } else if (firstStatus.equals("U.Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSMn < 6) {
            println(user.name + "'s defense fell!");
            
            user.defenseSMn += 1;
            user.battleStats[2] = int((2*user.stats[2])/float(user.defenseSMn));
          }
        }
      } else if (firstStatus.equals("Defense--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.defenseSMn < 6) {
            println(target.name + "'s defense greatly fell!");
            
            target.defenseSMn += 2;
            target.battleStats[2] = int((2*target.stats[2])/float(target.defenseSMn));
          }
        }
      } else if (firstStatus.equals("Defense+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSMp < 6) {
            println(user.name + "'s defense rose!");
            
            user.defenseSMp += 1;
            user.battleStats[2] = int(float((user.defenseSMp)*user.stats[2])/2);
          }
        }
      } else if (firstStatus.equals("Defense++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSMp < 6) {
            println(user.name + "'s defense greatly rose!");
            
            user.defenseSMp += 2;
            user.battleStats[2] = int(float((user.defenseSMp)*user.stats[2])/2);
          }
        }
      } else if (firstStatus.equals("Defense+++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSMp < 6) {
            println(user.name + "'s defense greatly rose!");
            
            user.defenseSMp += 3;
            user.battleStats[2] = int(float((user.defenseSMp)*user.stats[2])/2);
          }
        }
      } else if (firstStatus.equals("Sp.Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.spDefenseSMn < 6) {
            println(target.name + "'s special defense fell!");
            
            target.spDefenseSMn += 1;
            target.battleStats[4] = int((2.0*target.stats[4])/float(target.spDefenseSMn));
          }
        }
      } else if (firstStatus.equals("Sp.Defense+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spDefenseSMp < 6) {
            println(user.name + "'s special defense rose!");

            user.spDefenseSMp += 1;
            user.battleStats[4] = int(float((user.spDefenseSMp+1)*user.stats[4])/2);
          }
        }
      } else if (firstStatus.equals("Sp.Defense++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spDefenseSMp < 6) {
            println(user.name + "'s special defense greatly rose!");
            
            user.spDefenseSMp += 2;
            user.battleStats[4] = int(float((user.spDefenseSMp)*user.stats[4])/2);
          }
        }
      } else if (firstStatus.equals("Speed+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSMp < 6) {
            println(user.name + "'s speed rose!");
            
            user.speedSMp += 1;
            user.battleStats[5] = int(float((user.speedSMp)*user.stats[5])/2);
          }
        }
      } else if (firstStatus.equals("Speed++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSMp < 6) {
            println(user.name + "'s speed greatly rose!");

            user.speedSMp += 2;
            user.battleStats[5] = int(float((user.speedSMp+2)*user.stats[5])/2);
          }
        }
      } else if (firstStatus.equals("Speed-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.speedSMn < 6) {
            println(target.name + "'s speed fell!");
            
            target.speedSMn += 1;
            target.battleStats[5] = int((2*target.stats[5])/float(target.speedSMn));
          }
        }
      } else if (firstStatus.equals("Speed--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.speedSMn < 6) {
            println(target.name + "'s speed greatly fell!");
            
            target.speedSMn += 2;
            target.battleStats[5] = int((2*target.stats[5])/float(target.speedSMn));
          }
        }
      } else if (firstStatus.equals("U.Speed-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSMn < 6) {
            println(user.name + "'s speed fell!");
            
            user.speedSMn += 1;
            user.battleStats[5] = int((2*user.stats[5])/float(user.speedSMn));
          }
        }
      } else if (firstStatus.equals("U.Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSMn < 6) {
            println(user.name + "'s defense fell!");
            
            user.defenseSMn += 1;
            user.battleStats[2] = int((2*user.stats[2])/float(user.defenseSMn));
          }
        }
      } else if (firstStatus.equals("U.Defense--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSMn < 6) {
            println(user.name + "'s defense greatly fell!");
            
            user.defenseSMn += 2;
            user.battleStats[2] = int((2*user.stats[2])/float(user.defenseSMn));
          }
        }
      } else if (firstStatus.equals("U.Sp.Attack--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spAttackSMn < 6) {
            println(user.name + "'s special attack greatly fell!");
            
            user.spAttackSMn += 2;
            user.battleStats[3] = int((2*user.stats[3])/float(user.spAttackSMn));
          }
        }
      } else if (firstStatus.equals("U.Sp.Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spDefenseSMn < 6) {
            println(user.name + "'s special defense fell!");
            
            user.spDefenseSMn += 1;
            user.battleStats[4] = int((2.0*user.stats[4])/float(user.spDefenseSMn));
          }
        }
      } else if (firstStatus.equals("Accuracy-") && !target.ability.equals("Keen Eye")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.accuracySMn < 6) {
            println(target.name + "'s accuracy fell!");
            
            target.accuracySMn += 1;
            target.accuracy *= 3/float(target.accuracySMn);
          }
        }
      } else if (firstStatus.equals("Accuracy+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.accuracySMp < 6) {
            println(user.name + "'s accuracy rose!");
            
            user.accuracySMp += 1;
            user.accuracy *= float(user.accuracySMp)/3;
          }
        }
      } else if (firstStatus.equals("Evasion+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.evasionSMp < 6) {
            println(user.name + "'s evasion rose!");
            
            user.evasionSMp += 1;
            user.evasion *= 3/float(user.evasionSMp);
          }
        }
      } else if (firstStatus.equals("Evasion++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.evasionSMp < 6) {
            println(user.name + "'s evasion greatly rose!");
            
            user.evasionSMp += 2;
            user.evasion *= 3/float(user.evasionSMp);
          }
        }
      } else if (firstStatus.equals("Evasion+++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.evasionSMp < 6) {
            println(user.name + "'s evasion went up by three stages!");
            
            user.evasionSMp += 3;
            user.evasion *= 3/float(user.evasionSMp);
          }
        }
      } else if (firstStatus.equals("Evasion-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.evasionSMn < 6) {
            println(target.name + "'s evasion fell!");
            
            target.evasionSMn += 1;
            target.evasion *= float(target.evasionSMn)/3;
          }
        }
      } else if (firstStatus.equals("Drain")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.drain = true;
        }
      } else if (firstStatus.equals("Heal")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.heal = true;
        }
      } else if (firstStatus.equals("Recover")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.currHealth += int(user.health/2);
          if (user.currHealth > user.health)
            user.currHealth = user.health;
            
          println(user.name, "healed by 50% and is now at", user.currHealth, "health! (" + int((float(user.currHealth)/user.health)*100) + "%)");
        }
      } else if (firstStatus.equals("Rest") && !target.sleep) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.currHealth = user.health;
          
          user.burn = user.freeze = user.paralysis = user.poison = user.sleep = user.flinch = user.badlyPoisoned = user.recover
          = user.bound = user.cantEscape = user.confusion = user.curse = user.heal = user.drain = user.recoil = user.leech = false;
          
          user.sleep = true;
          user.sleepCounter = 2;
          
          println(user.name, "healed to max and was cured from all status conditions.");
          println(user.name, "rested and fell asleep.");
        }
      } else if (firstStatus.equals("DestroyItem")) {
        chance = random(0, 1);

        if (chance <= this.statusProb && (!target.item.equals("none"))) {
          println();
          println(user.name, "destroyed", target.name + "'s", target.item);
          
          target.item = "none";
        }
      } else if (firstStatus.equals("Repeat")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.repeat = true;
        }
      } else if (firstStatus.equals("Protect")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.protect = true;
        }
      } else if (firstStatus.equals("Cure")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          for (int i = 0; i < user.trainer.team.size(); i++) {
            Pokemon p = user.trainer.team.get(i);
            p.burn = p.freeze = p.paralysis = p.poison = p.sleep = p.flinch = p.badlyPoisoned = p.confusion = false;
          }
          
          println("The entire party has been cured of major status effects.");
        }
      } else if (firstStatus.equals("StrengthSap")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.currHealth += target.battleStats[1];
          if (user.currHealth >= user.health)
            user.currHealth = user.health;
          
          println(user.name, "healed to", user.currHealth, "health! (" +int((float(user.currHealth)/user.health)*100) + "%)");
          
          if (target.attackSMn < 6) {
            println(target.name + "'s attack fell!");
            target.attackSMn += 1;
            target.battleStats[1] = int(float(2*target.stats[1])/(target.attackSMn));
          }
        }
      } else if (firstStatus.equals("Thief")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.item.equals("none") || user.item.equals("None")) {
            user.item = (target.item);
            println(user.name, "stole", target.name + "'s", target.item + "!");
            target.item = ("none");
          }
        }
      } else if (firstStatus.equals("Charge") && !user.charge) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.charge = true;
          user.chargeTurn = 1;
        }
      } else if (firstStatus.equals("E.Charge") && !user.eCharge) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.eCharge = true;
          println(user.name, "was electrically charged!");
        }
      } else if (firstStatus.equals("Switch")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(user.name, "forced", target.name, "to switch!");
          target.switchOut();
        }
      } else if (firstStatus.equals("Substitute") && !user.substitute) {
        chance = random(0, 1);
        
        if (chance <= this.statusProb) {
          if (user.currHealth <= user.stats[0]/4) {
            println(user.name, "doesn't have enough health to make a substitute.");
          }
          else {
            user.substitute = true;
            
            user.currHealth -= user.stats[0]/4;
            user.subHealth = user.stats[0]/4;
            
            println(user.name, "made a Substitute and lost 25% of their health! HP:", user.currHealth + "/" + user.health);
            
          }
        }
      }
      // else if (firstStatus.equals("Transform")) {
      //  chance = random(0, 1);
        
      //  if (chance <= this.statusProb) {
      //    println(user.name, "became", target.name + "!");
          
      //    float perHealth = float(user.currHealth)/user.health;
                    
      //    user = target.transform();  
      //    user.moveSet(target.moveSet[0], target.moveSet], target.moveSet[2], target.moveSet[3]);
      //    user.calculateStats();
          
      //    user.currHealth = int(user.health*perHealth);
      //    user.name = user.name + "-Ditto";
      //  }
      //}
      else if (firstStatus.equals("Geomancy")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.item.equals("Power Herb")) {
            user.item = "none";
            
            println(user.name + "'s Power Herb charged Geomancy in one turn!");
            println();
            if (user.spAttackSMp < 6) {
              println(user.name + "'s special attack greatly rose!");
  
              user.spAttackSMp += 2;
              user.battleStats[3] = int(float((user.spAttackSMp)*user.stats[3])/2);
            }
            if (user.spDefenseSMp < 6) {
              println(user.name + "'s special defense greatly rose!");
              
              user.spDefenseSMp += 2;
              user.battleStats[4] = int(float((user.spDefenseSMp)*user.stats[4])/2);
            }
            if (user.speedSMp < 6) {
              println(user.name + "'s speed greatly rose!");
  
              user.speedSMp += 2;
              user.battleStats[5] = int(float((user.speedSMp+2)*user.stats[5])/2);
            }
          } else {
            if (user.chargeTurn == 0) {
              user.charge = true;
              user.chargeTurn = 1;
            }
            if (user.chargeTurn == 2) {
              if (user.spAttackSMp < 6) {
                println(user.name + "'s special attack greatly rose!");
    
                user.spAttackSMp += 2;
                user.battleStats[3] = int(float((user.spAttackSMp)*user.stats[3])/2);
              }
              if (user.spDefenseSMp < 6) {
                println(user.name + "'s special defense greatly rose!");
                
                user.spDefenseSMp += 2;
                user.battleStats[4] = int(float((user.spDefenseSMp)*user.stats[4])/2);
              }
              if (user.speedSMp < 6) {
                println(user.name + "'s speed greatly rose!");
    
                user.speedSMp += 2;
                user.battleStats[5] = int(float((user.speedSMp+2)*user.stats[5])/2);
              }

              user.charge = false;
              user.chargeTurn = 0;
            }
          }
        }
      } else if (firstStatus.equals("SpectralThief")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.attackSMp > user.attackSMp) {
            user.battleStats[1] = int(float((target.attackSMp)*user.stats[1])/2);
            target.battleStats[1] = target.stats[1];
            println("Attack+");
          }
          if (target.defenseSMp > user.defenseSMp) {
            user.battleStats[2] = int(float((target.defenseSMp)*user.stats[2])/2);
            target.battleStats[2] = target.stats[2];
            println("Defense+");
          }
          if (target.spAttackSMp > user.spAttackSMp) {
            user.battleStats[3] = int(float((target.spAttackSMp)*user.stats[3])/2);
            target.battleStats[3] = target.stats[3];
            println("Special Attack+");
          }
          if (target.spDefenseSMp > user.spDefenseSMp) {
            user.battleStats[4] = int(float((target.spDefenseSMp)*user.stats[4])/2);
            target.battleStats[4] = target.stats[4];
            println("Special Defense+");
          }
          if (target.speedSMp > user.speedSMp) {
            user.battleStats[5] = int(float((target.speedSMp)*user.stats[5])/2);
            target.battleStats[5] = target.stats[5];
            println("Speed+");
          }
          println(user.name, "stole", target.name + "'s stat bonuses!");
        }
      } else if (firstStatus.equals("ShellSmash")) {
        chance = random(0, 1);
        if (chance <= this.statusProb) {
          if (user.spAttackSMp < 6) {
            println(user.name + "'s special attack greatly rose!");

            user.spAttackSMp += 2;
            user.battleStats[3] = int(float((user.spAttackSMp)*user.stats[3])/2);
          }
          if (user.attackSMp < 6) {
            println(user.name + "'s attack greatly rose!");

            user.attackSMp += 2;
            user.battleStats[1] = int(float((user.attackSMp)*user.stats[1])/2);
          }
          if (user.speedSMp < 6) {
            println(user.name + "'s speed greatly rose!");

            user.speedSMp += 2;
            user.battleStats[5] = int(float((user.speedSMp+2)*user.stats[5])/2);
          }
          if (user.spDefenseSMn < 6) {
            println(user.name + "'s special defense fell!");

            user.spDefenseSMp -= 1;
            user.battleStats[4] = int((2*user.stats[4])/float(user.spDefenseSMn));
          }
          if (user.defenseSMn < 6) {
            println(user.name + "'s defense fell!");
            
            user.defenseSMn += 1;
            user.battleStats[2] = int((2*user.stats[2])/float(user.defenseSMn));
          }
          
          
        }
      } else if (firstStatus.equals("Wildfire") && !target.wildfire) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.wildfire = true;
          target.wildfireCounter = 4;
          println(user.name, "creates a Wildfire that swirls around", target.name + "!");
        }
      } else if (firstStatus.equals("StealthRock") && !target.trainer.sR) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.trainer.sR = true;
          println(user.name, "threw floating pointy rocks on the other side of the field!");
        }
      } else if (firstStatus.equals("Reflect") && !user.trainer.reflect) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.trainer.reflect = true;
          user.trainer.reflectC = 5;
          
          println(user.name, "set up Reflect!");
        }
      } else if (firstStatus.equals("LightScreen") && !user.trainer.lightScreen) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.trainer.lightScreen = true;
          user.trainer.lightScreenC = 5;
          
          println(user.name, "set up a Light Screen!");
        }
      } else if (firstStatus.equals("AuroraVeil") && !user.trainer.auroraVeil) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.trainer.auroraVeil = true;
          user.trainer.auroraVeilC = 5;
          
          println(user.name, "set up an Aurora Veil!!");
        }
      }
    }
    
    if (status2.equals("")) {
    } else {
      if (status2.equals("Burn")) {
        chance = random(0, 1);

        if (chance <= this.statusProb && !target.burn) {
          println(target.name, "was burned!");
          
          target.burn = true;
        }
      } else if (status2.equals("Freeze")) {
        chance = random(0, 1);

        if (chance <= this.statusProb && !target.freeze && !(target.type.equals("Ice") || target.type2.equals("Ice"))) {
          println(target.name, "was frozen!");
          
          target.freeze = true;
        }
      } else if (status2.equals("Paralysis") && !(target.type.equals("Electric") || target.type2.equals("Electric"))) {
        chance = random(0, 1);

        if (chance <= this.statusProb && !target.paralysis) {
          target.battleStats[5] = int(target.battleStats[5]*0.75);
          target.paralysis = true;
          
          println(target.name, "was paralyzed!");
        }
      } else if (status2.equals("Poison") && !target.poison) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "was poisoned!");
          
          target.poison = true;
        }
      } else if (status2.equals("Badly Poisoned") && !target.badlyPoisoned) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "was badly poisoned!");
          
          target.poisonCounter = 1;
          target.badlyPoisoned = true;
        }
      } else if (status2.equals("Sleep") && !target.sleep) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "fell asleep!");
          
          target.sleepCounter = int(random(1,3));
          target.sleep = true;
        }
      } else if (status2.equals("Attract") && !target.attract) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "fell in love with", this.name + "!");
          
          target.attract = true;
        }
      } else if (status2.equals("Leech") && !target.leech) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "was seeded!");
          
          target.leech = true;
        }
      } else if (status2.equals("Flinch") && !target.flinch && !target.ability.equals("Inner Focus")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          
          println(target.name, "flinched!");
          
          if (target.ability.equals("Steadfast")) {
            if (target.speedSMp < 6) {
              println(target.name, "is steadfast! Their speed rose!");
              
              target.speedSMp += 1;
              target.battleStats[5] = int(float((target.speedSMp)*target.stats[5])/2);
            }
          }
          
          target.flinch = true;
        }
      } else if (status2.equals("Confusion") && !target.confusion) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println(target.name, "was confused!");
        
          target.confusionCounter = int(random(1, 4));
          target.confusion = true;
        }
      } else if (status2.equals("Recoil")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.recoil = true;
        }
      } else if (status2.equals("Hp+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.currHealth += user.stats[0]/8;
          
          println(user.name + "'s bulk rose to", user.currHealth + "!");
            
        }
      } else if (status2.equals("Attack-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.attackSMn < 6) {
            println(target.name + "'s attack fell!");
            
            target.attackSMn += 1;
            target.battleStats[1] = int(float(2*target.stats[1])/(target.attackSMn));
          }
        }
      } else if (status2.equals("U.Attack-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.attackSMn < 6) {
            println(user.name + "'s attack fell!");
            
            user.attackSMn += 1;
            user.battleStats[1] = int(float(2*user.stats[1])/(user.attackSMn));
          }
        }
      } else if (status2.equals("Attack--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.attackSMn < 6) {
            println(target.name + "'s attack greatly fell!");
            
            target.attackSMn += 2;
            target.battleStats[1] = int(float(2*target.stats[1])/(target.attackSMn));
          }
        }
      } else if (status2.equals("Attack+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.attackSMp < 6) {
            println(user.name + "'s attack rose!");

            user.attackSMp += 1;
            user.battleStats[1] = int(float((user.attackSMp)*user.stats[1])/2);
          }
        }
      } else if (status2.equals("Attack++")) {
        chance = random(0, 1);
        
        if (chance <= this.statusProb) {
          if (user.attackSMp < 6) {
            println(user.name + "'s attack greatly rose!");

            user.attackSMp += 2;
            user.battleStats[1] = int(float((user.attackSMp)*user.stats[1])/2);
          }
        }
      } else if (status2.equals("Sp.Attack+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spAttackSMp < 6) {
            println(user.name + "'s special attack rose!");

            user.spAttackSMp += 1;
            user.battleStats[3] = int(float((user.spAttackSMp)*user.stats[3])/2);
          }
        }
      } else if (status2.equals("Sp.Attack++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spAttackSMp < 6) {
            println(user.name + "'s special attack greatly rose!");

            user.spAttackSMp += 2;
            user.battleStats[3] = int(float((user.spAttackSMp)*user.stats[3])/2);
          }
        }
      } else if (status2.equals("Sp.Attack-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.spAttackSMn < 6) {
            println(target.name + "'s special attack fell!");
            
            target.spAttackSMn += 1;
            target.battleStats[3] = int((2*target.stats[3])/float(target.spAttackSMn));
          }
        }
      } else if (status2.equals("Sp.Attack--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.spAttackSMn < 6) {
            println(target.name + "'s special attack greatly fell!");
            
            target.spAttackSMn += 2;
            target.battleStats[3] = int((2*target.stats[3])/float(target.spAttackSMn));
          }
        }
      } else if (status2.equals("Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.defenseSMn < 6) {
            println(target.name + "'s defense fell!");
            
            target.defenseSMn += 1;
            target.battleStats[2] = int((2*target.stats[2])/float(target.defenseSMn));
          }
        }
      } else if (status2.equals("U.Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSMn < 6) {
            println(user.name + "'s defense fell!");
            
            user.defenseSMn += 1;
            user.battleStats[2] = int((2*user.stats[2])/float(user.defenseSMn));
          }
        }
      } else if (status2.equals("Defense--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.defenseSMn < 6) {
            println(target.name + "'s defense greatly fell!");
            
            target.defenseSMn += 2;
            target.battleStats[2] = int((2*target.stats[2])/float(target.defenseSMn));
          }
        }
      } else if (status2.equals("Defense+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSMp < 6) {
            println(user.name + "'s defense rose!");
            
            user.defenseSMp += 1;
            user.battleStats[2] = int(float((user.defenseSMp)*user.stats[2])/2);
          }
        }
      } else if (status2.equals("Defense++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSMp < 6) {
            println(user.name + "'s defense greatly rose!");
            
            user.defenseSMp += 2;
            user.battleStats[2] = int(float((user.defenseSMp)*user.stats[2])/2);
          }
        }
      } else if (status2.equals("Sp.Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.spDefenseSMn < 6) {
            println(target.name + "'s special defense fell!");
            
            target.spDefenseSMn += 1;
            target.battleStats[4] = int((2.0*target.stats[4])/float(target.spDefenseSMn));
          }
        }
      } else if (status2.equals("Sp.Defense+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spDefenseSMp < 6) {
            println(user.name + "'s special defense rose!");

            user.spDefenseSMp += 1;
            user.battleStats[4] = int(float((user.spDefenseSMp+1)*user.stats[4])/2);
          }
        }
      } else if (status2.equals("Sp.Defense++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spDefenseSMp < 6) {
            println(user.name + "'s special defense greatly rose!");
            
            user.spDefenseSMp += 2;
            user.battleStats[4] = int(float((user.spDefenseSMp)*user.stats[4])/2);
          }
        }
      } else if (status2.equals("Speed+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSMp < 6) {
            println(user.name + "'s speed rose!");
            
            user.speedSMp += 1;
            user.battleStats[5] = int(float((user.speedSMp)*user.stats[5])/2);
          }
        }
      } else if (status2.equals("Speed++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSMp < 6) {
            println(user.name + "'s speed greatly rose!");

            user.speedSMp += 2;
            user.battleStats[5] = int(float((user.speedSMp+2)*user.stats[5])/2);
          }
        }
      } else if (status2.equals("Speed-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.speedSMn < 6) {
            println(target.name + "'s speed fell!");
            
            target.speedSMn += 1;
            target.battleStats[5] = int((2*target.stats[5])/float(target.speedSMn));
          }
        }
      } else if (status2.equals("Speed--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.speedSMn < 6) {
            println(target.name + "'s speed greatly fell!");
            
            target.speedSMn += 2;
            target.battleStats[5] = int((2*target.stats[5])/float(target.speedSMn));
          }
        }
      } else if (status2.equals("U.Speed-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSMn < 6) {
            println(user.name + "'s speed fell!");
            
            user.speedSMn += 1;
            user.battleStats[5] = int((2*user.stats[5])/float(user.speedSMn));
          }
        }
      } else if (status2.equals("U.Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSMn < 6) {
            println(user.name + "'s defense fell!");
            
            user.defenseSMn += 1;
            user.battleStats[2] = int((2*user.stats[2])/float(user.defenseSMn));
          }
        }
      } else if (status2.equals("U.Defense--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSMn < 6) {
            println(user.name + "'s defense greatly fell!");
            
            user.defenseSMn += 2;
            user.battleStats[2] = int((2*user.stats[2])/float(user.defenseSMn));
          }
        }
      } else if (status2.equals("U.Sp.Attack--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spAttackSMn < 6) {
            println(user.name + "'s special attack greatly fell!");
            
            user.spAttackSMn += 2;
            user.battleStats[3] = int((2*user.stats[3])/float(user.spAttackSMn));
          }
        }
      } else if (status2.equals("U.Sp.Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spDefenseSMn < 6) {
            println(user.name + "'s special defense fell!");
            
            user.spDefenseSMn += 1;
            user.battleStats[4] = int((2.0*user.stats[4])/float(user.spDefenseSMn));
          }
        }
      } else if (status2.equals("Accuracy-") && !target.ability.equals("Keen Eye")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.accuracySMn < 6) {
            println(target.name + "'s accuracy fell!");
            
            target.accuracySMn += 1;
            target.accuracy *= 3/float(target.accuracySMn);
          }
        }
      } else if (status2.equals("Accuracy+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.accuracySMp < 6) {
            println(user.name + "'s accuracy rose!");
            
            user.accuracySMp += 1;
            user.accuracy *= float(user.accuracySMp)/3;
          }
        }
      } else if (status2.equals("Evasion+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.evasionSMp < 6) {
            println(user.name + "'s evasion rose!");
            
            user.evasionSMp += 1;
            user.evasion *= 3/float(user.evasionSMp);
          }
        }
      } else if (status2.equals("Evasion++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.evasionSMp < 6) {
            println(user.name + "'s evasion greatly rose!");
            
            user.evasionSMp += 2;
            user.evasion *= 3/float(user.evasionSMp);
          }
        }
      } else if (status2.equals("Evasion+++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.evasionSMp < 6) {
            println(user.name + "'s evasion rose by three stages!");
            
            user.evasionSMp += 3;
            user.evasion *= 3/float(user.evasionSMp);
          }
        }
      } else if (status2.equals("Evasion-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.evasionSMn < 6) {
            println(target.name + "'s evasion fell!");
            
            target.evasionSMn += 1;
            target.evasion *= float(target.evasionSMn)/3;
          }
        }
      } else if (status2.equals("Drain")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.drain = true;
        }
      } else if (status2.equals("Heal")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.heal = true;
        }
      } else if (status2.equals("Recover")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.currHealth += int(user.health/2);
          if (user.currHealth > user.health)
            user.currHealth = user.health;
            
          println(user.name, "healed by 50% and is now at", user.currHealth, "health! (" + int((float(user.currHealth)/user.health)*100) + "%)");
        }
      } else if (status2.equals("Rest") && !target.sleep) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.currHealth = user.health;
          
          user.burn = user.freeze = user.paralysis = user.poison = user.sleep = user.flinch = user.badlyPoisoned = user.recover
          = user.bound = user.cantEscape = user.confusion = user.curse = user.heal = user.drain = user.recoil = user.leech = false;
          
          user.sleep = true;
          user.sleepCounter = 2;
          
          println(user.name, "healed to max and was cured from all status conditions.");
          println(user.name, "rested and fell asleep.");
        }
      } else if (status2.equals("DestroyItem")) {
        chance = random(0, 1);

        if (chance <= this.statusProb && (!target.item.equals("none"))) {
          println();
          println(user.name, "destroyed", target.name + "'s", target.item);
          
          target.item = "none";
        }
      } else if (status2.equals("Repeat")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.repeat = true;
        }
      } else if (status2.equals("Protect")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.protect = true;
        }
      } else if (status2.equals("Cure")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          for (int i = 0; i < user.trainer.team.size(); i++) {
            Pokemon p = user.trainer.team.get(i);
            p.burn = p.freeze = p.paralysis = p.poison = p.sleep = p.flinch = p.badlyPoisoned = p.confusion = false;
          }
          
          println("The entire party has been cured of major status effects.");
        }
      } else if (status2.equals("StrengthSap")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.currHealth += target.battleStats[1];
          if (user.currHealth >= user.health)
            user.currHealth = user.health;
          
          println(user.name, "healed to", user.currHealth, "health! (" +int((float(user.currHealth)/user.health)*100) + "%)");
          
          if (target.attackSMn < 6) {
            println(target.name + "'s attack fell!");
            target.attackSMn += 1;
            target.battleStats[1] = int(float(2*target.stats[1])/(target.attackSMn));
          }
        }
      } else if (status2.equals("Thief")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.item.equals("none") || user.item.equals("None")) {
            user.item = (target.item);
            println(user.name, "stole", target.name + "'s", target.item + "!");
            target.item = ("none");
          }
        }
      } else if (status2.equals("Charge") && !user.charge) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.charge = true;
          user.chargeTurn = 1;
        }
      } else if (status2.equals("Wildfire") && !target.wildfire) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.wildfire = true;
          target.wildfireCounter = 4;
          println(user.name, "creates a Wildfire that swirls around", target.name + "!");
        }
      } else if (status2.equals("StealthRock") && !target.trainer.sR) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.trainer.sR = true;
          println(user.name, "threw floating pointy rocks on the other side of the field!");
        }
      } else if (status2.equals("Reflect") && !user.trainer.reflect) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.trainer.reflect = true;
          user.trainer.reflectC = 5;
          
          println(user.name, "set up Reflect!");
        }
      } else if (status2.equals("LightScreen") && !user.trainer.lightScreen) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.trainer.lightScreen = true;
          user.trainer.lightScreenC = 5;
          
          println(user.name, "set up a Light Screen!");
        }
      } else if (status2.equals("AuroraVeil") && !user.trainer.auroraVeil) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          user.trainer.auroraVeil = true;
          user.trainer.auroraVeilC = 5;
          
          println(user.name, "set up an Aurora Veil!!");
        }
      }
    }
  }
  
  float typeEffectiveness(Pokemon target) {
    int first2 = 0;
    int second2 = 0;
    String firstType = target.type;

    if (!target.type2.equals("")) {
      if (target.type2.equals("Normal")) {
        second2 = 0;
      } else if (target.type2.equals("Fighting")) {
        second2 = 1;
      } else if (target.type2.equals("Flying")) {
        second2 = 2;
      } else if (target.type2.equals("Poison")) {
        second2 = 3;
      } else if (target.type2.equals("Ground")) {
        second2 = 4;
      } else if (target.type2.equals("Rock")) {
        second2 = 5;
      } else if (target.type2.equals("Bug")) {
        second2 = 6;
      } else if (target.type2.equals("Ghost")) {
        second2 = 7;
      } else if (target.type2.equals("Steel")) {
        second2 = 8;
      } else if (target.type2.equals("Fire")) {
        second2 = 9;
      } else if (target.type2.equals("Water")) {
        second2 = 10;
      } else if (target.type2.equals("Grass")) {
        second2 = 11;
      } else if (target.type2.equals("Electric")) {
        second2 = 12;
      } else if (target.type2.equals("Psychic")) {
        second2 = 13;
      } else if (target.type2.equals("Ice")) {
        second2 = 14;
      } else if (target.type2.equals("Dragon")) {
        second2 = 15;
      } else if (target.type2.equals("Dark")) {
        second2 = 16;
      } else if (target.type2.equals("Fairy")) {
        second2 = 17;
      }

      if (this.type.equals("Normal")) {
        first2 = 0;
      } else if (this.equals("Fighting")) {
        first2 = 1;
      } else if (this.type.equals("Flying")) {
        first2 = 2;
      } else if (this.type.equals("Poison")) {
        first2 = 3;
      } else if (this.type.equals("Ground")) {
        first2 = 4;
      } else if (this.type.equals("Rock")) {
        first2 = 5;
      } else if (this.type.equals("Bug")) {
        first2 = 6;
      } else if (this.type.equals("Ghost")) {
        first2 = 7;
      } else if (this.type.equals("Steel")) {
        first2 = 8;
      } else if (this.type.equals("Fire")) {
        first2 = 9;
      } else if (this.type.equals("Water")) {
        first2 = 10;
      } else if (this.type.equals("Grass")) {
        first2 = 11;
      } else if (this.type.equals("Electric")) {
        first2 = 12;
      } else if (this.type.equals("Psychic")) {
        first2 = 13;
      } else if (this.type.equals("Ice")) {
        first2 = 14;
      } else if (this.type.equals("Dragon")) {
        first2 = 15;
      } else if (this.type.equals("Dark")) {
        first2 = 16;
      } else if (this.type.equals("Fairy")) {
        first2 = 17;
      }
    }

    int first = 0;
    int second = 0;

    if (this.type.equals("Normal")) {
      first = 0;
    } else if (this.type.equals("Fighting")) {
      first = 1;
    } else if (this.type.equals("Flying")) {
      first = 2;
    } else if (this.type.equals("Poison")) {
      first = 3;
    } else if (this.type.equals("Ground")) {
      first = 4;
    } else if (this.type.equals("Rock")) {
      first = 5;
    } else if (this.type.equals("Bug")) {
      first = 6;
    } else if (this.type.equals("Ghost")) {
      first = 7;
    } else if (this.type.equals("Steel")) {
      first = 8;
    } else if (this.type.equals("Fire")) {
      first = 9;
    } else if (this.type.equals("Water")) {
      first = 10;
    } else if (this.type.equals("Grass")) {
      first = 11;
    } else if (this.type.equals("Electric")) {
      first = 12;
    } else if (this.type.equals("Psychic")) {
      first = 13;
    } else if (this.type.equals("Ice")) {
      first = 14;
    } else if (this.type.equals("Dragon")) {
      first = 15;
    } else if (this.type.equals("Dark")) {
      first = 16;
    } else if (this.type.equals("Fairy")) {
      first = 17;
    }

    if (firstType.equals("Normal")) {
      second = 0;
    } else if (firstType.equals("Fighting")) {
      second = 1;
    } else if (firstType.equals("Flying")) {
      second = 2;
    } else if (firstType.equals("Poison")) {
      second = 3;
    } else if (firstType.equals("Ground")) {
      second = 4;
    } else if (firstType.equals("Rock")) {
      second = 5;
    } else if (firstType.equals("Bug")) {
      second = 6;
    } else if (firstType.equals("Ghost")) {
      second = 7;
    } else if (firstType.equals("Steel")) {
      second = 8;
    } else if (firstType.equals("Fire")) {
      second = 9;
    } else if (firstType.equals("Water")) {
      second = 10;
    } else if (firstType.equals("Grass")) {
      second = 11;
    } else if (firstType.equals("Electric")) {
      second = 12;
    } else if (firstType.equals("Psychic")) {
      second = 13;
    } else if (firstType.equals("Ice")) {
      second = 14;
    } else if (firstType.equals("Dragon")) {
      second = 15;
    } else if (firstType.equals("Dark")) {
      second = 16;
    } else if (firstType.equals("Fairy")) {
      second = 17;
    }
    
    if (!target.type2.equals("") || !target.type2.equals("none")) {
      return typeChart[second][first] * typeChart[second2][first2];
    } else
      return typeChart[second][first];
  }
}
