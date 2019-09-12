// NIF 15419933C GIMENEZ ALDEGUER, PEDRO

#include <iostream>
#include <climits>
#include <cstdlib>
#include <vector>
#include <fstream>
#include <cstring>

using namespace std;

// ---------------- android -------------------------
const int NUMDROIDMODELS=25;

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



enum Status {
  ST_WORKING, 
  ST_IDLE, 
  ST_MAINTENANCE0,
  ST_MAINTENANCE1 
};

typedef struct {

   string model;
   int speed;
   int serialNumber;
   Status status;
   int hoursWorked;
   
} Android;

// ---------------- field -------------------------

typedef struct {

   string name;
   int products;
   int hoursLeft;
   
   vector<Android> androids;
} Field;

// ---------------- farm --------------------------

const int DAILY_WORKING_HOURS=10;

typedef struct {

  string name;
  vector<Field> fields;
  vector<Android> androids;

} Farm;

// ---------------- error -------------------------
enum Error {
  ERR_NO_FIELDS, 
  ERR_UNKNOWN_OPTION,
  ERR_WRONG_MODEL,
  ERR_WRONG_FIELD,
  ERR_WRONG_SPEED, 
  ERR_WRONG_PRODUCTS,
  ERR_NAME,
  ERR_OPEN_FILE,
  ERR_ARGS
};

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

    case ERR_OPEN_FILE:
      cout << "Error, can't open file" << endl;
      break;
    
    case ERR_ARGS:
      cout << "Error, wrong arguments" << endl
           << "Usage: uncleOwen [-f fieldName] [-a androidsFile] [-p productsFile]" << endl;
      break;
  }
}

//---------------------------------------------------------------
const string HEADER1="---- start ----";
const string HEADER2="---- distribution ----";
const string HEADER3="---- end ----";
const string HOUR="Hour: ";
const string SEPARATOR="===============================================";
//---------------------------------------------------------------


// prints android info
void printAndroid(const Android &android){
  cout << "[" << android.model << " sn=" << android.serialNumber << " s=" << android.speed << " hw=" << android.hoursWorked << " st=" << android.status << "]";
}

// prints field info
void printField(const Field &field){
	unsigned int i;
	
	cout << "{Field: " << field.name << "(" << field.products << " " << field.hoursLeft << ")" <<  endl;
	
	for(i = 0; i < field.androids.size(); i++){
    	printAndroid(field.androids[i]);
    	cout << endl;
  }
  cout << "}";
}

// prints farm info
void printFarm(const Farm &farm){
	unsigned int i;

	cout << "Farm: " << farm.name << endl;
	
  	for(i = 0; i < farm.fields.size(); i++){
  		printField(farm.fields[i]);
  		cout << endl;
	}

	for(i = 0; i < farm.androids.size(); i++){
		printAndroid(farm.androids[i]);
		cout << endl;
	}
}

// Creates a new android asking the data to the user given nextSerialNumber, and
// adds the android to the farm
void createAndroid(Farm &farm, int &nextSerialNumber){
	Android novo;
	int unsigned i; 
	int esta;
	esta = 0;

	cout << "Enter android speed: ";
	cin >> novo.speed;
	cin.get();

	if(novo.speed <= 0){
    	error(ERR_WRONG_SPEED);
	}
  	else{
		cout << "Enter android model: ";
		getline(cin, novo.model);

		for(i = 0; i < NUMDROIDMODELS; i++){
			if(novo.model == ANDROIDDATA[i].modelName){		
				esta = -1;
			}
		}	
		//Inicialmente el androide tiene estos datos y se meten en farm.androids
    	if(esta == -1){
    		novo.serialNumber = nextSerialNumber;
    		novo.hoursWorked = 0;
	   		nextSerialNumber++;
	   		novo.status = ST_IDLE;
	   		farm.androids.push_back(novo);
	  	}
		else{
	   		error(ERR_WRONG_MODEL);  
	  	}
	}
}

// creates a new field in the farm with the name provided by the user
void createField(Farm &farm){
	Field novo;
	unsigned int i; 
	int esta;
	esta = 0;
	
	cout << "Enter field name: ";
  	getline(cin, novo.name);
  	

	for(i = 0; i < farm.fields.size(); i++){
  		if(novo.name == farm.fields[i].name){
    		esta = -1;
    	}
  	}

  	//Inicalmente los campos contienen estos datos.
  	if(esta != -1){
  		novo.products = 0;
    	novo.hoursLeft = DAILY_WORKING_HOURS;
    	farm.fields.push_back(novo);
  	}

  	else{
   		error(ERR_NAME);
  	}
}

