// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

// Check if word_h is defined, if not, define it
#ifndef WORD_H
#define WORD_H

// Declare included libraries
#include <iostream>
#include <string>

using namespace std;

// Create the Word class, its elements, and methods
class Word {
private:
	string word;
	string definition;
	string type;
public:
	Word();
	Word(string x);
	string get_word();
	string get_definition();
	string get_type();
	void set_word(string x);
	void set_definition(string x);
	void set_type(string x);
	virtual bool isNoun();
	virtual bool isVerb();
	bool isPalindrome(string originalWord, string newWord);
};
#endif
