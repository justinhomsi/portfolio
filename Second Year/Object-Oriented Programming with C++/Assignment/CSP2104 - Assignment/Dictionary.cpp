// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

// Declare included libraries
#include <iostream>
#include <string>
#include <fstream>
#include <algorithm>
#include "stdio.h"
#include "Dictionary.h"
#include "Noun.h"
#include "Verb.h"
#include "Adverb.h"
#include "Adjective.h"
#include "Preposition.h"
#include "ProperNoun.h"
#include "NounAndVerb.h"
#include "MiscWord.h"
#include <cctype>
#include <ctime>

// Declare global variable to store the file name for use in reading/writing to file
string filename = "dictionary.txt";

// Define the determineWordType function
void Dictionary::determineWordType(string word, string def, string type) {
	if (type == "n") {
		Noun *myWord = new Noun(word);
		myWord -> set_word(word);
		myWord -> set_definition(def);
		myWord -> set_type(type);

		wordList.push_back(myWord);
	}

	else if (type == "v") {
		Verb *myWord = new Verb(word);
		myWord -> set_word(word);
		myWord -> set_definition(def);
		myWord -> set_type(type);

		wordList.push_back(myWord);
	}

	else if (type == "adv") {
		Adverb *myWord = new Adverb(word);
		myWord -> set_word(word);
		myWord -> set_definition(def);
		myWord -> set_type(type);

		wordList.push_back(myWord);
	}

	else if (type == "adj") {
		Adjective *myWord = new Adjective(word);
		myWord -> set_word(word);
		myWord -> set_definition(def);
		myWord -> set_type(type);

		wordList.push_back(myWord);
	}

	else if (type == "prep") {
		Preposition *myWord = new Preposition(word);
		myWord -> set_word(word);
		myWord -> set_definition(def);
		myWord -> set_type(type);

		wordList.push_back(myWord);
	}

	else if (type == "pn") {
		ProperNoun *myWord = new ProperNoun(word);
		myWord -> set_word(word);
		myWord -> set_definition(def);
		myWord -> set_type(type);

		wordList.push_back(myWord);
	}

	else if (type == "n_and_v") {
		NounAndVerb *myWord = new NounAndVerb(word);
		myWord->set_word(word);
		myWord->set_definition(def);
		myWord->set_type(type);

		wordList.push_back(myWord);

	}

	else if (type == "misc") {
		MiscWord *myWord = new MiscWord(word);
		myWord->set_word(word);
		myWord->set_definition(def);
		myWord->set_type(type);

		wordList.push_back(myWord);
	}

	else { 
		Word *myWord = new Word(word);
		myWord->set_word(word);
		myWord->set_definition(def);
		myWord->set_type(type);

		wordList.push_back(myWord);
	}
}

// Define the loadDictionary function
void Dictionary::loadDictionary() {
	// Declare variable to store the read line
	string line;
	cout << "Attempting to read file...\n" << endl;
	ifstream myFile(filename);

	// Check if file is open, declare variables and create a Word object if it is
	if (myFile.is_open()) {

		// Declare variables to temporarily store Word, Definition and Type
		string tempWord;
		string tempDef;
		string tempType;

		// Loop while not at the end of the file
		while (!(myFile.eof())) {
			getline(myFile, line);
			// Check if the line being read is not a comment
			if (!(line.substr(0, 2) == "//")) {

				// Set tempWord to the read line
				tempWord = line;
				// Read the next line and set tempDef to it
				getline(myFile, line);
				tempDef = line;
				// Read the next line and set tempType to it
				getline(myFile, line);
				tempType = line;
				// Read the next line and do nothing with it (as it is a blank line)
				getline(myFile, line);

				// Call the determineWordType function to add the word to the wordList vector as its respective class based on type
				determineWordType(tempWord, tempDef, tempType);

			}

		}
		// Close the file
		myFile.close();

	}

};

// Define the findWord function
Word Dictionary::findWord(string x) {
	// Enter a for loop that loops through all words stored in the wordList array and return the word if it matches the input
	for (Word *i : wordList) {
		if (x == i -> get_word()) {
			return (*i);
		}

	}
	// If no matching word is found, create a nullWord object of the Word class, set it's definition to word not found and return nullWord
	Word nullWord = Word();
	nullWord.set_definition("Word not found");
	return nullWord;
	
};

