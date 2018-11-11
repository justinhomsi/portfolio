// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

// Check if dictionary_h is defined, if not, define it
#ifndef DICTIONARY_H
#define DICTIONARY_H

// Declare included libraries
#include <iostream>
#include <string>
#include <vector>
#include "Word.h"

using namespace std;

// Create the Dictionary class, its elements, and methods
class Dictionary {
private:
	vector<Word*> wordList;

public:
	void loadDictionary();
	Word findWord(string x);
	void findZ();
	void findQ();
	int getTotalNumberOfWords();
	void determineWordType(string word, string def, string type);
	void findNounAndVerb();
	void findPalindromes();
	void findAnagrams(string x);
	void guessingGame();
	void addWord(string word);
	void deleteWord(string word);
	void editWord(string word);
};

#endif