//Esta función llama al modelo para devolver más tarde las horas
//trabadas(de Mantenimiento)
int horasTrab(string modelo){
	int i, pos, horast;
    horast = 0;
  	pos = -1;

  	for(i =  0; i < NUMDROIDMODELS; i++){
    	if(ANDROIDDATA[i].modelName == modelo){
      		pos = i;
      		horast = ANDROIDDATA[pos].hoursMaintenance;
    	}
  	}
  	if(pos == -1){
    	horast = 0;
 	}

 	return horast;
}

//Suma el total de Velocidades de todos los campos
int totalVelocidad(const Field &field){
	unsigned int i;
  	int total;
  	total = 0;

  	for(i = 0; i < field.androids.size(); i++){
    	total = total + field.androids[i].speed;
  	} 
  	return total;
}

// Función para buscar la posicion del campo buscado, y si no la encuentra devuelve -1.
int buscadorNombre(const Farm &farm, string nombre){
	unsigned int i; 
	int pos;
	pos = -1;

	for(i = 0; i < farm.fields.size(); i++){
		if(farm.fields[i].name == nombre){
			pos = i;
		}
	}

	return pos;
}

// Selecciona el campo con menor numero de androides  y si tiene 
// igual numero de androides el que más productos tenga(De esta función no he cambiado casi nada de la anterior Práctica)
int minimo(const Farm &farm){
	unsigned int i;
  	unsigned int minimo;
  	int posMin, VelocidadesProducto;
  	posMin = -1;
  	minimo = INT_MAX;  

  	for(i = 0; i < farm.fields.size(); i++){
    	VelocidadesProducto = totalVelocidad(farm.fields[i]);

    	if(farm.fields[i].products > 0 && farm.fields[i].products > VelocidadesProducto){
      		if(posMin == -1){
        		posMin = i;
        		minimo = farm.fields[posMin].androids.size();
      		}
   	  		else{
        		if(farm.fields[i].androids.size() < minimo){
  		    		posMin = i;
          			minimo = farm.fields[posMin].androids.size();
        		}
        		else{
     	    		if(farm.fields[i].androids.size() == minimo){
       	    			if(farm.fields[i].products > farm.fields[posMin].products){
     			    		minimo = farm.fields[posMin].androids.size();
              				posMin = i;  
       	    			}           
     	    		} 	
        		}
      		}
    	}
  	}
  	return posMin;
}

// Se trata de una función para buscar el androide más rápido.
//buscar el que este en estado ST_IDLE
//seria el primer mayor y luego será comparado con las otras posiciones
int rapido(const Farm &farm){
	unsigned int i, j; 
	int posMayor;
	posMayor = -1;
  	i = 0;

  	while(i < farm.androids.size() && posMayor == -1){
    	if(farm.androids[i].status == ST_IDLE){
      		posMayor = i;

      		for(j = i + 1; j < farm.androids.size(); j++){
        		if(farm.androids[j].status  == ST_IDLE && farm.androids[j].speed > farm.androids[posMayor].speed){
          			posMayor = j;
        		}
      		}
    	}
    	i++;
  	}
	
	return posMayor;
}

//distributes the farm's androids among its fields
//Utilizar la funcion que devuelve la posicion del androide mas rapido y la posicion del campo minimo
//Si ya no hay ninguna de las posiciones sale del while.
void distributeAndroids(Farm &farm){
	int posVel;
	int posMin;
	Android aux;

	do{
		posMin = minimo(farm);
		if(posMin != -1){
			posVel = rapido(farm);

			if(posVel != -1){
				aux = farm.androids[posVel];
				aux.status = ST_WORKING;
				farm.fields[posMin].androids.push_back(aux);
				farm.androids.erase(farm.androids.begin() + posVel);
			}
		}

  	}while(posMin != -1 && posVel != -1);
}


