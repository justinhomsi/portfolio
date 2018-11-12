/*
  Copyright 2006 by Sean Luke
  Licensed under the Academic Free License version 3.0
  See the file "LICENSE" for more information
*/

/*
 * File is a modified version of the original ECJ MultiValuedRegression Java class file.
 * File modified by: Matthew Burr, Justin Homsi as students at Edith Cowan University
 * For use in the Applied IT Project 2018
 */

package ec.app.BTEvolve;
import ec.util.*;
import jbt.model.core.ModelTask;
import rts.GameState;
import rts.PhysicalGameState;
import rts.units.Unit;
import ec.*;
import ec.gp.*;
import ec.simple.*;
import ec.app.BTEvolve.Converter;
import tests.ECJ_Tournament;





public class MyProblem extends GPProblem implements SimpleProblemForm
    {
    private static final long serialVersionUID = 1;
    public GameState gs = null;
    public Unit u = null;
    
    public void setup(final EvolutionState state,
        final Parameter base)
        {
        super.setup(state, base);
        
        // verify our input is the right class (or subclasses from it)
        if (!(input instanceof StringData))
            state.output.fatal("GPData class must subclass from " + StringData.class,
                base.push(P_DATA), null);
        }
        
    public void evaluate(final EvolutionState state, 
        final Individual ind, 
        final int subpopulation,
        final int threadnum)
        {
        if (!ind.evaluated && ((GPIndividual)ind).trees[0].child.expectedChildren() !=0)  // If an individual is not evaluated and the first node has expected child nodes
            {
            
            // Fitness stats
            double result = 0.0;
            
            // Unit stats
            double RedHP = 0.0;
            double BlueHP = 0.0;
            double TotalRedHP = 0.0;
            double TotalBlueHP = 0.0;
            double MaxHP = 0.0;
            
            // Get the current individuals tree
            String indTree = ((GPIndividual)ind).trees[0].child.makeLispTree();
            ModelTask tree = Converter.makeModelTask(indTree); // Make a ModelTask

            ECJ_Tournament ET = null;
            ET = new ECJ_Tournament(tree);

            try {

            	Parameter pathParam = new Parameter("path");
            	Parameter opponentParam = new Parameter("opponent");
            	Parameter tournamentParam = new Parameter("tournament");
            	String scenePath = state.parameters.getString(pathParam, null);
            	String sceneOpponent = state.parameters.getString(opponentParam, null);
            	String tournamentType = state.parameters.getString(tournamentParam, null);
            	
            	gs = getTournamentType(tournamentType, ET, scenePath, sceneOpponent);
                PhysicalGameState pgs = gs.getPhysicalGameState();
                
                // Variables for fitness calculation:
                TotalRedHP = ET.getStartingHP(1); // Red team HP
                TotalBlueHP = ET.getStartingHP(0); // Blue team HP
                MaxHP = ET.getMaxHP(); // Highest starting HP
                
                // Get/Set the remaining HP of the units
                for(Unit u : pgs.getUnits())
                {
                    if (u.getPlayer() == 1) // If red
                    {
                        RedHP = RedHP + u.getHitPoints();
                        
                    }
                    else // If blue
                        {
                        BlueHP = BlueHP + u.getHitPoints();
                        }
                }
                
            } catch (Exception e) {
                e.printStackTrace();
            }
                    
            
            for (int y=0;y<1;y++)
            {
	
            	result = (BlueHP-RedHP)+MaxHP;      
            }
            
            // Tiamat creates situations where there can be negative scores due to enemy workers being created
            if (result <= 0) 
            {
            	result = 0;
        	};
            

            // Calculate the fitness
            ((SimpleFitness)ind.fitness).setFitness(state, result, false);
//            f.hits = hits;
            ind.evaluated = true;
            
            }
        else {
			((SimpleFitness)ind.fitness).setFitness(state, 0.0, false);

          ind.evaluated = true;
        	
        }
    }
    
    public GameState getTournamentType(String tournament, ECJ_Tournament ET, String scenePath, String sceneOpponent) throws Exception {
    	GameState gs = null;
    	
		// Returns the desired tournament type based on user input as a GameState object
    	if(tournament.equals("tournament"))
    	{
    		gs = ET.tournamentFast(scenePath, sceneOpponent);
    	}
    	else if(tournament.equals("budget tournament"))
    	{
    		gs = ET.tournamentComputationBudget(scenePath, sceneOpponent);
    	}
    	else {gs = ET.tournamentFast(scenePath, sceneOpponent);}

    	return gs;
    }
    
    }

