class Battle {
  Trainer one;
  Trainer two;
  int turn;
  Pokemon[] turnOrder;
  
  Battle (Trainer o, Trainer t) {
    this.one = o;
    this.two = t;
    
    this.turn = 1;
    this.turnOrder = new Pokemon[2];
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
    
    checkBerry(oneP);
    checkBerry(twoP);
    
    turn += 1;
    println("*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *");
    println();
    
    if (oneP.currHealth == 0) {
      two.battlesWon += 1;
      for (int i = 0; i < 6; i++) {
        oneP.battleStats[i] = oneP.stats[i];
        twoP.battleStats[i] = twoP.stats[i];
      }
    }
    else if (twoP.currHealth == 0) {
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
      
      checkBerry(oneP);
      checkBerry(twoP);
      
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
  
  void setTurns(Pokemon oneP, int mv1, Pokemon twoP, int mv2) {
    //Setting up who goes first
      
    if (oneP.moveSet[mv1].priority < twoP.moveSet[mv2].priority) {
      if (twoP.currHealth > 0) {
        this.turnOrder[0] = twoP;
      }  
      if (oneP.currHealth > 0) {
        this.turnOrder[1] = oneP;
      }
    }
    else if (oneP.moveSet[mv1].priority > twoP.moveSet[mv2].priority) {
      if (oneP.currHealth > 0) {
        this.turnOrder[0] = oneP;
      }
      if (twoP.currHealth > 0) {
        this.turnOrder[1] = twoP;
      } 
    }
    else {
      if (oneP.battleStats[5] < twoP.battleStats[5]) {
        if (twoP.currHealth > 0) {
          this.turnOrder[0] = twoP;
        }  
        if (oneP.currHealth > 0) {
          this.turnOrder[1] = oneP;
        }
      }
      else {
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
    }
    
    else {
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
  
  void checkBerry(Pokemon oneP) {
    if (oneP.berry == "Sitrus" && oneP.currHealth <= (oneP.health/2) && oneP.currHealth > 0) {
      oneP.currHealth += int(float(oneP.health)/4);
      if (oneP.currHealth > oneP.health)
        oneP.currHealth = oneP.health;
        
      println(oneP.name, "ate a Sitrus berry and regained 25% health! Now", oneP.name, "has", str(oneP.health) + ". (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
      println();
      oneP.berry = "none";
    }
    
    if (oneP.berry == "Oran" && oneP.currHealth <= (oneP.health/2) && oneP.currHealth > 0) {
      oneP.currHealth += 10;
      if (oneP.currHealth > oneP.health)
        oneP.currHealth = oneP.health;
        
      println(oneP.name, "ate an Oran berry and regained 10 health! Now", oneP.name, "has", str(oneP.health) + ". (" + int((float(oneP.currHealth)/oneP.health)*100) + "%)");
      println();
      oneP.berry = "none";
    }
    
    if (oneP.berry == "Chesto Berry" && oneP.sleep && oneP.currHealth > 0) {
      oneP.sleep = false;
      oneP.sleepCounter = 0;
        
      println(oneP.name, "ate a Chesto berry and woke up!");
      println();
      oneP.berry = "none";
    }
    
    if (oneP.berry == "Cheri Berry" && oneP.paralysis && oneP.currHealth > 0) {
      oneP.paralysis = false;
        
      println(oneP.name, "ate a Cheri berry and is no longer paralyzed!");
      println();
      oneP.berry = "none";
    }
    
    if (oneP.berry == "Pecha Berry" && (oneP.poison || oneP.badlyPoisoned) && oneP.currHealth > 0) {
      oneP.poison = false;
      oneP.badlyPoisoned = false;
      oneP.poisonCounter = 0;
        
      println(oneP.name, "ate a Pecha berry and is no longer poisoned!");
      println();
      oneP.berry = "none";
    }
    
    if (oneP.berry == "Persim Berry" && oneP.confusion && oneP.currHealth > 0) {
      oneP.confusion = false;
      oneP.confusionCounter = 0;
        
      println(oneP.name, "ate a Persim berry and is no longer confused!");
      println();
      oneP.berry = "none";
    }
  }
}
