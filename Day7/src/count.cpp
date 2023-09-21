#include"count.h"
extern int counter = 0;
void CountOnce()
{
    counter++;
}
int GetCountNum()
{
    return counter;
}