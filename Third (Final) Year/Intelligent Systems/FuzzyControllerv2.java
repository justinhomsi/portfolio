/*
 * FuzzyControllerv2.java
 *
 * Created on 05 October 2017
 *
 */

package battle.saucers.controllers;

import au.edu.ecu.is.fuzzy.*;
import battle.Constants;
import static battle.Constants.SAUCER_MAX_POWER;
import static battle.Constants.SAUCER_MAX_SPEED;
import static battle.Constants.SAUCER_MIN_SPEED;
import static battle.Constants.SAUCER_START_ENERGY;
import static battle.Constants.STARFIELD_WIDTH;
import battle.saucers.Saucer;
import battle.sensors.SensorData;
import java.awt.Color;
import java.util.ArrayList;

public class FuzzyControllerv2 implements SaucerController, Constants
{
    private static final String NAME = "Sanic";
    private static final Color BASE = Color.darkGray;
    private static final Color ARROW = Color.magenta;
    private static final int TIME_BETWEEN_TURNS = 5;

    
    private SensorData target;
    private SensorData nearestBlast;
    private double opponentEnergy;
    private double opponentDirection;
    private double opponentDistance;
    private double energy;
    private double count;
    private double avEnergy;
    private boolean dodgeBlast = false;
    private boolean powerUpOn;
    private double nearestPowerUpDirection;
    private double powerDist;
    private double timeUntilNextTurn = TIME_BETWEEN_TURNS;

    // Declare your FuzzyVariables and rule set(s) here
    private SugenoRuleSet rules;
    
