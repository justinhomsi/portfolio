// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

#ifndef MISCWORD_H
#define MISCWORD_H

#include <string>
#include "Word.h"

using namespace std;

class MiscWord : public Word {
public:
	MiscWord(string x);
};

#endif