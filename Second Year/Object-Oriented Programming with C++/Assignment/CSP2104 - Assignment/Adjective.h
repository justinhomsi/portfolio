// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

#ifndef ADJECTIVE_H
#define ADJECTIVE_H

#include <string>
#include "Word.h"

using namespace std;

class Adjective : public Word {
public:
	Adjective(string x);
};

#endif