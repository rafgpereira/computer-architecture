    .data
endl: .string "\n"
    .text
main:
    li a7, 5
    ecall
    mv t0, a0

    li a7, 5
    ecall
    mv t1, a0

    add t2, t0, t1  

    mv a0, t2
    li a7, 1
    ecall
    
    la a0, endl
    li a7, 4
    ecall
    
    li a7, 10
    ecall