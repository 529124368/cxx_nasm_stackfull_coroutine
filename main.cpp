
#include <iostream>
#include "asm.h"
#include <cstring>
#include <unistd.h>
// void testss();
// void testsss(man &m);
template <class T>
void _Stop_run(T g);
void _run(char *s);
void _run1(char *s);
void coStart();
int main(void)
{
    int sum = 2;
    auto stack_ = malloc(1024 * 8);
    memset(stack_, 0, 1024 * 8);
    auto new_sp_ = (char *)stack_ + 4096;
    *((void **)(new_sp_ + 6 * 8)) = (void *)_run;

    _Register((char *)coStart);
    // man m;
    // m.age = 30;
    // m.sex = 100;
    // m.name = "sdfsdf";
    // m.flg = "sdfsdfdsfs";
    // man &b = m;
    // testsss(b);
    // _Read_struct(b);
    // std::cout << "age is :" << m.age << std::endl;
    // int asdsa = _maxofthree(1, 2, 4);
    // std::cout << asdsa << std::endl;
    // int asdsas = _maxofthree(10, 2, 4);
    // std::cout << asdsas << std::endl;
    // _nasm_hello("1#", "2#", "3#", "4#", "5#");
    // _print_number(6);

    // int len = _get_lengths("12sdf#@#");
    // std::cout << "length is :" << len << std::endl;

    // int shang = _Div_test(9, 4);
    // std::cout << "除法结果 :" << shang << std::endl;

    // double d = _Div_float(7.0, 2.0);
    // std::cout << d << std::endl;

    // _Div_remainder(23423, 2334);
    // _Div_remainder(2342323, 2334);

    // _Stop_run([&new_sp_]()
    //           {
    //     for (size_t i = 0; i < 5; i++)
    //     {
    //         std::cout << i << std::endl;
    //         new_sp_ = _Switch(new_sp_);
    //     } });

    // testss();
    // int *aboxs = _Re_Box_plus();
    // for (int i = 1; i < aboxs[0] + 1; i++)
    // {
    //     std::cout << "2->" << *(aboxs + i) << std::endl;
    // }
    _run1(new_sp_);
    _run(new_sp_);
    free(stack_);
    // coStart(&sum);

    return 0;
}

// void testss()
// {
//     int *abox = _Re_Box();
//     for (int i = 1; i < abox[0] + 1; i++)
//     {
//         std::cout << "1->" << *(abox + i) << std::endl;
//     }
// }

// void testsss(man &m)
// {
//     m.age = 10;
// }

template <class T>
void _Stop_run(T g)
{
    g();
}

void _run(char *s)
{
    for (size_t i = 0; i < 10; i++)
    {
        sleep(1);
        std::cout << "携程1:" << i << std::endl;
        s = _Switch(s);
    }
}

void _run1(char *s)
{

    for (size_t i = 0; i < 10; i++)
    {
        sleep(1);
        std::cout << "携程2:" << i << std::endl;
        s = _Switch(s);
    }
}

void coStart()
{
    for (;;)
    {
        sleep(1);
    }
}
