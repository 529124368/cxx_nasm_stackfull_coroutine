// MySimpleCoroutine
// asm.h
// just for asm code function declare
// create by rayhunterli
// 2021/4/5

#ifndef MYSIMPLECOROUTINE_ASM_H_
#define MYSIMPLECOROUTINE_ASM_H_
struct man
{
    int age;
    int sex;
    char *name;
    char *flg;
    int getAge();
};
int man::getAge()
{
    return age;
}
extern "C" void _nasm_hello(char *a, char *b, char *c, char *d, char *e);
extern "C" int _maxofthree(int a, int b, int c);
extern "C" void _print_number(int a);
extern "C" int _get_lengths(char *a);
extern "C" int _Div_test(int a, int b);
extern "C" double _Div_float(double a, double b);
extern "C" int *_Re_Box();
extern "C" int *_Re_Box_plus();
extern "C" long *_Div_remainder(int a, int b);
extern "C" void _Read_struct(man &m);
extern "C" char *_Switch(char *p);
extern "C" void _Yield();
extern "C" void _Register(char *p);
extern "C" void _ExitCo();

#endif