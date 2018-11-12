/*
 * File created by: Matthew Burr as students at Edith Cowan University
 * For use in the Applied IT Project 2018
 */

package ec.app.BTEvolve;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;

import ec.Evolve;
import jbt.model.core.ModelTask;
import tests.ECJ_Tournament;

public class MySecondThread extends Thread 
{
	File[] files;
	String mapPath;
	String opponentName;
	static ArrayList<String> trees = new ArrayList<String>();
	static ArrayList<ModelTask> tasks = new ArrayList<ModelTask>();
	
	MySecondThread(File[] files, String mapPath, String opponentName){
		this.files = files;
		this.mapPath = mapPath;
		this.opponentName = opponentName;
	}
	
	@Override
	public void run() {
		findTrees(files);
		makeTasks(trees);
		runTasks(tasks, mapPath, opponentName);
		reset();
		MyThread.currentThread().interrupt();
		
	}
	public void reset() {
		trees.clear();
		tasks.clear();
		files = new File[] {};
	}
	
	public void findTrees(File[] files) {
		String goal = "Best Individual of Run:";
		for (File f : files)
		{
			String tree = " ";
			try {
				BufferedReader br = new BufferedReader(new FileReader(f));
				for (String line; (line = br.readLine()) != null;)
				{
					if (line.equals(goal))
					{
						for (int i = 0; i<4; i++)
						{
							line = br.readLine();
							
						}
						
						for (String treeLine; (treeLine = br.readLine()) != null;)
						{
							treeLine = treeLine.trim();
							tree = tree+" "+treeLine;
						}

					}
				}
				br.close();
				trees.add(tree);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
	
		}
	}
	
	public void makeTasks(ArrayList<String> trees) {
		for (String s : trees)
		{
			ModelTask task = Converter.makeModelTask(s); // Make a ModelTask
			tasks.add(task);
		}
	}
	
	public void runTasks(ArrayList<ModelTask> tasks, String mapPath, String opponentName)
	{
		int count = 1;
		for (ModelTask task : tasks)
		{
			try {
				ECJ_Tournament ET = new ECJ_Tournament(task, mapPath, opponentName, count);
				count ++;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}




