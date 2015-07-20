/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package langton;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.util.Random;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 *
 * @author Abas
 */


public class Langton extends JPanel
{
    static int width=101;
    static int height=82;
    static JPanel panel = new JPanel(new GridLayout(width,height));
    static JButton[] array = new JButton[8282];
    static int current_pos=2000;
    static String orientation="left";

 
public static void main(String[] args)
{
    JFrame frame = new JFrame("Board");
   // frame.setLayout( new GridLayout());

     //  JPanel panel = new JPanel(new GridLayout(width,height));
        Color dcolor=Color.white;
        int k=0;
        int m=0;
        Color prev=Color.WHITE;
        
      
        String[] choices = { "All White", "All Black", "Checker board","Stripes","Random"};
        String input = (String) JOptionPane.showInputDialog(null, "Choose your board type",
        " ", JOptionPane.QUESTION_MESSAGE, null, choices, choices[1]);
        
        
        
        if(input=="Random")
        {
        
            Random rn = new Random();
            int rand=rn.nextInt(3)+1;
            input=choices[rand];
            System.out.println(input);
        }
        
        if(input=="All White")
            dcolor=Color.WHITE;
        else if(input=="All Black")
            dcolor=Color.black;
        
        
       
        
        
        for (int i = 0; i < array.length; i++) {
           array[i] = new JButton(""+i);
      //   array[i].setPreferredSize(new Dimension(20,20));
               array[i].setBackground(dcolor);
            

           // array[i].addActionListener(listener);
            panel.add(array[i]);
        }
        
        if(input=="Checker board")
            for (int i = 0; i < array.length; i++) {
                
            if(prev==Color.WHITE && m!=height)
            {
                array[i].setBackground(Color.BLACK);
                prev=Color.BLACK;
            }
            else
                if(prev==Color.BLACK && m!=height)
            {
                array[i].setBackground(Color.WHITE);
                prev=Color.WHITE;
            }
            
                
                    if(m==height)
                    {
                        array[i].setBackground(prev);
                        m=0;
                    }
                   m++;
            }
        
        if(input=="Stripes")
        {
            for (int i = 0; i < array.length; i++) {
              // k=i;
               if(k==height)
                {
                    for(int y=0;y<height;y++)
                    {
                        array[i].setBackground(Color.BLACK);
                        i++;
                    }
                      k=0;
                }
             
               k++;
               if(i%2==0)
                array[i].setBackground(Color.white);
               
               
            }
        
        }

        frame.add(panel);
        
    
      //  frame.add(panel);
        frame.setSize(1100, 700);
        frame.setLocationRelativeTo(null);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
        
        somefunction();

     
    
}
  static public void somefunction()
  {
        /* Random rn = new Random();
        //making sure the initial setting isnt full already
        int count=rn.nextInt(99)+1;
        for(int j=0;j<count;j++)
        {
        
            array[rn.nextInt(360)+1].setBackground(Color.GREEN);
        }
        somefunction();*/
      
      
      for(int i=0;i<500;i++)
      {
      
     
      
      
      if(array[current_pos].getBackground()==Color.BLACK)
      {
        //  System.out.println("We are here");
         // System.out.println(current_pos);
          
          
          if(orientation=="right")
          {
                  try {
              Thread.sleep(1000);                 //1000 milliseconds is one second.
             } catch(InterruptedException ex) {

             }
            //  current_pos++;
              orientation="up";
              array[current_pos].setBackground(Color.WHITE);
              current_pos-=height;
          }
          else
              if(orientation=="left")
              {
                      try {
              Thread.sleep(1000);                 //1000 milliseconds is one second.
             } catch(InterruptedException ex) {

             }
                  //current_pos--;
                  orientation="down";
                  array[current_pos].setBackground(Color.WHITE);
                  current_pos+=height;
              }
          else
           if(orientation=="up")
           {
                   try {
              Thread.sleep(1000);                 //1000 milliseconds is one second.
             } catch(InterruptedException ex) {

             }
               //current_pos+=18;
               orientation="left";
               array[current_pos].setBackground(Color.WHITE);
                current_pos--;
                // System.out.println(current_pos);
           }
          else
              if(orientation=="down")
              {
                      try {
              Thread.sleep(1000);                 //1000 milliseconds is one second.
             } catch(InterruptedException ex) {

             }
                  
                  orientation="right";
                  array[current_pos].setBackground(Color.WHITE);
                  current_pos++;
              }
          
          
       //   array[current_pos].setBackground(Color.GREEN);
      
      }
         
         
      
      
      
         if(array[current_pos].getBackground()==Color.WHITE)
      {
        //  System.out.println("We are here");
         // System.out.println(current_pos);
          
          
          if(orientation=="right")
          {
                  try {
              Thread.sleep(1000);                 //1000 milliseconds is one second.
             } catch(InterruptedException ex) {

             }
            //  current_pos++;
              orientation="down";
              array[current_pos].setBackground(Color.BLACK);
              current_pos+=height;
          }
          else
              if(orientation=="left")
              {
                      try {
              Thread.sleep(1000);                 //1000 milliseconds is one second.
             } catch(InterruptedException ex) {

             }
                  //current_pos--;
                  orientation="up";
                  array[current_pos].setBackground(Color.BLACK);
                  current_pos-=height;
              }
          else
           if(orientation=="up")
           {
                   try {
              Thread.sleep(1000);                 //1000 milliseconds is one second.
             } catch(InterruptedException ex) {

             }
               //current_pos+=18;
               orientation="right";
               array[current_pos].setBackground(Color.BLACK);
                current_pos++;
                // System.out.println(current_pos);
           }
          else
              if(orientation=="down")
              {
                      try {
              Thread.sleep(1000);                 //1000 milliseconds is one second.
             } catch(InterruptedException ex) {

             }
                  
                  orientation="left";
                  array[current_pos].setBackground(Color.BLACK);
                  current_pos--;
              }
          
          
       //   array[current_pos].setBackground(Color.GREEN);
      
      }
      
      
      
  
      }
  }
 
}