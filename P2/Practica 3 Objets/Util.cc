// NIF 15419933C GIMENEZ ALDEGUER, PEDRO
#include "Util.h"

void Util::error(Error n){
  switch (n) {
	case ERR_MAXANDROIDS:
		cout << "Error, no more androids allowed in the farm" << endl;
   		break;
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
