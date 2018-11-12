/*
 * File created by: Matthew Burr as students at Edith Cowan University
 * For use in the Applied IT Project 2018
 */

package ec.app.BTEvolve;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.swing.JFrame;
import javax.swing.JTextArea;
import java.awt.BorderLayout;
import javax.swing.JTextField;
import javax.swing.ScrollPaneConstants;

import ec.Evolve;
import ec.app.BTEvolve.MyThread;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JButton;
import javax.swing.JScrollPane;

public class BT_App implements ActionListener{

	String[] arguments = null;
	Thread thread;
	int count = 0;

	private JFrame frmMicrortsAiGui;
	private JTextField textFieldSeed;
	private JTextField textFieldPopulation;
	private JTextField textFieldGeneration;
	private JTextField textFieldMutation;
	private JTextField textFieldCrossover;
	
	private JTextArea textAreaOutput;
	private JButton btnChooseMap;
	private JButton btnRun;
	private JButton btnClear;
	private JComboBox comboBoxOpponent;
	private JComboBox comboBoxTournament;
	
	//File chooser to get the map
	JFileChooser fc;
	
	// File handler
	File file;
	
	// path to map
	protected String mapPath;
	// type of opponent
	protected String opponentName;
	// type of tournament
	protected String tournamentName;
	// Send the console outputs to the text area
	protected PrintStream standardOut;
	protected PrintStream printStream;

	

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					BT_App window = new BT_App();
					window.frmMicrortsAiGui.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public BT_App() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmMicrortsAiGui = new JFrame();
		frmMicrortsAiGui.setTitle("MicroRTS AI GUI: Evolution");
		frmMicrortsAiGui.setBounds(100, 100, 565, 430);
		frmMicrortsAiGui.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmMicrortsAiGui.getContentPane().setLayout(null);
		
		JLabel lblSeed = new JLabel("Seed");
		lblSeed.setBounds(10, 10, 71, 13);
		frmMicrortsAiGui.getContentPane().add(lblSeed);
		
		JLabel lblMutationRate = new JLabel("Mutation rate");
		lblMutationRate.setBounds(10, 79, 85, 13);
		frmMicrortsAiGui.getContentPane().add(lblMutationRate);
		
		JLabel lblCrossoverRate = new JLabel("Crossover rate");
		lblCrossoverRate.setBounds(10, 102, 85, 13);
		frmMicrortsAiGui.getContentPane().add(lblCrossoverRate);
		
		JLabel lblPopulation = new JLabel("Population");
		lblPopulation.setBounds(10, 33, 85, 13);
		frmMicrortsAiGui.getContentPane().add(lblPopulation);
		
		JLabel lblGenerations = new JLabel("Generations");
		lblGenerations.setBounds(10, 56, 85, 13);
		frmMicrortsAiGui.getContentPane().add(lblGenerations);
		
		textFieldSeed = new JTextField();
		textFieldSeed.setBounds(105, 7, 96, 19);
		frmMicrortsAiGui.getContentPane().add(textFieldSeed);
		textFieldSeed.setColumns(10);
		
		textFieldPopulation = new JTextField("");
		textFieldPopulation.setBounds(105, 30, 96, 19);
		frmMicrortsAiGui.getContentPane().add(textFieldPopulation);
		textFieldPopulation.setColumns(10);
		
		textFieldGeneration = new JTextField("");
		textFieldGeneration.setBounds(105, 53, 96, 19);
		frmMicrortsAiGui.getContentPane().add(textFieldGeneration);
		textFieldGeneration.setColumns(10);
		
		textFieldMutation = new JTextField("");
		textFieldMutation.setBounds(105, 76, 96, 19);
		frmMicrortsAiGui.getContentPane().add(textFieldMutation);
		textFieldMutation.setColumns(10);
		
		textFieldCrossover = new JTextField("");
		textFieldCrossover.setBounds(105, 99, 96, 19);
		frmMicrortsAiGui.getContentPane().add(textFieldCrossover);
		textFieldCrossover.setColumns(10);
		
		btnClear = new JButton("Clear");
		btnClear.setBounds(105, 123, 96, 23);
		frmMicrortsAiGui.getContentPane().add(btnClear);
		
