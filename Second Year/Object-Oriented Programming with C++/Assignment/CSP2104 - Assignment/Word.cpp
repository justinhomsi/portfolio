// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

// Declare included libraries
#include <iostream>
#include <string>
#include "Word.h"

// Define the Word class initializer
Word::Word() {

};

Word::Word(string x) {
	word = x;
}

// Define the get_word method used to get a word
string Word::get_word() {
	return word;
};

// Define the get_definition method used to get a word's definition
string Word::get_definition() {
	return definition;
};

string Word::get_type() {
	return type;
}

// Define the set_word function used to set a word
void Word::set_word(string x) {
	word = x;
};

// Define the set_definition function used to set a word's definition
void Word::set_definition(string x) {
	definition = x;
};

// Define the set_type function used to set a word's type
void Word::set_type(string x) {
	type = x;
};

// Define the isNoun function used to determine if a word is a noun
bool Word::isNoun() {
	return false;
}

bool Word::isVerb() {
	return false;
}

bool Word::isPalindrome(string originalWord, string newWord) {
	if (originalWord == newWord) {
		return true;
	}
	else {
		return false;
	}
}