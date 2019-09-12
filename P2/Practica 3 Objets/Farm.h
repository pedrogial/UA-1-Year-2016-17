// NIF 15419933C GIMENEZ ALDEGUER, PEDRO
#ifndef _farm
#define _farm
#include <iostream>
#include <vector>
#include "Android.h"
#include "Field.h"
#include "Util.h"
#include <cstdlib>
#include <climits>

class Farm{
	friend ostream &operator<<(ostream &os, const Farm &farm);
	protected:
		static const int MAXANDROIDS = 30;
		Android androids[MAXANDROIDS];
		unsigned numAndroids;
		string name;
		void collect(int &hour);
		int buscarMinimo();
		void distributeAndroids();
		int masRapido();
		vector<Field> fields;
	public:
		Farm(string name);
		string getName() const;
		unsigned numFields() const;
		unsigned getNumAndroids();
		void createField(string name = "");
		void createAndroid(int speed = -1, string model = "");
		void processProducts(string products);
		void startWorkingHour(int &hour);
		
};
#endif