		JLabel lblOpponent = new JLabel("Opponent");
		lblOpponent.setBounds(214, 10, 71, 13);
		frmMicrortsAiGui.getContentPane().add(lblOpponent);
		
		// The Opponent combobox
		String[] opponentAi = {"PassiveAI", "LightRush", "HeavyRush", "WorkerRush", "Custom_LightRush"};
		comboBoxOpponent = new JComboBox(opponentAi);
		comboBoxOpponent.setBounds(295, 6, 131, 21);
		frmMicrortsAiGui.getContentPane().add(comboBoxOpponent);
		
		JLabel lblTournament = new JLabel("Tournament");
		lblTournament.setBounds(214, 33, 71, 13);
		frmMicrortsAiGui.getContentPane().add(lblTournament);
		
		// The tournament combobox
		String[] tournament = {"tournament"};
		comboBoxTournament = new JComboBox(tournament);
		comboBoxTournament.setBounds(295, 30, 131, 21);
		frmMicrortsAiGui.getContentPane().add(comboBoxTournament);
		
		JLabel lblMap = new JLabel("Map");
		lblMap.setBounds(214, 58, 45, 13);
		frmMicrortsAiGui.getContentPane().add(lblMap);
		
		btnChooseMap = new JButton("Choose map");
		btnChooseMap.setBounds(295, 55, 131, 21);
		frmMicrortsAiGui.getContentPane().add(btnChooseMap);
		
		btnRun = new JButton("Run");
		btnRun.setBounds(295, 80, 131, 40);
		frmMicrortsAiGui.getContentPane().add(btnRun);
		
		textAreaOutput = new JTextArea();
		textAreaOutput.setBounds(201, 195, 225, 59);
		frmMicrortsAiGui.getContentPane().add(textAreaOutput);
		
		JScrollPane scrollPane = new JScrollPane(textAreaOutput);
		scrollPane.setBounds(10, 152, 529, 228);
		frmMicrortsAiGui.getContentPane().add(scrollPane);
		scrollPane.setVerticalScrollBarPolicy ( ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS );

		fc = new JFileChooser();
		file = fc.getSelectedFile();
		
		// Add action listeners
		comboBoxOpponent.addActionListener(this);
		comboBoxTournament.addActionListener(this);
		btnChooseMap.addActionListener(this);
		btnRun.addActionListener(this);
		btnClear.addActionListener(this);
		
		// Print console info to text area
		printStream = new PrintStream(new CustomOutputStream(textAreaOutput));
		

		// keeps reference of standard output stream
        standardOut = System.out;
        
        System.out.println(printStream);
         
