//to do:
//make power ups have same stroke 
// pause mode
//gameover mode/
//home button in gameover, maybe in game too
//score board
//bonus tab title
//instructions

//Color pallette
color darkPurple   =  #7400B8;
color purple       =  #6930C3;
color purpleBlue   =  #5E60CE;
color skyBlue      =  #5390D9;
color blue         =  #4EA8DE;
color blueTeal     =  #48BFE3;
color teal         =  #56CFE1;
color tealLight    =  #64DFDF;
color turquoise    =  #80ffdb;
color darkBlue     =  #023e8a;
color darkestBlue  =  #03045e;
color lightBlue    =  #ade8f4;
color seaBlue      =  #0077b6;
color gold         =  #c9a227;

//ocean background
PImage ocean;
PImage treasure;
PImage trident;
PImage greek;
PImage goldpile;
PImage coin;
PImage deepocean;

int timer;
int timer2;

//font
PFont  intro;
PFont  symbols;
PFont  instruct;

//GLOBAL VARIABLE
int mode;
final int INTRO          = 0;
final int GAME           = 1;
final int PAUSE          = 2;
final int GAMEOVER       = 3;
final int BONUS          = 4;
final int INSTRUCTIONS   = 5;

boolean up, down, left, right, space;


ArrayList <GameObject> objects;
Starfighter player1;


ArrayList <GameObjectE> objectss;
Starfighter2 player2;

int thingA     = 0;
int poseidonX  = -3000;

//score
int score     = 0;
int highscore = 0;




//================================================================================
void setup() {
  size(900, 750);
  mode= INTRO;
  rectMode(CENTER);

  objects     = new ArrayList <GameObject> ();
  player1     = new Starfighter();
  objects.add(player1); //to add an object
  //objects.add(diamond1);

  objectss    = new ArrayList <GameObjectE> ();
  player2     = new Starfighter2();
  objectss.add(player2); //to add an object


  //images background
  ocean     = loadImage("sea.jpeg");
  trident   = loadImage("poseidon.png");
  greek     = loadImage("column.png");
  treasure  = loadImage("gold.png");
  goldpile  = loadImage("goldpile.png");
  coin      = loadImage("coin.png");
  deepocean = loadImage("deep.jpeg");


  //font
  intro= createFont("Beastformer.ttf", 40);
  symbols= createFont("Font 90 Icons.ttf", 40);
  instruct= createFont("Typo Formal Regular Demo.otf", 40);

  //timer
  timer  = -1;
  timer2 = -1;
}

//================================================================================
void draw() {
  if      (mode == INTRO)         intro();
  else if (mode == GAME)          game ();
  else if (mode == PAUSE)         pause();
  else if (mode == GAMEOVER)      gameOver();
  else if (mode == BONUS)         bonus();
  else if (mode == INSTRUCTIONS)  instructions();
}
