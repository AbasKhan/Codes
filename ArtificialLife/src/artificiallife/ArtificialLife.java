/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package artificiallife;

import java.util.Arrays;
import java.util.Random;

/**
 *
 * @author Abas
 */
public class ArtificialLife {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
       Random rn=new Random();
       double velocity=0;
       double Alpha=0;
       double Gamma=0;
       Particle[] p=new Particle[5];
       
       for(int i=0;i<p.length;i++)
       {
           p[i]=new Particle();
           p[i].setVelocity(rn.nextInt(10)+1);
           
       }
       
      Alpha=rn.nextDouble();
      Gamma=rn.nextDouble();
       for(int j=0;j<p.length;j++)
       {
//           Arrays.sort(p);
           p[j].group_best=group_best(p,j);
           velocity=p[j].getVelocity() + Alpha*p[j].personal_best + Gamma*p[j].group_best;
          // System.out.println("personal best "+p[0].personal_best);
           p[j].setVelocity(velocity);
           
           p[j].show();
       }

        
       
    }
        static double group_best(Particle[] p,int index)
        {
         //   int v=0;
            int prev=0;
            int next=0;
            double[] a=new double[3];
            if(index==0)
                prev=p.length-1;
            else
                prev=index-1;
            
            if(index==p.length-1)
                next=0;
            else
                next=index+1;
      
            a[0]=p[prev].getVelocity();
            a[1]=p[index].getVelocity();
            a[2]=p[next].getVelocity();
            Arrays.sort(a);
            
            return a[a.length-1];
        }
}
