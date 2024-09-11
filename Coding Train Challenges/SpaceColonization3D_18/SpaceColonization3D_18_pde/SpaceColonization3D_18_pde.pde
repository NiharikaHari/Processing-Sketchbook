Tree tree;

import peasy.*;

PeasyCam cam;
PImage img;


void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 1000);
  
  img = loadImage("trunk.jpg");
  textureMode(NORMAL); 

  tree = new Tree();
  //1st branch
  tree.branches = new ArrayList<Branch>();
  Branch root = new Branch(null, new PVector(0, height*0.7), new PVector(0, -1));
  tree.branches.add(root);
  tree.generateLeaves();
  tree.generateRoot();
}

void draw() {

  background(29, 38, 108 );
  lights();
  tree.showLeaves();
  tree.grow();
  tree.showBranches();
}

void keyPressed() {
  tree.branches = new ArrayList<Branch>();
  Branch root = new Branch(null, new PVector(0, height*0.7), new PVector(0, -1));
  tree.branches.add(root);
  tree.generateLeaves();
  tree.generateRoot();
}
