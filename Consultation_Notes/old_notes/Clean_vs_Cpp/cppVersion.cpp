#include <iostream> //import StdEnv

bool isXEven(int x) //isXEven :: Int -> Bool
{
    return x%2==0;
}

bool isXEven2(int x)
{
    if(x%2==0)
        return true;
    else
        return false;
}

int isXEven3(int x)
{
    int flag=true;
    if(x%2==0)
        flag = true;
    else
        flag = false;
    return flag;
}

int variableX()
{
    return 4;
}

int fib(int x)
{
    if(x==0)
        return 0;
    if(x==1)
        return 1;
    return fib(x-1) + fib(x-2)
}

int fibonacci (int x)
{
    return fibAux(x,0,1);
}

int fibAux(int x, int a, int b)
{
    if(x==1)
        return b;
    return fibAux(x-1,b,a+b);
}

int main() //Start
{
    std::cout<<fibonacci(8);
    return 0;// = ???
}
