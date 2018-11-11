// Title: CSP2104 Object Oriented Programming with C++ Assignment
// Author: Justin Homsi (10373949)
// Description: A program which stores words and definitions from a dictionary file and allows basic tasks to be performed on the data

#include <iostream>
#include <string>
#include "NounAndVerb.h"

using namespace std;

NounAndVerb::NounAndVerb(string x) : Noun(x), Verb(x) {

}