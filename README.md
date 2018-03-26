# Proy-ObjectiveC
Proyecto y ensayo para CI3641

En este repositorio se encuentra un proyecto propuesto y un ensayo referente al lenguaje Objective-C.

Contenido:
Enunciado del proyecto propuesto en Objective-C.
Tres codigos: cabezeras.h donde estan las declaraciones de las clases, cuerpo.m que contiene la implementacion de las clases y maim.m con el programa principal.

Para si ejecucion primero se debe descargar las dependencias:
`sudo apt-get install  libbsd-dev`
`sudo apt-get install gnustep gnustep-devel gobjc`

Luego para su compilacion:
gcc main.m cuerpo.m -o main \`gnustep-config --objc-flags\` \`gnustep-config --base-libs\` -lbsd

Para su ejecucion:
`./main`

Advertencia: Colocar un numero considerado de objetos, ya que puede afectar a la memoria (no mas de miles)
