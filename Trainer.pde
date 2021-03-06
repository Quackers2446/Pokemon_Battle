class Trainer {
  String name;
  int battlesWon;
  ArrayList<Pokemon> team;
  Boolean sR, reflect, lightScreen, auroraVeil;
  int reflectC, lightScreenC, auroraVeilC;
  
  Trainer (String n) {
    this.name = n;
    
    this.battlesWon = 0;
    this.team = new ArrayList<Pokemon>();
    
    this.sR = this.reflect = this.lightScreen = this.auroraVeil = false;
    this.reflectC = this.lightScreenC = this.auroraVeilC = 0;
  }
  
  void describe () {
    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");    
    println("Trainer:", this.name);
    println();
    
    println("Battles Won:\t", str(this.battlesWon));
    print("Pokemon:  \t\t");
    for (int i = 0; i < team.size(); i++) {
      if (i == team.size()-1)
        print(team.get(i).name);
        
      else
        print(team.get(i).name + ", ");
    }
    println();
    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
    println();
  }
  
  void addPokemon (Pokemon ... p ) {
    for (int i = 0; i < p.length; i++) { 
      team.add(p[i]);
      p[i].trainer = this;
    }
  }
  
  void heal (Pokemon ... p) {
    for (int i = 0; i < p.length; i++) { 
      p[i].currHealth = p[i].stats[0];
    }
  }
  
  void giveItem(String b, Pokemon ... p) {
    for (int i = 0; i < p.length; i++) {
      p[i].item = b;
    }
  }
  
  void useItem (String item, Pokemon p) {
    int x = p.currHealth;
    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
    println();
    
    if (item.equals("Fresh Water")) {
      p.currHealth += 50;
    }
    
    else if (item.equals("Oran Berry")) {
      p.currHealth += 10;
    }
    
    else if (item.equals("Berry Juice")) {
      p.currHealth += 20;
    }
    
    else if (item.equals("Sitrus Berry")) {
      p.currHealth += p.stats[0]/4;
    }
    
    else if (item.equals("Sweet Heart")) {
      p.currHealth += 20;
    }
    
    else if (item.equals("Soda Pop")) {
      p.currHealth += 60;
    }
    
    else if (item.equals("Hyper Potion")) {
      p.currHealth += 200;
    }
    
    else if (item.equals("Revive")) {
      p.currHealth = p.health/2;
    }
    
    else if (item.equals("Max Revive")) {
      p.currHealth = p.health;
    }
    
    else if (item.equals("Cheri Berry")) {
      p.paralysis = false;
      println(p.name, "is no longer paralyzed!");
    }
    
    else if (item.equals("Chesto Berry")) {
      p.sleep = false;
      println(p.name, "is no longer asleep!");
    }
    
    else if (item.equals("Persim Berry")) {
      p.confusion = false;
      println(p.name, "is no longer confused!");
    }
    
    else if (item.equals("Pecha Berry")) {
      p.poison = false;
      p.badlyPoisoned = false;
      println(p.name, "is no longer poisoned!");
    }
    
    if (p.currHealth > p.health)
      p.currHealth = p.health;
    
    println(p.name, "heals", str(p.currHealth-x), "health and is now at", p.currHealth, "health! (" + int((float(p.currHealth)/p.health)*100) + "%)");

    println();
    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
    println();
  }
  
  void showTeam () {
    int avgLevel = 0;
    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");    
    println(this.name + "'s Team:");
    println();
    println("Name:\t\tType:\t\tLevel:\t\tHealth Points:");
    
    for (int i = 0; i < team.size(); i++) {
      if (this.team.get(i).name.length() > 7) {
        if (this.team.get(i).type.length() > 7) {
          println(this.team.get(i).name + "\t" + this.team.get(i).type + "\t" + this.team.get(i).level + "\t\t"
          + this.team.get(i).currHealth + "/" + this.team.get(i).health + " HP (" + int((float(team.get(i).currHealth)/team.get(i).health)*100) + "%)");
        }
        else  {
          println(this.team.get(i).name + "\t" + this.team.get(i).type + "\t\t" + this.team.get(i).level + "\t\t" + 
          this.team.get(i).currHealth + "/" + this.team.get(i).health + " HP (" + int((float(team.get(i).currHealth)/team.get(i).health)*100) + "%)");
        }
      }
      else {
        if (this.team.get(i).type.length() > 7) {
          println(this.team.get(i).name + "\t\t" + this.team.get(i).type + "\t" + this.team.get(i).level + "\t\t" + 
          this.team.get(i).currHealth + "/" + this.team.get(i).health + " HP (" + int((float(team.get(i).currHealth)/team.get(i).health)*100) + "%)");
        }
        else  {
          println(this.team.get(i).name + "\t\t" + this.team.get(i).type + "\t\t" + this.team.get(i).level + "\t\t" + 
          this.team.get(i).currHealth + "/" + this.team.get(i).health + " HP (" + int((float(team.get(i).currHealth)/team.get(i).health)*100) + "%)");
        }
      }
      avgLevel += this.team.get(i).level;
    }
    
    println();
    println("Team Avg. Level:", avgLevel/this.team.size());

    println("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *");
    println();
  }
}
