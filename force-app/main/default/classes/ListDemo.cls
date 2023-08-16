public class ListDemo {
    public static List<string>listOfElements()
    {
        List<string> s1 = new List<string>{'red','yellow','orange'};
            /*s1.add('red');
s1.add('yellow');
s1.add('rose');
s1.add(2,'Black');*/  //add(index,element)
            return s1;
    }
    public static void listOfData(){
        List<string> s2 = new List<string>();
        s2=listOfElements();
        system.debug('the values are -->'+ s2);
        s2.add('pink');
        s2.add('orange');
        s2.add('lavander');
        system.debug('colors are shown' +s2);
        List<string> d3 = new List<string>();
        d3 = s2.clone();
        system.debug('cloned vaklues are -->'+ d3);
        system.debug('the colned are listed'+s2.contains('pink'));
        system.debug('the equals are shown in:' + s2.equals(d3));
        system.debug('the colned are listed'+s2.get(4));
        system.debug('the colned are listed'+s2.indexOf('orange'));
        system.debug('Empty = ' + d3.isEmpty());
    }
    public static List<string>listofcolors(){
        List<String> colors = new String[3];
        colors[0] = 'Red';
        colors[1] = 'Blue';
        colors[2] = 'Green';
        system.debug('list of colors are ' + colors);
        return colors;
    }
    public static void listofdemo(){
        List<Account> acc_lst = new List<Account>();
        Account lst_acc = new Account();
        lst_acc.Name = 'Keerthi';
        lst_acc.Rating = 'Hot';
        acc_lst.add(lst_acc);
        system.debug('return the lsit of account' + lst_acc);
        insert acc_lst;
    }
}