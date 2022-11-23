DIM SHARED cantidad AS integer
DIM SHARED resultado AS integer

print 
print "======================================="
print
input "Valor en pesos $:", cantidad

print
call realesapesos
print "REALES BR $"; resultado
call dolaresapesos
print "DOLARES   $"; resultado

print 
print "======================================="
print

sub realesapesos
resultado = cantidad  * 0.03275
end sub

sub dolaresapesos
resultado = cantidad  * 0.00607
end sub
