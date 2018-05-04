.data
mg1: .asciiz "enter a\n"
mg2: .asciiz "enter b\n"
mg3: .asciiz "enter c\n"
mg4: .asciiz "complex roots\n"
mg5: .asciiz "the roots = "
mg6: .asciiz " and "

x: .float 4
y: .float 2
z: .float 0
.text
lwc1 $f1,x
lwc1 $f2,y
lwc1 $f3,z

#promt user for a
li $v0,4
la $a0,mg1
syscall
#collect a = $f4
li $v0,6
syscall
add.s $f4,$f0,$f3
#promt user for b
li $v0,4
la $a0,mg2
syscall
#collect b = $f5
li $v0,6
syscall
add.s $f5,$f0,$f3
#promt user for c
li $v0,4
la $a0,mg3
syscall
#collect c = $f6
li $v0,6
syscall
add.s $f6,$f0,$f3

#get b^2 = $f7
mul.s $f7,$f5,$f5
#get 2a = $f8
mul.s $f8,$f2,$f4
#get ac = $f6
mul.s $f6,$f4,$f6
#get 4ac = $f6
mul.s $f6,$f1,$f6
#get b^2-4ac = $f6
sub.s $f6,$f7,$f6
#check if d < 0
mfc1 $t1,$f6
blez $t1,complex
#compute x1 
neg.s $f7,$f5
sqrt.s $f6,$f6
add.s $f9,$f7,$f6
div.s $f9,$f9,$f8 #x1 = $f9
#compute x2
sub.s $f10,$f7,$f6
div.s $f10,$f10,$f8 #x2 = $f10
#print result
li $v0,4
la $a0,mg5
syscall
li $v0,2
add.s $f12,$f9,$f3
syscall
li $v0,4
la $a0,mg6
syscall
li $v0,2
add.s $f12,$f10,$f3
syscall
b exit
complex:
li $v0,4
la $a0,mg4
syscall
exit:
li $v0,10
syscall


