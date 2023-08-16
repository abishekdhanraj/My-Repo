public class simpleInterst {
    Decimal principal, rate, timeperiod;
    public simpleInterst(Decimal principal,Decimal rate,Decimal timeperiod){      // Constructor method 
        this.principal= principal;
        this.rate=rate;
        this.timeperiod=timeperiod;
    }
    public void principal(){
        Decimal Principal= 4, Rate= 32, Timeperiod=55;
        Decimal SI = (Principal*Rate*Timeperiod)/100;
        system.debug('SI'+ SI);
    }
}