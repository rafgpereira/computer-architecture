.data
eol:  .string "\n"
string1: .space 1000
string2: .space 1000

.text

main:
    li a7, 5
    ecall
    mv t0, a0
    
    addi t0, t0, 1
    addi t1, zero, 0
    addi t2, zero, 0
    
    la a0, string1
    mv a1, t0
    li a7, 8
    ecall
    
    la a0, eol
    li a7, 4
    ecall
    
    la a0, string2
    mv a1, t0
    li a7, 8
    ecall
    
    la a0, eol
    li a7, 4
    ecall
    
    la t3, string1
    la t4, string2

loop:
    bgt t2, t0, done
    
    lb t5, 0(t3)
    lb t6, 0(t4)
    
    beqz t5, done
    beqz t6, done
    
    beq t5, t6, igual
    
    j volta
      
igual:
    addi t1, t1, 1
    j volta

volta:
    addi t3, t3, 1
    addi t4, t4, 1
    addi t2, t2, 1
    
    j loop
    
done:
    mv a0, t1
    li a7, 1
    ecall
    
    la a0, eol