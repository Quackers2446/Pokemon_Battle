class Battle {
  Trainer one;
  Trainer two;
  int turn;
  Pokemon[] turnOrder;
  String weather;
  int weatherCounter;

  Battle (Trainer o, Trainer t) {
    this.one = o;
    this.two = t;

    this.turn = 1;
    this.turnOrder = new Pokemon[2];

    this.weather = "Normal";
    this.weatherCounter = 0;
  }

  void reset() {
    this.turn = 1;
  }

  void move(Pokemon oneP, int mv1, Pokemon twoP, int mv2) {
    boolean ppLoss1 = true;
    boolean ppLoss2 = true;

    if (turn == 1) {
      println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
      println("A BATTLE BETWEEN", this.one.name.toUpperCase(), "AND", this.two.name.toUpperCase(), "HAS BEGUN! Lv.", str(oneP.level), oneP.name, "| Lv.", str(twoP.level), twoP.name);   
      println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
      enterBattleEffects(oneP, twoP);
      enterBattleEffects(twoP, oneP);
    }

    println("Turn #" + str(this.turn));
    println();

    if (oneP.currHealth == 0 || twoP.currHealth == 0) {
      println("One of the pokemon has already fainted, the battle cannot begin.");
      println();
      println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
      println();
      return;
    }


    if (oneP.moveSet[mv1].currPowerPoints < 1) {
      println(oneP.moveSet[mv1].name, "has run out of PP,", oneP.name, "uses", oneP.moveSet[(mv1+1)%4].name, "instead.");
      mv1 = (mv1 + 1)%4;
      println();
    }

    if (twoP.moveSet[mv2].currPowerPoints < 1) {
      println(twoP.moveSet[mv1].name, "has run out of PP,", twoP.name, "uses", twoP.moveSet[(mv1+1)%4].name, "instead.");
      mv2 = (mv2 + 1)%4;
      println();
    }

    for (int i = 0; i < 4; i++) {
      if (oneP.moveSet[i].currPowerPoints > 0)
        ppLoss1 = false;

      if (twoP.moveSet[i].currPowerPoints > 0) 
        ppLoss2 = false;
    }

    if (ppLoss1 == true) {
      println(oneP.name, "has run out of PP!", twoP.name, "wins the battle!");
      println();
      two.battlesWon += 1;
      return;
    }

    if (ppLoss2 == true) {
      println(twoP.name, "has run out of PP!", oneP.name, "wins the battle!");
      println();
      one.battlesWon += 1;
      return;
    }

    //Setting up who goes first

    setTurns(oneP, mv1, twoP, mv2);

    //Actually using the moves

    useMoves(oneP, mv1, twoP, mv2);

    checkBerry(oneP, twoP);
    checkBerry(twoP, oneP);

    checkWeather(oneP, twoP);
    checkWeather(twoP, oneP);

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

  void start1v1(Pokemon oneP, int mv1, Pokemon twoP, int mv2) {
    int turn = 1;
    boolean ppLoss1 = true;
    boolean ppLoss2 = true;

    println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
    println("A BATTLE BETWEEN", this.one.name.toUpperCase(), "AND", this.two.name.toUpperCase(), "HAS BEGUN! Lv.", str(oneP.level), oneP.name, "| Lv.", str(twoP.level), twoP.name);   
    println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");

    enterBattleEffects(oneP, twoP);
    enterBattleEffects(twoP, oneP);

    while (oneP.currHealth > 0 && twoP.currHealth > 0) {
      println();
      println("Turn #" + str(turn));
      println();

      if (oneP.moveSet[mv1].currPowerPoints < 1) {
        println(oneP.moveSet[mv1].name, "has run out of PP,", oneP.name, "uses", oneP.moveSet[(mv1+1)%4].name, "instead.");
        mv1 = (mv1 + 1)%4;
        println();
      }

      if (twoP.moveSet[mv2].currPowerPoints < 1) {
        println(twoP.moveSet[mv1].name, "has run out of PP,", twoP.name, "uses", twoP.moveSet[(mv1+1)%4].name, "instead.");
        mv2 = (mv2 + 1)%4;
        println();
      }

      for (int i = 0; i < 4; i++) {
        if (oneP.moveSet[i].currPowerPoints > 0)
          ppLoss1 = false;

        if (twoP.moveSet[i].currPowerPoints > 0) 
          ppLoss2 = false;
      }

      if (ppLoss1 == true) {
        println(oneP.name, "has run out of PP!", twoP.name, "wins the battle!");
        println();
        break;
      }

      if (ppLoss2 == true) {
        println(twoP.name, "has run out of PP!", oneP.name, "wins the battle!");
        println();
        break;
      }

      //Setting up who goes first

      setTurns(oneP, mv1, twoP, mv2);

      //Actually using the moves   

      useMoves(oneP, mv1, twoP, mv2);

      checkBerry(oneP, twoP);
      checkBerry(twoP, oneP);

      checkWeather(oneP, twoP);
      checkWeather(twoP, oneP);

      turn += 1;
      println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
    }

    println();

    if (oneP.currHealth > 0 || ppLoss2)
      one.battlesWon += 1;
    else
      two.battlesWon += 1;

    for (int i = 0; i < 6; i++) {
      oneP.battleStats[i] = oneP.stats[i];
      twoP.battleStats[i] = twoP.stats[i];
    }
  }

  void enterBattleEffects(Pokemon oneP, Pokemon twoP) {
    if (oneP.ability.equals("Intimidate")) {
      println();
      println(twoP.name + "was intimidated. Their attack fell!");
      println();

      twoP.attackSMn += 1;
      twoP.battleStats[1] = int(float(2*twoP.stats[1])/twoP.attackSMn);
    }

    if (oneP.ability.equals("Sand Stream")) {
      println();
      println(oneP.name + "'s Sand Stream whipped up a sandstorm!");
      println();

      this.weather = "Sandstorm";
      this.weatherCounter = 5;
    }
  }

  void checkWeather(Pokemon oneP, Pokemon twoP) {
    String firstType1 = oneP.type;
    String firstType2 = twoP.type;

    if (oneP.type.indexOf("/") != -1) {
      firstType1 = oneP.type.substring(0, oneP.type.indexOf("/"));
    }

    if (twoP.type.indexOf("/") != -1) {
      firstType2 = twoP.type.substring(0, twoP.type.indexOf("/"));
    }

    if (this.turn == 1 && this.weather.equals("Sandstorm") && (firstType1.equals("Rock") || oneP.type2.equals("Rock")
      || firstType1.equals("Steel") || oneP.type2.equals("Steel") || firstType1.equals("Ground") || oneP.type2.equals("Ground"))) {
      oneP.battleStats[4] *= 1.5;
      println(oneP.name + "'s special defense rose!");
      println();
    }

    if (this.weather.equals("Sandstorm") && !(firstType1.equals("Rock") || oneP.type2.equals("Rock")
      || firstType1.equals("Steel") || oneP.type2.equals("Steel") || firstType1.equals("Ground") || oneP.type2.equals("Ground"))) {
      oneP.currHealth -= (oneP.health/16);
      println(oneP.name, "was buffeted by the sandstorm! (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
      println();
    }

    if (this.weather.equals("Sandstorm"))      
      this.weatherCounter -= 1;

    if (this.weatherCounter == 0 && this.weather.equals("Sandstorm")) {
      this.weather = "none";
      println("The sandstorm subsided!");
      println();
    }
  }

  void setTurns(Pokemon oneP, int mv1, Pokemon twoP, int mv2) {
    //Setting up who goes first

    if (oneP.moveSet[mv1].priority < twoP.moveSet[mv2].priority) {
      if (twoP.currHealth > 0) {
        this.turnOrder[0] = twoP;
      }  
      if (oneP.currHealth > 0) {
        this.turnOrder[1] = oneP;
      }
    } else if (oneP.moveSet[mv1].priority > twoP.moveSet[mv2].priority) {
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

  void useMoves(Pokemon oneP, int mv1, Pokemon twoP, int mv2) {
    if (this.turnOrder[0] == oneP) {
      if (oneP.currHealth > 0) {
        oneP.useMove(oneP.moveSet[mv1], twoP);
        println();
      }

      if (twoP.currHealth > 0) {
        twoP.useMove(twoP.moveSet[mv2], oneP);
        println();
      }
    } else {
      if (twoP.currHealth > 0) {
        twoP.useMove(twoP.moveSet[mv2], oneP);
        println();
      }

      if (oneP.currHealth > 0) {
        oneP.useMove(oneP.moveSet[mv1], twoP);
        println();
      }
    }
  }

  void checkBerry(Pokemon oneP, Pokemon twoP) {
    if (oneP.item.equals("Sitrus Berry") && oneP.currHealth <= (oneP.health/2) && oneP.currHealth > 0) {
      oneP.currHealth += int(float(oneP.health)/4);
      if (oneP.currHealth > oneP.health)
        oneP.currHealth = oneP.health;

      println(oneP.name, "ate a Sitrus berry and regained 25% health! Now", oneP.name, "has", str(oneP.currHealth) + ". (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
      println();
      oneP.item = "none";
    }

    if (oneP.item.equals("Oran Berry") && oneP.currHealth <= (oneP.health/2) && oneP.currHealth > 0) {
      oneP.currHealth += 10;
      if (oneP.currHealth > oneP.health)
        oneP.currHealth = oneP.health;

      println(oneP.name, "ate an Oran berry and regained 10 health! Now", oneP.name, "has", str(oneP.currHealth) + ". (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
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

    if (oneP.item.equals("Berry Juice") && oneP.currHealth > 0) {
      oneP.currHealth += 10;
      if (oneP.currHealth > oneP.health)
        oneP.currHealth = oneP.health;

      println(oneP.name, "drank some berry juice and regained 10 health! Now", oneP.name, "has", str(oneP.currHealth) + ". (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
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
}
