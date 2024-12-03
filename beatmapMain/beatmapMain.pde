//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ import libraries ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
import bpm.library.beatsperminute.*; //import BPM timings for Processing library by Vincent Sijben (https://github.com/vincentsijben/bpm-timings-for-processing)
import processing.sound.*; //import Sound library by The Processing Foundation (https://processing.org/reference/libraries/sound/index.html)

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ variable declaration ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
//BPM Timing variables//
BeatsPerMinute bpmLLNF;
BeatsPerMinute bpmUMG;
BeatsPerMinute bpmMeltdown;
BeatsPerMinute bpmCantarella;
BeatsPerMinute bpmPhony;
//sound files//
SoundFile LLNF;
SoundFile UMG;
SoundFile Meltdown;
SoundFile Cantarella;
SoundFile phony;
//PVectors//
PVector beatLane1;
PVector beatLane2;
PVector beatLane3;
PVector beatLane4;
PVector currentVel;
PVector currentAccel;
//ints//
int currentBeat;
int gameScore;
//floats//
float pos1;
float pos2;
float pos3;
float pos4;
float vel;
float accel;
float currentTime;
//arrays//
//Luka Luka Night Fever
boolean[] beatLane1LLNF;
boolean[] beatLane2LLNF;
boolean[] beatLane3LLNF;
boolean[] beatLane4LLNF;
//Unknown Mother Goose
boolean[] beatLane1UMG;
boolean[] beatLane2UMG;
boolean[] beatLane3UMG;
boolean[] beatLane4UMG;
//Meltdown
boolean[] beatLane1M;
boolean[] beatLane2M;
boolean[] beatLane3M;
boolean[] beatLane4M;
//Cantarella
boolean[] beatLane1C;
boolean[] beatLane2C;
boolean[] beatLane3C;
boolean[] beatLane4C;
//phony
boolean[] beatLane1P;
boolean[] beatLane2P;
boolean[] beatLane3P;
boolean[] beatLane4P;
//ArrayLists//
ArrayList beatLane1Pos;
ArrayList beatLane2Pos;
ArrayList beatLane3Pos;
ArrayList beatLane4Pos;
ArrayList beatVel;
ArrayList beatAccel;
//objects//
HoldBeat lane1H = new HoldBeat();
HoldBeat lane2H = new HoldBeat();
HoldBeat lane3H = new HoldBeat();
HoldBeat lane4H = new HoldBeat();
PressBeat lane1P = new PressBeat();
PressBeat lane2P = new PressBeat();
PressBeat lane3P = new PressBeat();
PressBeat lane4P = new PressBeat();


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ setup & variable initialization ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
void setup(){
  size(1280, 1024);
  
  //Luka Luka Night Fever by SAM (samfree) ft. Megurine Luka - information & sound file from https://projectsekai.fandom.com/wiki/Luka_Luka_%E2%98%85_Night_Fever
  LLNF = new SoundFile(this, "Luka_Luka_Night_Fever_(Game_Version_-_VIRTUAL_SINGER).wav");
  bpmLLNF = new BeatsPerMinute(this); //initialize bpm for Luka Luka Night Fever
  bpmLLNF.setBPM(160); //set bpm for Luka Luka Night Fever
  //beatLane1LLNF = new boolean[];
  //beatLane2LLNF = new boolean[];
  //beatLane3LLNF = new boolean[];
  //beatLane4LLNF = new boolean[];
  
  //Unknown Mother Goose by wowaka ft. Hatsune Miku - information & sound file from https://projectsekai.fandom.com/wiki/Unknown_Mother_Goose
  UMG = new SoundFile(this, "Unknown_Mother_Goose_(Game_Version_-_VIRTUAL_SINGER).wav");
  bpmUMG = new BeatsPerMinute(this); //initialize bpm for Unknown Mother Goose
  bpmUMG.setBPM(222); //set bpm for Unknown Mother Goose
  //beatLane1UMG = new boolean[];
  //beatLane2UMG = new boolean[];
  //beatLane3UMG = new boolean[];
  //beatLane4UMG = new boolean[];
  
  //Meltdown by iroha(sasaki) ft. Kagamine Rin - information & sound file from https://projectsekai.fandom.com/wiki/Roshin_Yuukai
  Meltdown = new SoundFile(this, "Roshin_Yuukai_(Game_Version_-_VIRTUAL_SINGER).wav");
  bpmMeltdown = new BeatsPerMinute(this); //initialize bpm for Meltdown
  bpmMeltdown.setBPM(165); //set bpm for Meltdown
  //beatLane1M = new boolean[];
  //beatLane2M = new boolean[];
  //beatLane3M = new boolean[];
  //beatLane4M = new boolean[];
  
  //Cantarella by Kurousa ft. KAITO and Hatsune Miku - information & sound file from https://projectsekai.fandom.com/wiki/Cantarella
  Cantarella = new SoundFile(this, "Cantarella_(Game_Version_-_VIRTUAL_SINGER).wav");
  bpmCantarella = new BeatsPerMinute(this); //initialize bpm for Cantarella
  bpmCantarella.setBPM(144); //set bpm for Cantarella
  beatLane1C = new boolean[1200];
  beatLane2C = new boolean[1200];
  beatLane3C = new boolean[1200];
  beatLane4C = new boolean[1200];
  
  //phony by Tsumiki ft. KAFU - information & sound file from https://projectsekai.fandom.com/wiki/Phony
  phony = new SoundFile(this, "Phony_(Game_Version_-_VIRTUAL_SINGER).wav");
  bpmPhony = new BeatsPerMinute(this); //initializes bpm for phony
  bpmPhony.setBPM(170);
  beatLane1P = new boolean[1632];
  beatLane2P = new boolean[1632];
  beatLane3P = new boolean[1632];
  beatLane4P = new boolean[1632];
  
}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ draw ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
void draw(){
 background(255);
  if(!phony.isPlaying()){
    phony.play();
  }
}
