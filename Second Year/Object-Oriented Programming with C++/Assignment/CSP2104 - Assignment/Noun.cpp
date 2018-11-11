// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

#include <iostream>
#include <string>
#include "Noun.h"
#include "Word.h"

using namespace std;

Noun::Noun(string x) : Word(x) {

}

bool Noun::isNoun() {
	return true;
}
