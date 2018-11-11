// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

// Check if propernoun_h is defined, if not, define it
#ifndef PROPERNOUN_H
#define PROPERNOUN_H

// Declare included libraries
#include <string>
#include "Noun.h"


using namespace std;

class ProperNoun : public Noun {
public:
	ProperNoun(string x);
};
#endif