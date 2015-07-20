/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package artificiallife;

/**
 *
 * @author Abas
 */
public class Position {
    
    private double x;
    private double y;
    void Position()
    {
        this.x=0;
        this.y=0;
    
    }

    /**
     * @return the x
     */
    
    
    public Position getPosition() {
       // Position n=new Position();
        return new Position();
    }
    
     public Position setPosition(double x,double y) {
   
        this.x=x;
        this.y=y;
        return this;
    }
    
    
    
    public void show()
    {
        System.out.println(this.x +"  "+this.y);
    
    }

    /**
     * @param x the x to set
     */


 
    
    
    
}
