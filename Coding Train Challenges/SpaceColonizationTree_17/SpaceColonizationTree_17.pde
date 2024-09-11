Tree tree;


void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  //scale(2);

  tree = new Tree();
  //generate leaves
  tree.generateLeaves();
  tree.showLeaves();


  //1st branch
  tree.branches = new ArrayList<Branch>();
  Branch root = new Branch(null, new PVector(width/2, height), new PVector(0, -1));
  tree.branches.add(root);

  //generate root
  tree.generateRoot();

}

void draw() {

  background(0);
  // show leaves
  tree.showLeaves();

  //generate branches, grow
  tree.grow();

  //show branches
  tree.showBranches();
}

void mousePressed() {
    tree.generateLeaves();
    tree.branches = new ArrayList<Branch>();
    Branch root = new Branch(null, new PVector(width/2, height), new PVector(0, -1));
    tree.branches.add(root);
    tree.generateRoot();
}
