import processing.sound.*;
int currentLee = 0;
RichardLeeManager richardLee;
RichardLeeManager gamblerLee;
RichardLeeManager headphoneLee;
RichardLeeManager hoodieLee;
RichardLeeManager matrixLee;
RichardLeeManager nurseLee;
RichardLeeManager suitLee;
RichardLeeManager xmasLee;
RichardLeeManager[] lees = new RichardLeeManager[8];
Button leftButton;
Button rightButton;  
int gameLevel;
Button startButton;
Button gameButton;
Button outfitSelectButton;
int movement = 120;
ObstacleManager trash;
ObstacleManager person;
ObstacleManager car;
int leeHP;
Button restartButton;
boolean timerRunning = false;
int startTime = 0;
PImage cobwebs;
SoundFile backgroundMusic;


void setup(){
  size(400,400);
  gameLevel = 1;
  leeHP = 3;
  richardLee = new RichardLeeManager("RichardLee.png");
  lees[0] = richardLee;
  gamblerLee = new RichardLeeManager("GamblerLee.png");
  lees[1] = gamblerLee;
  headphoneLee = new RichardLeeManager("HeadphoneLee.png");
  lees[2] = headphoneLee;
  hoodieLee = new RichardLeeManager("HoodieLee.png");
  lees[3] = hoodieLee;
  matrixLee = new RichardLeeManager("MatrixLee.png");
  lees[4] = matrixLee;
  nurseLee = new RichardLeeManager("NurseLee.png");
  lees[5] = nurseLee;
  suitLee = new RichardLeeManager("SuitLee.png");
  lees[6] = suitLee;
  xmasLee = new RichardLeeManager("XMASLee.png");
  lees[7] = xmasLee;
  
  leftButton = new Button(62.5, 200, 75, 50);
  rightButton = new Button(262.5, 200, 75, 50);
  startButton = new Button(150, 200, 100, 50);
  gameButton = new Button(150, 200, 100, 50);
  outfitSelectButton = new Button(150, 325, 100, 50);
  restartButton = new Button(150, 325, 100, 50);
  
  trash = new ObstacleManager(1, leeHP);
  person = new ObstacleManager(2, leeHP);
  car = new ObstacleManager(3, leeHP);
  
  cobwebs = loadImage("cobwebs.png");
  backgroundMusic = new SoundFile(this, "backgroundmusic.mp3");
  backgroundMusic.loop();
  
}

void draw(){
  background(255, 165, 0);
  if(gameLevel == 1){
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(15);
    text("Help Richard Lee get to the ACSS Halloween party!", 200, 150);
    startButton.display();
    startButton.label("GO");
    image(cobwebs, 0, 0, width, height);
  }
  if(gameLevel == 2){
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(15);
    text("Pick an outfit for Richard Lee!", 200, 80);
    lees[currentLee].display(127, 100, 150, 206);
    leftButton.display();
    leftButton.label("<");
    rightButton.display();
    rightButton.label(">");
    outfitSelectButton.display();
    outfitSelectButton.label("G0");
    image(cobwebs, 0, 0, width, height);
  }
  if(gameLevel == 3){
    int elapsedTime = millis() - startTime;
    text("Time: " + elapsedTime/1000, 350, 25);
    text("Health: " + leeHP, 50, 25);
    lees[currentLee].display(movement, 290, 75, 103);
    trash.web();
    trash.checkHit(movement, 290);
    person.bat();
    person.checkHit(movement, 290);
    car.ghost();
    car.checkHit(movement, 290);
    if(trash.hit() == true){
      leeHP = leeHP - 1;
      trash.downed = false;
    }
    if(person.hit() == true){
      leeHP = leeHP - 1;
      person.downed = false;
    }
    if(car.hit() == true){
      leeHP = leeHP - 1;
      car.downed = false;
    }
    if(leeHP == 0){
      gameLevel = 4;
    }
    if(elapsedTime/1000 >= 60){
      gameLevel = 5;
    }
  }
  if(gameLevel == 4){
    lees[currentLee].display(127, 100, 150, 206);
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(15);
    text("Richard Lee missed the party...", 200, 80);
    restartButton.display();
    restartButton.label("Restart");
    image(cobwebs, 0, 0, width, height);
  }
  if (gameLevel == 5){
    lees[currentLee].display(127, 100, 150, 206);
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(15);
    text("Richard Lee is here to Party", 200, 80);
    restartButton.display();
    restartButton.label("Restart");
    image(cobwebs, 0, 0, width, height);

  }
  if(gameLevel == 6){
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(15);
    text("Avoid the obstacles and help Richard", 200, 150); 
    text("get to the ACSS Halloween party!", 200, 165); 
    startButton.display();
    startButton.label("GO");
    image(cobwebs, 0, 0, width, height);
  }
}

void mouseClicked(){
  if(startButton.isInside(mouseX, mouseY) == true && gameLevel == 1){
    gameLevel = 2;
  }
  if(outfitSelectButton.isInside(mouseX, mouseY) == true && gameLevel == 2){
    gameLevel = 6;
    
  }
  if(gameButton.isInside(mouseX, mouseY) == true && gameLevel == 6){
    gameLevel = 3;
    startTimer();
  }
  if(restartButton.isInside(mouseX, mouseY) == true && gameLevel == 4 || gameLevel == 5){
    reset();
  }
  
  if(leftButton.isInside(mouseX, mouseY) == true && gameLevel == 2){
    if(currentLee == 0){
      currentLee = lees.length - 1;
    }
    else{
    currentLee = currentLee - 1;
    }
  }
  
  if(rightButton.isInside(mouseX, mouseY) == true && gameLevel == 2){
    if(currentLee >= lees.length - 1){
      currentLee = 0;
    }
    else{
    currentLee = currentLee + 1;
    }
  }
}

void keyPressed(){
  if(key == 'a' || key == 'A' || keyCode == 37){
    if(movement > 0){
      movement = movement - 3;
    }
  }
  if(key == 'd' || key == 'D' || keyCode == 39){
    if(movement < 325){
      movement = movement + 3;
    }
  }
}

void reset(){
  currentLee = 0;
  movement = 120;
  leeHP = 3;
  gameLevel = 1;
}

void startTimer() {
  timerRunning = true;
  startTime = millis();
}