// simulates the collection of products in a field by its androids
//Aqui es donde ocurre la magia
vector<Android> collectField(Field &field){
  	vector<Android> devolver;
  	unsigned int i;
  	int total;
  	total = 0;

  	//Suma el total de Velocidades de todos los campos
  	for(i = 0; i < field.androids.size(); i++){
		total = total + field.androids[i].speed;
	}
	//Restamos los productos con dicha volecidad total
  	field.products = field.products - total;

  	//Si los productos son negativos, forzamos a que sean 0
	if(field.products < 0){
		field.products = 0;
	}
  
  	//Con este for incrementamos las horas trabadas
  	for(i = 0; i < field.androids.size(); i++){
  		field.androids[i].hoursWorked++;
    	
    	//Si  sus horas trabadas estan igualdas cambian a mantenimiento y se borran del vector adroide campo
    	if(field.androids[i].hoursWorked == horasTrab(field.androids[i].model)){
    		field.androids[i].status = ST_MAINTENANCE0;
    		devolver.push_back(field.androids[i]);
			field.androids.erase(field.androids.begin() + i);
			
			//para que no me pueda saltar la posicion que estoy moviendo
  			i--;
  		}
  	}

  	field.hoursLeft--;

    //Devuelve al vector androide los androides que han terminado y si el campo no va
    //a devolver  ningun androide a la granja, devolverá un vector vacío.
    if(field.products == 0){
		field.hoursLeft = DAILY_WORKING_HOURS;
		for(i = 0; i < field.androids.size(); i++){
			field.androids[i].status = ST_IDLE;
			devolver.push_back(field.androids[i]);	
		}
		field.androids.clear();	
    }

	if(field.hoursLeft == 0){
    
		field.hoursLeft = DAILY_WORKING_HOURS;
		for(i = 0; i < field.androids.size(); i++){
			field.androids[i].status = ST_IDLE;
			devolver.push_back(field.androids[i]);	
		}
		field.androids.clear();
    }

    return devolver;
}

void collectFarm(Farm &farm, int &hour){
	vector<Android> devolver;
	unsigned int i;
	unsigned int j;
	
	cout << SEPARATOR << endl;
	cout << HOUR << hour <<endl;
	cout << HEADER1 << endl;

	printFarm(farm);
	distributeAndroids(farm);

 	cout << HEADER2 << endl;

	printFarm(farm);
	//Dicho antes, los devuelve a las granjas de androides.

 	for(i = 0; i < farm.fields.size(); i++){
   		devolver = collectField(farm.fields[i]);
   		for(j = 0; j < devolver.size(); j++){      
    		farm.androids.push_back(devolver[j]);
    	}
    	
 	}
 	//No se si hace falta limpiar(devolver.clear();)
  	
  	cout << HEADER3 << endl;
  	
  	hour++;
  	printFarm(farm);

  	//Voy cambiando los estados de los androides dependiendo de 
  	//las horas de producción además de volver las horas a 1
  	if(hour == DAILY_WORKING_HOURS +1){
  		//No me deja utilizar una auxiliar error de autocorrector
  		//Android aux;
  		//aux = farm.androids[i];

  		for(i = 0; i < farm.androids.size(); i++){
			if(farm.androids[i].status == ST_MAINTENANCE0){
				farm.androids[i].status = ST_MAINTENANCE1;
			}
			else{

				if(farm.androids[i].status == ST_MAINTENANCE1){
					farm.androids[i].status = ST_IDLE;
				}
			}
		}
  	}
}

//Proceso de producción (SAcar los datos, por pates, introducidos)
void proPro(Farm &farm, string products){
	string field;
	string productos;
	int unsigned i;
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
		
		while(i < products.length() && products[i] != ' '){
			productos = productos + products[i];
			i++;
		}

		posc = buscadorNombre(farm, field);

		if(posc == -1){
			error(ERR_WRONG_FIELD);	
		}
		else{
			//Cambiar los productos a entero(int)
			posp = atoi(productos.c_str());

			if(posp != 0){
				//Meter los datos del campo y de los productos correspondientes
				farm.fields[posc].products = farm.fields[posc].products  + posp;
			}
			else{
				error(ERR_WRONG_PRODUCTS);
			}
		}
	}

}

//asks for products data in the farm's fields, then collects them
void startWorkingHour(Farm &farm, int &hour){
	string nombre;

	if(farm.fields.size() != 0){
		if(hour == 1){
  			cout << "Products: ";
  			getline(cin, nombre);
  			proPro(farm, nombre);
		}
  		collectFarm(farm, hour);
  		//Volvemos a la hora inicial si cumple la condición(11 cambia a 1)
  		if(hour == DAILY_WORKING_HOURS +1){
  			hour = 1;
  		}
  	}
  	else{

  		error(ERR_NO_FIELDS);	
  	}
}


