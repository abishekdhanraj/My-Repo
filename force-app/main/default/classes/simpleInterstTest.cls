@isTest
public class simpleInterstTest {
    @isTest static void testSimpleInterest() {
        Decimal p = 1000;
        Decimal r = 5;
        Decimal t = 2;
        simpleInterst si = new simpleInterst(p, r, t);
        si.principal();
        Decimal expectedSI = 25;
        System.assertEquals(expectedSI, -25);
    }
}