// Define the findZ function
void Dictionary::findZ() {
	// Create and initialize variables required by function
	string lowerZ = "z";
	string upperZ = "Z";
	int zCounter = 0;
	string currentChar;
	string wordToCheck;

	// Enter a for loop that loops through all words stored in the wordList array, check if the word contains any "z"'s and increment the counter if it does
	for (Word *i : wordList) {
		wordToCheck = i -> get_word();
		for (int x = 0; x < wordToCheck.size(); x++) {
			currentChar = wordToCheck[x];
			if (currentChar == lowerZ || currentChar == upperZ) {
				zCounter++;
				}
			}
		// Once inner loop has ended, check if the counter has reached 3 or more and print out the word if it has then reset the counter to 0
		if (zCounter >= 3) {
			cout << wordToCheck << endl;
			zCounter = 0;
		}
		// Once inner loop has ended, if counter has not reached 3 or more, reset the counter to 0
		else {
			zCounter = 0;
		}
	}
	// Print an empty line
	cout << endl;
};

// Define the findQ function
void Dictionary::findQ(){
	// Create and initialize variables required by function
	string lowerQ = "q";
	string upperQ = "Q";
	string checkU = "u";
	string currentChar;
	string wordToCheck;

	// Enter a for loop that loops through all words in the wordList array, checks if the word has a "Q" and if it does, check if the following character is a "u", if so print the word
	for (Word *i : wordList) {
		wordToCheck = i -> get_word();
		for (int x = 0; x < wordToCheck.size(); x++) {
			currentChar = wordToCheck[x];
			if (currentChar == lowerQ || currentChar == upperQ) {
				if (wordToCheck[x + 1] != checkU[0]) {
					cout << wordToCheck << endl;
				}
			}
		}
	}
	// Print an empty line
	cout << endl;
};

// Define the getTotalNumberOfWords method
int Dictionary::getTotalNumberOfWords() {
	// Create and initialize variables required by method
	int numberOfWords = 0;
	// Enter a for loop that loops through the array and increments the counter
	for (Word *i : wordList) {
		numberOfWords++;
	}
	// Return the numberOfWords variable, which stores the number of words in the array
	return numberOfWords;
}

// Define the findNounAndVerb method
void Dictionary::findNounAndVerb() {
	// Enter a for loop to loop through all words in the wordList vector
	for (Word *i : wordList) {
		// Check if the current word is a noun and a verb, then print it if both return true
		if (i -> isNoun() && i -> isVerb()) {
			cout << i -> get_word() << endl;
		}
	}
}

// Define the findPalindromes() method
void Dictionary::findPalindromes() {
	// Declare variables required
	string originalWord;
	string currentChar;
	string newWord;
	int x = 0;
	// Enter a for loop to loop through all words in the wordList vector and set the originalWord variable to the current word
	for (Word *i : wordList) {
		originalWord = i -> get_word();
		// Enter a for loop to loop backwards through the word and append each character in reverse order to the newWord variable
		for (x = originalWord.length() - 1; x >= 0; x--) {
			currentChar = originalWord[x];
			newWord.append(currentChar);
		}
		// Check if the word is a palindrome by calling the isPalindrome method
		if (i->isPalindrome(originalWord, newWord)) {
			cout << i->get_word() << endl;
		}
		// Clear the newWord variable
		newWord.clear();
	}
}

// Define the findAnagrams() method
void Dictionary::findAnagrams(string x) {
	// Enter a for loop to loop through all words in the wordList vector
	string inputWord = x;
	for (Word *i : wordList) {
		// Declare and assign required variables
		string currentWord = i -> get_word();
		// Sort the entered input from the user and the current word in the vector
		sort(inputWord.begin(), inputWord.end());
		sort(currentWord.begin(), currentWord.end());
		// If both words match, return the current word in the vector
		if (inputWord == currentWord) {
		//	return *i;
			cout << i->get_word() << endl;
		}
	}
}