        // re-assigns standard output stream and error output stream
        System.setOut(printStream);
        System.setErr(printStream);

	}
	// Checks if the passed string is a number
	public boolean checkIfNum(String number) {
		try {
			Integer.parseInt(number);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
	// Checks if the passed string is of the type double
	public boolean checkIfDouble(String number) {
		try {
			Double.parseDouble(number);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
	// Checks for correct input of fields within the GUI
	public boolean errorCheck(JTextField[] fields)
	{
		if (checkIfNum(fields[0].getText()) == false && !fields[0].getText().equals(""))
		{
			System.out.println("Error: Seed is not an integer number.");
			return false;
		}
		if (checkIfNum(fields[1].getText()) == false && !fields[1].getText().equals(""))
		{
			System.out.println("Error: Population is not an integer number.");
			return false;

		}
		if (checkIfNum(fields[2].getText()) == false && !fields[2].getText().equals(""))
		{
			System.out.println("Error: Generations is not an integer number.");
			return false;
		}
		if (checkIfDouble(fields[3].getText()) == false && !fields[3].getText().equals("")) 
		{
			System.out.println("Error: Mutation rate is not a double.");
			return false;
		}
		if (checkIfDouble(fields[4].getText()) == false && !fields[4].getText().equals("")) 
		{
			System.out.println("Error: Crossover rate is not a double.");
			return false;
		}
		
		return true;
	}
	
	// If no value is entered by the user, specifies a default value to be used
	public void setDefaults(JTextField[] fields) {
		if(fields[0].getText() == null || fields[0].getText().equals("")) {
			fields[0].setText("780");
		}
		
		if(fields[1].getText() == null || fields[1].getText().equals("")) {
			fields[1].setText("50");
		}
		
		if(fields[2].getText() == null || fields[2].getText().equals("")) {
			fields[2].setText("500");

		}
		
		if(fields[3].getText() == null || fields[3].getText().equals("")) {
			fields[3].setText("0.1");

		}
		
		if(fields[4].getText() == null || fields[4].getText().equals("")) {
			fields[4].setText("0.6");

		}
	}

	
	@Override
	public void actionPerformed(ActionEvent e) {      
        // map chooser button
        if (e.getSource() == btnChooseMap) {
            int returnVal = fc.showOpenDialog(frmMicrortsAiGui);
            file = fc.getSelectedFile();
            
            try {
                mapPath = file.getAbsolutePath();
            }
            catch (Exception exc)
            {
            	mapPath = "";
            }
            
            if (returnVal == JFileChooser.APPROVE_OPTION) {
                //This is where a real application would open the file.
                textAreaOutput.append("Opening: " + mapPath + "." + "\n");
            } else {
            	textAreaOutput.append("Open command cancelled by user." + "\n");
            }
        }else if (e.getSource() == comboBoxOpponent) {
    		// Combo action
            opponentName = (String)comboBoxOpponent.getSelectedItem();
            textAreaOutput.append("Opponent selected: " + opponentName + "\n");
        }else if (e.getSource() == comboBoxTournament) {
        	tournamentName = (String)comboBoxTournament.getSelectedItem();
        	textAreaOutput.append("Tournament selected: "+tournamentName+"\n");
        }else if (e.getSource() == btnClear) {
			textFieldSeed.setText("");
        	textFieldPopulation.setText("");
        	textFieldGeneration.setText(""); 
        	textFieldMutation.setText(""); 
        	textFieldCrossover.setText("");
        }else if (e.getSource() == btnRun) {
        	// check that input is not null
        	if (file == null)
        	{
        		System.out.println("ERROR: No map selected\n");
        	}else if (thread != null && thread.isAlive())
        	{
        		// Do nothing
        	}
        	else {
	        	// run button
        		JTextField[] fields = {textFieldSeed, textFieldPopulation, textFieldGeneration, textFieldMutation, textFieldCrossover};
        		if(errorCheck(fields) == true)
        		{
            		setDefaults(fields);
            		
            		String seed = textFieldSeed.getText();
            		String population = textFieldPopulation.getText();
            		String generation = textFieldGeneration.getText();
            		String mutation = textFieldMutation.getText();
            		String crossover = textFieldCrossover.getText();
            		
    	        	textAreaOutput.append("Seed: " + seed + "\n");
    	        	textAreaOutput.append("Population: " + population + "\n"); 
    	        	textAreaOutput.append("Generation: " + generation + "\n"); 
    	        	textAreaOutput.append("Mutation: " + mutation + "\n"); 
    	        	textAreaOutput.append("Crossover: " + crossover + "\n"); 
    	        	
    	        	// Run evolve
    	        	arguments = new String[] {"-from", "app/BTEvolve/BT.params",
    						"-p", "seed.0="+seed,
    						"-p", "pop.subpop.0.size="+population,
    						"-p", "generations="+generation,
    						"-p", "pop.subpop.0.species.pipe.source.0.prob="+crossover,
    						"-p", "pop.subpop.0.species.pipe.source.1.prob="+mutation,
    						"-p", "stat.file=$"+count+"- Seed_"+seed+"_Crossover_"+crossover+"_Mutation_"+mutation+"_out.stat",
    						"-p", "path="+mapPath,
    						"-p", "opponent="+opponentName,
    						"-p", "tournament="+tournamentName,
    						"-p", "stat.child.0.file=$"+count+"- Seed_"+seed+"_Crossover_"+crossover+"_Mutation_"+mutation+"_out_2.stat"};
    	        	
    	        	count++;
    				thread = new MyThread(arguments);
    				thread.start();
        		}

				
				
				
    		}		
    	}
	}
}

	
