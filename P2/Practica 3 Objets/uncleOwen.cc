// NIF 15419933C GIMENEZ ALDEGUER, PEDRO
#include <iostream>
#include <cstdlib>

using namespace std;

#include "Farm.h"
#include "Util.h"

void menu(int hour)
{
  cout << "-----========== Farm manager ==========-----" << endl
       << "1- List farm info" << endl
       << "2- Add field" << endl
       << "3- Add android" << endl
       << "4- Start working hour ("<< hour << ")" << endl
       << "q- Quit" << endl
       << "Option: " ;
}


int main()
{
   Farm farm("west farm");
   char option;
   int hour=1;

   do {
        menu(hour);
        cin >> option; cin.get();
        
        switch (option) {
          case '1': cout << farm;
            break;
          case '2': farm.createField();
            break;
          case '3': farm.createAndroid();
            break;
          case '4': farm.startWorkingHour(hour);
            break;

          case 'q':
            break;
          default: Util::error(ERR_UNKNOWN_OPTION);
                  
        }
   } while (option != 'q');
}
