@IsTest
public class Demo_Apex_Test {
    @IsTest
    static void Test1(){
        Demo_Apex dp = new Demo_Apex();
        dp.Callme();
        System.assertEquals('Abishek', dp.Name);
        System.assertEquals('Chennai',dp.City);
    }
}