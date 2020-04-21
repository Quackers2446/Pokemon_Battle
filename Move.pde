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
      1, 2, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1
    }
    , 
    /* fght */       {
      1, 1, 2, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1
    }
    , 
    /* fly  */       {
      1, 0.5, 1, 1, 0, 2, 0.5, 1, 1, 1, 1, 0.5, 2, 1, 2, 1, 1
    }
    , 
    /* pois */       {
      1, 0.5, 1, 0.5, 2, 1, 0.5, 1, 1, 1, 1, 0.5, 1, 2, 1, 1, 1
    }
    , 
    /* grnd */       {
      1, 1, 1, 0.5, 1, 0.5, 1, 1, 1, 1, 2, 2, 0, 1, 2, 1, 1
    }
    , 
    /* rock */       {
      0.5, 2, 0.5, 0.5, 2, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1
    }
    , 
    /* bug  */       {
      1, 0.5, 2, 1, 0.5, 2, 1, 1, 1, 2, 1, 0.5, 1, 1, 1, 1, 1
    }
    , 
    /* ghst */       {
      0, 0, 1, 0.5, 1, 1, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2
    }
    , 
    /* stel */       {
      0.5, 2, 0.5, 0, 2, 0.5, 0.5, 0.5, 0.5, 2, 1, 0.5, 1, 0.5, 0.5, 0.5, 0.5
    }
    , 
    /* fire */       {
      1, 1, 1, 1, 2, 2, 0.5, 1, 0.5, 0.5, 2, 0.5, 1, 1, 0.5, 1, 1
    }
    , 
    /* wter */       {
      1, 1, 1, 1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 2, 2, 1, 0.5, 1, 1
    }
    , 
    /* grss */       {
      1, 1, 2, 2, 0.5, 1, 2, 1, 1, 2, 0.5, 0.5, 0.5, 1, 2, 1, 1
    }
    , 
    /* elec */       {
      1, 1, 0.5, 1, 2, 1, 1, 1, 0.5, 1, 1, 1, 0.5, 1, 1, 1, 1
    }
    , 
    /* psyc */       {
      1, 0.5, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 0.5, 1, 1, 2
    }
    , 
    /* ice  */       {
      1, 2, 1, 1, 1, 2, 1, 1, 2, 2, 1, 1, 1, 1, 0.5, 1, 1
    }
    , 
    /* drag */       {
      1, 1, 1, 1, 1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 1, 2, 2, 1
    }
    , 
    /* dark */       {
      1, 2, 1, 1, 1, 2, 0.5, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0.5
    }
    , 
    /* fair */       {
      1, 2, 1, 0.5, 1, 1, 1, 1, 0.5, 0.5, 1, 1, 1, 1, 1, 2, 2, 1
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
          println();
          println(target.name, "was burned!");
          
          target.burn = true;
        }
      } else if (firstStatus.equals("Freeze")) {
        chance = random(0, 1);

        if (chance <= this.statusProb && !target.freeze) {
          println();
          println(target.name, "was frozen!");
          
          target.freeze = true;
        }
      } else if ((firstStatus.equals("Paralysis") && (randomP <= 0.25)) && !(target.type.equals("Electric") || target.type2.equals("Electric"))) {
        chance = random(0, 1);

        if (chance <= this.statusProb && !target.paralysis) {
          target.battleStats[5] = int(target.battleStats[5]*0.75);
          target.paralysis = true;
          
          println();
          println(target.name, "was paralyzed!");
        }
      } else if (firstStatus.equals("Poison") && !target.poison) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "was poisoned!");
          
          target.poison = true;
        }
      } else if (firstStatus.equals("Badly Poisoned") && !target.badlyPoisoned) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "was badly poisoned!");
          
          target.poisonCounter = 1;
          target.badlyPoisoned = true;
        }
      } else if (firstStatus.equals("Sleep") && !target.sleep) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "fell asleep!");
          
          target.sleepCounter = int(random(0,2));
          target.sleep = true;
        }
      } else if (firstStatus.equals("Leech") && !target.leech) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "was seeded!");
          
          target.leech = true;
        }
      } else if (firstStatus.equals("Flinch") && !target.flinch) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "flinched!");
          
          target.flinch = true;
        }
      } else if (firstStatus.equals("Confusion") && !target.confusion) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "was confused!");
        
          target.confusionCounter = int(random(1, 4));
          target.confusion = true;
        }
      } else if (firstStatus.equals("Recoil")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.recoil = true;
        }
      } else if (firstStatus.equals("Attack-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.attackSM < 6) {
            println();
            println(target.name + "'s attack fell!");
            
            target.attackSM += 1;
            target.battleStats[1] = (2/target.attackSM)*target.stats[1];
          }
        }
      } else if (firstStatus.equals("Attack+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.attackSM < 6) {
            println();
            println(user.name + "'s attack rose!");

            user.attackSM += 1;
            user.battleStats[1] = (user.attackSM/2)*user.stats[1];
          }
        }
      } else if (firstStatus.equals("Attack++")) {
        chance = random(0, 1);
        
        if (chance <= this.statusProb) {
          if (user.attackSM < 6) {
            println();
            println(user.name + "'s attack greatly rose!");
            user.attackSM += 2;
            user.battleStats[1] = (user.attackSM/2)*user.stats[1];
          }
        }
      } else if (firstStatus.equals("Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.defenseSM < 6) {
            println();
            println(target.name + "'s defense fell!");
            
            target.defenseSM += 1;
            target.battleStats[2] = (2/target.defenseSM)*target.stats[2];
          }
        }
      } else if (firstStatus.equals("Defense+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSM < 6) {
            println();
            println(user.name + "'s defense rose!");

            user.defenseSM += 1;
            user.battleStats[2] = (user.defenseSM/2)*user.stats[2];
          }
        }
      } else if (firstStatus.equals("Sp.Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.spDefenseSM < 6) {
            println();
            println(target.name + "'s special defense fell!");
            
            target.spDefenseSM += 1;
            target.battleStats[4] = int((2.0/float(target.spDefenseSM))*target.stats[4]);
          }
        }
      } else if (firstStatus.equals("Sp.Defense+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spDefenseSM < 6) {
            println();
            println(user.name + "'s special defense rose!");

            user.spDefenseSM += 1;
            user.battleStats[4] = (user.spDefenseSM/2)*user.stats[4];
          }
        }
      } else if (firstStatus.equals("Sp.Defense++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spDefenseSM < 6) {
            println();
            println(user.name + "'s special defense greatly rose!");

            user.spDefenseSM += 2;
            user.battleStats[4] = (user.spDefenseSM/2)*user.stats[4];
          }
        }
      } else if (firstStatus.equals("Speed+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSM < 6) {
            println();
            println(user.name + "'s speed rose!");

            user.speedSM += 1;
            user.battleStats[5] = (user.speedSM/2)*user.stats[5];
          }
        }
      } else if (firstStatus.equals("Speed++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSM < 6) {
            println();
            println(user.name + "'s speed greatly rose!");

            user.speedSM += 2;
            user.battleStats[5] = (user.speedSM/2)*user.stats[5];
          }
        }
      } else if (firstStatus.equals("Speed-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSM < 6) {
            println();
            println(user.name + "'s speed fell!");

            user.speedSM += 1;
            user.battleStats[5] = (2/user.speedSM)*user.stats[5];
          }
        }
      } else if (firstStatus.equals("Speed--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSM < 6) {
            println();
            println(user.name + "'s speed greatly fell!");

            user.speedSM += 2;
            user.battleStats[5] = (2/user.speedSM)*user.stats[5];
          }
        }
      } else if (firstStatus.equals("Accuracy-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.accuracySM < 6) {
            println();
            println(target.name + "'s accuracy fell!");
            target.accuracySM += 1;
            target.adjustedStages = float(target.evasionSM)/float(target.accuracySM);
          }
        }
      } else if (firstStatus.equals("Accuracy+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.accuracySM < 6) {
            println();
            println(user.name + "'s accuracy rose!");
            user.accuracySM += 1;
            user.adjustedStages = float(user.accuracySM)/float(user.evasionSM);
          }
        }
      } else if (firstStatus.equals("Evasion+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.evasionSM < 6) {
            println();
            println(user.name + "'s evasion rose!");
            user.evasionSM += 1;
            user.adjustedStages = float(user.evasionSM)/float(user.accuracySM);
          }
        }
      } else if (firstStatus.equals("Drain")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.drain = true;
        }
      } else if (firstStatus.equals("Heal")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.heal = true;
        }
      }
    }
    
    if (status2.equals("")) {
    } else {
      if (status2.equals("Burn")) {
        chance = random(0, 1);

        if (chance <= this.statusProb && !target.burn) {
          println();
          println(target.name, "was burned!");
          
          target.burn = true;
        }
      } else if (status2.equals("Freeze")) {
        chance = random(0, 1);

        if (chance <= this.statusProb && !target.freeze) {
          println();
          println(target.name, "was frozen!");
          
          target.freeze = true;
        }
      } else if ((status2.equals("Paralysis") && (randomP <= 0.25)) && !(target.type.equals("Electric") || target.type2.equals("Electric"))) {
        chance = random(0, 1);

        if (chance <= this.statusProb && !target.paralysis) {
          target.battleStats[5] = int(target.battleStats[5]*0.75);
          target.paralysis = true;
          
          println();
          println(target.name, "was paralyzed!");
        }
      } else if (status2.equals("Poison") && !target.poison) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "was poisoned!");
          
          target.poison = true;
        }
      } else if (status2.equals("Badly Poisoned") && !target.badlyPoisoned) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "was badly poisoned!");
          
          target.poisonCounter = 1;
          target.badlyPoisoned = true;
        }
      } else if (status2.equals("Sleep") && !target.sleep) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "fell asleep!");
          
          target.sleepCounter = int(random(0,2));
          target.sleep = true;
        }
      } else if (status2.equals("Flinch") && !target.flinch) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "flinched!");
          
          target.flinch = true;
        }
      } else if (status2.equals("Confusion") && !target.confusion) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "was confused!");
        
          target.confusionCounter = int(random(1, 4));
          target.confusion = true;
        }
      } else if (status2.equals("Recoil")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.recoil = true;
        }
      } else if (status2.equals("Leech") && !target.leech) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          println();
          println(target.name, "was seeded!");
          
          target.leech = true;
        }
      } else if (status2.equals("Attack-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.attackSM < 6) {
            println();
            println(target.name + "'s attack fell!");
            
            target.attackSM += 1;
            target.battleStats[1] = (2/target.attackSM)*target.stats[1];
          }
        }
      } else if (status2.equals("Attack+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.attackSM < 6) {
            println();
            println(user.name + "'s attack rose!");

            user.attackSM += 1;
            user.battleStats[1] = (user.attackSM/2)*user.stats[1];
          }
        }
      } else if (status2.equals("Attack++")) {
        chance = random(0, 1);
        
        if (chance <= this.statusProb) {
          if (user.attackSM < 6) {
            println();
            println(user.name + "'s attack greatly rose!");
            user.attackSM += 2;
            user.battleStats[1] = (user.attackSM/2)*user.stats[1];
          }
        }
      } else if (status2.equals("Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.defenseSM < 6) {
            println();
            println(target.name + "'s defense fell!");
            
            target.defenseSM += 1;
            target.battleStats[2] = (2/target.defenseSM)*target.stats[2];
          }
        }
      } else if (status2.equals("Defense+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.defenseSM < 6) {
            println();
            println(user.name + "'s defense rose!");

            user.defenseSM += 1;
            user.battleStats[2] = (user.defenseSM/2)*user.stats[2];
          }
        }
      } else if (status2.equals("Sp.Defense-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.spDefenseSM < 6) {
            println();
            println(target.name + "'s special defense fell!");
            
            target.spDefenseSM += 1;
            target.battleStats[4] = int((2.0/float(target.spDefenseSM))*target.stats[4]);
          }
        }
      } else if (status2.equals("Sp.Defense+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spDefenseSM < 6) {
            println();
            println(user.name + "'s special defense rose!");

            user.spDefenseSM += 1;
            user.battleStats[4] = (user.spDefenseSM/2)*user.stats[4];
          }
        }
      } else if (status2.equals("Sp.Defense++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.spDefenseSM < 6) {
            println();
            println(user.name + "'s special defense greatly rose!");

            user.spDefenseSM += 2;
            user.battleStats[4] = (user.spDefenseSM/2)*user.stats[4];
          }
        }
      } else if (status2.equals("Speed+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSM < 6) {
            println();
            println(user.name + "'s speed rose!");

            user.speedSM += 1;
            user.battleStats[5] = (user.speedSM/2)*user.stats[5];
          }
        }
      } else if (status2.equals("Speed++")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSM < 6) {
            println();
            println(user.name + "'s speed greatly rose!");

            user.speedSM += 2;
            user.battleStats[5] = (user.speedSM/2)*user.stats[5];
          }
        }
      } else if (status2.equals("Speed-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSM < 6) {
            println();
            println(user.name + "'s speed fell!");

            user.speedSM += 1;
            user.battleStats[5] = (2/user.speedSM)*user.stats[5];
          }
        }
      } else if (status2.equals("Speed--")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.speedSM < 6) {
            println();
            println(user.name + "'s speed greatly fell!");

            user.speedSM += 2;
            user.battleStats[5] = (2/user.speedSM)*user.stats[5];
          }
        }
      } else if (status2.equals("Accuracy-")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (target.accuracySM < 6) {
            println();
            println(target.name + "'s accuracy fell!");
            target.accuracySM += 1;
            target.adjustedStages = float(target.evasionSM)/float(target.accuracySM);
          }
        }
      } else if (status2.equals("Accuracy+")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          if (user.accuracySM < 6) {
            println();
            println(user.name + "'s accuracy rose!");
            user.accuracySM += 1;
            user.adjustedStages = float(user.accuracySM)/float(user.evasionSM);
          }
        }
      } else if (status2.equals("Drain")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.drain = true;
        }
      } else if (status2.equals("Heal")) {
        chance = random(0, 1);

        if (chance <= this.statusProb) {
          target.heal = true;
        }
      }
    }
  }

  float typeEffectiveness(Pokemon target) {
    int first2 = 0;
    int second2 = 0;
    String firstType = target.type;

    if (target.type.indexOf("/") != -1) {
      firstType = target.type.substring(0, target.type.indexOf("/"));
      String secondType = target.type.substring(target.type.indexOf("/")+1, target.type.length());

      if (secondType.equals("Normal")) {
        second2 = 0;
      } else if (secondType.equals("Fighting")) {
        second2 = 1;
      } else if (secondType.equals("Flying")) {
        second2 = 2;
      } else if (secondType.equals("Poison")) {
        second2 = 3;
      } else if (secondType.equals("Ground")) {
        second2 = 4;
      } else if (secondType.equals("Rock")) {
        second2 = 5;
      } else if (secondType.equals("Bug")) {
        second2 = 6;
      } else if (secondType.equals("Ghost")) {
        second2 = 7;
      } else if (secondType.equals("Steel")) {
        second2 = 8;
      } else if (secondType.equals("Fire")) {
        second2 = 9;
      } else if (secondType.equals("Water")) {
        second2 = 10;
      } else if (secondType.equals("Grass")) {
        second2 = 11;
      } else if (secondType.equals("Electric")) {
        second2 = 12;
      } else if (secondType.equals("Psychic")) {
        second2 = 13;
      } else if (secondType.equals("Ice")) {
        second2 = 14;
      } else if (secondType.equals("Dragon")) {
        second2 = 15;
      } else if (secondType.equals("Dark")) {
        second2 = 16;
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
      } else if (this.type.equals("Steel")) {
        first2 = 16;
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
    } else if (this.type.equals("Dark")) {
      second = 16;
    }

    if (target.type.indexOf("/") != -1) {
      return typeChart[second][first] * typeChart[second2][first2];
    } else
      return typeChart[second][first];
  }
}
