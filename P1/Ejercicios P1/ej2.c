#include <cstdlib>
#include <iostream>
#include <time.h>
using namespace std;

int main(){
    int random_vector[100];
    int i;
    srand(time(NULL));
    cout << "Estos son los números: "<< endl;
    
    for(i = 0; i<=99; i++){
        random_vector[i]= rand() %10 + 1;
    }    
    for(i = 0; i<=99; i++){
        cout << random_vector[i] << " ";
    }
    cout << endl;
    cout <<"---------------------------------------------------------------" << endl;
    int numero;
    for(numero=1; numero <=10; numero++){
        int cuantos = 0;
        for (i =0; i <= 99; i++){
            if(numero== random_vector[i]){
                cuantos++;
            }
        }
        cout << numero  << ":" <<  cuantos << endl;
    }
    return 0;
}
