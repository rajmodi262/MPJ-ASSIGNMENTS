class shapes {
float area;
void calc( float r){
    float area=r*r; 
    System.out.println("Area of square is:"+area);
}

void calc(float l,float b){
  float  area=l*b;
    System.out.println("Area of rectangle is:"+area);
}

void calc(float b,float h, float s){
    area=0.5f*b*h;
System.out.println("Area of triangle is:"+area);
}

}






public class Main{
public static void main(String[] args) {
    shapes obj=new shapes();
  obj.calc(3,4);
  obj.calc(3,4,1);
  obj.calc(3);
  
}
    
}