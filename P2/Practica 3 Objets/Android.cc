// NIF 15419933C GIMENEZ ALDEGUER, PEDRO
#include "Android.h"

const int NUMDROIDMODELS = 25;

typedef struct {
  string modelName;
  int    hoursMaintenance;
} AndroidData;

const AndroidData ANDROIDDATA[NUMDROIDMODELS] = 
  {
    "x-75", 8,
    "fx-7", 10,
    "JK9", 15,
    "XAR-25", 5,
    "HC-2", 12,
    "Xj 23 v7.5", 10,
    "c3p0-2", 20,
    "r2d2", 15,
    "f9-x d27", 10,
    "-v65 +23", 11,
    "@prog2ua", 13,
    "#h45ht4g", 18,
    "fx-9", 10,
    "x-7", 12,
    "JK10", 7,
    "GHR tdi9", 10,
    "fx-8", 20,
    "fx-75", 5,
    "JK9-75", 14,
    "HC-3.7", 12,
    "xw-a87", 17,
    "tiDef 8", 25,
    "fx-5", 10,
    "fx-3", 8,
    "fx-4", 9
 };

int Android::nextSerialNumber = 100;

int Android::getSpeed() const{
	return speed;
}

Android::Android(){
	model = "";
	speed = -1;
	status = ST_IDLE;
	hoursWorked = 0;
	assigned = false;
}

Android::Android(string model, int speed){
	 int esta;
	 esta = 0;
	
	for(unsigned int i = 0; i < NUMDROIDMODELS; i++){
		if(model == ANDROIDDATA[i].modelName){		
			esta = -1;
		}
	}

	if(esta != -1){
		throw invalid_argument("wrong android model");
	}
	if(speed < 0){
		throw invalid_argument("wrong speed");
	}

	serialNumber = nextSerialNumber;
	this->hoursWorked = 0;
	nextSerialNumber++;
	this->model = model;
	this->status = ST_IDLE;
	this->speed = speed;
	assigned = false;
}

string Android::getModel() const{
	return model;
}

int Android::getSerialNumber() const{
	return serialNumber;
}

int Android::getHoursWorked() const{
	return hoursWorked;
}

Status Android::getStatus() const{
	return status;
}

bool Android::isAssigned() const{
	return assigned;
}

void Android::setAssigned(bool assigned){
	this->assigned = assigned;
}

void Android::setStatus(Status status){
	this->status = status;
}

bool Android::isIdle() const{
	bool esta;

	if(status == ST_IDLE){
		esta = true;
	}
	else{
		esta = false;
	}

	return esta;
}

void Android::oneMoreHour(){
	hoursWorked++;
}

bool Android::isMaintenanceTime() const{
	bool esta;
	esta = true;
	int horasmodel, i;

	for(i = 0; i < NUMDROIDMODELS; i++){
		if(model == ANDROIDDATA[i].modelName){
			horasmodel = ANDROIDDATA[i].hoursMaintenance;
		}
	}
	if(horasmodel == hoursWorked){
		esta = true;
	}
	else{
		esta = false;
	}
	return esta;
}

void Android::resetHoursWorked(){
	hoursWorked = 0;
}


ostream &operator<<(ostream &os, const Android &android){
	os << "[" << android.model << " sn=" << android.serialNumber << 
	" s=" << android.speed << " hw=" << android.hoursWorked << 
	" st=" << android.status << " a=" << android.assigned << "]";
	return os;
}


