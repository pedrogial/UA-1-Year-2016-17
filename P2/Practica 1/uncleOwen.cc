
#include <iostream>
#include <climits>
#include <vector>
#include <string>

using namespace std;

// ---------------- android -------------------------
const int NUMDROIDMODELS=5;

const string droidModels[NUMDROIDMODELS] = { 
   "x-75",
   "fx-7",
   "JK9",
   "XAR-25",
   "HC-2"
};


enum Status {ST_WORKING, ST_IDLE};

typedef struct {
   string model; 
   int speed;
   int serialNumber;
   Status status; 
} Android;

// ---------------- field -------------------------

typedef struct {
   string name;
   int products;
   vector<Android> androids;
} Field;

// ---------------- farm --------------------------

typedef struct {
  string name;
  vector<Field> fields;
  vector<Android> androids;
} Farm;

// ---------------- error -------------------------

enum Error {ERR_NO_FIELDS, ERR_UNKNOWN_OPTION, ERR_WRONG_MODEL, ERR_WRONG_FIELD, ERR_WRONG_SPEED, ERR_WRONG_PRODUCTS, ERR_NAME}; 

void error(Error n)
{
  switch (n) {
   
    case ERR_NO_FIELDS:
      cout << "Error, there are no fields in the farm" << endl;
      break;
      
    case ERR_UNKNOWN_OPTION:
      cout << "Error, unknown option" << endl;
      break;

    case ERR_WRONG_MODEL:
      cout << "Error, wrong android model name" << endl;
      break;

    case ERR_WRONG_FIELD:
      cout << "Error, wrong field name" << endl;
      break;

    case ERR_WRONG_SPEED:
      cout << "Error, wrong speed" << endl;
      break;

    case ERR_WRONG_PRODUCTS:
      cout << "Error, wrong number of products" << endl;
      break;

    case ERR_NAME:
      cout << "Error, field name repeated" << endl;
      break;
    
  }
}

//---------------------------------------------------------------
const string HEADER1="---- start ----";
const string HEADER2="---- distribution ----";
const string HEADER3="---- end ----";
//---------------------------------------------------------------

void printAndroid(const Android &android){
	cout << "[" << android.model << " sn=" << android.serialNumber << " s=" << android.speed << " st=" << android.status << "]" << endl;
}

void printField(const Field &field){
	unsigned int i;
	
	cout << "{Field: " << field.name << "(" << field.products << ")" << endl;
	
	for(i = 0; i < field.androids.size(); i++){
    	printAndroid(field.androids[i]);
    	cout << endl;
  	}
  	cout << "}";
}

void printFarm(const Farm &farm){
	unsigned int i;

	cout << "Farm: " << farm.name << endl;
	
  	for(i = 0; i < farm.fields.size(); i++){
   		printField(farm.fields[i]);
   		cout << endl;
	}

	i = 0;

	for(i = 0; i < farm.androids.size(); i++){
		printAndroid(farm.androids[i]);
		cout << endl;
	}
}

void createAndroid(Farm &farm, int &nextSerialNumber){
	Android novo;
	int i, esta;
	esta = 0;

	cout << "Enter android speed:"<< endl;
	cin >> novo.speed;
	cin.get();
	if(novo.speed <= 0){
    	error(ERR_WRONG_SPEED);
	}
  	
  	else{
		cout << "Enter android model:"<< endl;
		getline(cin, novo.model);
	  
		for(i = 0; i < NUMDROIDMODELS; i++){
	    	if(novo.model == droidModels[i]){
	      	esta = -1;
	    	}
	  	}
		
		if(esta == -1){
	    	novo.serialNumber = nextSerialNumber;
	    	nextSerialNumber++;
	    	novo.status = ST_IDLE;
	    	farm.androids.push_back(novo);
	  	}

		else{
	    	error(ERR_WRONG_MODEL);  
	  	}
	}
}

void createField(Farm &farm){
	Field novo;
	unsigned int i; 
	int esta;
	esta = 0;
	
	cout << "Enter field name:" << endl;
  	getline(cin, novo.name);
  	novo.products = 0;

  	for(i = 0; i < farm.fields.size(); i++){
    	if(novo.name == farm.fields[i].name){
      	esta = -1;
    	}
  	}

  	if(esta != -1){
    	farm.fields.push_back(novo);
  	}

  	else{
    	error(ERR_NAME);
  	}
}

int buscarNombre(const Farm &f, string nombre){
	unsigned int i; 
	int pos;
	pos = -1;

	for(i = 0; i < f.fields.size(); i++){
		if(f.fields[i].name == nombre){
			pos = i;
		}
	}

	return pos;
}