//--------------------------------------------------------

const int MAXNAME=10;

typedef struct {
  char model[MAXNAME];
   int speed;
   int serialNumber;
   Status status;
   int hoursWorked;
} AndroidBin;

typedef struct {
  char name[MAXNAME];
  unsigned int products;
  int hoursLeft;
  unsigned int numAndroids;
} FieldBin;

typedef struct {
  char name[MAXNAME];
  int nextSerialNumber;
  int hour;
  unsigned int numFields;
} FarmBin;


// asks for the fname, then opens the file and writes farm data. If the
// file can't be opened returns false, otherwise returns true
bool writeFarmData(const Farm &farm,int nextSerialNumber,int hour){
	FarmBin farmb;
	FieldBin fieldb;
	AndroidBin androidb;
	string fname;
	unsigned int i; 
	unsigned int j;
	bool escribir;
	escribir = true;
	ofstream fich;

	cout << "Enter filename: ";
	getline(cin, fname);
	fich.open(fname.c_str(), ios::binary);

	if(fich.is_open()){
		strncpy(farmb.name, farm.name.c_str(), MAXNAME);
		//en la ultima posición hay que terminar con '\0'
		farmb.name[MAXNAME - 1] = '\0';
		farmb.nextSerialNumber = nextSerialNumber;
		farmb.hour = hour;
		farmb.numFields = farm.fields.size();

		fich.write((const char *) &farmb, sizeof(farmb));

		for(i = 0; i < farm.fields.size(); i++){
			strncpy(fieldb.name, farm.fields[i].name.c_str(), MAXNAME);
			

			fieldb.name[MAXNAME-1] = '\0';
			fieldb.products = farm.fields[i].products;
			fieldb.hoursLeft = farm.fields[i].hoursLeft;
			fieldb.numAndroids = farm.fields[i].androids.size();
			fich.write((const char *) &fieldb, sizeof(fieldb));

			// Hay que recorrer los androides de cada campo.
			for(j = 0; j < farm.fields[i].androids.size(); j++){
				strncpy(androidb.model, farm.fields[i].androids[j].model.c_str(), MAXNAME);

				androidb.model[MAXNAME - 1] = '\0';
				androidb.hoursWorked = farm.fields[i].androids[j].hoursWorked; 
				androidb.speed = farm.fields[i].androids[j].speed;
				androidb.status =farm.fields[i].androids[j].status;
				androidb.serialNumber = farm.fields[i].androids[j].serialNumber;

				fich.write((const char *) &androidb, sizeof(androidb));
			}
		}
		for(j = 0; j < farm.androids.size(); j++){
			strncpy(androidb.model, farm.androids[j].model.c_str(), MAXNAME);

			androidb.model[MAXNAME - 1] = '\0';
			androidb.speed = farm.androids[j].speed;
			androidb.status =farm.androids[j].status;
			androidb.hoursWorked = farm.androids[j].hoursWorked; 
			androidb.serialNumber = farm.androids[j].serialNumber;

			fich.write((const char *) &androidb, sizeof(androidb));
		}

		fich.close();
	}
	else{
		escribir = false;

		error(ERR_OPEN_FILE);
	}

	return escribir;
}

// asks for the fname, then opens the file and reads farm data. If the
// file can't be opened returns false, otherwise returns true
bool readFarmData(Farm &farm, int &nextSerialNumber,int &hour){
	Android android;
	Field field;
	FarmBin farmb;
	FieldBin fieldb;
	AndroidBin androidb;
	string fname;
	bool leer;
	unsigned int i, j;
	leer = true;
	ifstream fich;
	
	cout << "Enter filename: ";
	getline(cin, fname);
	fich.open(fname.c_str(), ios::binary);

	if(fich.is_open()){
		farm.androids.clear();
		farm.fields.clear();
		
		// leo la informacion de la granja
		fich.read((char *) &farmb, sizeof(farmb));

		farm.name = farmb.name;
		hour = farmb.hour;
		nextSerialNumber = farmb.nextSerialNumber;
		
		//los androides de los campos
		for(i = 0; i < farmb.numFields; i++){
			fich.read((char *) &fieldb, sizeof(fieldb));

			field.name = fieldb.name;
			field.products = fieldb.products;
			field.hoursLeft = fieldb.hoursLeft;
			field.androids.clear();		

			for(j  = 0; j < fieldb.numAndroids;j++){
				fich.read((char *) &androidb, sizeof(androidb));

				android.model = androidb.model;
				android.speed = androidb.speed;
				android.status = androidb.status;
				android.hoursWorked = androidb.hoursWorked;
				android.serialNumber = androidb.serialNumber;
				field.androids.push_back(android);
			}
			farm.fields.push_back(field);
		}
		// los androides de la granja
		fich.read((char *) &androidb, sizeof(androidb));
		while(!fich.eof()){

			android.model = androidb.model;
			android.speed = androidb.speed;
			android.status = androidb.status;
			android.hoursWorked = androidb.hoursWorked;
			android.serialNumber = androidb.serialNumber;
			farm.androids.push_back(android);

			fich.read((char *) &androidb, sizeof(androidb));			
		}
		fich.close();
	}
	else{
		leer = false;
		error(ERR_OPEN_FILE);
	}
	return leer;
}

