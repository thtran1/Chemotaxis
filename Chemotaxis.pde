 Bacteria a;
 void setup()   
 {     
 	size(500,500);
 	a = new Bacteria((int)(Math.random*501),(int)(Math.random*501));
 }   
 void draw()   
 {    
 	background(0);
 	a.move();
 	a.show();
 }  
 class Bacteria    
 {     
 	int xPos, yPos, sizeB;
 	Bacteria(int x, int y)
 	{
 		xPos = x;
 		yPos = y;
 		sizeB = (int)(Math.random*50);
 	}
 	void move()
 	{
 		xPos = xPos + (int)(Math.random*3)-1;
 		yPos = yPos + (int)(Math.random*3)-1;
 	}
 	void show()
 	{
 		fill(sizeB,sizeB,sizeB);
 		ellipse(xPos,yPos,sizeB,sizeB);
 	}
 }    