int minimo(const Farm &f){
	unsigned int i;
  	int posMin;
  	posMin = -1;

  	for(i = 0; i < f.fields.size(); i++){
    	if(f.fields[i].products > 0){
     		if(posMin == -1){
        		posMin = i;
      		}
      		else{
        		if(f.fields[i].androids.size() < f.fields[posMin].androids.size()){
          			posMin = i;
        		}
        		else{
        			if(f.fields[i].androids.size() == f.fields[posMin].androids.size()){
            			if(f.fields[i].products > f.fields[posMin].products){
              				posMin = i;  
            			}           
          			}	
        		}
      		}
    	}
	}
  return posMin;
}

int masRapido(const Farm &farm){
	unsigned int i; 
	int posMayor, Vel;
	posMayor = 0;
	Vel = 0;

	for(i = 0; i < farm.androids.size(); i++){
		if(i == 0){
			 Vel = farm.androids[0].speed;
		}
		else{
			if(farm.androids[i].speed > Vel){
				Vel = farm.androids[i].speed;
				posMayor = i;
			}
		}
	}
	return posMayor;
}


int proPro(const vector<Android> &androids){
	unsigned int i; 
	int total, horas;
	horas= 5;
	total = 0;
	
	for(i = 0; i < androids.size(); i++){
		total = total + androids[i].speed * horas;
	}

	return total;
}

void distributeAndroids(Farm &farm){
	int posVel;
	int posMin;
	Android aux;
	bool fake;
	fake = false;
	
	while(farm.androids.size() > 0 && fake == false){
		posMin = minimo(farm);

		if(posMin == -1){
			fake = true;
		}
		else{
			posVel = masRapido(farm);
			aux = farm.androids[posVel];
			aux.status = ST_WORKING;
			farm.androids.erase(farm.androids.begin() + posVel);
			farm.fields[posMin].androids.push_back(aux);
		}
	}
}

void collectField(Field &field){
  int productos;
  productos = proPro(field.androids);
  	field.products = field.products - productos;
	if(field.products < 0){
		field.products = 0;
	}
}


void collectFarm(Farm &farm){
  	unsigned int i, j;
  	cout << HEADER1 << endl;

  	printFarm(farm);
  	distributeAndroids(farm);

  	cout << HEADER2 << endl;

  	printFarm(farm);

  	for(i = 0; i < farm.fields.size(); i++){
    	collectField(farm.fields[i]);
  	}

  	i = 0;

  	for(i = 0; i < farm.fields.size(); i++){

    	for(j = 0; j < farm.fields[i].androids.size(); j++){
      		farm.fields[i].androids[j].status = ST_IDLE;      
      		farm.androids.push_back(farm.fields[i].androids[j]);
    	}
    	farm.fields[i].androids.clear();
  	}

  	cout << HEADER3 << endl;

  	printFarm(farm);
}


void startWorkingDay(Farm &farm){
   	string nombre;
   	int pos, productos;

	if(farm.fields.size() > 0){
    	do{
      		cout << "Enter field name: ";
      		getline(cin, nombre);

      		if(nombre!= "q"){
        		pos = buscarNombre(farm, nombre);

        		if(pos == -1){
        			error(ERR_WRONG_FIELD);
        		}
      			else{
      				cout << "Products: ";
        			cin >> productos;
        			cin.get();
        			if(productos <= 0){
          				error(ERR_WRONG_PRODUCTS);
        			}

        			else{
          				farm.fields[pos].products = farm.fields[pos].products + productos;
        			}
      			}
      		}
    	}while(nombre != "q");
    		collectFarm(farm);
    }
	else{
  		error(ERR_NO_FIELDS);
  	}
}

void menu()
{
  cout << "-----========== Farm manager ==========-----" << endl
       << "1- List farm info" << endl
       << "2- Add field" << endl
       << "3- Add android" << endl
       << "4- Start working day" << endl
       << "q- Quit" << endl
       << "Option: " ;
}


int main(){

   	Farm farm;
   	farm.name = "west farm";
   	char option;
   	int nextSerialNumber = 100;  

   	do {
        menu();
        cin >> option; cin.get();
        
        switch (option) { 
          case '1': {
				printFarm(farm);
            break;
          }
          case '2': { 
				createField(farm);
            break;
          }
          case '3': {
				createAndroid(farm, nextSerialNumber);
            break;
          }
          case '4': {
          		startWorkingDay(farm);
            break;
          }
          case 'q': {
            break;
          }
          default:  {
            error(ERR_UNKNOWN_OPTION); 
            break;
          }
        }
   } while (option != 'q');
   
   return 0;
}
