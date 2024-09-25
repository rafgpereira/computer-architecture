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

    li a7, 5
    ecall
    mv t1, a0

    li s2, 1 
    beq t0, s2, invalidado 
    beq t1, s2, invalidado 
    beq t0, zero, invalidado 
    blt t0, zero, invalidado
    beq t1, zero, invalidado
    blt t1, zero, invalidado
    bgt t0,t1, t1menor 
    bgt t1,t0, t0menor 

t1menor:
    mv t3, t1 
    j mdc 
t0menor:
    mv t3, t0 
    j mdc
mdc:
    beq t3 , s2, achoumdc
    rem t4, t0,t3
    rem t5, t1,t3
    add s3, t5, t4
    beqz s3, achoumdc
    addi t3,t3,-1
    j mdc
achoumdc:
    mv s0, t3
    j mmc
mmc:
    mul s1, t0,t1
    div s1 , s1, s0
    j final_feliz
final_feliz:
    mv a0, s0  
    li a7, 1  
    ecall  
    
    la a0, eol  
    li a7, 4  
    ecall  
    
    mv a0, s1  
    li a7, 1  
    ecall  
    
    la a0, eol  
    li a7, 4  
    ecall  
    
     
    li a7, 10
    ecall
invalidado:    
    la a0, nopuede  
    li a7, 4  
    ecall  
     
    la a0, eol  
    li a7, 4  
    ecall  
    
     
    li a7, 10
    ecall
    
    