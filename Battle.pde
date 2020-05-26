class Battle {
  Trainer one;
  Trainer two;
  int turn;
  Pokemon[] turnOrder;
  String weather;
  int weatherCounter;
  Boolean sR;
  Move stealthRock;

  Battle (Trainer o, Trainer t) {
    this.one = o;
    this.two = t;

    this.turn = 1;
    this.turnOrder = new Pokemon[2];

    this.weather = "Normal";
    this.weatherCounter = 0;
    
    this.sR = false;
    this.stealthRock = new Move("Stealth Rock", 20, 0, 0, "Rock", "Status", 0, "StealthRock", 1);
  }

  void reset() {
    this.turn = 1;
  }

  void move(Pokemon oneP, Move mv1, Pokemon twoP, Move mv2) {

    if (turn == 1) {
      println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
      println("A BATTLE BETWEEN", this.one.name.toUpperCase(), "AND", this.two.name.toUpperCase(), "HAS BEGUN! Lv.", str(oneP.level), oneP.name, "| Lv.", str(twoP.level), twoP.name);   
      println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
    }

    println("Turn #" + str(this.turn));
    println();
    
    enterBattleEffects(oneP, twoP);
    enterBattleEffects(twoP, oneP);
    
    oneP.battle = this;
    twoP.battle = this;

    if (oneP.currHealth == 0 || twoP.currHealth == 0) {
      println("One of the pokemon has already fainted, the battle cannot begin.");
      println();
      println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
      println();
      return;
    }

    if (mv1.currPowerPoints < 1) {
      println(mv1.name, "has run out of PP.");
      println();
      return;
    }

    if (mv2.currPowerPoints < 1) {
      println(mv1.name, "has run out of PP.");
      println();
      return;
    }

    //Setting up who goes first

    setTurns(oneP, mv1, twoP, mv2);

    //Actually using the moves

    useMoves(oneP, mv1, twoP, mv2);

    checkBerry(oneP, twoP);
    checkBerry(twoP, oneP);

    updateWeather(oneP, twoP);
    
    checkWeather(oneP, mv1, twoP);
    checkWeather(twoP, mv2, oneP);

    if (oneP.raidPokemon) {
      recover(oneP);
    }
    if (twoP.raidPokemon) {
      recover(twoP);
    }
    
    oneP.turnsOut += 1;
    twoP.turnsOut += 1;
    
    turn += 1;
    println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
    println();

    if (oneP.currHealth == 0) {
      two.battlesWon += 1;
      for (int i = 0; i < 6; i++) {
        oneP.battleStats[i] = oneP.stats[i];
        twoP.battleStats[i] = twoP.stats[i];
      }
    } else if (twoP.currHealth == 0) {
      one.battlesWon += 1;
      for (int i = 0; i < 6; i++) {
        oneP.battleStats[i] = oneP.stats[i];
        twoP.battleStats[i] = twoP.stats[i];
      }
    }
  }

  void start1v1(Pokemon oneP, Move mv1, Pokemon twoP, Move mv2) {
    int turn = 1;

    println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
    println("A BATTLE BETWEEN", this.one.name.toUpperCase(), "AND", this.two.name.toUpperCase(), "HAS BEGUN! Lv.", str(oneP.level), oneP.name, "| Lv.", str(twoP.level), twoP.name);   
    println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");

    oneP.battle = this;
    twoP.battle = this;
    
    while (oneP.currHealth > 0 && twoP.currHealth > 0) {
      println();
      println("Turn #" + str(turn));
      println();
  
      enterBattleEffects(oneP, twoP);
      enterBattleEffects(twoP, oneP);
      
      if (mv1.currPowerPoints < 1) {
        println(mv1.name, "has run out of PP.");
        println();
      }
  
      if (mv2.currPowerPoints < 1) {
        println(mv1.name, "has run out of PP.");
        println();
      }
      
      //Setting up who goes first

      setTurns(oneP, mv1, twoP, mv2);

      //Actually using the moves   

      useMoves(oneP, mv1, twoP, mv2);

      checkBerry(oneP, twoP);
      checkBerry(twoP, oneP);
      
      updateWeather(oneP, twoP);
      
      checkWeather(oneP, mv1, twoP);
      checkWeather(twoP, mv2, oneP);
      
      if (oneP.raidPokemon) {
        recover(oneP);
      }
      if (twoP.raidPokemon) {
        recover(twoP);
      }

      oneP.turnsOut += 1;
      twoP.turnsOut += 1;
      
      turn += 1;
      println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
    }

    println();

    if (oneP.currHealth > 0)
      one.battlesWon += 1;
    else
      two.battlesWon += 1;

    for (int i = 0; i < 6; i++) {
      oneP.battleStats[i] = oneP.stats[i];
      twoP.battleStats[i] = twoP.stats[i];
    }
  }

  void enterBattleEffects(Pokemon oneP, Pokemon twoP) {      
    if (oneP.turnsOut == 0) {

      if (oneP.trainer.sR) {
        float effective = stealthRock.typeEffectiveness(oneP);
        float damage = 0;
        if (effective == 0.25) {
          damage = oneP.stats[0] * 0.03125;
        } else if (effective == 0.5) {
          damage = oneP.stats[0] * 0.0625;
        } else if (effective == 1) {
          damage = oneP.stats[0] * 0.125;
        } else if (effective == 2) {
          damage = oneP.stats[0] * 0.25;
        } else if (effective == 3) {
          damage = oneP.stats[0] * 0.5;
        }
        
        damage = int(damage);
        
        oneP.currHealth -= damage;
        
        println("Pointed rocks poked", oneP.name + "! They lost", damage, "health. (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
        println();
      }

      if (oneP.ability.equals("Intimidate")) {
        println(twoP.name, "was intimidated. Their attack fell!");
        println();
  
        twoP.attackSMn += 1;
        twoP.battleStats[1] = int(float(2*twoP.stats[1])/twoP.attackSMn);
      }
  
      if (oneP.ability.equals("Sand Stream") && !weather.equals("Sandstorm")) {
        println(oneP.name + "'s Sand Stream whipped up a sandstorm!");
        println();
  
        this.weather = "Sandstorm";
        this.weatherCounter = 5;
      }
      
      if (oneP.ability.equals("Snow Warning") && !weather.equals("Hail")) {
        println(oneP.name + "'s Snow Warning whipped up a hailstorm!");
        println();
  
        this.weather = "Hail";
        this.weatherCounter = 1000; //or some arbitrary big number
      }
      
      if (oneP.ability.equals("Drought") && !this.weather.equals("Harsh Sunlight")) {
        this.weather = "Harsh Sunlight";
        
        println(oneP.name, "made the sunlight turn harsh!");
        println();
        this.weatherCounter = 5;
      } 
    }
    
    if (oneP.trainer.reflect) {      
      oneP.trainer.reflectC -= 1;
      if (oneP.trainer.reflectC == 0) {
        println(oneP.name + "'s reflect wore off!");
        println();
        oneP.trainer.reflect = false;
      }
    }
    if (oneP.trainer.lightScreen) {
      oneP.trainer.lightScreenC -= 1;
      if (oneP.trainer.lightScreenC == 0) {
        println(oneP.name + "'s Light Screen wore off!");
        println();
        oneP.trainer.lightScreen = false;
      }
    }
    if (oneP.trainer.auroraVeil) {
      oneP.trainer.auroraVeilC -= 1;
      if (oneP.trainer.auroraVeilC == 0) {
        println(oneP.name + "'s Aurora Veil wore off!");
        println();
        oneP.trainer.auroraVeil = false;
      }
    }
    
    if (oneP.currHealth < 1) {
      println();
      println(oneP.name, "has fainted!", twoP.name, "wins the battle!");
      oneP.currHealth = 0;
    }
  }

  void checkWeather(Pokemon oneP, Move mv1, Pokemon twoP) {
    String firstType1 = oneP.type;
    String firstType2 = twoP.type;

    if (oneP.turnsOut == 1 && this.weather.equals("Sandstorm") && (firstType1.equals("Rock") || oneP.type2.equals("Rock")
      || firstType1.equals("Steel") || oneP.type2.equals("Steel") || firstType1.equals("Ground") || oneP.type2.equals("Ground"))) {
      oneP.battleStats[4] *= 1.5;
      println(oneP.name + "'s special defense rose!");
      println();
    }

    if (this.weather.equals("Sandstorm") && !oneP.raidPokemon && !(firstType1.equals("Rock") || oneP.type2.equals("Rock")
      || firstType1.equals("Steel") || oneP.type2.equals("Steel") || firstType1.equals("Ground") || oneP.type2.equals("Ground"))) {
      oneP.currHealth -= (oneP.stats[0]/16);
      println(oneP.name, "was buffeted by the sandstorm! (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
      println();
    }
    
    if (this.weather.equals("Hail") && !oneP.raidPokemon && !(firstType1.equals("Ice") || oneP.type2.equals("Ice"))) {
      oneP.currHealth -= (oneP.stats[0]/16);
      println(oneP.name, "was buffeted by the hail! (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
      println();
    }
    
    if (mv1.status.equals("Rain") && !this.weather.equals("Rain")) {
      this.weather = "Rain";
      
      println(oneP.name, "made it rain!");
      println();
      this.weatherCounter = 5;
    } 
    
    if (mv1.status.equals("Harsh Sunlight") && !this.weather.equals("Harsh Sunlight")) {
      this.weather = "Harsh Sunlight";
      
      println(oneP.name, "made the sunlight turn harsh!");
      println();
      this.weatherCounter = 5;
    } 
    
    if (mv1.status.equals("Hail") && !weather.equals("Hail")) {
      println(oneP.name, "whipped up a hailstorm!");
      println();

      this.weather = "Hail";
      this.weatherCounter = 1000; //or some arbitrary big number
    }
    
    if (oneP.turnsOut == 0 && this.weather.equals("Harsh Sunlight")) {
      if (oneP.ability.equals("Chlorophyll")) {
        oneP.battleStats[5] *= 2;
      }
    }
    
    if (oneP.turnsOut == 0 && this.weather.equals("Rain")) {
      if (oneP.ability.equals("Swift Swim")) {
        oneP.battleStats[5] *= 2;
      }
    }
  }
  
  void updateWeather(Pokemon oneP, Pokemon twoP) {
    if (this.weather.equals("Sandstorm")) {  
      this.weatherCounter -= 1;
      println("The sandstorm rages!");
      println();
    }
    
    if (this.weatherCounter == 0 && this.weather.equals("Sandstorm")) {
      this.weather = "none";
      println("The sandstorm subsided!");
      println();
    }
    
    if (this.weather.equals("Hail")) {  
      this.weatherCounter -= 1;
      println("The hail continues!");
      println();
    }
    
    if (this.weatherCounter == 0 && this.weather.equals("Hail")) {
      this.weather = "none";
      println("The hailstorm subsided!");
      println();
    }
    
    if (this.weather.equals("Rain")) {
      this.weatherCounter -= 1;
      
      println("Rain continues to fall.");
      println();
    } else if (this.weatherCounter == 0 && this.weather.equals("Rain")) {
      this.weather = "none";
      
      println("The rain stopped!");
      println();
    }
    
    if (this.weather.equals("Harsh Sunlight")) {
      this.weatherCounter -= 1;
      
      println("The sunlight is strong.");
      println();
      
    } else if (this.weatherCounter == 0 && this.weather.equals("Harsh Sunlight")) {
      this.weather = "none";
      
      println("The sunlight faded!");
      println();
      
      oneP.battleStats[5] = oneP.stats[5];
      twoP.battleStats[5] = twoP.stats[5];
    }
  }

  void setTurns(Pokemon oneP, Move mv1, Pokemon twoP, Move mv2) {
    //Setting up who goes first

    if (mv1.priority < mv2.priority) {
      if (twoP.currHealth > 0) {
        this.turnOrder[0] = twoP;
      }  
      if (oneP.currHealth > 0) {
        this.turnOrder[1] = oneP;
      }
    } else if (mv1.priority > mv2.priority) {
      if (oneP.currHealth > 0) {
        this.turnOrder[0] = oneP;
      }
      if (twoP.currHealth > 0) {
        this.turnOrder[1] = twoP;
      }
    } else {
      if (oneP.battleStats[5] < twoP.battleStats[5]) {
        if (twoP.currHealth > 0) {
          this.turnOrder[0] = twoP;
        }  
        if (oneP.currHealth > 0) {
          this.turnOrder[1] = oneP;
        }
      } else {
        if (oneP.currHealth > 0) {
          this.turnOrder[0] = oneP;
        }
        if (twoP.currHealth > 0) {
          this.turnOrder[1] = twoP;
        }
      }
    }
  }

  void useMoves(Pokemon oneP, Move mv1, Pokemon twoP, Move mv2) {
    if (this.turnOrder[0] == oneP) {
      if (oneP.currHealth > 0) {
        oneP.useMove(mv1, twoP);
        println();
      }

      if (twoP.currHealth > 0) {
        twoP.useMove(mv2, oneP);
        println();
      }
    } else {
      if (twoP.currHealth > 0) {
        twoP.useMove(mv2, oneP);
        println();
      }

      if (oneP.currHealth > 0) {
        oneP.useMove(mv1, twoP);
        println();
      }
    }
  }

  void checkBerry(Pokemon oneP, Pokemon twoP) {
    if (oneP.item.equals("Sitrus Berry") && oneP.currHealth <= (oneP.health/2) && oneP.currHealth > 0) {
      if (oneP.ability.equals("Ripen"))
        oneP.currHealth += int(float(oneP.stats[0])/4);

      oneP.currHealth += int(float(oneP.stats[0])/4);
      
      if (oneP.currHealth > oneP.health)
        oneP.currHealth = oneP.health;

      println(oneP.name, "ate a Sitrus berry and regained health! Now", oneP.name, "has", str(oneP.currHealth) + " health. (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
      println();
      oneP.item = "none";
    }

    if (oneP.item.equals("Oran Berry") && oneP.currHealth <= (oneP.health/2) && oneP.currHealth > 0) {
      if (oneP.ability.equals("Ripen")) {
        oneP.currHealth += 10;
      }
      
      oneP.currHealth += 10;
      
      if (oneP.currHealth > oneP.health)
        oneP.currHealth = oneP.health;

      println(oneP.name, "ate an Oran berry and regained health! Now", oneP.name, "has", str(oneP.currHealth) + " health. (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
      println();
      oneP.item = "none";
    }

    if (oneP.item.equals("Chesto Berry") && oneP.sleep && oneP.currHealth > 0) {
      oneP.sleep = false;
      oneP.sleepCounter = 0;

      println(oneP.name, "ate a Chesto berry and woke up!");
      println();
      oneP.item = "none";
    }

    if (oneP.item.equals("Cheri Berry") && oneP.paralysis && oneP.currHealth > 0) {
      oneP.paralysis = false;

      println(oneP.name, "ate a Cheri berry and is no longer paralyzed!");
      println();
      oneP.item = "none";
    }

    if (oneP.item.equals("Pecha Berry") && (oneP.poison || oneP.badlyPoisoned) && oneP.currHealth > 0) {
      oneP.poison = false;
      oneP.badlyPoisoned = false;
      oneP.poisonCounter = 0;

      println(oneP.name, "ate a Pecha berry and is no longer poisoned!");
      println();
      oneP.item = "none";
    }

    if (oneP.item.equals("Persim Berry") && oneP.confusion && oneP.currHealth > 0) {
      oneP.confusion = false;
      oneP.confusionCounter = 0;

      println(oneP.name, "ate a Persim berry and is no longer confused!");
      println();
      oneP.item = "none";
    }

    if (oneP.item.equals("Berry Juice") && oneP.currHealth <= (oneP.health/2) && oneP.currHealth > 0) {
      if (oneP.ability.equals("Ripen")) {
        oneP.currHealth += 20;
      }
      
      oneP.currHealth += 20;
      
      if (oneP.currHealth > oneP.health)
        oneP.currHealth = oneP.health;

      println(oneP.name, "drank some berry juice and regained health! Now", oneP.name, "has", str(oneP.currHealth) + " health. (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
      println();
      oneP.item = "none";
    }
    
    if (oneP.item.equals("Leftovers") && oneP.currHealth > 0) {
      oneP.currHealth += (oneP.health/16);
      if (oneP.currHealth > oneP.health)
        oneP.currHealth = oneP.health;
      
      println(oneP.name, "ate some leftovers and gained", (oneP.health/16), "health!");
      println();
    }
  }
  
  void recover(Pokemon p) {
    for (int i = 0; i < p.moveSet.length; i++) {
      p.moveSet[i].currPowerPoints = p.moveSet[i].powerPoints;
    }
    
    for (int i = 0; i < 6; i++) {
      p.battleStats[i] = p.stats[i];
    }
    p.burn = p.freeze = p.paralysis = p.poison = p.sleep = p.flinch = p.badlyPoisoned = p.recover = p.protect
      = p.bound = p.cantEscape = p.confusion = p.curse = p.heal = p.drain = p.recoil = p.leech = p.repeat = false;
   
   println(p.name, "recovered from all status conditions and stat changes!");
   println();
  }
}
