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
public class Particle {
  
    void Particle()
    {
      //  position=position.getPosition();
        
        velocity=0;
        personal_best=0;
        group_best=0;
    }
    
    
    Position position=new Position();
    double velocity;
    double personal_best;
    double group_best;
    
    public double getVelocity()
    {
        return this.velocity;
    }
    
    public double getPersonalBest()
    {
        return this.personal_best;
    }
    
    public void setVelocity(double x)
    {
        this.velocity=x;
        if(this.velocity>this.personal_best)
            personal_best=this.velocity;
    }
    
     public void setGroupBest(int x)
    {
        this.group_best=x;
    }
    
    public void show()
    {
       // position.show();
        System.out.println("velocities are : "+velocity);
    
    }
    
}
