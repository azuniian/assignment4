//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ import libraries ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
import bpm.library.beatsperminute.*; //import BPM timings for Processing library by Vincent Sijben (https://github.com/vincentsijben/bpm-timings-for-processing)
import processing.sound.*; //import Sound library by The Processing Foundation (https://processing.org/reference/libraries/sound/index.html)

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ variable declaration ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
/////BPM Timing variables/////
BeatsPerMinute bpmLLNF;
BeatsPerMinute bpmUMG;
BeatsPerMinute bpmMeltdown;
BeatsPerMinute bpmCantarella;
BeatsPerMinute bpmPhony;

/////sound files/////
SoundFile LLNF;
SoundFile UMG;
SoundFile Meltdown;
SoundFile Cantarella;
SoundFile phony;

/////PVectors/////

/////ints/////
int currentBeat;
int gameScore;
int measure;

/////floats/////

/////booleans/////
boolean gameScreen = true;
boolean startScreen = false;
boolean songScreen = false;
boolean pauseScreen = false;
boolean controlScreen = false;
boolean scoreScreen = false;

/////arrays/////
//Luka Luka Night Fever
/*boolean[] beatLane1LLNF;
boolean[] beatLane2LLNF;
boolean[] beatLane3LLNF;
boolean[] beatLane4LLNF;*/

//Unknown Mother Goose
/*boolean[] beatLane1UMG;
boolean[] beatLane2UMG;
boolean[] beatLane3UMG;
boolean[] beatLane4UMG;*/

//Meltdown
/*boolean[] beatLane1M;
boolean[] beatLane2M;
boolean[] beatLane3M;
boolean[] beatLane4M;*/

