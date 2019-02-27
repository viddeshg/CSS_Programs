//Implementing Affine Cipher

import java.util.*;

class random
{
    public static void main(String args[])
    {
        Scanner scan = new Scanner(System.in);
        int count = 0;
        int[] arr = {1,2,3,4,5,6,22,12};
        System.out.print("number: ");
        int n = scan.nextInt();
       for (int i =0; i< arr.length; i++)
       {
            if (arr[i] > 2*n)
            {
                count = count + 1;
            }
       }

       System.out.println(count);
       scan.close();
    }
}