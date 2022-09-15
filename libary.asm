extern  printf

_get_length:   
    push    rbx
    mov     rbx, rax
nextchar:
    cmp     byte [rax], 0
    jz      finished
    inc     rax
    jmp     nextchar
finished:
    sub     rax, rbx
    pop     rbx
    ret

_prinf:
    push    rdx
    push    rdi
    push    rsi
    push    rax
    call    _get_length
    mov     rdx, rax 
    pop     rax
    mov     rsi, rax             ; address of string to output
    push    rax
    mov     rax, 1         ; system call for write
    mov     rdi, 1                  ; file handle 1 is stdout
    syscall
    pop    rax
    pop    rsi
    pop    rdi
    pop    rdx
    ret

_printfd:
    push    rdi
    push    rsi
    push    rax
    mov     rdi,fmt_d
    mov     rsi,rax
    mov     rax,0
    call    printf
    pop    rax
    pop    rsi
    pop    rdi
    ret


_printfEX:
    call    _prinf
    push    rax         ; push eax onto the stack to preserve it while we use the eax register in this function
    mov     rax, 0Ah    ; move 0Ah into eax - 0Ah is the ascii character for a linefeed
    push    rax         ; push the linefeed onto the stack so we can get the address
    mov     rax, rsp    ; move the address of the current stack pointer into eax for sprint
    call    _prinf      ; call our sprint function
    pop     rax         ; remove our linefeed character from the stack
    pop     rax         ; restore the original value of eax before our function was called
    ret   

_printfs:
    push    rdi
    push    rsi
    push    rax
    mov     rdi,fmt_s
    mov     rsi,rax
    mov     rax,0
    call    printf
    pop    rax
    pop    rsi
    pop    rdi
    ret