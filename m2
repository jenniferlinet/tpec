Regular Programs
1.	Sorting: Comparator
import java.util.*;

class Player {
    String name;
    int score;

    Player(String name, int score) {
        this.name = name;
        this.score = score;
    }
}

class Checker implements Comparator<Player> {
    public int compare(Player p1, Player p2) {
 return p1.score != p2.score ? (p2.score - p1.score) : p1.name.compareTo(p2.name);
        	}
}
public class Solution {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int n = scan.nextInt();

        Player[] player = new Player[n];
        Checker checker = new Checker();
        
        for(int i = 0; i < n; i++){
            player[i] = new Player(scan.next(), scan.nextInt());
        }
        scan.close();

        Arrays.sort(player, checker);
        for(int i = 0; i < player.length; i++){
            System.out.printf("%s %s\n", player[i].name, player[i].score);
        }
    }
}
Sample Input
5
amy 100
david 100
heraldo 50
aakansha 75
aleksa 150

Sample  Output
aleksa 150
amy 100
david 100
aakansha 75
heraldo 50

2.Pattern-syntax-checker
import java.util.Scanner;
import java.util.regex.*;

class Solution{
	public static void main(String[] args){
		Scanner in = new Scanner(System.in);
		int testCases = Integer.parseInt(in.nextLine());
		while(testCases>0){
			String pattern = in.nextLine();
			try{
				Pattern pat=Pattern.compile(pattern);
				System.out.println("Valid");
			}catch(Exception e){System.out.println("Invalid");}
			testCases--;
		}
	}
}

Sample Input
3
([A-Z])(.+)
[AZ[a-z](a-z)
batcatpat(nat

Sample Output
Valid
Invalid
Invalid

Surprise Programs
1.	Java SHA-256
import java.io.*;
import java.util.*;
import java.security.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        Scanner scanner = new Scanner(System.in);
        String key = scanner.next();
        try{
        MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(key.getBytes());
        
        byte[] digest = md.digest();
        
        StringBuffer stringbuffer = new StringBuffer();
        for (byte b: digest)
        {  // needed to print it in hexadecimal format
            stringbuffer.append(String.format("%02x", b));
        }
        
        System.out.println(stringbuffer.toString());
        
        }
         catch (NoSuchAlgorithmException exception)
        {
            System.out.println(exception);
        }
        
    }
}

Sample Input 
HelloWorld
Sample Output 
872e4e50ce9990d8b041330c47c9ddd11bec6b503ae9386a99da8584e9bb12c4

2.	Java Regex 2 - Duplicate Words
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DuplicateWords {

    public static void main(String[] args) {

        String regex = "\\b(\\w+)(?:\\W+\\1\\b)+";
        Pattern p = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
        

        Scanner in = new Scanner(System.in);
        int numSentences = Integer.parseInt(in.nextLine());
        
        while (numSentences-- > 0) {
            String input = in.nextLine();
            
            Matcher m = p.matcher(input);
            
            // Check for subsequences of input that match the compiled pattern
            while (m.find()) {
                 input = input.replaceAll(m.group(), m.group(1));
            }
            
            // Prints the modified sentence.
            System.out.println(input);
        }
        
        in.close();
    }
}

Sample Input
5
Goodbye bye bye world world world
Sam went went to to to his business
Reya is is the the best player in eye eye game
in inthe
Hello hello Ab aB

Sample Output
Goodbye bye world
Sam went to his business
Reya is the best player in eye game
in inthe
Hello Ab
