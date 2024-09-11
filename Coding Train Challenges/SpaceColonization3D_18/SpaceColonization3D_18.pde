Tree tree;
boolean circleMade = false;
boolean leavesGenerated = false;
boolean rootGenerated = false;
//int p = 100+width*100;


void setup() {
  //loadPixels();
  size(800, 800);
  background(0);
  //println("setup");
  //println(red(pixels[p])+" , "+blue(pixels[p])+ " , "+green(pixels[p]));
  stroke(255);
  //scale(2);

  tree = new Tree();
  //generate leaves
  //tree.generateLeaves();
  //tree.showLeaves();


  //1st branch
  //tree.branches = new ArrayList<Branch>();
  //Branch root = new Branch(null, new PVector(width/2, height), new PVector(0, -1));
  //tree.branches.add(root);

  //generate root
  //tree.generateRoot();
  //noLoop();
}

void draw() {
  loadPixels();

  //println("draw 1");
  //println(red(pixels[p])+" , "+blue(pixels[p])+ " , "+green(pixels[p]));

  //background(200);
  //println("draw 2");
  //println(red(pixels[p])+" , "+blue(pixels[p])+ " , "+green(pixels[p]));


  background(0);

  // draw a circle
  noStroke();
  fill(223, 106, 106);
  ellipse(width/2, height/2, width*0.9, height*0.9);

  if (circleMade) {
    if (!leavesGenerated) {
      tree.generateLeaves();
      leavesGenerated=true;
    } else {
      if (!rootGenerated) {
        tree.branches = new ArrayList<Branch>();
        Branch root = new Branch(null, new PVector(width/2, height-80), new PVector(0, -1));
        tree.branches.add(root);

        //generate root
        tree.generateRoot();
        rootGenerated = true;
      }
      //generate branches, grow
      tree.grow();

      //show branches
      tree.showBranches();
    }
    // show leaves
    tree.showLeaves();
  } else
    circleMade = true;
}

void mousePressed() {
  tree.maxDist = mouseX;
  tree.generateLeaves();
  tree.branches = new ArrayList<Branch>();
  Branch root = new Branch(null, new PVector(width/2, height-80), new PVector(0, -1));
  tree.branches.add(root);
  tree.generateRoot();
}
