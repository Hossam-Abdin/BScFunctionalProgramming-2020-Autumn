#include <iostream>

// int Start()
// {
//     return 1;
// }

// int x()
// {
//     return 3;
// }

// int Start ()
// {
//     return x();
// }

int addTwo(int somesystemvariablenamegoeshere)
{
    switch (somesystemvariablenamegoeshere)
    {
        case 0:
        return -1;
        default:
        int x = somesystemvariablenamegoeshere;
        if(x<10)
        {
            return x+1;
        }
        return x+2;
    }
    
}

// int Start()
// {
//     return addTwo(addTwo(9));
// }

int fac(int ijfiejfiejfowjfowifjoiefj)
{
    switch (ijfiejfiejfowjfowifjoiefj)
    {
    case 0:
        return 1;
    
    default:
        int n = ijfiejfiejfowjfowifjoiefj;
        return n * fac(n-1);
    }
}

// int Start()
// {
//     return fac(5);
// }

int facAux(int fjeifjei, int awlflwl)
{
    int acc = awlflwl;
    switch (fjeifjei)
    {
    case 0:
        return awlflwl;
    
    default:
        int n = fjeifjei;
        return facAux(n-1, acc*n);
    }
}

int fac2(int jifiejfeijfisss)
{

    int n = jifiejfeijfisss;
    if(n<0)
    {
        std::exit(9001);
    }
    return facAux(n,1);
}



// int Start()
// {
//     return fac2(5);
// }

int fibAux(int n, int a, int b)
{
    switch (n)
    {
    case 1:
        return b;
    default:
        return fibAux((n-1),b,(a+b));
    }
}

int fib(int n)
{
    if(n<=0)
    {
        std::exit(1);
    }
    return fibAux(n,1,1);
}

// int Start()
// {
//     return fib(30);
// }

int main()
{
    std::cout<<Start()<<std::endl;
    return 65789;
}

