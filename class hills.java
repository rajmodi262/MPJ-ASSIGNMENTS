class hills{
    void famousfood(){
        System.out.println("Famous food of this place is");
    }
void famousfor(){
        System.out.println("This place is famous for its");
    }
}

class shimla extends hills{
    void famousfood(){
        System.out.println("Shimla is famous for its siddu");
    }

    void famousfor(){
        System.out.println("Shimla is famous for its scenic beauty");
    }
}


class dharmashala extends hills{
    void famousfood(){
        System.out.println("Dharmashala is famous for its Momos");
    }

    void famousfor(){
        System.out.println("Dharmashala is famous for its Tibetian culture");
    }
}

class Gulmarg extends hills{
    void famousfood(){
        System.out.println("Gulmarg is famous for its Kahwa");
    }

    void famousfor(){
        System.out.println("Gulmarg is famous for its Snowboarding");
    }
}



public class Main {
    public static void main(String[] args) {
        hills h;
        h=new shimla();
        h.famousfood();
        h.famousfor();


         h=new dharmashala();
        h.famousfood();
        h.famousfor();


         h=new Gulmarg();
        h.famousfood();
        h.famousfor();

    }
}