//Cantarella//
//measure 1
boolean[] measure1Lane1 = {true, false, false, false, false, false, false, true, false, false, false, false, false, true, true, true, true, true, false, false, false, true, false, false, false, true, true, true, true, true, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, true};
boolean[] measure1Lane2 = {false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true,  false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, true, true, true, false, true, false, false, false, false, false, true, false, false, false, false};
boolean[] measure1Lane3 = {false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true,  false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, true, false, false, false, true, false, true, false, false, false, false, false, false};
boolean[] measure1Lane4 = {false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, false, true, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true,  false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false};
//measure 2
boolean[] measure2Lane1 = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, true, true, true, true, true, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true};
boolean[] measure2Lane2 = {false, true, false, true, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false,true, false, false, false, false, false, false};
boolean[] measure2Lane3 = {false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, true, true, true, true, true, false, false, true, false, false, false, false, false, false, true, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure2Lane4 = {false, false, false, false, false, true, false, false, false, false, false,true, true, true, true, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, true, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, true, false, false, false, false};
//measure 3
boolean[] measure3Lane1 = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false};
boolean[] measure3Lane2 = {false, false, false, true, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, false, true, true, true, true, true,  false, false, false, false, false, false, false, false, false, true,  false, false, false, true, false, false, false, false, false, false, false, false, false, true,  false, false, false, true, false, true, false, false, false, false, false, false};
boolean[] measure3Lane3 = {false, true, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure3Lane4 = {false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, false, false, false, true, false, false, false, false};
//measure 4
boolean[] measure4Lane1 = {false, false, false, true, false, false, false, true, true, true, true, true, false, true, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true,true, true, true, true, false, false, false, false, false, false, false, false};
boolean[] measure4Lane2 = {false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false};
boolean[] measure4Lane3 = {false, false, false, true, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, true, false, false};
boolean[] measure4Lane4 = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 5
boolean[] measure5Lane1 = {false,  false, false, true, false,true, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure5Lane2 = {false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure5Lane3 = {false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true, true, true};
boolean[] measure5Lane4 = {false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, true,  false, false, false, false, false, true, true, true, true, true, true, true};
//measure 6
boolean[] measure6Lane1 = {true, true, true, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, true, true, true, true, true, false, false, false, false, false, true, false, true, false, true, false, true, false, false, false, false, false, false, false, false, false, true};
boolean[] measure6Lane2 = {false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure6Lane3 = {false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, true, true, false, true, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure6Lane4 = {false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false,true, true, true, true, true, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, true, false, true, false, false, false, false, false, false, false, false, false, false};
//measure 7
boolean[] measure7Lane1 = {true, true, true, true,  false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, true, true, true, true, false, false, false, false, false, true, false, true, false, false, false, true};
boolean[] measure7Lane2 = {false, false, false, false, false, false, false, false, false,true, true, true, true, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false};
boolean[] measure7Lane3 = {false, false, false, false, false, true, true, true, true, true,  false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure7Lane4 = {false, false, false, true, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, false, true, false, false, false, true};
//measure 8
boolean[] measure8Lane1 = {true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure8Lane2 = {false, false, false, false, false, true, false, false, false, true, true, true, true, true, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, true, false, false};
boolean[] measure8Lane3 = {false, false, false, true, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, true,  false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, true, false, false, false, false};
boolean[] measure8Lane4 = {false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true};
//measure 9
boolean[] measure9Lane1 = {false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, true, false, true, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, false, false, false, false, true, false};
boolean[] measure9Lane2 = {false, false, false, true, true, true, true, false, false, true,  false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, true, false, false, true};
boolean[] measure9Lane3 = {false, false, false, true, true, true, true, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true};
boolean[] measure9Lane4 = {false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, true, true, true, true, false, true, false, false, false, false};
//measure 10
boolean[] measure10Lane1 = {false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, true, true, true, true};
boolean[] measure10Lane2 = {false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, false, false, false, true, false, false, false, true, true, true, true, false, false, false, false, false, true, false, false, false, false, false, false, true, true, true, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, true, true, true, true};
boolean[] measure10Lane3 = {false, false, false, false, true, false, false, false, false, false, false, false, true, false, true, false, false, false, true, false, false, false, true, true, true, false, true, false, false, false, false, true, false, false, true, true, true, false, false, false, false, false, true, false, false, false, false, true, true, true, true, true, false, false, false, true, true, true, true, true, false, false, false, false};
boolean[] measure10Lane4 = {false, false, false, false, false, false, true, false, true, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, true, true, true, true, false, false, false, false};
//measure 11
boolean[] measure11Lane1 = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false};
boolean[] measure11Lane2 = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false, false, false, true, false, true, false, false, false, true, false, false, false, false, false, false};
boolean[] measure11Lane3 = {false, false, false, true, true, true, true, true, true, true, true, true, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, false, false, false, true, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, true, false, false, false, false, false, false};
boolean[] measure11Lane4 = {false, false, false, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, true, false, false, false, false, true, false, false, true, false, false, false, true, false, true, true, true, true, true, true, false, false, false, false, false, false, true, true, true, true, true};
//measure 12
boolean[] measure12Lane1 = {false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, true, false, true, false, false, false, false, false, false, false, false, false, true};
boolean[] measure12Lane2 = {false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure12Lane3 = {false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure12Lane4 = {false, false, false, false, false, true, true, true, true, true, true, true,  false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, false, true, false, true, false, true, false, false, false, false, false, false, false, false, false, false};
//measure 13
boolean[] measure13Lane1 = {true, true, true, true, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, false, true, false, false, false, false};
boolean[] measure13Lane2 = {false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, true, true, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false};
boolean[] measure13Lane3 = {false, false, false, true, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure13Lane4 = {false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, false, true, false, false, false, false};
//measure 14
boolean[] measure14Lane1 = {false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure14Lane2 = {false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure14Lane3 = {false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure14Lane4 = {true, true, true, true, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
//measure 15
boolean[] measure15Lane1 = {false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, true, true, true, true, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, false, true, false, false, false, true};
boolean[] measure15Lane2 = {false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure15Lane3 = {true, true, true, true, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false};
boolean[] measure15Lane4 = {false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, true, false, true, true, true, true, true, false, false, false, false, false, true, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, true, true, true, true, false, false, false, false, false, true, false, true, false, false, false, true};
//measure 16
boolean[] measure16Lane1 = {false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, true,  false, false, false, true, true, true, true, true, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure16Lane2 = {false, false, false, true, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true};
boolean[] measure16Lane3 = {false, false, false, false, false, true, false, false, false, true, true, true, true, true, false, false, true, false, false, true, false, true, true, true, true, true, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true};
boolean[] measure16Lane4 = {true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, true, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, true, false, false};
//measure 17
boolean[] measure17Lane1 = {false, false, true, false, false, true, false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, true, true, false, true, false, false, false, false, false, true, false, false, false, false};
boolean[] measure17Lane2 = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, true, true, true, true, false, false, true, false, false, false, true, true, false, true, false, false, false, false, false, false, false, true, false, false, false, true, true, false, false, false, false, true, false, true, false, false, false, false, false, true};
boolean[] measure17Lane3 = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, true, false, true, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, true};
boolean[] measure17Lane4 = {false, true, false, true, false, false, false, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, false, false, false, false, false};
//measure 18
boolean[] measure18Lane1 = {false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, true, false, false};
boolean[] measure18Lane2 = {false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, true, true, false, false, false, false, false, false};
boolean[] measure18Lane3 = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, true, false, true, false, false, false, false, false, false, false, true, false, false, false, true, true, false, false, false, false, false, false, true, false, false, true, false, false, true};
boolean[] measure18Lane4 = {false, false, true, false, false, true, false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, false, true, false, false, false, false, false, false, false, false, false, true};
//measure 19
boolean[] measure19Lane1 = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false};
boolean[] measure19Lane2 = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false};
boolean[] measure19Lane3 = { false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure19Lane4 = { false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};

//phony//
/*boolean[] beatLane1P;
boolean[] beatLane2P;
boolean[] beatLane3P;
boolean[] beatLane4P;*/

/////ArrayLists/////
ArrayList beatLane1Pos;
ArrayList beatLane2Pos;
ArrayList beatLane3Pos;
ArrayList beatLane4Pos;
ArrayList beatVel;
ArrayList beatAccel;

/////objects/////
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
  rectMode(CORNERS);
  
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
  bpmCantarella.setBPM(576); //set bpm for Cantarella
  
  
  //phony by Tsumiki ft. KAFU - information & sound file from https://projectsekai.fandom.com/wiki/Phony
  phony = new SoundFile(this, "Phony_(Game_Version_-_VIRTUAL_SINGER).wav");
  bpmPhony = new BeatsPerMinute(this); //initializes bpm for phony
  bpmPhony.setBPM(170);
  
}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ draw ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
void draw(){
 background(255);
 //check which screen is being drawn
 if(startScreen == true){
   
 }
 
 else if(songScreen == true){
   
 }
 
 else if(controlScreen == true){
   
 }
 
 else if(gameScreen == true){
   //draw the reference lines/circles
   stroke(0, 0, 0, 200);
   strokeWeight(2);
   line(960, 0, 960, 1024);
   line(640, 0, 640, 1024);
   line(320, 0, 320, 1024);
   line(0, 810, 1280, 810);
   //lane 1 reference rectangles
   stroke(184, 191, 191, 200);
   fill(184, 191, 191, 100);
   rect(31, 760, 284, 860);
   rect(31, 790, 284, 830);
   //lane 2 reference rectangles
   rect(351, 760, 604, 860);
   rect(351, 790, 604, 830);
   //lane 3 reference rectangles
   rect(671, 760, 924, 860);
   rect(671, 790, 924, 830);
   //lane 4 reference rectangles
   rect(991, 760, 1244, 860);
   rect(991, 790, 1244, 830);
   
   
 }
 
 else if(pauseScreen == true){
   
 }
 
 else if(scoreScreen == true){
   
 }
}
