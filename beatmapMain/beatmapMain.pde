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
BeatsPerMinute checkSpawnLane1;
BeatsPerMinute checkSpawnLane2;
BeatsPerMinute checkSpawnLane3;
BeatsPerMinute checkSpawnLane4;
BeatsPerMinute checkPressLane1;
BeatsPerMinute checkPressLane2;
BeatsPerMinute checkPressLane3;
BeatsPerMinute checkPressLane4;

/////sound files/////
SoundFile LLNF;
SoundFile UMG;
SoundFile Meltdown;
SoundFile Cantarella;
SoundFile phony;

/////PVectors/////
PVector accel;

/////ints/////
int currentBeat = 0;
int checkBeat = 0;
int gameScore;
int measure = 1;

/////floats/////
float measureFloat;

/////booleans/////
boolean gameScreen = true;
boolean startScreen = false;
boolean songScreen = false;
boolean pauseScreen = false;
boolean controlScreen = false;
boolean scoreScreen = false;
boolean isSongPlaying = false;
boolean songEnd = false;


/////arrays/////
//Cantarella//
//measure 1
boolean[] measure1Lane1Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false,  true,false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, true,false, false, false, false, false, true};
boolean[] measure1Lane2Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false,  true, false, false, false, false, false, false, true, false, true,false, false, false, false, false,  true,false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false};
boolean[] measure1Lane3Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, true, false, true,false, false, false, false, false, false, false, true, false, false, false, true, false, true, false, false, false, false, false, false};
boolean[] measure1Lane4Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false};
boolean[] measure1Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, true, true, true, true, true,false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure1Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure1Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure1Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true,false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 2
boolean[] measure2Lane1Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true};
boolean[] measure2Lane2Press = {false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false,true, false, false, false, false, false, false};
boolean[] measure2Lane3Press = {false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, true, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure2Lane4Press = {false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, true, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, true, false, false, false, false};
boolean[] measure2Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure2Lane2Hold = {false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure2Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,  true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure2Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true,false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 3
boolean[] measure3Lane1Press = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false};
boolean[] measure3Lane2Press = {false, false, false, true, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true,  false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, true, false, false, false, false, false, false};
boolean[] measure3Lane3Press = {false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure3Lane4Press = {false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false};
boolean[] measure3Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure3Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure3Lane3Hold = {false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure3Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false};
//measure 4
boolean[] measure4Lane1Press = {false, false, false, true, false, false, false, true, true, true, true, true, false, true, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,  false, false, false, false, false, false, false, false};
boolean[] measure4Lane2Press = {false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false};
boolean[] measure4Lane3Press = {false, false, false, true, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, true, false, false};
boolean[] measure4Lane4Press = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure4Lane1Hold = {false, false, false, false, false, false, false, true, true, true, true, true,false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true,false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false};
boolean[] measure4Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure4Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure4Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 5
boolean[] measure5Lane1Press = {false,  false, false, true, false,true, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure5Lane2Press = {false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure5Lane3Press = {false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true, true, true};
boolean[] measure5Lane4Press = {false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, true,  false, false, false, false, false, true, true, true, true, true, true, true};
boolean[] measure5Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure5Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure5Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true};
boolean[] measure5Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 6
boolean[] measure6Lane1Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, true, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure6Lane2Press = {false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure6Lane3Press = {false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure6Lane4Press = {false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, true, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure6Lane1Hold = {true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true,false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure6Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure6Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure6Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 7
boolean[] measure7Lane1Press = {false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false};
boolean[] measure7Lane2Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false};
boolean[] measure7Lane3Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure7Lane4Press = {false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, true};
boolean[] measure7Lane1Hold = {true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure7Lane2Hold = {false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure7Lane3Hold = {false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure7Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 8
boolean[] measure8Lane1Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure8Lane2Press = {false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false};
boolean[] measure8Lane3Press = {false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true,  false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false};
boolean[] measure8Lane4Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true};
boolean[] measure8Lane1Hold = {true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure8Lane2Hold = {false, false, false, false, false, false, false, false, false, false, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure8Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure8Lane4Hold = {false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 9
boolean[] measure9Lane1Press = {false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, true, false, true, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, true, false};
boolean[] measure9Lane2Press = {false, false, false, false, false, false, false, false, false, true,  false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,  false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, true, false, false, true};
boolean[] measure9Lane3Press = {false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true};
boolean[] measure9Lane4Press = {false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false};
boolean[] measure9Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure9Lane2Hold = {false, false, false, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure9Lane3Hold = {false, false, false, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure9Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false};
//measure 10
boolean[] measure10Lane1Press = {false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true};
boolean[] measure10Lane2Press = {false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false};
boolean[] measure10Lane3Press = {false, false, false, false, true, false, false, false, false, false, false, false, true, false, true, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false,  false, false, false, false};
boolean[] measure10Lane4Press = {false, false, false, false, false, false, true, false, true, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false};
boolean[] measure10Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false};
boolean[] measure10Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true};
boolean[] measure10Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false};
boolean[] measure10Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 11
boolean[] measure11Lane1Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false};
boolean[] measure11Lane2Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false, false, false, true, false, true, false, false, false, true, false, false, false, false, false, false};
boolean[] measure11Lane3Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, false, false, false, true, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, true, false, false, false, false, false, false};
boolean[] measure11Lane4Press = {false, false, false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, true, false, false, false, false, true, false, false, true, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure11Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure11Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure11Lane3Hold = {false, false, false, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure11Lane4Hold = {false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, true, true, true, true, true};
//measure 12
boolean[] measure12Lane1Press = {false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, true, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure12Lane2Press = {false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure12Lane3Press = {false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure12Lane4Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, true, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure12Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure12Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure12Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure12Lane4Hold = {false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 13
boolean[] measure13Lane1Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false};
boolean[] measure13Lane2Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true};
boolean[] measure13Lane3Press = {false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure13Lane4Press = {false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false};
boolean[] measure13Lane1Hold = {true, true, true, true, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure13Lane2Hold = {false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure13Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure13Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true};
//measure 14
boolean[] measure14Lane1Press = {false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure14Lane2Press = {false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure14Lane3Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure14Lane4Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure14Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure14Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure14Lane3Hold = {false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true};
boolean[] measure14Lane4Hold = {true, true, true, true, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 15
boolean[] measure15Lane1Press = {false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, true};
boolean[] measure15Lane2Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure15Lane3Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false};
boolean[] measure15Lane4Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false};
boolean[] measure15Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure15Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure15Lane3Hold = {true, true, true, true, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure15Lane4Hold = {false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true};
//measure 16
boolean[] measure16Lane1Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure16Lane2Press = {false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true};
boolean[] measure16Lane3Press = {false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true};
boolean[] measure16Lane4Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false};
boolean[] measure16Lane1Hold = {false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false};
boolean[] measure16Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure16Lane3Hold = {false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure16Lane4Hold = {true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false};
//measure 17
boolean[] measure17Lane1Press = {false, false, true, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, true, true, false, true, false, false, false, false, false, true, false, false, false, false};
boolean[] measure17Lane2Press = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, true, false, true, false, false, false, false, false, false, false, true, false, false, false, true, true, false, false, false, false, true, false, true, false, false, false, false, false, true};
boolean[] measure17Lane3Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, true, false, true, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, true};
boolean[] measure17Lane4Press = {false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, false, false, false, false, false};
boolean[] measure17Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure17Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure17Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure17Lane4Hold = {false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 18
boolean[] measure18Lane1Press = {false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, true, false, false};
boolean[] measure18Lane2Press = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure18Lane3Press = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, true, false, true, false, false, false, false, false, false, false, true, false, false, false, true, true, false, false, false, false, false, false, true, false, false, true, false, false, true};
boolean[] measure18Lane4Press = {false, false, true, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, false, true, false, false, false, false, false, false, false, false, false, true};
boolean[] measure18Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure18Lane2Hold = {false, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false};
boolean[] measure18Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure18Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//measure 19
boolean[] measure19Lane1Press = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false};
boolean[] measure19Lane2Press = {false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false};
boolean[] measure19Lane3Press = { false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure19Lane4Press = { false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure19Lane1Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure19Lane2Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure19Lane3Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] measure19Lane4Hold = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};

/////objects/////
HoldBeat1 hold1;
HoldBeat2 hold2;
HoldBeat3 hold3;
HoldBeat4 hold4;
PressBeat1 press1;
PressBeat2 press2;
PressBeat3 press3;
PressBeat4 press4;

/////ArrayLists/////
//pvectors
//ArrayList<PVector> accel = new ArrayList<PVector>();




//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ setup & variable initialization ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
void setup(){
  size(1280, 1024);
  rectMode(CORNER);
  
  //Luka Luka Night Fever by SAM (samfree) ft. Megurine Luka - information & sound file from https://projectsekai.fandom.com/wiki/Luka_Luka_%E2%98%85_Night_Fever
  LLNF = new SoundFile(this, "Luka_Luka_Night_Fever_(Game_Version_-_VIRTUAL_SINGER).wav");
  bpmLLNF = new BeatsPerMinute(this); //initialize bpm for Luka Luka Night Fever
  //bpmLLNF.setBPM(160); //set bpm for Luka Luka Night Fever
  //beatLane1LLNF = new boolean[];
  //beatLane2LLNF = new boolean[];
  //beatLane3LLNF = new boolean[];
  //beatLane4LLNF = new boolean[];
  
  //Unknown Mother Goose by wowaka ft. Hatsune Miku - information & sound file from https://projectsekai.fandom.com/wiki/Unknown_Mother_Goose
  UMG = new SoundFile(this, "Unknown_Mother_Goose_(Game_Version_-_VIRTUAL_SINGER).wav");
  bpmUMG = new BeatsPerMinute(this); //initialize bpm for Unknown Mother Goose
  //bpmUMG.setBPM(222); //set bpm for Unknown Mother Goose
  //beatLane1UMG = new boolean[];
  //beatLane2UMG = new boolean[];
  //beatLane3UMG = new boolean[];
  //beatLane4UMG = new boolean[];
  
  //Meltdown by iroha(sasaki) ft. Kagamine Rin - information & sound file from https://projectsekai.fandom.com/wiki/Roshin_Yuukai
  Meltdown = new SoundFile(this, "Roshin_Yuukai_(Game_Version_-_VIRTUAL_SINGER).wav");
  bpmMeltdown = new BeatsPerMinute(this); //initialize bpm for Meltdown
  //bpmMeltdown.setBPM(165); //set bpm for Meltdown
  //beatLane1M = new boolean[];
  //beatLane2M = new boolean[];
  //beatLane3M = new boolean[];
  //beatLane4M = new boolean[];
  
  //Cantarella by Kurousa ft. KAITO and Hatsune Miku - information & sound file from https://projectsekai.fandom.com/wiki/Cantarella
  //songChoice = 1
  Cantarella = new SoundFile(this, "Cantarella_(Game_Version_-_VIRTUAL_SINGER).wav");
  bpmCantarella = new BeatsPerMinute(this); //initialize bpm for Cantarella
  
  
  //phony by Tsumiki ft. KAFU - information & sound file from https://projectsekai.fandom.com/wiki/Phony
  phony = new SoundFile(this, "Phony_(Game_Version_-_VIRTUAL_SINGER).wav");
  bpmPhony = new BeatsPerMinute(this); //initializes bpm for phony
  //bpmPhony.setBPM(170);
  
  checkSpawnLane1 = new BeatsPerMinute(this); //initializes a spawn BPM check for lane 1
  checkSpawnLane2 = new BeatsPerMinute(this); //initializes a spawn BPM check for lane 2
  checkSpawnLane3 = new BeatsPerMinute(this); //initializes a spawn BPM check for lane 3
  checkSpawnLane4 = new BeatsPerMinute(this); //initializes a spawn BPM check for lane 4
  checkPressLane1 = new BeatsPerMinute(this); //initialize a press BPM check for lane 1
  checkPressLane2 = new BeatsPerMinute(this); //initializes a press BPM check for lane 2
  checkPressLane3 = new BeatsPerMinute(this); //initializes a press BPM check for lane 3
  checkPressLane4 = new BeatsPerMinute(this); //initializes a press BPM check for lane 4
  
  hold1 = new HoldBeat1(38, 253, 38, 30, color(23, 19, 97), color(135, 132, 189));
  hold2 = new HoldBeat2(38, 253, 38, 30, color(23, 19, 97), color(135, 132, 189));
  hold3 = new HoldBeat3(38, 253, 38, 30, color(23, 19, 97), color(135, 132, 189));
  hold4 = new HoldBeat4(38, 253, 38, 30, color(23, 19, 97), color(135, 132, 189));
  press1 = new PressBeat1(38, 253, color(23, 19, 97));
  press2 = new PressBeat2(38, 253, color(23, 19, 97));
  press3 = new PressBeat3(38, 253, color(23, 19, 97));
  press4 = new PressBeat4(38, 253, color(23, 19, 97));
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
    rect(31, 760, 253, 100);
    rect(31, 790, 253, 40);
    //lane 2 reference rectangles
    rect(351, 760, 253, 100);
    rect(351, 790, 253, 40);
    //lane 3 reference rectangles
    rect(671, 760, 253, 100);
    rect(671, 790, 253, 40);
    //lane 4 reference rectangles
    rect(991, 760, 253, 100);
    rect(991, 790, 253, 40);
   
    if(isSongPlaying == false){
      if(songEnd == false){
        if(!Cantarella.isPlaying()){
          bpmCantarella.setBPM(144);
          //if(bpmCantarella.getBeatCount() == 16){
            Cantarella.play();
            isSongPlaying = true; 
          //} //end of start song conditional
        }//end of sound management conditional
      }//end of song check conditional
      else if(songEnd == true){
        gameScreen = false;
        scoreScreen = true;
      }//end of songEnd conditional
    } //end of songPlaying false conditional
    
    else if(isSongPlaying == true){
      //check lane to see if beat has been spawned for this beat in song
      //LANE1
      if(checkSpawnLane1.every_once[1]){ //every beat, once per beat, check to see if a beat needs to be spawned/clicked or not (lane 1)
        //MEASURE 1
        if(measure == 1){
          //scroll existing beats down the screen
          if(currentBeat>=1){
            press1.scrollNotes();
            hold1.scrollNotes();
          }
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<80){ //current measure
            //check what type of beat needs to be spawned
            if(measure1Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure1Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure1Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure1Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 80){ //next measure
            if(measure2Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure2Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure2Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure2Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
           
           //check to see if any note arrays need to be reset
          if(currentBeat>=16){
            //press1.resetNote();
            //hold1.resetNote();
          }
        }//end of measure 1
        
        //MEASURE 2
        else if(measure == 2){
        //check to see if any note arrays need to be reset
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<144){ //current measure
            //check what type of beat needs to be spawned
            if(measure2Lane1Press[(currentBeat%64)+16] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure2Lane1Hold[((currentBeat%64)+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure2Lane1Hold[(currentBeat%64)+15] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure2Lane1Hold[(currentBeat%64)+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 144){ //next measure
            if(measure3Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure3Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure3Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure3Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press1.display();
          hold1.display(); 
          
          press1.resetNote();
          hold1.resetNote();
        }//end of measure 2
        
        //MEASURE 3
        else if(measure == 3){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<208){ //current measure
            //check what type of beat needs to be spawned
            if(measure3Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure3Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure3Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure3Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 208){ //next measure
            if(measure4Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure4Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure4Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure4Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press1.display();
          hold1.display(); 
        }//end of measure 3
        
        //MEASURE 4
        else if(measure == 4){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<272){ //current measure
            //check what type of beat needs to be spawned
            if(measure4Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure4Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure4Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure4Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 272){ //next measure
            if(measure5Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure5Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure5Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure5Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press1.display();
          hold1.display(); 
        }//end of measure 4
        
        //MEASURE 5
        else if(measure == 5){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<336){ //current measure
            //check what type of beat needs to be spawned
            if(measure5Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure5Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure5Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure5Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 336){ //next measure
            if(measure6Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure6Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure6Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure6Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press1.display();
          hold1.display(); 
        }//end of measure 5
        
        //MEASURE 6
        else if(measure == 6){
        //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<400){ //current measure
            //check what type of beat needs to be spawned
            if(measure6Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure6Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure6Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure6Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 400){ //next measure
            if(measure7Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure7Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure7Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure7Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 6
        
        //MEASURE 7
        else if(measure == 7){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<464){ //current measure
            //check what type of beat needs to be spawned
            if(measure7Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure7Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure7Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure7Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 464){ //next measure
            if(measure8Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure8Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure8Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure8Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 7
        
        //MEASURE 8
        else if(measure == 8){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<528){ //current measure
            //check what type of beat needs to be spawned
            if(measure8Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure8Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure8Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure8Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 528){ //next measure
            if(measure9Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure9Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure9Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure9Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 8
        
        //MEASURE 9
        else if(measure == 9){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<592){ //current measure
            //check what type of beat needs to be spawned
            if(measure9Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure9Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure9Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure9Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 592){ //next measure
            if(measure10Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure10Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure10Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure10Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 9
        
        //MEASURE 10
        else if(measure == 10){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<656){ //current measure
            //check what type of beat needs to be spawned
            if(measure10Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure10Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure10Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure10Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 656){ //next measure
            if(measure11Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure11Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure11Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure11Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 10
        
        //MEASURE 11
        else if(measure == 11){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<720){ //current measure
            //check what type of beat needs to be spawned
            if(measure11Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure11Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure11Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure11Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 720){ //next measure
            if(measure12Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure12Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure12Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure12Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 11
        
        //MEASURE 12
        else if(measure == 12){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<784){ //current measure
            //check what type of beat needs to be spawned
            if(measure12Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure12Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure12Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure12Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 784){ //next measure
            if(measure13Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure13Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure13Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure13Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 12
        
        //MEASURE 13
        else if(measure == 13){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<848){ //current measure
            //check what type of beat needs to be spawned
            if(measure13Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure13Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure13Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure13Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 848){ //next measure
            if(measure14Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure14Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure14Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure14Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 13
        
        //MEASURE 14
        else if(measure == 14){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<912){ //current measure
            //check what type of beat needs to be spawned
            if(measure14Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure14Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure14Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure14Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 912){ //next measure
            if(measure15Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure15Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure15Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure15Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 14
        
        //MEASURE 15
        else if(measure == 15){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<976){ //current measure
            //check what type of beat needs to be spawned
            if(measure15Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure15Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure15Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure15Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 976){ //next measure
            if(measure16Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure16Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure16Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure16Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 15
        
        //MEASURE 16
        else if(measure == 16){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1040){ //current measure
            //check what type of beat needs to be spawned
            if(measure16Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure16Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure16Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure16Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1040){ //next measure
            if(measure17Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure17Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure17Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure17Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 16
        
        //MEASURE 17
        else if(measure == 17){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1104){ //current measure
            //check what type of beat needs to be spawned
            if(measure17Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure17Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure17Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure17Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1104){ //next measure
            if(measure18Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure18Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure18Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure18Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 17
        
        //MEASURE 18
        else if(measure == 18){
          //check to see if any note arrays need to be reset
          press1.resetNote();
          hold1.resetNote();
           
          //scroll existing beats down the screen
          press1.scrollNotes();
          hold1.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1168){ //current measure
            //check what type of beat needs to be spawned
            if(measure18Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure18Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure18Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure18Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1168){ //next measure
            if(measure19Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press1.spawnBeat();
            }
            else if(measure19Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure19Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold1.spawnStartBeat();
              }
              else if (measure19Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold1.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold1.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press1.display();
           hold1.display(); 
        }//end of measure 18
      }//end of lane 1 conditional
      
      //LANE 2
      if(checkSpawnLane2.every_once[1]){ //every beat, once per beat, check to see if a beat needs to be spawned/clicked or not (lane 1)
        //MEASURE 1
        if(measure == 1){
          //check to see if any note arrays need to be reset
          //press2.resetNote();
          //hold2.resetNote();
           
          //scroll existing beats down the screen
          //press2.scrollNotes();
          //hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<80){ //current measure
            //check what type of beat needs to be spawned
            if(measure1Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure1Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure1Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure1Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 80){ //next measure
            if(measure2Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure2Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure2Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure2Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 1
        
        //MEASURE 2
        else if(measure == 2){
        //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<144){ //current measure
            //check what type of beat needs to be spawned
            if(measure2Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure2Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure2Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure2Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 144){ //next measure
            if(measure3Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure3Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure3Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure3Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press2.display();
          hold2.display(); 
        }//end of measure 2
        
        //MEASURE 3
        else if(measure == 3){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<208){ //current measure
            //check what type of beat needs to be spawned
            if(measure3Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure3Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure3Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure3Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 208){ //next measure
            if(measure4Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure4Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure4Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure4Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press2.display();
          hold2.display(); 
        }//end of measure 3
        
        //MEASURE 4
        else if(measure == 4){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<272){ //current measure
            //check what type of beat needs to be spawned
            if(measure4Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure4Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure4Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure4Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 272){ //next measure
            if(measure5Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure5Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure5Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure5Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press2.display();
          hold2.display(); 
        }//end of measure 4
        
        //MEASURE 5
        else if(measure == 5){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<336){ //current measure
            //check what type of beat needs to be spawned
            if(measure5Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure5Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure5Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure5Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 336){ //next measure
            if(measure6Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure6Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure6Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure6Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press2.display();
          hold2.display(); 
        }//end of measure 5
        
        //MEASURE 6
        else if(measure == 6){
        //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<400){ //current measure
            //check what type of beat needs to be spawned
            if(measure6Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure6Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure6Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure6Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 400){ //next measure
            if(measure7Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure7Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure7Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure7Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 6
        
        //MEASURE 7
        else if(measure == 7){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<464){ //current measure
            //check what type of beat needs to be spawned
            if(measure7Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure7Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure7Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure7Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 464){ //next measure
            if(measure8Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure8Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure8Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure8Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 7
        
        //MEASURE 8
        else if(measure == 8){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<528){ //current measure
            //check what type of beat needs to be spawned
            if(measure8Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure8Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure8Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure8Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 528){ //next measure
            if(measure9Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure9Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure9Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure9Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 8
        
        //MEASURE 9
        else if(measure == 9){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<592){ //current measure
            //check what type of beat needs to be spawned
            if(measure9Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure9Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure9Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure9Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 592){ //next measure
            if(measure10Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure10Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure10Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure10Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 9
        
        //MEASURE 10
        else if(measure == 10){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<656){ //current measure
            //check what type of beat needs to be spawned
            if(measure10Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure10Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure10Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure10Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 656){ //next measure
            if(measure11Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure11Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure11Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure11Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 10
        
        //MEASURE 11
        else if(measure == 11){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<720){ //current measure
            //check what type of beat needs to be spawned
            if(measure11Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure11Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure11Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure11Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 720){ //next measure
            if(measure12Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure12Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure12Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure12Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 11
        
        //MEASURE 12
        else if(measure == 12){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<784){ //current measure
            //check what type of beat needs to be spawned
            if(measure12Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure12Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure12Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure12Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 784){ //next measure
            if(measure13Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure13Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure13Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure13Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 12
        
        //MEASURE 13
        else if(measure == 13){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<848){ //current measure
            //check what type of beat needs to be spawned
            if(measure13Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure13Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure13Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure13Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 848){ //next measure
            if(measure14Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure14Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure14Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure14Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 13
        
        //MEASURE 14
        else if(measure == 14){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<912){ //current measure
            //check what type of beat needs to be spawned
            if(measure14Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure14Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure14Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure14Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 912){ //next measure
            if(measure15Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure15Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure15Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure15Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 14
        
        //MEASURE 15
        else if(measure == 15){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<976){ //current measure
            //check what type of beat needs to be spawned
            if(measure15Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure15Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure15Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure15Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 976){ //next measure
            if(measure16Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure16Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure16Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure16Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 15
        
        //MEASURE 16
        else if(measure == 16){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1040){ //current measure
            //check what type of beat needs to be spawned
            if(measure16Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure16Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure16Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure16Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1040){ //next measure
            if(measure17Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure17Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure17Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure17Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 16
        
        //MEASURE 17
        else if(measure == 17){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1104){ //current measure
            //check what type of beat needs to be spawned
            if(measure17Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure17Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure17Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure17Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1104){ //next measure
            if(measure18Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure18Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure18Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure18Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 17
        
        //MEASURE 18
        else if(measure == 18){
          //check to see if any note arrays need to be reset
          press2.resetNote();
          hold2.resetNote();
           
          //scroll existing beats down the screen
          press2.scrollNotes();
          hold2.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1168){ //current measure
            //check what type of beat needs to be spawned
            if(measure18Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure18Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure18Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure18Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1168){ //next measure
            if(measure19Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press2.spawnBeat();
            }
            else if(measure19Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure19Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold2.spawnStartBeat();
              }
              else if (measure19Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold2.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold2.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press2.display();
           hold2.display(); 
        }//end of measure 18
      }//end of lane 2 conditional
      
      //LANE 3
      if(checkSpawnLane3.every_once[1]){ //every beat, once per beat, check to see if a beat needs to be spawned/clicked or not (lane 1)
        //MEASURE 1
        if(measure == 1){
          //check to see if any note arrays need to be reset
          //press3.resetNote();
          //hold3.resetNote();
           
          //scroll existing beats down the screen
          //press3.scrollNotes();
          //hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<80){ //current measure
            //check what type of beat needs to be spawned
            if(measure1Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure1Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure1Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure1Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 80){ //next measure
            if(measure2Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure2Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure2Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure2Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 1
        
        //MEASURE 2
        else if(measure == 2){
        //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<144){ //current measure
            //check what type of beat needs to be spawned
            if(measure2Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure2Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure2Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure2Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 144){ //next measure
            if(measure3Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure3Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure3Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure3Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press3.display();
          hold3.display(); 
        }//end of measure 2
        
        //MEASURE 3
        else if(measure == 3){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<208){ //current measure
            //check what type of beat needs to be spawned
            if(measure3Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure3Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure3Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure3Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 208){ //next measure
            if(measure4Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure4Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure4Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure4Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press3.display();
          hold3.display(); 
        }//end of measure 3
        
        //MEASURE 4
        else if(measure == 4){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<272){ //current measure
            //check what type of beat needs to be spawned
            if(measure4Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure4Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure4Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure4Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 272){ //next measure
            if(measure5Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure5Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure5Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure5Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press3.display();
          hold3.display(); 
        }//end of measure 4
        
        //MEASURE 5
        else if(measure == 5){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<336){ //current measure
            //check what type of beat needs to be spawned
            if(measure5Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure5Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure5Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure5Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 336){ //next measure
            if(measure6Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure6Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure6Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure6Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press3.display();
          hold3.display(); 
        }//end of measure 5
        
        //MEASURE 6
        else if(measure == 6){
        //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<400){ //current measure
            //check what type of beat needs to be spawned
            if(measure6Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure6Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure6Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure6Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 400){ //next measure
            if(measure7Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure7Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure7Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure7Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 6
        
        //MEASURE 7
        else if(measure == 7){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<464){ //current measure
            //check what type of beat needs to be spawned
            if(measure7Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure7Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure7Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure7Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 464){ //next measure
            if(measure8Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure8Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure8Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure8Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 7
        
        //MEASURE 8
        else if(measure == 8){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<528){ //current measure
            //check what type of beat needs to be spawned
            if(measure8Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure8Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure8Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure8Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 528){ //next measure
            if(measure9Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure9Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure9Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure9Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 8
        
        //MEASURE 9
        else if(measure == 9){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<592){ //current measure
            //check what type of beat needs to be spawned
            if(measure9Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure9Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure9Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure9Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 592){ //next measure
            if(measure10Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure10Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure10Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure10Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 9
        
        //MEASURE 10
        else if(measure == 10){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<656){ //current measure
            //check what type of beat needs to be spawned
            if(measure10Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure10Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure10Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure10Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 656){ //next measure
            if(measure11Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure11Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure11Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure11Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 10
        
        //MEASURE 11
        else if(measure == 11){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<720){ //current measure
            //check what type of beat needs to be spawned
            if(measure11Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure11Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure11Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure11Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 720){ //next measure
            if(measure12Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure12Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure12Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure12Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 11
        
        //MEASURE 12
        else if(measure == 12){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<784){ //current measure
            //check what type of beat needs to be spawned
            if(measure12Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure12Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure12Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure12Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 784){ //next measure
            if(measure13Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure13Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure13Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure13Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 12
        
        //MEASURE 13
        else if(measure == 13){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<848){ //current measure
            //check what type of beat needs to be spawned
            if(measure13Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure13Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure13Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure13Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 848){ //next measure
            if(measure14Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure14Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure14Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure14Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 13
        
        //MEASURE 14
        else if(measure == 14){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<912){ //current measure
            //check what type of beat needs to be spawned
            if(measure14Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure14Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure14Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure14Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 912){ //next measure
            if(measure15Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure15Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure15Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure15Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 14
        
        //MEASURE 15
        else if(measure == 15){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<976){ //current measure
            //check what type of beat needs to be spawned
            if(measure15Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure15Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure15Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure15Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 976){ //next measure
            if(measure16Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure16Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure16Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure16Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 15
        
        //MEASURE 16
        else if(measure == 16){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1040){ //current measure
            //check what type of beat needs to be spawned
            if(measure16Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure16Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure16Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure16Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1040){ //next measure
            if(measure17Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure17Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure17Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure17Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 16
        
        //MEASURE 17
        else if(measure == 17){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1104){ //current measure
            //check what type of beat needs to be spawned
            if(measure17Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure17Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure17Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure17Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1104){ //next measure
            if(measure18Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure18Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure18Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure18Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 17
        
        //MEASURE 18
        else if(measure == 18){
          //check to see if any note arrays need to be reset
          press3.resetNote();
          hold3.resetNote();
           
          //scroll existing beats down the screen
          press3.scrollNotes();
          hold3.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1168){ //current measure
            //check what type of beat needs to be spawned
            if(measure18Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure18Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure18Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure18Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1168){ //next measure
            if(measure19Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press3.spawnBeat();
            }
            else if(measure19Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure19Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold3.spawnStartBeat();
              }
              else if (measure19Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold3.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold3.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press3.display();
           hold3.display(); 
        }//end of measure 18
      }//end of lane 3 conditional
      
      //LANE 4
      if(checkSpawnLane4.every_once[1]){ //every beat, once per beat, check to see if a beat needs to be spawned/clicked or not (lane 1)
        //MEASURE 1
        if(measure == 1){
          //check to see if any note arrays need to be reset
          //if(currentBeat>= 16){
            //press4.resetNote();
            //hold4.resetNote();
          //}
          //if(currentBeat>=1){
            //scroll existing beats down the screen
            //press4.scrollNotes();
            //hold4.scrollNotes();
          //}
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<80){ //current measure
            //check what type of beat needs to be spawned
            if(measure1Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure1Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure1Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure1Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 80){ //next measure
            if(measure2Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure2Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure2Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure2Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 1
        
        //MEASURE 2
        else if(measure == 2){
        //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<144){ //current measure
            //check what type of beat needs to be spawned
            if(measure2Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure2Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure2Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure2Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 144){ //next measure
            if(measure3Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure3Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure3Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure3Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press4.display();
          hold4.display(); 
        }//end of measure 2
        
        //MEASURE 3
        else if(measure == 3){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<208){ //current measure
            //check what type of beat needs to be spawned
            if(measure3Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure3Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure3Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure3Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 208){ //next measure
            if(measure4Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure4Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure4Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure4Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press4.display();
          hold4.display(); 
        }//end of measure 3
        
        //MEASURE 4
        else if(measure == 4){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<272){ //current measure
            //check what type of beat needs to be spawned
            if(measure4Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure4Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure4Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure4Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 272){ //next measure
            if(measure5Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure5Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure5Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure5Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press4.display();
          hold4.display(); 
        }//end of measure 4
        
        //MEASURE 5
        else if(measure == 5){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<336){ //current measure
            //check what type of beat needs to be spawned
            if(measure5Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure5Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure5Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure5Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 336){ //next measure
            if(measure6Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure6Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure6Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure6Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
          press4.display();
          hold4.display(); 
        }//end of measure 5
        
        //MEASURE 6
        else if(measure == 6){
        //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<400){ //current measure
            //check what type of beat needs to be spawned
            if(measure6Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure6Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure6Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure6Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 400){ //next measure
            if(measure7Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure7Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure7Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure7Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 6
        
        //MEASURE 7
        else if(measure == 7){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<464){ //current measure
            //check what type of beat needs to be spawned
            if(measure7Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure7Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure7Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure7Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 464){ //next measure
            if(measure8Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure8Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure8Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure8Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 7
        
        //MEASURE 8
        else if(measure == 8){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<528){ //current measure
            //check what type of beat needs to be spawned
            if(measure8Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure8Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure8Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure8Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 528){ //next measure
            if(measure9Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure9Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure9Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure9Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 8
        
        //MEASURE 9
        else if(measure == 9){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<592){ //current measure
            //check what type of beat needs to be spawned
            if(measure9Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure9Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure9Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure9Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 592){ //next measure
            if(measure10Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure10Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure10Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure10Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 9
        
        //MEASURE 10
        else if(measure == 10){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<656){ //current measure
            //check what type of beat needs to be spawned
            if(measure10Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure10Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure10Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure10Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 656){ //next measure
            if(measure11Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure11Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure11Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure11Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 10
        
        //MEASURE 11
        else if(measure == 11){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<720){ //current measure
            //check what type of beat needs to be spawned
            if(measure11Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure11Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure11Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure11Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 720){ //next measure
            if(measure12Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure12Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure12Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure12Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 11
        
        //MEASURE 12
        else if(measure == 12){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<784){ //current measure
            //check what type of beat needs to be spawned
            if(measure12Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure12Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure12Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure12Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 784){ //next measure
            if(measure13Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure13Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure13Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure13Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 12
        
        //MEASURE 13
        else if(measure == 13){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<848){ //current measure
            //check what type of beat needs to be spawned
            if(measure13Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure13Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure13Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure13Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 848){ //next measure
            if(measure14Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure14Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure14Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure14Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 13
        
        //MEASURE 14
        else if(measure == 14){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<912){ //current measure
            //check what type of beat needs to be spawned
            if(measure14Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure14Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure14Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure14Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 912){ //next measure
            if(measure15Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure15Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure15Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure15Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 14
        
        //MEASURE 15
        else if(measure == 15){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<976){ //current measure
            //check what type of beat needs to be spawned
            if(measure15Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure15Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure15Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure15Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 976){ //next measure
            if(measure16Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure16Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure16Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure16Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 15
        
        //MEASURE 16
        else if(measure == 16){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1040){ //current measure
            //check what type of beat needs to be spawned
            if(measure16Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure16Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure16Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure16Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1040){ //next measure
            if(measure17Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure17Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure17Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure17Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 16
        
        //MEASURE 17
        else if(measure == 17){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1104){ //current measure
            //check what type of beat needs to be spawned
            if(measure17Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure17Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure17Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure17Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1104){ //next measure
            if(measure18Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure18Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure18Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure18Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 17
        
        //MEASURE 18
        else if(measure == 18){
          //check to see if any note arrays need to be reset
          press4.resetNote();
          hold4.resetNote();
           
          //scroll existing beats down the screen
          press4.scrollNotes();
          hold4.scrollNotes();
           
          //spawn new beats
          //check if the beats being checked are in this measure or next
          if((currentBeat+16)<1168){ //current measure
            //check what type of beat needs to be spawned
            if(measure18Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure18Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure18Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure18Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          else if((currentBeat+16)> 1168){ //next measure
            if(measure19Lane1Press[(currentBeat+16)] == true){ //press beat
              //spawn a press beat
              press4.spawnBeat();
            }
            else if(measure19Lane1Hold[(currentBeat+16)] == true){ //hold beat
              //check if this is beginning or end of beat
              if(measure19Lane1Hold[(currentBeat+15)] == false){
                //spawn the start of a hold beat
                hold4.spawnStartBeat();
              }
              else if (measure19Lane1Hold[currentBeat+17] == false){
                //spawn the end of a hold beat
                hold4.spawnEndBeat(); 
              }
              else{
                //spawn the middle of a hold beat
                hold4.spawnMidBeat(); 
              }  
            }
          }
          
          //display all beats
           press4.display();
           hold4.display(); 
        }//end of measure 18
      }//end of lane 4 conditional
      
      currentBeat+=1;
      if(measure == 1){ //measure 1 is longer, so needs a specific case
        measureFloat = (currentBeat/80)+1; //get current measure
        measure = int(measureFloat); //typecast to get whole number
      }
      else{
        measureFloat = (currentBeat/64)+1; //get current measure
        measure = int(measureFloat); //typecast to get whole number 
      }  
      println(currentBeat +" "+measure);
    }//end of songPlaying true conditional
    
    
  } //end of game screen conditional
 
 
  else if(pauseScreen == true){
   
  }
 
  else if(scoreScreen == true){
   
  }
}
