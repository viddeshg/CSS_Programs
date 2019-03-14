//Implementing Affine Cipher

import java.util.*;

class prac1
{
    public static void main(String args[])
    {
        Scanner scan = new Scanner(System.in);

        System.out.print("\nEnter Multiplicative Key (1-26):: ");
        int a = scan.nextInt();

        //finding multiplicative inverse
        int min = 1, flag = 1;
        while (flag == 1)
        {
            for (int i=1; i<26; i++)
            {
                if (((i*a)%26)==1)
                {
                    min = i;
                    flag = 0;
                }
            }
            if (flag == 1)
            {
                System.out.print("Invalid Multiplicative key. Enter again:: ");
                a = scan.nextInt();
            }
        }


        System.out.print("Multiplicative inverse:: "+min); 

        System.out.print("\nEnter Additive Key:: ");
        int b = scan.nextInt();
        scan.nextLine();


        Hashtable<Integer, Character> hash = new Hashtable<Integer, Character>(); 
        /* 
        assinging integer values to the alphabets
        from a=0 to z=25 in a hash table   
        */
        for(int i=0; i<26; i++)
        {
            char j = (char)(i+97); //ASCII value for a is 97
            hash.put(i,j); // 0,a -> 25,z
        }
        
        System.out.print("Enter text:: ");
        String input = scan.nextLine();
        /* 
        converting string into character array
        from "hello" -> ['h','e','l','l','o']
        */
        char[] input_char_array = input.toCharArray();

        /* 
        encrypting each character from input
        using formula (ax + b) % 26 and 
        storing it into an array.
        */
        int[] encr_array = new int[input.length()];
        for (int i = 0; i<input.length(); i++)
        {
            /* 
            ascii value of a -> 97 
            subtracting 97 to get values from a -> 0
            */
             int x = (int)input_char_array[i] - 97 ;            
             encr_array[i] = (a*x + b) % 26; // (ax + b) % 26
        }

        //printing encrypted characters stored in the array
        System.out.print("Encrypted text:: "); 
        for (int i = 0; i<input.length(); i++)
        {
            System.out.print(hash.get(encr_array[i])); 
        }

        //decrypting characters from encr_array
        System.out.print("\nDecrypted text:: ");
        for (int i =0; i<input.length(); i++)
        {            
            int x = encr_array[i];
            int decr = 0;
            //checking if (x-b) is negative
            if ( (x - b) < 0)
            {
                decr = (min * ((x-b) + 26)) % 26;
                System.out.print(hash.get(decr));
            }
            else 
            {
                decr = (min*(x-b)) % 26;
                System.out.print(hash.get(decr));
            }
        }
        System.out.println("\n");

        scan.close();
    }
}