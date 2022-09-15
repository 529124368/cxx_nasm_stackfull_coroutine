%include  'libary.asm'
global _nasm_hello
global _maxofthree
global _print_number
global _get_lengths
global _Div_test
global _Div_float
global _Re_Box
global _Re_Box_plus
global _Div_remainder
global _Stop_run
global _Read_struct
global _Switch;
global _Yield;
global _SwitchPlus;
global _Register;
global _ExitCo:;
[section .data]
fmt_d:db '%x',0xa,0
fmt_s:db '%s',0xa,0
[section .bss]
    array: RESD 0
    arrays: RESQ 0
    content: RESQ 0
[section .text]
_nasm_hello:
    push    rcx
    mov     rax ,rdi
    call    _printfEX
    mov     rax ,rsi
    call    _printfEX
    mov     rax ,rdx
    call    _printfEX
    pop     rcx
    mov     rax ,rcx
    call    _printfEX
    mov     rax ,r8
    call    _printfEX
    ret


_maxofthree:
    mov     rax, rdi                ; result (rax) initially holds x
    cmp     rax, rsi                ; is x less than y?
    cmovl   rax, rsi                ; if so, set result to y
    cmp     rax, rdx                ; is max(x,y) less than z?
    cmovl   rax, rdx                ; if so, set result to z
    ret     

_print_number:
    mov     rax ,rdi
    add     rax,48
    push    rax
    mov     rax, rsp
    call    _printfEX
    pop     rax
    ret

_get_lengths:
    mov     rax ,rdi
    call    _get_length
    ret

_Div_test:
    xor     rdx,rdx
    mov     rax ,rdi
    div     rsi
    ret

_Div_float:
    divsd   xmm0,xmm1
    ret
_Re_Box:
    mov   dword [array],2
    mov   dword [array+4],2
    mov   dword [array+4*2],3
    mov   rax,array
    ret

_Re_Box_plus:
    mov   rax,array
    ret


_Div_remainder:
    push     rbp
    mov      rbp,rsp
    push     rax
    mov      rax,[rbp+8]
    call    _printfd
    pop      rax
    pop      rbp
    xor     rdx,rdx
    mov     rax ,rdi
    div     rsi
    mov     qword [arrays],rax
    mov     qword [arrays+8],rdx

    mov     rax,arrays
    ret


_Stop_run:
    call      rdi
    ret

_Read_struct:
    mov     rax,[rdi]
    call    _printfd
    mov     rax,[rdi+4]
    call    _printfd
    mov     rax,[rdi+8]
    call    _printfs
    mov     rax,[rdi+16]
    call    _printfs
    ret

_Switch:
    push  rbp
    push  rbx
    push  r15
    push  r14
    push  r13
    push  r12
    mov   rax, rsp
    mov   rsp,rdi
    pop   r12
    pop   r13
    pop   r14
    pop   r15
    pop   rbx
    pop   rbp
    pop   r8
    cmp   r8,0x0
    jz    finisheds
    mov   rdi, rax
    jmp   r8

finisheds:
    ; jmp  [content]
    call _ExitCo
_Register:
   mov  qword[content],rdi
   ret
_ExitCo:
    mov       rax, 60                 ; system call for exit
    xor       rdi, rdi                ; exit code 0
    syscall      
; _Yield:
;     push     rax
;     mov      rax,[rsp+8]
;     ; call     _printfd
;     mov      qword [content],rax
;     pop      rax
;     mov      qword [content+8],rbp
;     mov      qword [content+8*2],rbx
;     mov      qword [content+8*3],r15
;     mov      qword [content+8*4],r14
;     mov      qword [content+8*5],r13
;     mov      qword [content+8*6],r12
;     mov      qword [content+8*7],rsp
;     ; mov      rax,content
;     ;leave
;     ret
    
    
 
    


