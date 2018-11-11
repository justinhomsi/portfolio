// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

// Check if noun_h is defined, if not, define it
#ifndef NOUN_H
#define NOUN_H

// Declare included libraries
#include "Word.h"
#include <string>

using namespace std;

class Noun : virtual public Word {
public:
	Noun(string x);
	bool isNoun();
};
#endif