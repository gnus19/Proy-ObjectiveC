# Proy-ObjectiveC
Proyecto y ensayo para CI3641

En este repositorio se encuentra un proyecto propuesto y un ensayo referente al lenguaje Objective-C.

Contenido:
Enunciado del proyecto propuesto en Objective-C.
Tres codigos: cabezeras.h donde estan las declaraciones de las clases, cuerpo.m que contiene la implementacion de las clases y maim.m con el programa principal.

Para poder ejecutar el proyecto, primero se debe compilar:
gcc \`gnustep-config --objc-flags\` \`gnustep-config --base-libs\` main.m cuerpo.m -o main -lbsd

Para su ejecucion:
./main
