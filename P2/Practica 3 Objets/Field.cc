// NIF 15419933C GIMENEZ ALDEGUER, PEDRO
#include "Field.h"

Field::Field(string name){
	hoursLeft = 10;

	this->name = name;
	products = 0;
}

string Field::getName() const{
	return name;
}

int Field::getProducts() const{
	return products;
}

int Field::getHoursLeft() const{
	return hoursLeft;
}

unsigned Field::numAndroids() const{
	return androids.size();
}

void Field::setProducts(int products){
	this->products = products;

	if(this->products < 0){
		this->products = 0;
	}
}

void Field::addProducts(int products){
	this->products += products;

	if(this->products < 0){
		this->products = 0;
	}
}

bool Field::needsDroids() const{
	bool necesita;
	necesita = false;
	int total;
	total = this->droidsCapacity();

	if(total < products){
		necesita = true;
	}
	return necesita;
}

void Field::addDroid(Android *newAndroid){
	bool asignar;
	asignar = true;

	androids.push_back(newAndroid);
	newAndroid->setAssigned(asignar);
	newAndroid->setStatus(ST_WORKING);
}

// Suma de las velocidades de los androides.
int Field::droidsCapacity() const{
	unsigned int i;
  	int total;
  	total = 0;

  	for(i = 0; i < androids.size(); i++){
    	total += androids[i]->getSpeed();
  	} 
  	return total;
}

void Field::collect(){
	unsigned int i;
	int totalVel;
	totalVel = 0;
	bool asignar;
	asignar = false;


	totalVel = droidsCapacity();
	products -= totalVel;

	if(products < 0){
		products = 0;
	}

	for(i = 0; i < androids.size(); i++){
  		androids[i]->oneMoreHour();
   
    	if(androids[i]->isMaintenanceTime() == true){
    		androids[i]->setStatus(ST_MAINTENANCE0);
    		androids[i]->setAssigned(asignar);
			androids.erase(androids.begin() + i);
  			i--;
  		}
  	}

  	hoursLeft--;
	
	if(products == 0){
		hoursLeft = WORKINGHOURS;
		for(i = 0; i < androids.size(); i++){
			androids[i]->setStatus(ST_IDLE);
			androids[i]->setAssigned(asignar);
		}
		androids.clear();	
    }

	if(hoursLeft == 0){
		hoursLeft = WORKINGHOURS;
		for(i = 0; i < androids.size(); i++){
			androids[i]->setStatus(ST_IDLE);
			androids[i]->setAssigned(asignar);
		}
		androids.clear();	
    }
}

ostream &operator<<(ostream &os, const Field &field){
	unsigned int i;
	
	os << "{Field: " << field.name << "(" << field.products << " " << field.hoursLeft << ")" <<  endl;
	
	for(i = 0; i < field.androids.size(); i++){
    	os << (*field.androids[i]);
    	os << endl;
  }
  os << "}";
	return os;
}