// NIF 15419933C GIMENEZ ALDEGUER, PEDRO
#include "Farm.h"
#include "Util.h"
#include <cstring>

//---------------------------------------------------------------
const string HEADER1="---- start ----";
const string HEADER2="---- distribution ----";
const string HEADER3="---- end ----";
const string HOUR="Hour: ";
const string SEPARATOR="===============================================";
//---------------------------------------------------------------

Farm::Farm(string name){
	this->name = name;
	numAndroids = 0;
}

string Farm::getName() const{
	return name;
}

unsigned Farm::numFields() const{
	int numFields;
	numFields = fields.size();

	return numFields;
}

unsigned Farm::getNumAndroids(){
	return numAndroids;
}

void Farm::createField(string name){
	int esta;
	unsigned int i;
	esta = 0;

	if(name == ""){
		cout << "Enter field name: ";
		getline(cin, name);
	}

	for(i = 0; i < fields.size() && esta == 0; i++){
  		if(name == fields[i].getName()){
    		esta = -1;
    	}
  	}

  	if(esta != -1){
  		Field nuevo(name);
		fields.push_back(nuevo); 
  	}

  	else{
   		Util::error(ERR_NAME);
  	}
}

void Farm::createAndroid(int speed, string model){
	bool error; 
	error = false;
	
	if(numAndroids != MAXANDROIDS){
		if(speed == -1){
			cout << "Enter android speed: ";
			cin >> speed;
			cin.get();

			if(speed <= 0){
				Util::error(ERR_WRONG_SPEED);
				error = true;
			}
			else{
				cout << "Enter android model: ";
				getline(cin, model);
			}	
		}			
		if(error == false){
			try{
				Android novo(model, speed); 
				androids[numAndroids] = novo;
				numAndroids++;			
			}
			catch(invalid_argument &e){
				if(strcmp(e.what(), "wrong android model") == 0){
					Util::error(ERR_WRONG_MODEL);
				}
				else{
					Util::error(ERR_WRONG_SPEED);
				}
			}
		}
		
	}
	else{
		Util::error(ERR_MAXANDROIDS);
		
	}
}

// El processProducts de la Práctica 2
void Farm::processProducts(string products){
	string field;
	string productos;
	int unsigned i,j;
	int posp;
	int posc;
	i = 0;
	
	while(i < products.length()){
		field = "";
		productos = "";

		//buscar nombre
		while(i < products.length() && products[i] != '"'){
			i++;
		}
		i++; 
		
		//recojo el nombre	
		while(i < products.length() && products[i] != '"'){
			field = field + products[i];
			i++;
		}
		
		//buscar numero
		while(products[i] < '0' || products[i] > '9'){
			i++;
		}

		//recojo el numero.
		while(i < products.length() && products[i] >= '0' && products[i] <= '9'){
			productos += products[i];
			i++;
		}
		
		posc = -1;

		for(j = 0; j < fields.size() && posc == -1; j++){
			if(fields[j].getName() == field){
				posc = j;
				//Productos a entero(int)
				posp = atoi(productos.c_str());

				if(posp != 0){
					//Meter los datos del campo y de los productos correspondientes
					fields[j].addProducts(posp);
				}
				else{
					Util::error(ERR_WRONG_PRODUCTS);
				}
			}
		}
		if(posc == -1){
			Util::error(ERR_WRONG_FIELD);
		}
	}
}

// El buscarMinimo de la Práctica 2
int Farm::buscarMinimo(){
	unsigned int i;
  	unsigned int minimo;
  	bool esta;
  	esta = false;
  	int posMin;
  	posMin = -1;
  	minimo = INT_MAX;

  	for(i = 0; i < fields.size(); i++){
    	
    	if(fields[i].needsDroids() == true){
      		if(esta == false){
      			esta = true;
        		posMin = i;
        		minimo = fields[posMin].numAndroids();
      		}
   	  		else{
        		if(fields[i].numAndroids() < minimo){
  		    		posMin = i;
          			minimo = fields[posMin].numAndroids();
        		}
        		else{
     	    		if(fields[i].numAndroids() == minimo){
       	    			if(fields[i].getProducts() > fields[posMin].getProducts()){
     			    		minimo = fields[posMin].numAndroids();
              				posMin = i;  
       	    			}           
     	    		} 	
        		}
      		}
    	}
  	}
  	return posMin;
}

int Farm::masRapido(){
	unsigned int i;
	int posMayor;
	posMayor = -1;
  	i = 0;

  	while(i < numAndroids){
    	if(androids[i].getStatus()== ST_IDLE){
    
      		if(androids[i].getSpeed() > androids[posMayor].getSpeed()){
          		posMayor = i;
          	}
        }	
		i++;
	}
	return posMayor;
}

void Farm::distributeAndroids(){
	int posVel;
	int posMin;

	do{
		posMin = buscarMinimo();
		if(posMin != -1){
			posVel = masRapido();

			if(posVel != -1){
				fields[posMin].addDroid(&androids[posVel]);
			}
		}

  	}while(posMin != -1 && posVel != -1);
}

void Farm::startWorkingHour(int &hour){
	string nombre;

	if(fields.size() != 0){
		if(hour == 1){
  			cout << "Products: ";
			getline(cin, nombre);
			processProducts(nombre);
		}
  		collect(hour);
  	}

  	else{

  		Util::error(ERR_NO_FIELDS);	
  	}
}

void Farm::collect(int &hour){
	vector<Android> devolver;
	unsigned int i;
	int DAILY_WORKING_HOURS= 10;
	
	cout << SEPARATOR << endl;
	cout << HOUR << hour << endl;
	cout << HEADER1 << endl;

	cout << (*this) << endl;
	distributeAndroids();
	
	cout << HEADER2 << endl;
	cout << (*this) << endl;
	
	for(i = 0; i < fields.size(); i++){
		fields[i].collect();
	}
	
	cout << HEADER3 << endl;
	
	hour++;
	cout << (*this) << endl;

	if(hour == DAILY_WORKING_HOURS +1){
		for(i = 0; i < numAndroids; i++){
			if(androids[i].getStatus() == ST_MAINTENANCE0){
				androids[i].setStatus(ST_MAINTENANCE1);
			}
			else{
				if(androids[i].getStatus() == ST_MAINTENANCE1){
					androids[i].setStatus(ST_IDLE);
					androids[i].resetHoursWorked();
				}
			}
		}
		hour = 1;
	}
}

ostream &operator<<(ostream &os, const Farm &farm){
	unsigned int i;

	os << "Farm: " << farm.name << endl;
	
  	for(i = 0; i < farm.fields.size(); i++){
  		os << farm.fields[i];
  		os << endl;
	}

	for(i = 0; i < farm.numAndroids; i++){
		if(farm.androids[i].getStatus() != ST_WORKING){
			os << farm.androids[i];
			os << endl;
		}
	}
	return os;
}