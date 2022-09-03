#include <stdio.h>

int recursion(int num)
{
    if(num < 1)
        return -1;
    if(num == 1)
        return 1;

    return num + recursion(num - 1);
}

int main()
{
    printf("%d\r\n", recursion(10));

    return 0;
}
