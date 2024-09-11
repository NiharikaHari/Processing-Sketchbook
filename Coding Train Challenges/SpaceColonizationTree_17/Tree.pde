class Tree {
  ArrayList<Leaf> leaves;
  ArrayList<Branch> branches;
  int leafCount = 500;
  int minDist = 10;
  int maxDist = 200;

  void generateLeaves() {
    leaves = new ArrayList<Leaf>();
    for (int i=0; i<leafCount; ++i) {

      //float x = random(width);
      float x = (16 * pow(sin(i), 3))*15+width/2+random(-50, 50);

      float y = random(height*0.1,height*0.7);
      //float y = x*x/height;
      //float y = x*x/height+random(-100,100);
      //float y = (13*cos(i) - 5*cos(2*i) - 2*cos(3*i) - cos(4*i))*15+height/2+random(-50,50);

      println("x: "+x+" , y: "+y);

      PVector pos = new PVector(x, y);
      leaves.add(new Leaf(pos));
    }
  }

  void showLeaves() {
    for (int i=0; i<leaves.size(); ++i) {
      Leaf l = leaves.get(i);
      l.show();
    }
  }

  void showBranches() {
    for (int i=0; i<branches.size(); ++i) {
      branches.get(i).show();
    }
  }

  void generateRoot() {
    boolean found = false;
    Branch current = branches.get(0);
    while (!found) {
      // check distance of curr branch from all leaves
      for (int i=0; i<leaves.size(); ++i) {
        float dist = PVector.dist(current.pos, leaves.get(i).pos);
        if (dist < maxDist) {
          found = true;
        }
      }
      if (!found) {
        Branch next = current.generateNext();
        branches.add(next);
        current = next;
      }
    }
  }

  void grow() {

    // keep count of leaves close to a branch to average out the direction forces (as property of the branch

    // for each leaf, do the following:
    for (int i=0; i<leaves.size(); ++i) {
      // find the closest branch between min & max distance
      Branch closestBranch = null;
      float closestDist = 10000;
      Leaf currLeaf = leaves.get(i);
      for (int j=0; j<branches.size(); ++j) {
        Branch currBranch = branches.get(j);
        float d = PVector.dist(currLeaf.pos, currBranch.pos);
        if (d<minDist) {
          // if leaf is less than min dist away from any branch, remove leaf, make closest branch null
          currLeaf.reached = true;
          closestBranch = null;
          break;
        } else if (d>maxDist) {
          // if leaf is more than max dist away from any branch, ignore current branch for that leaf
        } else if (closestBranch == null || d<closestDist) {
          closestBranch = currBranch;
          closestDist = d;
        }
        // ..
      }
      // if there is a closest branch within min & max
      if (closestBranch != null) {
        // move the closest branch dir towards leaf ||
        PVector leafDir = PVector.sub(currLeaf.pos, closestBranch.pos);
        PVector newDir = PVector.add(closestBranch.dir, leafDir);
        if (closestBranch.count>0)
          newDir.div(closestBranch.count);
        newDir.normalize();
        newDir.mult(5);
        closestBranch.dir = newDir;
        closestBranch.count++;
      }
    }

    // delete reached leaves
    for (int i=leaves.size()-1; i>=0; --i) {
      Leaf currLeaf = leaves.get(i);
      if (currLeaf.reached) {
        leaves.remove(currLeaf);
      }
    }

    // from every branch that had a leaf closeby:
    for (int i=0; i<branches.size(); ++i) {
      Branch currBranch = branches.get(i);

      if (currBranch.count>0) {
        //we make a new branch (pos will be prev pos + dir)
        Branch newBranch = currBranch.generateNext();
        // reset the og branch to og dir & count
        currBranch.reset();
        // add the new branch to array each time
        branches.add(newBranch);
      }
    }
  }
}