// asks for the fname, then opens the file and reads android data. If the
// file can't be opened returns false, otherwise returns true
bool importAndroids(Farm &farm,int &nextSerialNumber){
	Android novo;
	string fName;
	string modelName;
	string nombre;
	int vel;
	unsigned int i;
	bool leer;
	int esta;
	leer = true;
	nombre = "";
	ifstream fich;

	if(nombre == ""){
		cout << "Enter filename: ";
		getline(cin, fName);
	}
	else{
		fName = nombre;
		
	}
	fich.open(fName.c_str());

	if(fich.is_open()){

		fich >> vel;
		fich.get();
		getline(fich, modelName);

		while(!fich.eof()){
			if(vel <= 0){
				error(ERR_WRONG_SPEED);
			}
			else{
				for(i = 0; i < NUMDROIDMODELS; i++){
					if( modelName == ANDROIDDATA[i].modelName){
						esta = -1;
					}
				}
				if(esta == -1){
					//Intoducimos los datos en novo
					novo.model = modelName;
					novo.speed = vel;
					novo.status = ST_IDLE;
					novo.hoursWorked = 0;
					novo.serialNumber = nextSerialNumber;
					nextSerialNumber++;
					farm.androids.push_back(novo);
				}
				else {
					error(ERR_WRONG_MODEL);
				}
			}
			fich >> vel;
			fich.get();
			getline(fich, modelName);
		}
		fich.close();
	}
	else{

		leer = false;
	}
	return leer;
}

//(Explicado en la función Proc.Arg.)
bool importAndroidsAux(Farm &farm,int &nextSerialNumber, string Nfile){
	Android novo;
	string modelName;
	string fName;
	int vel;
	bool leer;
	int esta;
	leer = true;
	ifstream fich;

	if(Nfile == ""){
		cout << "Enter filename: ";
		getline(cin, fName);
	}
	else{
		fName = Nfile;
	}	
	fich.open(fName.c_str());
	if(fich.is_open()){
		
		fich >> vel;
		fich.get();
		getline(fich, modelName);
		while(!fich.eof()){

			if(vel <= 0){
				error(ERR_WRONG_SPEED);
			}
			else{
				for(int i = 0; i < NUMDROIDMODELS; i++){
					if(ANDROIDDATA[i].modelName == modelName){
						esta = -1;
					}
				}
				if(esta == -1){
					//Intoducimos los datos en novo
					novo.model = modelName;
					novo.speed = vel;
					novo.status = ST_IDLE;
					novo.hoursWorked = 0;
					novo.serialNumber = nextSerialNumber;
					nextSerialNumber++;
					farm.androids.push_back(novo);
				}
				else {
					error(ERR_WRONG_MODEL);
				}			
			}
			fich >> vel;
			fich.get();
			getline(fich, modelName);
		}
		fich.close();
	}
	else{
		leer = false;
	}
	return leer;
}

