#Numero menor
# Fernanda Uribe UNIR

.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
resultado: .asciiz "El número menor es: "
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

    #Busca el numero menor
    move $t3, $t0       
    bgt $t1, $t3, check_t1     
    move $t3, $t1       
check_t1:
    bgt $t2, $t3, update_max  
    move $t3, $t2       
update_max:
# muestra el resultado
move $a0, $t3       
li $v0, 1          
syscall          
li $v0, 4           
la $a0, salto_linea   
syscall         
