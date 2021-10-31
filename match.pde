
int n =5;
int m = 5;
int cw = width/n;
int ch = height/m;
int gap = 5;


int index =0;

int sel =-1;
int sec = -1;

int[] mycolor= new int[n*m];
boolean [] mystate = new boolean[n*m];

int timer =0;

PImage photo,photo1,photo2,photo3 ;



void mousePressed(){
  
  int p=(mouseY/ch)*n+ mouseX/cw;
  
  
  if ( sel< 0 )
  {
    
    
    if (mystate[p])
      sel =p; 
  }else if ( sec < 0 )
  {
     if (mystate[p])
     {
       sec =  p;
       timer =30;
     }
  }
  
  
}



void setup(){
  size(800,800);
  cw = width/n;
  ch = height/m;
   
  for( int i = 0 ; i < n*m ; i++){
    mycolor[i] =(int) random(3);
    mystate[i] =true;
    }
 
}


void draw(){
  
  
  background(255); 
  
  if ( timer > 0 )
  {
    if ( timer == 1)
    {
      
      if(mycolor[ sel] == mycolor[sec]){
        mystate[sec] =false;
        mystate[sel] = false;
      }
      
     sel =-1;
     sec=-1;
    }
    timer--; 
  }
  
  
  
index =0;
textSize(20);
for( int j=0; j < m ; j=j+1){
for( int i=0; i < n ; i=i+1){

  
 if ( index == sel || index== sec )
  {
    
    switch(mycolor[index]){
      case 0:
        fill(255,0,0);
        break;
      
     case 1:
        fill(0,255,0);
        break;
     case 2:
        fill(0,0,255);
        break;
    }
    
    
  }else
    fill(255);
  
  
  if ( mystate[index])
  {
 
        rect(i*cw+gap,j*ch+gap,cw-2*gap,ch-2*gap);
  }
  
  fill(0);
  
  //text(index, i*cw+cw/2,j*ch+ch/2);
  index++;
  }
}
}
