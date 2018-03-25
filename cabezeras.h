#include <bsd/stdlib.h>
#import <stdlib.h>
#import <Foundation/Foundation.h>
#import <unistd.h>

//Clase Soldado:
//	nombre NSString : Nombre del soldado.
//	init: Metodo para inicializar la clase
@interface Soldado:NSObject
{
    NSString *nombre;   // Nombre del soldado
}
@property (assign) NSString *nombre;

@end

//Clase Legion:
//	grupo NSMutableArray: Arreglo mutable con los respectivos soldados de la legion
//	init: Metodo para inicializar la clase

@interface Legion:NSObject
{
    NSMutableArray *grupo;
}

@property (assign) NSMutableArray *grupo;

@end


//Clase CampoDeGuerra:
// piedra Legion: Legion que contiene los soldados de tipo piedra.
// papel Legion: Legion que contiene los soldados de tipo papel.
// tijera Legion: Legion que contiene los soldados de tipo tijera.
// (bool) atacando: Metodo para realizar un ataque aleatorio entre las legiones. Devuelve un booleano que representa si se puede continuar el combate
// (bool) atacando: Metodo para realizar un ataque aleatorio entre las legiones. Devuelve un booleano que representa si se puede continuar el combate
// (int) randomValido: Metodo que devuelve un entero entre 0 y 2 incluido tal que representan una legion que aun tiene participantes
// (bool) aLoSumoUnoVivo: Metodo que determina si solamente 0 o 1 legion viva, permitiendo saber si se debe detener el combate
//0: piedra
//1: tijeras
//2: papel  

@interface CampoDeGuerra:NSObject
{
    Legion *piedra;
    Legion *papel;
    Legion *tijera;
}
-(bool) atacando;
-(bool) aLoSumoUnoVivo;
-(int) randomValido;
@property (assign) Legion *piedra;
@property (assign) Legion *papel;
@property (assign) Legion *tijera;

@end




