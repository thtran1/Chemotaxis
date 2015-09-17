 Bacteria [] colony;
 Food a;
 int sizeS = 1000; //size of canvas, use to modify: food initial position, bacteria initial position, bacteria spawning zone, black rectangle size[makes trails]
 int mX = sizeS/2;
 int mY = sizeS/2;
 void setup()   
 {     
 	size(sizeS,sizeS);
 	colony = new Bacteria[1000];
 	for (int i = 0; i < colony.length; i++)
 	{
 		colony[i] = new Bacteria(sizeS/2,sizeS/2);
 	}
 }   
 void draw()   
 {    
 	fill(0,80);
 	rect(-100,-100,sizeS+100,sizeS+100);
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
 		sizeB = (int)(Math.random()*2)+10;
 		rCol = (int)(Math.random()*257);
 		gCol = (int)(Math.random()*257);
 		bCol = (int)(Math.random()*257);
 	}
 	void move()
 	{
 		//Go to food
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
 			xPos = (int)(Math.random()*sizeS)+sizeS*numbers[(int)(Math.random()*2)];
 			yPos = (int)(Math.random()*sizeS)+sizeS*numbers[(int)(Math.random()*2)];
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
 		text("(" + (int)(xPos+sizeF/2)/10 + "," + (int)(yPos+sizeF/2)/10 + ")",xPos+sizeF/2, yPos-sizeF/2);
 		noStroke();
 		fill(255,255,0);
 		rect(xPos+sizeF/2,yPos+sizeF/2,sizeF,sizeF);
 	}
 }    
 void mouseMoved()
 {
 	mX = mouseX;
 	mY = mouseY;
 }