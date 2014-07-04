int SCREEN_HEIGHT =500; //y axis
int SCREEN_WIDTH =750; //x axis

float SHAPE_HEIGHT = 50; //shape height
float SHAPE_WIDTH = 50; //shape width
int NUM_FLAKES = 99; //number of snowflakes snow01

PShape snow01;
PShape snow02;
PShape snow03;


class flake01 {
  float x, y;
}

// snow is a list of flakes NUM_FLAKES long
flake01 [] snow = new flake01[NUM_FLAKES];//an array of the NUM_FLAKES of snowflakes


boolean mouseclick; //boolean is a true or false value


void setup() {
  size (SCREEN_WIDTH, SCREEN_HEIGHT);
  snow01 = loadShape("snow01.svg");
  snow02 = loadShape("snow02.svg");
  snow03 = loadShape("snow03.svg");
  
  int i; // i is each snowflake
  // for( start action;  repeat while this is true;  after every loop do this )
  for(i=0;i<NUM_FLAKES;i++) {
    snow[i] = new flake01();
    snow[i].x= random(SCREEN_WIDTH);
    snow[i].y= -(SHAPE_HEIGHT + random(500));//shape is hidden off the screen
  }
  frameRate(120);
  mouseclick = false;
}

void draw() {
  background(32,72,96);

  int i;
  // for( start action;  repeat while this is true;  after every loop do this )
  for(i=0;i<NUM_FLAKES;i++){
    if(i%3==0) {
      float rand01 = random(0.2, 1);

      shape(snow01, snow[i].x, snow[i].y, SHAPE_HEIGHT*rand01, SHAPE_WIDTH*rand01); //Draw at (x, y, [size: n x n])  
    } else if(i%3==1){
      float rand02 = random(0.2, 1);

      shape(snow02, snow[i].x, snow[i].y, SHAPE_HEIGHT*rand02, SHAPE_WIDTH*rand02);
    } else {
      float rand03 = random(0.2, 1);

      shape(snow03, snow[i].x, snow[i].y, SHAPE_HEIGHT*rand03, SHAPE_WIDTH*rand03);
    }
  }
  
  if (mouseclick==true) fallAndStop(); 
}

void mouseClicked() {
  mouseclick=true;
}


void fallAndStop() {
  int i;
  // for( start action;  repeat while this is true;  after every loop do this ) {
  for(i=0;i<NUM_FLAKES;i++){
    // if my shape falls to the bottom of the screen, make it stop
    if (snow[i].y < SCREEN_HEIGHT - SHAPE_HEIGHT) snow[i].y+=2;
  }
}




