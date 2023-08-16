public class rectangle {
Decimal length, breadth;                     //variable defined
    public rectangle(Decimal l,Decimal b){         //Constructor
        length=l;
        breadth=b;
    }
    public void area(){                   //method
        Decimal l = length*breadth;
        system.debug('area =' + l);
    }
}