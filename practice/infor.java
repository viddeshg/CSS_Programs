
import java.util.*;

class infor
{
    public static void main(String args[])
    {
        Hashtable<Integer,String> hash = new Hashtable<Integer, String>();
        List<Integer> temp = new ArrayList<Integer>();
        
        //initializing posting lists of two words
        int[] array1 = {1,2,4,7,8,10,16,19};
        int[] array2 = {2,3,4,9,10,11,16,17,18,19};

        //storing document-ids with their names in a hash table
        for (int i = 1; i < 20; i++)
        {
            hash.put(i,"Document"+i);
        }

        //displaying posting lists of two words
        System.out.print("\n'Brutus'"+"("+ array1.length +") ");
        for (int i=0; i< array1.length; i++)
        {
            System.out.print(" -> " + array1[i]);
        }
        System.out.print("\n\n'Cleopatra'"+"("+ array2.length +") ");
        for (int i=0; i< array2.length; i++)
        {
            System.out.print(" -> " + array2[i]);
        }

        System.out.print("\n\n'Brutus AND Cleopatra' ");

        int end = 0, i = 0, j =0;
        int last1 = array1.length - 1;
        int last2 = array2.length - 1;

        while (end==0)
        {       
           //break loop when we reach end of both the arrays 
            if( last1 == i)
            {
                if( last2 == j)
                {
                   end = 1;
                }
            }
            
           //add to temp array when same doc-id is found
            if (array1[i]==array2[j])
            {
                temp.add(array1[i]);
                System.out.print(" -> " + array1[i]);
            }

            if (array1[i] >= array2[j])
            {
                j++;
            }
            else 
            {
                i++;
            }

           //for ensuring array is in bound
            if (i > last1)
            {
                i = last1;
            }

            if (j > last2)
            {
                j = last2;
            }
        }
        
        int size = temp.size();
        int docid = 0;
        System.out.print("\n\n");
        for(int k = 0; k<size; k++)
        {
            docid = temp.get(k);
            System.out.print("-> " + hash.get(docid) + "\n");
        }
        System.out.print("\n");
        
    }
}