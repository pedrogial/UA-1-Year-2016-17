// NIF 15419933C GIMENEZ ALDEGUER, PEDRO
#ifndef _field
#define _field
#include <iostream>
#include "Android.h"
#include <vector>

class Field{
	friend ostream &operator<<(ostream &os, const Field &field);
	protected:
		string name;		
		int products;
		int hoursLeft;
		int droidsCapacity() const;
		vector<Android *> androids;

	public:
		static const int WORKINGHOURS = 10;
		Field(string name);
		string getName() const;
		int getProducts() const;
		int getHoursLeft() const;
		unsigned numAndroids() const;
		void setProducts(int products);
		void addProducts(int products);
		bool needsDroids() const;
		void addDroid(Android * newAndroid);
		void collect();
};
#endif