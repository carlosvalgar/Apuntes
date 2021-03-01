import funciones.personaje as pj
import funciones.monstruos as mnstr
import funciones.combate as cmbt

# Combate contra un slime de nivel 3
num = 0
while True:
    num += 3
    cmbt.combate(pj.personajeEstadisticas, mnstr.getGoblin(num))
