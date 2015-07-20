/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datamining;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author Abas
 */
public class Datamining {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        double[] set={1,2,3,4,8,10,20,21,22,23,30,50,80,100,120,150,200,220};
     
        ArrayList<Double> prev_cluster=new ArrayList();
 
        double sum=0;
        boolean change=true;
        double smallest=0;
        int index=0;
        int c=0;
        Random rn=new Random();
    
        int k=0;
        System.out.println("Please input the number of clusters you want");
        Scanner sc=new Scanner(System.in);
        k=sc.nextInt();
        ArrayList<Double>[] group1 = (ArrayList<Double>[])new ArrayList[k];
      
        for( int i = 0; i < k; i++) {
              group1[i] = new ArrayList<>();
            }
      
        double[] centers=new double[k];
        
        centers[0]=rn.nextInt(100)+1;
   
         for(int j=1;j<k;j++)
        {
          centers[j]=centers[j-1]+(rn.nextInt(100)+1);
      
        }
        

        double[] distances=new double[k];
        
       
        while(change)
        {
        c=0;
        index=0;
        for(int j=0;j<group1.length;j++)
        {
         group1[j].clear();
    
        }
        for(int i=0;i<set.length;i++)
        {
          
            for(int j=0;j<k;j++)
            {
              
                distances[j]=Math.sqrt(Math.pow(centers[j]-set[i],2));
          
            }
          
            smallest=distances[0];
            for(int v=0;v<k;v++)
            {
                if(distances[v]<smallest)
                {
                    smallest=distances[v];
                    index=v;
                }
            }
            
             for(int j=0;j<k;j++)
            {
              
                distances[j]=0;
          
            }
          
            group1[index].add(set[i]);
 
        }

        if(prev_cluster==group1[0])
            change=false;
        else 
        {
            prev_cluster=group1[0];

            for(int y=0;y<centers.length;y++)
                centers[y]=0;
        
       
                for(int m=0;m<group1.length;m++)
                {
                    for(int j=0;j<group1[m].size();j++)
                    {
                        sum=(sum+group1[m].get(j));
                    }
                     if(sum!=0)
                    centers[c]=sum/group1[m].size();
                    else 
                        centers[c]=sum;
                     sum=0;

                    c++;
                }
        
        }
    }
        
            for(int j=0;j<group1.length;j++)
            {
                System.out.println("cluster "+j);
                for(int i=0;i<group1[j].size();i++)
                 System.out.println(group1[j].get(i));
                System.out.println();
            }
      
       
        
        }
    
}