// asks for the fname, then opens the file and reads product data. If the
// file can't be opened returns false, otherwise returns true
bool importProducts(Farm &farm){
	string linea;
	string fname;
	bool leer;
	leer = false;
	ifstream fich;

	cout << "Enter filename: ";
	getline(cin, fname);
	fich.open(fname.c_str());

	if(fich.is_open()){
		
		getline(fich, linea);

		while(!fich.eof()){
			//proPro Procesa todo los datos y ya los mete dentro de las granjas
			proPro(farm, linea);
			getline(fich, linea);
		}
		leer = true;
		fich.close();
	}

	else{
		error(ERR_OPEN_FILE);
	}
	return leer;
}
//(Explicado en la función Proc.Arg.)
bool importProductsAux(Farm &farm, string nombreFichero){
	string linea;
	bool leer;	
	leer = false;
	ifstream fich;

	fich.open(nombreFichero.c_str());
	if(!fich.is_open()){
		error(ERR_OPEN_FILE);
	}

	else{
		
		getline(fich, linea);

		while(!fich.eof()){
			//proPro Procesa todo los datos y ya los mete dentro de las granjas
			proPro(farm, linea);
			getline(fich, linea);
		}
		leer = true;
		fich.close();
	}
	return leer;
}


//------------------------------------------------------
void menu(int hour)
{
  cout << "-----========== Farm manager ==========-----" << endl
       << "1- List farm info" << endl
       << "2- Add field" << endl
       << "3- Add android" << endl
       << "4- Start working hour (" << hour << ")" << endl
       << "5- Write farm data" << endl
       << "6- Read farm data" << endl
       << "7- Import androids" << endl
       << "8- Import products" << endl
       << "q- Quit" << endl
       << "Option: " ;
}


bool processArguments(int argc,char *argv[],Farm &farm,int &nextSerialNumber){
	vector<string> fields;
	Field field;
	string productsFile, androidsFile;
	unsigned int j;
	unsigned int i;
	int bien;
	int esta;
	bien = 0;
	androidsFile = "";
	productsFile = "";

	//Vamos cogiendo la información de la linea  en orden(-f, -a, -p)
	if(argc % 2 == 1){
		bien = 1;

		for(int i = 1; i < argc; i = i + 2){
			if(strcmp(argv[i], "-f") == 0){
				fields.push_back(argv[i + 1]);
			}
			else{
				if(strcmp(argv[i], "-a") == 0){
					if(androidsFile == ""){
						androidsFile = argv[i + 1];
						
					}
					else{
						bien = 0;
					}
				}
				else{
					if(strcmp(argv[i], "-p") == 0){
						if(productsFile == ""){
							productsFile = argv[i + 1];
						}
						else{
							bien = 0;
						}
					}
					else{
						bien = 0;
					}
				}
			}
		}
	}

	//Comprobamos si no hay error en los argumentos y si no hay crear dos funciones Auxiliales
	//Estas dos funciones haran lo mismo que las originales, pero necesito el nombre del archivo del androide
	//y el archivo de los productos
	if(bien != 0){
		if(androidsFile != ""){
			importAndroidsAux(farm, nextSerialNumber, androidsFile);
		}

		for(i = 0; i < fields.size(); i++){
			esta = 0;

			//Comprobar si esta bien y rellenar el campo
			for(j = 0; j < farm.fields.size(); j++){
				if(farm.fields[j].name == fields[i]){
					esta = -1;
				}
			}

			if(esta == 0){
				field.name = fields[i];
				field.hoursLeft = DAILY_WORKING_HOURS;
				field.products = 0;
				farm.fields.push_back(field);
			}
			else{
				error(ERR_NAME);
			}
		}

		if(productsFile != ""){
			importProductsAux(farm, productsFile);
		}
	}
	else{
		error(ERR_ARGS);
	}
	return bien;
}

int main(int argc,char *argv[])
{
   Farm farm;
   farm.name = "west farm";
   char option;
   int nextSerialNumber = 100;
   int hour=1;

   if (processArguments(argc,argv,farm,nextSerialNumber))
     do {
        menu(hour);
        cin >> option; cin.get();
        
        switch (option) {
          case '1':
			printFarm(farm);
            break;
          case '2':
			createField(farm);
            break;
          case '3':
			createAndroid(farm, nextSerialNumber);
            break;
          case '4':
			startWorkingHour(farm, hour);
            break;
          case '5':
          	writeFarmData(farm, nextSerialNumber, hour);
            break;
          case '6':
          	readFarmData(farm, nextSerialNumber, hour);
            break;
          case '7':
          	importAndroids(farm, nextSerialNumber);
            break;
          case '8':
          	importProducts(farm);
            break;
          case 'q':
            break;
          default: error(ERR_UNKNOWN_OPTION);
            break;
        }
     } while (option != 'q');
     
   return 0;
}