// Define the guessingGame() method
void Dictionary::guessingGame() {
	// Explicity declare the srand seed so that rand is a different number on each execution of the program
	srand(time(NULL));
	// Choose a random number within the size of the wordList vector
	int randomInt = rand() % wordList.size();
	// Set the randomWord variable as a pointer to the word object from the vector using the randomed int from above as the index
	Word *randomWord = wordList[randomInt];
	// Declare required variables
	string randomNoun;
	string randomDef;
	// Check if the chosen word object is a noun, if it is, get the word and the definition and assign them to their respective variables
	if (randomWord->isNoun()) {
		randomNoun = randomWord->get_word();
		randomDef = randomWord->get_definition();
	}
	// If the chosen word object is not a noun, keep looping through different random indexes until a noun is found
	else {
		while (!randomWord->isNoun()) {
			randomInt = rand() % wordList.size();
			randomWord = wordList[randomInt];
			// Check if the newly found word object is a noun, if it is, get the word and the definition and assign them to their respective variables
			if (randomWord->isNoun()) {
				randomNoun = randomWord->get_word();
				randomDef = randomWord->get_definition();
			}
		}
	}
	// Declare required variables
	string userGuess;
	int attemptCounter;
	// Print the chosen words definition and length
	cout << "Definition: " << randomDef << endl;
	cout << "Length of word: " << randomNoun.length() << endl;
	// Enter a for loop that loops 3 times allowing the user to guess the word
	for (attemptCounter = 0; attemptCounter <= 2; attemptCounter++) {
		cout << "Enter your guess: ";
		cin >> userGuess;

		// If the user guesses the word correctly, print "You guessed correctly!" and break from the loop
		if (userGuess == randomNoun) {
			cout << "You guessed correctly!" << endl;
			break;
		}
		// If the guess is incorrect and this is the first attempt, print a message telling the user they were incorrect and that they have 2 more guesses remaining, and print the first letter of the word
		else if (userGuess != randomNoun && attemptCounter == 0) {
			cout << "Incorrect! 2 more guesses remaining!" << endl;
			cout << "Here's a hint: ";
			cout << randomNoun[0] << endl;
		}
		// If the guess is incorrect and this is the second attempt, print a message telling the user they were incorrect and that they have 1 more guess remaining, and print the first and second letters of the word
		else if (userGuess != randomNoun && attemptCounter == 1) {
			cout << "Incorrect! 1 more guess remaining!" << endl;
			cout << "Here's another hint: ";
			cout << randomNoun[0] << randomNoun[1] << endl;
		}
		// If the guess is incorrect and this is the third attempt, print a message telling the user they were incorrect and print the word
		else if (userGuess != randomNoun && attemptCounter == 2) {
			cout << "Incorrect! The word is: ";
			cout << randomNoun << endl;
		}
	}


}

// Define the addWord method
void Dictionary::addWord(string word) {
	// Declare required variables
	string enteredDef;
	string enteredType;
	// Print "Enter word definition" prompt
	cout << "Enter word definition: ";
	// Accept user input and save to variable
	cin.ignore();
	getline(cin, enteredDef);
	// Print "Enter word type" prompt
	cout << "Enter word type (e.g. 'n' for noun): ";
	// Accept user input and save to variable
	cin >> enteredType;
	// Open the dictionary.txt file in output append mode
	ofstream myFile(filename, ios::app);
	// Call the determineWordType method to add the word to the wordList vector
	determineWordType(word, enteredDef, enteredType);
	// Write the entered word, definition and type to the dictionary file
	myFile << word << "\n";
	myFile << enteredDef << "\n";
	myFile << enteredType << "\n";
	// Write a new line to the dictionary file to preserve file format
	myFile << "\n";

	// Close the file
	myFile.close();
}

