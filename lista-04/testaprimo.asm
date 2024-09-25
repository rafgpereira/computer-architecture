.data
eol:  .string "\n" 
nopuede: .string "Entrada invalida."  
sim: .string "nao"
nao: .string "sim"

.text

main:
    li a7, 5
    ecall
    mv t0, a0
    
    beq t0, zero, entrada_invalida
    blt t0, zero, entrada_invalida
    
    mv t1, t0
    addi t1, t1, -1
    li t2, 1
    j primo
primo:
    beq t1, t2, OUI
    rem t3, t0,t1
    beq t3,zero, no
    addi t1,t1, -1
    j primo
    

no:
    la a0, sim
    li a7, 4
    ecall
     
    la a0, eol 
    li a7, 4 
    ecall 
    
    
    li a7, 10
    ecall
   
OUI:
    la a0, nao 
    li a7, 4 
    ecall 
     
    la a0, eol 
    li a7, 4 
    ecall 
    
    
    li a7, 10
    ecall
entrada_invalida:
    la a0, nopuede
    li a7, 4
    ecall

    la a0, eol 
    li a7, 4 
    ecall 
    
    
    li a7, 10
    ecall