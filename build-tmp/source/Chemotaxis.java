import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Chemotaxis extends PApplet {

 Bacteria [] colony;
 Food a;
 int sizeS = 600; //size of canvas, use to modify: food initial position, bacteria initial position, bacteria spawning zone, black rectangle size[makes trails]
 int mX = sizeS/2;
 int mY = sizeS/2;
 int bScore = 0;
 float bScore1 = 0;
 public void setup()   
 {  
 	frameRate(60);   
 	size(sizeS,sizeS);
 	colony = new Bacteria[1000];
 	for (int i = 0; i < colony.length; i++)
 	{
 		colony[i] = new Bacteria(sizeS/2,sizeS/2);
 	}
 }   
 public void draw()   
 {    
 	bScore = 0;
 	bScore1 = bScore1-0.1666f;
 	fill(0,80);
 	rect(-100,-100,sizeS+100,sizeS+100);
 	for (int i = 0; i < colony.length; i++)
 	{
 		colony[i].move();
 		colony[i].show();
 	}
 	a = new Food(mX,mY);
 	a.show();
 	fill(255,255,0);
 	text("# of Bacteria on Screen: " + bScore, 25,25);
 	text(bScore1, sizeS-50, 25);
 }  
 class Bacteria    
 {     
 	int xPos, yPos, sizeB,rCol,gCol,bCol;
 	Bacteria(int x, int y)
 	{
 		xPos = x;
 		yPos = y;
 		sizeB = (int)(Math.random()*2)+10;
 		rCol = (int)(Math.random()*257);
 		gCol = (int)(Math.random()*257);
 		bCol = (int)(Math.random()*257);
 	}
 	public void move()
 	{
 		//Go to food
 		if (xPos < mX)
 		{
 			xPos = xPos + ((int)((Math.random()*2)-0.5f)); //0,1
 			yPos = yPos + ((int)(Math.random()*3)-1); //-1,0,1
 		}
 		else if (xPos > mX)
 		{
 			xPos = xPos + ((int)((Math.random()*2)-1.5f)); //-1,0
 			yPos = yPos + ((int)(Math.random()*3)-1); //-1,0,1
 		}
 		if (yPos < mY)
 		{
 			yPos = yPos + ((int)((Math.random()*2)-0.5f)); //0,1
 			xPos = xPos + ((int)(Math.random()*3)-1); //-1,0,1
 		}
 		else if (yPos > mY)
 		{
 			yPos = yPos + ((int)((Math.random()*2)-1.5f)); //-1,0
 			xPos = xPos + ((int)(Math.random()*3)-1); //-1,0,1
 		}
 		if (xPos == mX && yPos == mY)
 		{
 			int [] numbers = {-1,1};
 			xPos = (int)(Math.random()*sizeS)+sizeS*numbers[(int)(Math.random()*2)];
 			yPos = (int)(Math.random()*sizeS)+sizeS*numbers[(int)(Math.random()*2)];
 			bScore1 += 1;
 		}
 		if (xPos > 0 && xPos < sizeS && yPos > 0 && yPos < sizeS) //add one to "# of bac on screen"
 		{
 			bScore += 1;
 		}
 		if (xPos < 0 || xPos > sizeS || yPos < 0 || yPos > sizeS)
 		{
 			//bScore1 += 1;
 		}
 		//Move away from other bacteria ***NOT WORKING***
 		/*for (int i = 1; i <= 3; i++)
 		{
	 		if (get(xPos+(sizeB/2)+i,yPos) != 0)
	 		{
	 			xPos = xPos + ((int)(Math.random()*2)-1); //-1,0
	 		}
	 		else if (get(xPos+(sizeB/2)+i,yPos) == 0)
	 		{
	 			xPos = xPos;
	 		}
	 		if (get(xPos-(sizeB/2)+i,yPos) != 0)
	 		{
	 			xPos = xPos + ((int)(Math.random()*2)-0); //0,1
	 		}
	 		else if (get(xPos-(sizeB/2)+i,yPos) == 0)
	 		{
	 			xPos = xPos;
	 		}
	 		if (get(xPos,yPos+(sizeB/2)+i) != 0)
	 		{
	 			yPos = yPos + ((int)(Math.random()*2)-1); //-1,0
	 		}
	 		else if (get(xPos,yPos+(sizeB/2)+i) == 0)
	 		{
	 			yPos = yPos;
	 		}
	 		if (get(xPos,yPos-(sizeB/2)+i) != 0)
	 		{
	 			yPos = yPos + ((int)(Math.random()*2)-0); //0,1
	 		}
	 		else if (get(xPos,yPos-(sizeB/2)+i) == 0)
	 		{
	 			yPos = yPos;
	 		}
	 	}*/
 	}
 	public void show()
 	{
 		noStroke();
 		fill(rCol,gCol,bCol);
 		ellipse(xPos+sizeB/2,yPos+sizeB/2,sizeB,sizeB);
 	}
 }

 class Food
 {
 	int xPos,yPos, sizeF;
 	Food(int x, int y)
 	{
 		yPos = y;
 		xPos = x;
 		sizeF = 5;
 	}
 	public void show()
 	{
 		fill(255);
 		text("(" + (int)(xPos+sizeF/2)/10 + "," + (int)(yPos+sizeF/2)/10 + ")",xPos+sizeF/2, yPos-sizeF/2);
 		noStroke();
 		fill(255,255,0);
 		rect(xPos+sizeF/2,yPos+sizeF/2,sizeF,sizeF);
 	}
 }    
 public void mouseDragged()
 {
 	mX = mouseX;
 	mY = mouseY;
 }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Chemotaxis" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
