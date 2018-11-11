// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

// Check if nounandverb_h is defined, if not, define it
#ifndef NOUNANDVERB_H
#define NOUNANDVERB_H

// Declare included libraries
#include <string>
#include "Verb.h"
#include "Noun.h"


using namespace std;

class NounAndVerb : public Noun, public Verb {
public:
	NounAndVerb(string x);
};

#endif
