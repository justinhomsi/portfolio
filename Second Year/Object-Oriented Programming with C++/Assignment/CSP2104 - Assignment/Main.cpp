// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

// Declare inclucuded libraries
#include <iostream>
#include <vector>
#include <fstream>
#include <string>
#include "Word.h"
#include "Dictionary.h"
#include "TriGram.h"
#include <thread>
#include <future>
#include <chrono>

using namespace std;

void main() {
	// Create the dictionary and call the loadDictionary method
	Dictionary dict = Dictionary();
	dict.loadDictionary();

	// Create and initialize selection variable
	int selection = 5;

	// Enter infinite loop that asks for input from user to determine what they would like to do, or 0 (zero) to exit
	while (true) {
		selection = 5;
		// Print welcome message and available options to user
		cout << "Please choose an option or enter '0' (zero) to quit:" << endl;
		cout << "1. Enter a word to find it's definition" << endl;
		cout << "2. Find the word(s) with 3 or more 'Z's" << endl;
		cout << "3. List the words that have a 'q' without a following 'u'" << endl;
		cout << "4. Display total number of words in dictionary" << endl;
		cout << "5. List all words that are a noun and verb" << endl;
		cout << "6. List all words that are palindromes" << endl;
		cout << "7. Enter a word to find all words that are anagrams of that word" << endl;
		cout << "8. Guessing Game! You will be given a random Noun and it's length with 3 attempts to correctly guess it" << endl;
		cout << "9. Edit Dictionary (add, edit or delete words)" << endl;
		cout << "Enter selection and press Enter: ";
		cin >> selection;
		// Determine correct course of action based on user input
		if (selection == 0) {
			// Break from the loop, causing the program to exit
				break;
		}
		else if (selection == 1) {
			string enteredWord;
			cout << "Please enter your word: ";
			cin >> enteredWord;
			cout << dict.findWord(enteredWord).get_definition() << endl << endl;
		}
		else if (selection == 2) {
			cout << "The following words contain 3 or more 'Z's:" << endl;
			dict.findZ();
		}
		else if (selection == 3) {
			cout << "The following words have a 'Q' that is not followed by a 'u':" << endl;
			dict.findQ();
		}
		else if (selection == 4) {
			cout << "Total number of words in dictionary: " << dict.getTotalNumberOfWords() << endl << endl;
		}
		else if (selection == 5) {
			cout << "The following words are a noun and a verb: " << endl;
			dict.findNounAndVerb();
		}
		else if (selection == 6) {
			cout << "The following words are palindromes: " << endl;
			dict.findPalindromes();
		}
		else if (selection == 7) {
			string enteredWord;
			cout << "Please enter your word: ";
			cin >> enteredWord;
			dict.findAnagrams(enteredWord);
			cout << endl;
		}
		else if (selection == 8) {
			cout << "The definition and length of your word are as follows: " << endl;
			dict.guessingGame();
		}
		else if (selection == 9) {
			thread dictEditThread;
			int manipulationSelection;
			string enteredWord;
			cout << "1. Add Word" << endl;
			cout << "2. Edit Word" << endl;
			cout << "3. Delete Word" << endl;
			cout << "What would you like to do?: ";
			cin >> manipulationSelection;
			if (manipulationSelection == 1) {
				cout << "Enter word: ";
				cin >> enteredWord;
				if (dict.findWord(enteredWord).get_word() != enteredWord) {
					dictEditThread = thread([&](Dictionary* add) {add->addWord(enteredWord); }, &dict);
					dictEditThread.join();
				}
				else {
					cout << "Word already exists!" << endl;
				}
			}
			else if (manipulationSelection == 2) {
				string enteredWord;
				cout << "Enter word: ";
				cin >> enteredWord;
				dictEditThread = thread([&](Dictionary* edit) {edit->editWord(enteredWord); }, &dict);
				dictEditThread.join();
			}
			else if (manipulationSelection == 3) {
				string enteredWord;
				cout << "Enter word to delete: ";
				cin >> enteredWord;
				cout << "Deleting word..." << endl;
				dictEditThread = thread([&](Dictionary* del) {del->deleteWord(enteredWord); }, &dict);
				dictEditThread.join();
			}
			// If user has entered an invalid option, display error message, clear the input and ignore the incorrect input
			else {
				cout << "\nPlease enter a valid option from the list\n" << endl;
				cin.clear();
				cin.ignore(numeric_limits<streamsize>::max(), '\n');
			}
		}
		// If user has entered an invalid option, display error message, clear the input and ignore the incorrect input
		else {
			cout << "\nPlease enter a valid option from the list\n" << endl;
			cin.clear();
			cin.ignore(numeric_limits<streamsize>::max(), '\n');
		}
	}
}

