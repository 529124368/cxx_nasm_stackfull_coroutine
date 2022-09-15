all:
			nasm -felf64 function.asm -o function.o
			g++ -o  wewe main.cpp function.o -no-pie

debug:      
			nasm -felf64 function.asm -o function.o -g
			g++ -o  wewe main.cpp function.o -no-pie -g

gdb:
			gdb ./wewe

clean:
			rm *.o