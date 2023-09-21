#include <iostream>
#include "count.h"
using namespace std;
int main()
{
    // int counter = 10;
    cout << GetCountNum() << endl;
    cout << counter << endl;    
    CountOnce();
    cout << GetCountNum() << endl;
    cout << counter << endl;
    counter++;
    cout << GetCountNum() << endl;
    cout << counter << endl;
    return 0;
}
