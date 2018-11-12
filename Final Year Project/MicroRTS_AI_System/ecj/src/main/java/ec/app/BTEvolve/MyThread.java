/*
 * File created by: Matthew Burr as students at Edith Cowan University
 * For use in the Applied IT Project 2018
 */

package ec.app.BTEvolve;

import ec.Evolve;

public class MyThread extends Thread 
{
	String[] arguments;
	
	MyThread(String[] arguments){
		this.arguments = arguments;
	}
	
	public void run() {
		Evolve.main(arguments);
		MyThread.currentThread().interrupt();
		
	}
	
}




