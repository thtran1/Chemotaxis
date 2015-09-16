 Bacteria [] colony;
 Food a;
 int mX = 250;
 int mY = 250;
 void setup()   
 {     
 	size(500,500);
 	colony = new Bacteria[500];
 	for (int i = 0; i < colony.length; i++)
 	{
 		colony[i] = new Bacteria(250,250);
 	}
 }   
 void draw()   
 {    
 	background(0);
 	for (int i = 0; i < colony.length; i++)
 	{
 		colony[i].move();
 		colony[i].show();
 	}
 	a = new Food(mX,mY);
 	a.show();
 }  
 class Bacteria    
 {     
 	int xPos, yPos, sizeB,rCol,gCol,bCol;
 	Bacteria(int x, int y)
 	{
 		xPos = x;
 		yPos = y;
 		sizeB = (int)(Math.random()*6)+5;
 		rCol = (int)(Math.random()*257);
 		gCol = (int)(Math.random()*257);
 		bCol = (int)(Math.random()*257);
 	}
 	void move()
 	{
 		if (xPos < mX)
 		{
 			xPos = xPos + ((int)(Math.random()*2)-0); //0,1
 			yPos = yPos + ((int)(Math.random()*3)-1); //-1,0,1
 		}
 		else if (xPos > mX)
 		{
 			xPos = xPos + ((int)(Math.random()*2)-1); //-1,0
 			yPos = yPos + ((int)(Math.random()*3)-1); //-1,0,1
 		}
 		if (yPos < mY)
 		{
 			yPos = yPos + ((int)(Math.random()*2)-0); //0,1
 			xPos = xPos + ((int)(Math.random()*3)-1); //-1,0,1
 		}
 		else if (yPos > mY)
 		{
 			yPos = yPos + ((int)(Math.random()*2)-1); //-1,0
 			xPos = xPos + ((int)(Math.random()*3)-1); //-1,0,1
 		}
 		if (xPos == mX && yPos == mY)
 		{
 			int [] numbers = {-1,1};
 			xPos = (int)(Math.random()*501)+500*numbers[(int)(Math.random()*2)];
 			yPos = (int)(Math.random()*501)+500*numbers[(int)(Math.random()*2)];
 		}
 	}
 	void show()
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
 	void show()
 	{
 		stroke(255,255,255);
 		text("(" + (xPos+sizeF/2)/10 + "," + (yPos+sizeF/2)/10 + ")",xPos+sizeF/2, yPos-sizeF/2);
 		noStroke();
 		fill(255,255,0);
 		rect(xPos+sizeF/2,yPos+sizeF/2,sizeF,sizeF);
 	}
 }    
 void mousePressed()
 {
 	mX = mouseX;
 	mY = mouseY;
 }