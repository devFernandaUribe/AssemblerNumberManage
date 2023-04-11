#Numero mayor o más positivo
#Fernanda Uribe UNIR

.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
resultado: .asciiz "El número mayor o más positivo es: "
salto_linea: .asciiz "\n"

.text
.globl main

main:
    # Pide el primer numero y lo lee
    li $v0, 4           
    la $a0, prompt1  
    syscall            
    li $v0, 5         
    syscall         
    move $t0, $v0     
    # Pide el segundo numero y lo lee
    li $v0, 4         
    la $a0, prompt2    
    syscall            
    li $v0, 5          
    syscall         
    move $t1, $v0      
    # Pide el tercer numero y lo lee
    li $v0, 4        
    la $a0, prompt3     
    syscall     
    li $v0, 5         
    syscall            
    move $t2, $v0       

    # Busca el numero mayor o más positivo
    move $t3, $t0       # Compara con el primer número
    abs $t0, $t0        # Calcula valor absoluto del primer número
    bgt $t0, $t3, check_t1     # Compara con el valor absoluto del segundo número
    move $t3, $t1
    abs $t1, $t1        # Calcula valor absoluto del segundo número
check_t1:
    bgt $t1, $t3, check_t2    # Compara con el valor absoluto del tercer número
    move $t3, $t2
    abs $t2, $t2        # Calcula valor absoluto del tercer número
check_t2:
    bgt $t2, $t3, update_max   # Compara con el valor absoluto de $t3
    move $t3, $t3
update_max:
    # Muestra el resultado
    la $a0, resultado
    li $v0, 4
    syscall
    move $a0, $t3
    li $v0, 1
    syscall
    la $a0, salto_linea
    li $v0, 4
    syscall