    private FuzzyVariable distance;
    private FuzzyVariable energyDifference;   
    private FuzzyVariable firePower;
    private FuzzyVariable speed;
    private FuzzyVariable turnDirection;
    private FuzzyVariable direction;
    private FuzzyVariable powerUpDistance;
    private FuzzyVariable averageEnergy;
    private FuzzyVariable powerSpeed;
    
    
    public FuzzyControllerv2() throws FuzzyException
    {
        // Create your FuzzyVariables and rule set(s) here
        final double maxDistance =
                Math.sqrt(Constants.STARFIELD_WIDTH*Constants.STARFIELD_WIDTH+
                    Constants.STARFIELD_HEIGHT*Constants.STARFIELD_HEIGHT);
        final double veryCloseD = 0.08*maxDistance;
        final double closeD = 0.16*maxDistance;
        final double lowMedD = 0.2*maxDistance;
        final double highMedD = 0.3*maxDistance;
        final double farD = 0.4*maxDistance;
        final double veryFarD = 0.5*maxDistance;
        distance = new FuzzyVariable("distance to target", "m", 0.0, maxDistance, 2);
        FuzzySet veryClose = new FuzzySet("very close", 0.0, 0.0, veryCloseD, closeD);
        FuzzySet close = new FuzzySet("close", veryCloseD, closeD, closeD, lowMedD);
        FuzzySet lowMed = new FuzzySet("low-med", closeD, lowMedD, lowMedD, highMedD);
        FuzzySet highMed = new FuzzySet("high-med", lowMedD, highMedD, highMedD, farD);
        FuzzySet far = new FuzzySet("far", highMedD, farD, farD, veryFarD);
        FuzzySet veryFar = new FuzzySet("very far", farD, veryFarD, maxDistance, maxDistance);
        distance.add(veryClose);
        distance.add(close);
        distance.add(lowMed);
        distance.add(highMed);
        distance.add(far);
        distance.add(veryFar);
        //distance.display();
        
        // create fuzzy variable for energy difference
        final double maxDiff = Saucer.SAUCER_START_ENERGY;
        final double minDiff = -maxDiff;
        final double diffRamp1 = 0.1*maxDiff;
        final double diffRamp2 = 0.2*maxDiff;
        final double diffRamp3 = -0.2*maxDiff;
        final double diffRamp4 = -0.1*maxDiff;
        energyDifference = new FuzzyVariable("energy difference", "J", minDiff, maxDiff, 2);
        FuzzySet losing = new FuzzySet("losing", minDiff, minDiff, diffRamp3, diffRamp4);
        FuzzySet even = new FuzzySet("even", diffRamp3, 0.0, 0.0, diffRamp2);
        FuzzySet winning = new FuzzySet("winning", diffRamp1, diffRamp2, maxDiff, maxDiff);
        energyDifference.add(losing);
        energyDifference.add(even);
        energyDifference.add(winning);
        energyDifference.display();
        
        // create fuzzy variable for direction
        direction = new FuzzyVariable("Direction", "Degrees", -360, 360, 2);
        FuzzySet right = new FuzzySet("Right - -360 to -20", -360, -360, -20, -20);
        FuzzySet left = new FuzzySet("Left - 20 to 360", 20 ,20 ,360, 360);
        FuzzySet straight = new FuzzySet("Straight - 0",-20 ,0.0 ,0.0 ,20); 
        
        direction.add(left);
        direction.add(right);
        direction.add(straight);
        direction.display();
        
       
        // create fuzzy variable for fire power
        final double maxPower = Saucer.SAUCER_MAX_POWER;
        final double midPower = maxPower/2.0;
        final double lowPower = maxPower/5.0;
        firePower = new FuzzyVariable("fire power", "J", -maxPower, maxPower, 2);
        firePower.display();
        
        // create fuzzy variable for speed
        final double maxSpeed = Saucer.SAUCER_MAX_SPEED;
        final double midSpeed = Saucer.SAUCER_MAX_SPEED*0.5;
        final double lowSpeed = Saucer.SAUCER_MIN_SPEED;
        speed = new FuzzyVariable("speed", "parsecs", Saucer.SAUCER_MIN_SPEED, Saucer.SAUCER_MAX_SPEED,2);
        //speed.display();
        
        //create fuzzy variable turnDirection
        turnDirection = new FuzzyVariable ("Turn Direction","Degrees",-360,360,0);
        //turnDirection.display();
        
        // create fuzzy variable for powerSpeed
        final double maxPowerSpeed = Saucer.SAUCER_MAX_SPEED;
        final double midPowerSpeed = Saucer.SAUCER_MAX_SPEED*0.5;
        final double lowPowerSpeed = Saucer.SAUCER_MIN_SPEED;
        powerSpeed = new FuzzyVariable("powerSpeed", "parsecs", Saucer.SAUCER_MIN_SPEED, Saucer.SAUCER_MAX_SPEED,2);
        
        // create fuzzy variable powerUpDistance
        final double maxPowerDistance =
                Math.sqrt(Constants.STARFIELD_WIDTH*Constants.STARFIELD_WIDTH+
                    Constants.STARFIELD_HEIGHT*Constants.STARFIELD_HEIGHT);
        final double closeDist = 0.10*maxPowerDistance;
        final double medDist = 0.25*maxPowerDistance;
        final double farDist = 0.50*maxPowerDistance;
        powerUpDistance = new FuzzyVariable ("PowerUp Distance","m", 0.0, maxPowerDistance,0);
        FuzzySet closePowerUp = new FuzzySet("close", 0.0, 0.0, closeDist, medDist);
        FuzzySet medPowerUp = new FuzzySet("medium", closeDist, medDist, medDist, farDist);
        FuzzySet farPowerUp = new FuzzySet("far", medDist, farDist, maxPowerDistance, maxPowerDistance);
        powerUpDistance.add(closePowerUp);
        powerUpDistance.add(medPowerUp);
        powerUpDistance.add(farPowerUp);
        
        // create fuzzy variable averageEnergy
        
        final double maxAvDiff = Saucer.SAUCER_START_ENERGY;
        final double minAvDiff = -maxAvDiff;
        final double diffAv1 = 0.1*maxAvDiff;
        final double diffAv2 = 0.2*maxAvDiff;
        final double diffAv3 = -0.2*maxAvDiff;
        final double diffAv4 = -0.1*maxAvDiff;
        averageEnergy = new FuzzyVariable ("Average Energy Difference","J",minAvDiff,maxAvDiff,0);
        FuzzySet losingAv = new FuzzySet("losing", minAvDiff, minAvDiff, diffAv3, diffAv4);
        FuzzySet evenAv = new FuzzySet("even", diffAv3, 0.0, 0.0, diffAv2);
        FuzzySet winningAv = new FuzzySet("winning", diffAv1, diffAv2, maxAvDiff, maxAvDiff);
        averageEnergy.add(losingAv);
        averageEnergy.add(evenAv);
        averageEnergy.add(winningAv);
        averageEnergy.display();
        
        // now construct a matrix of fuzzy sugeno-type rules
        rules = new SugenoRuleSet();
        
        FuzzySet[] averageSets = {losingAv, evenAv, winningAv};
        FuzzySet[] powerUpDistSets = {closePowerUp, medPowerUp, farPowerUp};
        FuzzySet[] distanceSets = {veryClose, close, lowMed, highMed, far, veryFar};
        FuzzySet[] diffSets = {losing, even, winning};
        FuzzySet[] eDirectionSets = {right, left, straight};
        
        double[][] powerUpSpeedLevel = 
        {
            // losingAv, evenAv, winningAv
            {maxPowerSpeed, maxPowerSpeed, maxPowerSpeed}, // closePowerUp
            {maxPowerSpeed, maxPowerSpeed, maxPowerSpeed}, // medPowerUp
            {maxPowerSpeed, maxPowerSpeed, maxPowerSpeed} // farPowerUp
        };
        double[][] firePowerLevels =
        {
               // losing   even     winning
            {midPower, maxPower, maxPower}, // very close
            {0.0, 0.0,0.0}, // close
            {0.0, 0.0, 0.0},  // low med
            {0.0, 0.0, 0.0}, // high med
            {0.0, 0.0, 0.0}, // far
            {0.0, 0.0, 0.0}  // very far
                 
        };
        
        // speed levels
         double[][] speedLevels =
        {
            // speed
               // losing   even     winning
            {maxSpeed, maxSpeed, maxSpeed}, // very close
            {maxSpeed, maxSpeed, maxSpeed}, // close
            {maxSpeed, maxSpeed, maxSpeed},  // low med
            {maxSpeed, maxSpeed, maxSpeed}, // high med
            {maxSpeed, maxSpeed, maxSpeed}, // far
            {maxSpeed, maxSpeed, maxSpeed}  // very far
        
                
        };
        
        //Turn Ammount
        double[][] turnAmount =
        {
            // losing   even     winning
            {-5, -5, -5}, //right
            {5, 5, 5}, //left
            {0.0, 0.0, 0.0} //straight
                
        };     
        
        rules.addRuleMatrix(
                powerUpDistance, powerUpDistSets,
                averageEnergy, averageSets,
                powerSpeed, powerUpSpeedLevel);
        
        rules.addRuleMatrix(
                distance, distanceSets,
                energyDifference, diffSets,
                firePower, firePowerLevels);
        
        
        rules.addRuleMatrix(
                distance, distanceSets,
                energyDifference, diffSets,
                speed, speedLevels);
        
        rules.addRuleMatrix(
                direction, eDirectionSets,
                energyDifference, diffSets,
                turnDirection, turnAmount);

        // use "pause" to see which rules are firing etc
        // comment this out this when not needed
        rules.displayRuleMatrix(
           distance, distanceSets,
           energyDifference, diffSets,
           firePower);
        rules.displayRuleMatrix(
           direction, eDirectionSets,
           energyDifference, diffSets,
           turnDirection);
        
    }
   
        
    public void senseSaucers(ArrayList<SensorData> data) throws FuzzyVariableOutOfRangeException 
    {
        // This is where you get told about enemies
        // save whatever information you need in suitable member variables
        
        // find the closest enemy to target - this will be used later in getTarget()
        if(data.size() > 0)
        {
            double closest = data.get(0).distance;
            target = data.get(0);
            for(SensorData thisData: data)
            {
                avEnergy = avEnergy + thisData.energy;
                count = count + 1;
                if(thisData.distance <= closest)
                {
                    // set target info
                    target = thisData;
                    opponentDirection = target.direction;
                    opponentEnergy = target.energy;
                    opponentDistance = target.distance;
                    closest = thisData.distance;
                    
                }
            }
        }
        else
        {
            target = null;
            // placeholders
            opponentDirection = 0.0;
            opponentEnergy = 10000;
            final double maxDistance =
                Math.sqrt(Constants.STARFIELD_WIDTH*Constants.STARFIELD_WIDTH+
                Constants.STARFIELD_HEIGHT*Constants.STARFIELD_HEIGHT);
   
            final double distRamp3 = 0.2*maxDistance;
            opponentDistance = distRamp3;
        }
        
    }

