#include <iostream>
#include <string>
#include <fstream>
#include "TriGram.h"

using namespace std;

int TriGram::returnIndex(char a) {
	int index = -1;
	int currentCharCode = (int)a;

	if (currentCharCode == (int)" ") {
		index = 0;
	}
	else if ((int)"a" <= currentCharCode <= (int)"z") {
		index = currentCharCode - (int)"a" + 1;
	}
	return index;
}

void TriGram::calculateProbability() {
	ifstream myFile("dictionary.txt");
	string currentLine;
	int characterCount[27][27][27] = { 0 };
	int index1, index2, index3;
	while (getline(myFile, currentLine)) {
		for (int i = 0; i < currentLine.length() - 1; i++) {
			char a = currentLine[i];
			char b = currentLine[i + 1];
			char c = currentLine[i + 2];
			index1 = returnIndex(a);
			index2 = returnIndex(b);
			index3 = returnIndex(c);
			if ((index1 != -1) && (index2 != -1) && (index3 != -1)) {
				characterCount[index1][index2][index3]++;
			}
		}
	}
	for (int i = 0; i < currentLine.length(); i++) {
		for (int j = 0; j < currentLine.length(); j++) {
			for (int k = 0; k < currentLine.length(); k++) {
				cout << characterCount[i][j][k] << endl;
			}
		}
	}
}