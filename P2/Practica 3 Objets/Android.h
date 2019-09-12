// NIF 15419933C GIMENEZ ALDEGUER, PEDRO
#ifndef _android
#define _android
#include <iostream>
#include "Util.h"
#include <stdexcept>
using namespace std;

enum Status {
  ST_WORKING, 
  ST_IDLE, 
  ST_MAINTENANCE0,
  ST_MAINTENANCE1 
};

class Android{
	friend ostream &operator<<(ostream &os, const Android &android);
	protected:
		string model;
		int speed;
		int serialNumber;
		int hoursWorked;
		static int nextSerialNumber;
		Status status;
		bool assigned;
		
	public:
		Android();
		Android(string model, int speed);
		string getModel() const;
		int getSpeed() const;
		int getSerialNumber() const;
		int getHoursWorked() const;
		Status getStatus() const;
		bool isAssigned() const;
		void setAssigned(bool assigned);
		void setStatus(Status status);
		void resetHoursWorked();
		bool isIdle() const;
		void oneMoreHour();
		bool isMaintenanceTime() const;
};
#endif