    public void sensePowerUps(ArrayList<SensorData> data) 
    {
        // This is where you get told about power-ups
        // save whatever information you need in suitable member variables
        
        // find the closest powerUp
        powerUpOn = data.size() > 0;
        if(powerUpOn)
        {
            double closest = data.get(0).distance;
            nearestPowerUpDirection = data.get(0).direction;
            for(SensorData thisData: data)
            {
                if(thisData.distance < closest)
                {
                    nearestPowerUpDirection = thisData.direction;
                    closest = thisData.distance;
                    powerDist = closest;
                }
            }
        }
    }
    
    private ArrayList<SensorData> blasts;

     public void senseBlasts(ArrayList<SensorData> data) 
    {
        blasts = data;
        
        // This is where you get told about photon blasts
        // save whatever information you need in suitable member variables
        
        // find the closest blast
        if(data.size() > 0)
        {
            double closest = data.get(0).distance;
            nearestBlast = data.get(0);
            for(SensorData thisData: data)
            {
                if(thisData.distance < closest)
                {
                    nearestBlast = thisData;
                    closest = thisData.distance;
                }
            }
            
            dodgeBlast = closest < STARFIELD_WIDTH/10;            
        }
        else
        {
            nearestBlast = null;
            dodgeBlast = false;
        }
    }
     
