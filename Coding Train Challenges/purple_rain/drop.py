#import random
class Drop:
    
    def __init__(self):
        #print("self")
        self.m=random(0,10)
        self.x=random(width+100)
        self.y=random(-height,0)
        #print("1")
        self.ySpeed=map(self.m,0,20,10,30)
        #print("2")
        self.len_=map(self.m,0,20,5,25)
        self.angle=map(self.m,0,20,-5,0)*random(0.1,1)
        self.wt=map(self.m,0,10,0.1,2)
        #print(m,x,y,ySpeed,len_)
        #m>20, a>0    m>0 , a>-2,2
        
    def show(self):
        #print(self.x,self.y)
        strokeWeight(self.wt)
        line(self.x,self.y,self.x+self.angle,self.y+self.len_)
        #line(self.x+2,self.y,self.x+self.angle,self.y+self.len_)
        #line(self.x-2,self.y,self.x+self.angle,self.y+self.len_)
        
        
    def fall(self):
        self.y+=self.ySpeed
        self.x+=self.angle
        if self.y>height:
            self.y=random(-height,0)
            self.x=random(width)
