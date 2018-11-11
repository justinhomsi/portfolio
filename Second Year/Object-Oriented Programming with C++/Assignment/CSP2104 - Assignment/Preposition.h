// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

#ifndef PREPOSITION_H
#define PREPOSITION_H

#include <string>
#include "MiscWord.h"

using namespace std;

class Preposition : public MiscWord {
public:
	Preposition(string x);
};

#endif