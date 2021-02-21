# Apartat a
# import matematiques.operacions_basiques as operacions_basiques 

# a, b = 13, 3
# print ('operands =', a, b)
# print ('sumar =', operacions_basiques.sumar (a, b))
# print ('restar =', operacions_basiques.restar (a, b))
# print ('multiplicar =', operacions_basiques.multiplicar (a, b))
# print ('dividir =', operacions_basiques.dividir (a, b))

# Apartat b

# import matematiques.operacions_basiques as ob 

# a, b = 13, 3
# print ('operands =', a, b)
# print ('sumar =', ob.sumar (a, b))
# print ('restar =', ob.restar (a, b))
# print ('multiplicar =', ob.multiplicar (a, b))
# print ('dividir =', ob.dividir (a, b))

# Apartat C

from matematiques.operacions_basiques import sumar, restar, multiplicar, dividir

a, b = 13, 0
print ('operands =', a, b)
print ('sumar =', sumar (a, b))
print ('restar =', restar (a, b))
print ('multiplicar =', multiplicar (a, b))
print ('dividir =', dividir (a, b))
