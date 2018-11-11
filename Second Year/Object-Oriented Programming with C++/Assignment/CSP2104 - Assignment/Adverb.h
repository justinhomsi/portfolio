// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

#ifndef ADVERB_H
#define ADVERB_H

#include <string>
#include "Word.h"

using namespace std;

class Adverb : public Word {
public:
	Adverb(string x);
};

#endif