    public void senseEnergy(double energy) throws FuzzyException
    {
        // This is where you get told what your own energy level is
        // Save this information if you need it
        
       energy = this.energy;
 
       // clear out previous values
       rules.clearVariables();

       // Set fuzzy input variable values
       distance.setValue(opponentDistance);
       energyDifference.setValue(energy-opponentEnergy);
       powerUpDistance.setValue(powerDist); 
 
       if (target == null)
       {
           averageEnergy.setValue(0);
       }
       else
       {
           averageEnergy.setValue(avEnergy/count);
       }
       
       // clear average energy
       count = 0;
       avEnergy = 0;
       
       direction.setValue(opponentDirection);


       // fire rules to compute power
       rules.update();
       
    }
    
    // methods below determine what your saucer does

    // gets closest target if there is one
    public SensorData getTarget() 
    {        
        if(target != null)
        {
            return target;
        }
        else
        {
            return null;
        }
    }

    // gets firepower from fuzzy variable
    public double getFirePower() throws Exception
    {
        if (target != null)
        {
           
            
            return firePower.getValue();
        }
        else
        {
            // don't fire
            firePower.setValue(0.0);
            return firePower.getValue();
        }

    }
    
    // turns a random amount between -3 and +3 degrees each turn
    // or heads for the nearest powerUp
    public double getTurn() throws Exception
    {
        if(dodgeBlast)
        {
            timeUntilNextTurn = TIME_BETWEEN_TURNS;
            return this.nearestBlast.direction + 135; // run away at an angle
        }
        else if(powerUpOn) // go for the power up
        {
            timeUntilNextTurn = TIME_BETWEEN_TURNS;
            return nearestPowerUpDirection;
        }
        else
        {
            timeUntilNextTurn--;
            if(timeUntilNextTurn == 0)
            {
                timeUntilNextTurn = TIME_BETWEEN_TURNS;
                return turnDirection.getValue();
            }
            else
            {
                return 0.0;
            }
        }
    }
    
    public double getSpeed() throws Exception
    {
        if(powerUpOn)
        {
            return powerSpeed.getValue();
        }
        else 
        {
            return speed.getValue();
            
        }
    }
    
    public boolean getShields()
    {
        return false;
    }
    
    public String getName()
    {
        return NAME;
    }
    
    public Color getBaseColor()
    {
        return BASE;
    }
    
    public Color getTurretColor()
    {
        return ARROW;
    }
}
