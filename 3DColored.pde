
// help for triangles pos
int cols, rows;

//scaling the world
int scale = 20;
  int w = 2000;
  int h = 1600;
  
  
  // movment speed
  float flying =  0;
  
  
  float[][] map;



// 3D set up
void setup() {
  size(600,600,P3D);

  cols = w/scale;
  rows = h/scale;
  map = new float[cols][rows];

}

void draw() {
  
  
  // change the flying value to change scrolling speed
    flying -= 0.1;
    float yoff = flying;
    
    // stored z value to give a smooth 3D ground, using noise
  for(int y = 0; y<rows; y++){
   float xoff = 0;
 for( int x = 0; x < cols; x++){ 
  map[x][y] = map(noise(xoff,yoff), 0, 1, -100, 120);
  xoff += 0.2;
   
 }
 yoff+= 0.2;
 }
 
 background(0);
 stroke(255);
 noFill();
 
 
 // this part help to get a "3D GROUND" without flipping it over
 translate(width/2,height/2+50);
 rotateX(PI/3); 
 translate(-w/2,-h/2);
 
 for(int y = 0; y<rows-1; y++){
   beginShape(TRIANGLE_STRIP);
 
 for( int x = 0; x < cols; x++){ 
   vertex(x*scale,y*scale, map[x][y]);
   vertex(x*scale, (y+1)*scale, map[x][y+1]);
    // rect(x*scale,y*scale,scale,scale);
    if(map[x][y] < 0 || map[x][y+1] < 0){
      stroke(200, 255, 204);
      
     
    }else{
     stroke(0,255,255); 
    }
   }
   endShape();
 }
}
