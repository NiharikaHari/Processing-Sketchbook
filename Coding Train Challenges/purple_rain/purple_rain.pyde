from drop import Drop

drops=[]
c1=color(213, 197, 238)
c2=color(65, 45, 95)

def setup():
    size(1000,600)
    drops = generateDrops()
    
    
def draw():
    if random(1)>0.96:
        background(c1)
    else:
        background(c2)
   
    drawTrees()
    drawHouse()
   
    for d in drops:
        stroke(124, 91, 143)
        d.fall()
        d.show()
    
def generateDrops():
    for i in range(1000):
        drops.append(Drop())
    return drops
    
def drawHouse():
    
    stroke(50, 35, 90,100)
    noFill()
    strokeWeight(500)
    curve(-width*0.5,height*0.8, 0,height*0.95, width*0.6,height*1.4, width,height*0.9)
    #quad(width*0.1,height*0.6,width*0.2,height*0.7,width*0.2,height*0.7,width*0.1+100,height*0.6)
    #quad(30,30,40,30,40,40,30,40)
    
    noStroke()
    fill(50, 35, 90,100)
    quad(width*0.17,height*0.55, width*0.27,height*0.65, width*0.25,height*0.75, width*0.15,height*0.65)
    fill(50, 35, 90,150)
    quad(width*0.2,height*0.65, width*0.3,height*0.75, width*0.28,height*0.85, width*0.18,height*0.75)
    fill(50, 35, 90,120)
    quad(width*0.17,height*0.55, width*0.2,height*0.65, width*0.18,height*0.75, width*0.15,height*0.65)
    fill(50, 35, 90,100)
    quad(width*0.27,height*0.65, width*0.3,height*0.75, width*0.28,height*0.85, width*0.25,height*0.75)
    fill(50, 35, 90,80)
    triangle(width*0.17,height*0.55, width*0.27,height*0.57, width*0.2,height*0.65)
    fill(50, 35, 90,110)
    triangle(width*0.2,height*0.65, width*0.27,height*0.57, width*0.3,height*0.75)
    triangle(width*0.3,height*0.75, width*0.27,height*0.57, width*0.27,height*0.65)
    triangle(width*0.27,height*0.65, width*0.27,height*0.57, width*0.17,height*0.55)
    
    stroke(50, 35, 90,150)
    strokeWeight(5)
    for i in range(50):
        line(width*random(0.17,0.27),height*random(0.55,0.79),width*0.23+random(-100,100),height*0.72+random(-100,100))
    
     
def drawTrees():
    stroke(50, 35, 90 ,50)
    strokeWeight(5)
    
    for i in range(100):
        x=width*0.6+10
        y=random(2*height/3,height)
        line(x,y,x+map(y,2*height/3,height,0,40),y+random(-1,10))
        line(x,y,x+map(y,2*height/3,height,0,-40),y+random(-1,10))
    
    stroke(50, 35, 90,30)
    strokeWeight(5)
    
    for i in range(100):
        x=width*0.8
        y=random(height*0.5,height)
        line(x,y,x+map(y,height*0.5,height,0,70),y+random(-1,10))
        line(x,y,x+map(y,height*0.5,height,0,-70),y+random(-1,10))
        
    stroke(50, 35, 90,20)
    strokeWeight(5)
    
    for i in range(100):
        x=width*0.71
        y=random(height*0.4,height)
        line(x,y,x+map(y,height*0.4,height,0,90),y+random(-1,10))
        line(x,y,x+map(y,height*0.4,height,0,-90),y+random(-1,10))
    
    
    
def drawTrees():
    stroke(50, 35, 90 ,50)
    strokeWeight(5)
    
    for i in range(100):
        x=width*0.6+10
        y=random(2*height/3,height)
        line(x,y,x+map(y,2*height/3,height,0,40),y+random(-1,10))
        line(x,y,x+map(y,2*height/3,height,0,-40),y+random(-1,10))
    
    stroke(50, 35, 90,30)
    strokeWeight(5)
    
    for i in range(100):
        x=width*0.8
        y=random(height*0.5,height)
        line(x,y,x+map(y,height*0.5,height,0,70),y+random(-1,10))
        line(x,y,x+map(y,height*0.5,height,0,-70),y+random(-1,10))
        
    stroke(50, 35, 90,20)
    strokeWeight(5)
    
    for i in range(100):
        x=width*0.71
        y=random(height*0.4,height)
        line(x,y,x+map(y,height*0.4,height,0,90),y+random(-1,10))
        line(x,y,x+map(y,height*0.4,height,0,-90),y+random(-1,10))
    
