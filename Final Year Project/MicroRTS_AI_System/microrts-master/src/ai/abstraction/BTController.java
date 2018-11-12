/**
 *
 * @author santi
 */

/*
 * File is a modified version of the LightRush Java class file.
 * File modified by: Matthew Burr, Justin Homsi as students at Edith Cowan University
 * For use in the Applied IT Project 2018
 */

package ai.abstraction;

// imports
import ai.abstraction.pathfinding.AStarPathFinding;
import ai.core.AI;
import ai.abstraction.pathfinding.PathFinding;
import ai.core.ParameterSpecification;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;



import rts.GameState;
import rts.PhysicalGameState;
import rts.Player;
import rts.PlayerAction;
import rts.units.*;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// BT IMPORTS
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// import IBTLibrary & protoBT
import jbt.execution.core.*;
import bts.btlibrary.*;
import jbt.model.core.*;
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// class definition
public class BTController extends AbstractionLayerAI {
	

	// Initialise some variables for units/utt
    Random r = new Random();
    protected UnitTypeTable utt;
    UnitType workerType;
    UnitType baseType;
    UnitType lightType;
    UnitType rangedType;
    UnitType heavyType;
    UnitType barracksType;
    static ModelTask treeTask = null;
    IBTLibrary btLibrary;
    IContext context;
    ModelTask upBT;
    ModelTask getBT;
    IBTExecutor btExecutor;
        
    
    // Strategy implemented by this class:
    // Use behaviour trees.
    public BTController(UnitTypeTable a_utt) {
        this(a_utt, new AStarPathFinding(), treeTask);
        //System.out.println("The tree inside BTController is: "+tree);
    }

    
    public BTController(UnitTypeTable a_utt, PathFinding a_pf, ModelTask tree) {
        super(a_pf); 
        treeTask = tree;
        btLibrary = new TTLibrary();
        upBT = btLibrary.update(treeTask);
        getBT = btLibrary.getBT("TestTree");
        context = ContextFactory.createContext(btLibrary);
        btExecutor = BTExecutorFactory.createBTExecutor(getBT, context);
        
        //System.out.println("The test tree passed to constructor is: "+tree);
        
        reset(a_utt);
    }
    
 
    
    
    public void reset(UnitTypeTable a_utt)  
    {
        utt = a_utt;
        workerType = utt.getUnitType("Worker");
        baseType = utt.getUnitType("Base");
        barracksType = utt.getUnitType("Barracks");
        lightType = utt.getUnitType("Light");
    }   
    

    public AI clone() {
        return new BTController(utt, pf, treeTask);
    }
    


    /*
        This is the main function of the AI. It is called at each game cycle with the most up to date game state and
        returns which actions the AI wants to execute in this cycle.
        The input parameters are:
        - player: the player that the AI controls (0 or 1)
        - gs: the current game state
        This method returns the actions to be sent to each of the units in the gamestate controlled by the player,
        packaged as a PlayerAction.
     */
    public PlayerAction getAction(int player, GameState gs) {
        PhysicalGameState pgs = gs.getPhysicalGameState();
        ArrayList<Unit> friendly = new ArrayList<Unit>();
        ArrayList<Unit> allFriendly = new ArrayList<Unit>();
        ArrayList<Unit> enemy = new ArrayList<Unit>();
        ArrayList<Unit> enemyBases = new ArrayList<Unit>();
        
        // For all units in the PGS add them into the necessary arrayList
        for (Unit u: pgs.getUnits())
        {
            // Add all friendly units to an array for use in MoveToClosestAlly
            if (u.getType().canAttack && !u.getType().canHarvest
                    && u.getPlayer() == player)
            {
                allFriendly.add(u);
            }

        	// If its friendly and can perform an action
        	if(u.getType().canAttack && !u.getType().canHarvest
                    && u.getPlayer() == player && gs.getActionAssignment(u) == null)
        	{
        		friendly.add(u);
        	}
        	// If its an enemy
        	else if(u.getType().canAttack
                    && u.getPlayer() != player)
        	{
        		enemy.add(u);
        	}
        	// If its an enemy base
        	else if(u.getPlayer() != player && u.getType() == baseType)
        	{
        		enemyBases.add(u);
        	}
        }
        
        // Set some context variables:
        context.setVariable("gsVar", gs); // gamestate
        context.setVariable("friendly", friendly);
        context.setVariable("allFriendly", allFriendly);
        context.setVariable("enemy", enemy);
        context.setVariable("enemyBases", enemyBases);
        context.setVariable("actions", null); // actions hashmap
        

//        System.out.println("LightRushAI for player " + player + " (cycle " + gs.getTime() + ")");
        
        // For all units who can perform an action.
        for(Unit f : friendly)
        {
            // If the tree has been completed successfully, restart
            if (btExecutor.getStatus() == jbt.execution.core.ExecutionTask.Status.FAILURE
            		|| btExecutor.getStatus() == jbt.execution.core.ExecutionTask.Status.SUCCESS)
            {
            	btExecutor = BTExecutorFactory.createBTExecutor(getBT, context);
            	
            }
            
            // Set the unit context variable to the current unit.
            context.setVariable("unitVar", f);

        	// Perform a BT tick
        	btExecutor.tick();
        	//System.out.println("The current status of the behaviour tree is: "+btExecutor.getStatus());
        	
        	// The unit has an individual action after the tick
        	if(context.getVariable("actions") != null)
        	{
            	//System.out.println("Adding unit actions to the hashmap");
            	// Get the actions hash
            	@SuppressWarnings("unchecked")
    			HashMap<Unit, AbstractAction> Actions = (HashMap<Unit, AbstractAction>) context.getVariable("actions");   

            	// Add the current units actions into the overall actions hash
            	actions.putAll(Actions);
        	}
        }


        return translateActions(player, gs);
    }

    
    @Override
    public List<ParameterSpecification> getParameters()
    {
        List<ParameterSpecification> parameters = new ArrayList<>();
        
        parameters.add(new ParameterSpecification("PathFinding", PathFinding.class, new AStarPathFinding()));

        return parameters;
    }    
    
}
