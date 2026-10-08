int scene = 0;
int health = 100;
boolean hasSword = false;
boolean hasGold = false;

void setup() {
  size(600, 400);
}

void draw() {
  background(20, 80, 40);
  fill(255, 255, 255);
  textSize(18);

  text("Health: " + health, 450, 40);

  if (scene == 0) {
    text("Welcome,", 20, 40);
    text("You are a warrior in the middle of a forest.", 20, 60);
    text("You need to get back to your homeland.", 20, 80);

    textAlign(CENTER);
    text("Press 1 to start", width / 2, 200);
    textAlign(LEFT);
  } else if (scene == 1) {
    text("Do you want to look around?", 20, 40);
    text("1. Look around for loot", 20, 80);
    text("2. Move forward without looking", 20, 110);
  } else if (scene == 2) {
    text("Which direction do you want to go?", 20, 40);
    if (hasSword) {
      text("(You are carrying a sword)", 20, 65);
    }
    text("1. Go Left", 20, 100);
    text("2. Go Right", 20, 130);
  } else if (scene == 3) {
    text("You stand before 3 different paths. Type a number:", 20, 40);
    if (hasGold) {
      text("(You found gold!)", 20, 65);
    }
    text("1. Path 1", 20, 90);
    text("2. Path 2", 20, 120);
    text("3. Path 3", 20, 150);
  } else if (scene == 4) {
    text("You reach the city! You are starving and need to eat.", 20, 40);
    text("1. Go to the ship to sail home", 20, 80);
    text("2. Find work to earn money and return home", 20, 110);
    text("3. Try to rob someone for quick cash", 20, 140);
  } else if (scene == 8) {
    text("The city guards caught you attempting robbery!", 20, 40);
    text("You were thrown in prison for life.", 20, 80);
    text("GAME OVER.", 20, 120);
    text("Press R to restart.", 20, 160);
  } else if (scene == 9) {
    text("You successfully returned to your homeland!", 20, 40);
    text("YOU WIN!", 20, 80);
    text("Press R to restart.", 20, 120);
  } else if (scene == 6) {
    text("You've been killed in the forest.", 20, 40);
    text("GAME OVER.", 20, 80);
    text("Press R to restart.", 20, 120);
  } else if (scene == 10) {
    text("You suddenly wake up in your bed.", 20, 40);
    text("It was all just a crazy dream!", 20, 80);
    text("SECRET ENDING UNLOCKED!", 20, 120);
    text("Press R to restart.", 20, 160);
  }
}

void keyPressed() {
  int currentScene = scene;

  if (key == 'r' || key == 'R') {
    scene = 0;
    health = 100;
    hasSword = false;
    hasGold = false;
  } else if (currentScene == 0 && key == '1') {
    scene = 1;
  } else if (currentScene == 1) {
    if (key == '1') {
      if (random(100) < 20) {
        hasSword = true;
        println("You found a sword!");
      } else {
        println("You looked around but found nothing.");
      }
      scene = 2;
    } else if (key == '2') {
      scene = 2;
    }
  } else if (currentScene == 2) {
    if (key == '1') {
      if (hasSword) {
        println("Wolves attacked you, but you fought them off with your sword, taking 30 damage!");
        health -= 30;
        if (health <= 0) {
          scene = 6;
        } else {
          scene = 3;
        }
      } else {
        println("A pack of wolves attacked and overwhelmed you!");
        health = 0;
        scene = 6;
      }
    } else if (key == '2') {
      scene = 3;
    }
  } else if (currentScene == 3) {
    if (key == '1') {
      println("Wolves ambush you from the trees!");
      health = 0;
      scene = 6;
    } else if (key == '2') {
      if (random(100) < 30) {
        println("You survived the bear attack taking 70 damage!");
        health -= 70;

        if (health <= 0) {
          scene = 6;
        } else {
          hasGold = true;
          println("You found gold near the bear's den!");
          scene = 3;
        }
      } else {
        println("A hungry bear eats you!");
        health = 0;
        scene = 6;
      }
    } else if (key == '3') {
      scene = 4;

      String secretInput = Ask.forString("What will you do in the city?");
      if (secretInput != null && secretInput.toLowerCase().trim().equals("wake up")) {
        scene = 10;
      }
    }
  } else if (currentScene == 4) {
    if (key == '1') {
      if (hasGold || hasSword) {
        println("You paid the captain with your valuables and secured passage home!");
        scene = 9;
      } else {
        println("The ship captain turned you away because you have no money or sword!");
      }
    } else if (key == '2') {
      println("You worked hard, earned food and travel funds, and returned home!");
      scene = 9;
    } else if (key == '3') {
      scene = 8;
    }
  }
}