// Define the deleteWord method
void Dictionary::deleteWord(string word) {
	// Declare required variables
	ifstream myFile("dictionary.txt");
	ofstream myTemp("temp.txt");
	string line;
	string wordToCheck;
	// Enter a for loop that loops through the wordList vector
	for (size_t i = 0; i < wordList.size(); i++) {
		// Set wordToCheck to the current word in the vector
		wordToCheck = wordList[i]->get_word();
		// Check if wordToCheck is the same as the input word
		if (wordToCheck == word) {
			// Erase the object from the wordList vector
			wordList.erase(next(begin(wordList), +i));
			// Decalre variables
			string delimiter = "\n";
			string token;
			// Enter a while loop that continues while lines are being read in from the dictionary
			while (getline(myFile, line)) {
				// Set token to the current line
				token = line.substr(0, line.find(delimiter));
				// Check if token equals wordToCheck, if it does, get the next 3 lines in the dictionary file and do nothing with them
				if (token == wordToCheck) {
					getline(myFile, line);
					getline(myFile, line);
					getline(myFile, line);
				}
				// If token does not equal wordToCheck, write the current line to the temp file
				else if (token != wordToCheck) {
					myTemp << line << endl;
				}
		
			}
			// Close both files
			myFile.close();
			myTemp.close();
			// Delete the dictionary.txt file
			std::remove("dictionary.txt");
			// Rename the temp file to dictionary.txt
			std::rename("temp.txt", "dictionary.txt");
		}
	}
}

// Define the editWord method
void Dictionary::editWord(string word) {
	// Declare required variables
	string wordEdit;
	string defEdit;
	string typeEdit;
	string editDef;
	string editType;
	ifstream myFile("dictionary.txt");
	ofstream myTemp("temp.txt");
	string line;
	string originalWord;
	Word *changedWord = new Word;
	// Enter a for loop that loops through all objects in the wordList vector
	for (Word *i : wordList) {
		// Check if the current object's word is equal to the entered word
		if (i->get_word() == word) {
			// Set originalWord to the current object's word
			originalWord = i->get_word();
			// Set the changedWord variable to the current object
			changedWord = i;
			// Ask for input from user
			cout << "Word found! What would you like to change it to? ";
			// Save input from user to the wordEdit variable
			cin >> wordEdit;
			// Set the current object's word variable to the string stored in wordEdit
			i -> set_word(wordEdit);
			// Inform user word has been changed and ask if they would like to change the definition
			cout << "Word has been updated successfully!" << endl;
			cout << "Would you like to change the definition? ('y' for yes or 'n' for no): ";
			cin >> editDef;
			// Ensure the input from user is in lowercase
			transform(editDef.begin(), editDef.end(), editDef.begin(), ::tolower);
			// If the user has entered "y", prompt for input for new definition
			if (editDef == "y") {
				cin.ignore();
				cout << "Enter new definition: ";
				// Save the input to the defEdit variable using getline
				getline(cin, defEdit);
				// Set the current object's definition to the string stored in defEdit
				i -> set_definition(defEdit);
				// Inform user definitoin has been changed
				cout << "Definition has been updated successfully!" << endl;
			}
			// Ask user if they would like to change the type
			cout << "Would you like to change the type? ('y' for yes or 'n' for no): ";
			cin >> editType;
			// Ensure the input from user is in lowercase
			transform(editType.begin(), editType.end(), editType.begin(), ::tolower);
			// If the user has entered "y", prompt for input for new type
			if (editType == "y") {
				cout << "Enter new type (e.g. 'n' for noun): ";
				// Store the input in the typeEdit variable
				cin >> typeEdit;
				// Set the current object's type to the string stored in typeEdit
				i -> set_type(typeEdit);
				// Inform user type has been changed
				cout << "Type has been updated successfully!" << endl;
			}
		}
	}
	// Inform user the changes are being written to the file
	cout << "Writing changes to file..." << endl;
	// Enter a while loop that continues while lines are being read from the file
	while (getline(myFile, line)) {
		// Check if the current line equals the original word that was being changed
		if (line == originalWord) {
			// If line matches original word, write the changedWord's word, definition and type to the file
			myTemp << changedWord->get_word() << endl;
			myTemp << changedWord->get_definition() << endl;
			myTemp << changedWord->get_type() << endl;
			// Get the next 4 lines and do nothing with them to ensure file formatting is consistent
			getline(myFile, line);
			getline(myFile, line);
			getline(myFile, line);
			getline(myFile, line);
		}
		// If line does not match originalWord, write the current line to the file
		else {
			myTemp << line << endl;
		}
	}

	// Inform user changes have been saved
	cout << "All changes have been saved!" << endl;

	// Close both files
	myFile.close();
	myTemp.close();
	// Delete the dictionary.txt file
	std::remove("dictionary.txt");
	// Rename the temp.txt file to dictionary.txt
	std::rename("temp.txt", "dictionary.txt");
}