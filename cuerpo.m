#include <bsd/stdlib.h>
#import <stdlib.h>
#import <Foundation/Foundation.h>
#import <unistd.h>
#import <cabezeras.h>

//Nombres de los objetos que no son apuntadores a ninguna cosa de la realidad
NSString *nombresSinReferencia[20] = {@"Hoku",@"Hreezer",@"Helula",@"Herfecto",@"Handroide legal",@"Handroide no legal",@"Bhuu-enos dias",@"Vhegita",@"Thrunks",@"Kakapartido",@"Khuririn",@"Alumno Rozhi",@"Diez shin han",@"iamcha",@"iarirove",@"Leche",@"Mr cris-tiano",@"No humano green",@"Depende",@"Hiren"};

//Clase Soldado:
//	nombre NSString : Nombre del soldado.
//	init: Metodo para inicializar la clase

@implementation Soldado

@synthesize nombre; 

-(id)init
{
   self = [super init];
   self.nombre = [[NSString alloc] init];
   self.nombre = nombresSinReferencia[arc4random_uniform(70)%20];
   return self;
}

@end
//Fin de la clase soldado

//Clase Legion:
//	grupo NSMutableArray: Arreglo mutable con los respectivos soldados de la legion
//	init: Metodo para inicializar la clase

@implementation Legion

@synthesize grupo; 
-(id)init
{
   self = [super init];
   self.grupo = [[NSMutableArray alloc] init];
   return self;
}

@end
//Fin clase legion

@implementation CampoDeGuerra
@synthesize piedra; 
@synthesize papel; 
@synthesize tijera; 

-(id)init
{
   //Se inicializa cada uno de los atributos
   self = [super init];
   self.piedra = [[Legion alloc]init];
   self.papel = [[Legion alloc]init];
   self.tijera = [[Legion alloc]init];
   return self;
}

- (bool) aLoSumoUnoVivo{
   //Se calcula la cantidad de legiones que tienen almenos un soldado
	int a1=0;
	int a2=0;
	int a3=0;
	if(0<[piedra.grupo count]){a1=1;}
	if(0<[tijera.grupo count]){a2=1;}
	if(0<[papel.grupo count]){a3=1;}
	
	if((a1+a2+a3)<=1){
		return true;	
	}
	return false;

}

- (int) randomValido{
   //Se calcula de forma aleatoria un numero que represente una legion que aun tenga soldados.
	int i = arc4random_uniform(70)%3;
	while(true){
		if(i==0 && [piedra.grupo count]>0){

			return 0;
		}
		if(i==1 && [tijera.grupo count]>0){

			return 1;
		}
		if(i==2 && [papel.grupo count]>0){

			return 2;
		}	
	
	
		i=arc4random_uniform(70)%3;
	}

}

-(bool) atacando
{
   //Se hace sleep para poder visualizar los resultados poco a poco en consola
	sleep(1.5);
	//Se determina si se debe detener el combate
	if([self aLoSumoUnoVivo]){return false;}
	
	//Se inicializam las variables
	Soldado *temporal;		
	
    //0: atacar piedra
    //1: atacar tijeras
    //2: atacar papel  
	
    int i = [self randomValido];
    int atacante = [self randomValido];
	int randomSelect,randomSelect2;
	//Segun el caso se selecciona las legiones y se selecciona al azar un objeto de ambas legiones para que interactuen entre si.
    if(atacante==0){
		randomSelect=arc4random_uniform([piedra.grupo count]-1);
		temporal =  [piedra.grupo objectAtIndex :randomSelect];
        if(i==0){
			printf("La piedra (%s) se ha atacado a si mismo \n", [temporal.nombre UTF8String]);
		}
        else if(i==1){
			randomSelect2=arc4random_uniform([tijera.grupo count]-1);
			Soldado *temporalAtacado = [tijera.grupo objectAtIndex :randomSelect2];
			printf("La piedra (%s) ha sacado de la arena a la tijera (%s)\n",[temporal.nombre UTF8String],[temporalAtacado.nombre UTF8String]);
            [tijera.grupo  removeObjectAtIndex:randomSelect2];
        }
        else{
			randomSelect2=arc4random_uniform([papel.grupo count]-1);
			Soldado *temporalAtacado = [papel.grupo objectAtIndex :randomSelect2];
			printf("La piedra (%s) se ha inmolado por el papel (%s)\n",[temporal.nombre UTF8String],[temporalAtacado.nombre UTF8String]);
            [piedra.grupo removeObjectAtIndex:randomSelect];
        }
    }else if(atacante==1){
		randomSelect=arc4random_uniform([tijera.grupo count]-1);
		temporal =  [tijera.grupo objectAtIndex :randomSelect];
        if(i==1){
			printf("La tijera (%s) se ha atacado a si mismo\n",[temporal.nombre UTF8String]);}
        else if(i==0){
			randomSelect2=arc4random_uniform([piedra.grupo count]-1);
			Soldado *temporalAtacado = [piedra.grupo objectAtIndex :randomSelect2];
			printf("La tijera (%s) se ha inmolado por la piedra (%s)\n",[temporal.nombre UTF8String],[temporalAtacado.nombre UTF8String]);
            [tijera.grupo removeObjectAtIndex:randomSelect];
        }
        else{
			randomSelect2=arc4random_uniform([papel.grupo count]-1);
			Soldado *temporalAtacado = [papel.grupo objectAtIndex :randomSelect2];
			printf("La tijera (%s) ha sacado de la arena al papel (%s)\n",[temporal.nombre UTF8String],[temporalAtacado.nombre UTF8String]);
            [papel.grupo removeObjectAtIndex:randomSelect2];
        }        
    }else{
		randomSelect=arc4random_uniform([papel.grupo count]-1);
		temporal =  [papel.grupo objectAtIndex :randomSelect];
        if(i==1){
			randomSelect2=arc4random_uniform([tijera.grupo count]-1);
			Soldado *temporalAtacado = [tijera.grupo objectAtIndex :randomSelect2];		
			printf("El papel (%s) se ha inmolado por  la tijera (%s)\n",[temporal.nombre UTF8String],[temporalAtacado.nombre UTF8String]);
            [papel.grupo removeObjectAtIndex:randomSelect];
        }
        else if(i==0){
			randomSelect2=arc4random_uniform([piedra.grupo count]-1);
			Soldado *temporalAtacado = [piedra.grupo objectAtIndex :randomSelect2];		
			printf("El papel (%s) ha sacado de la arena a la piedra (%s)\n",[temporal.nombre UTF8String],[temporalAtacado.nombre UTF8String]);
            [piedra.grupo removeObjectAtIndex:randomSelect2];
        }
        else{printf("El papel (%s) se ha atacado a si mismo\n",[temporal.nombre UTF8String]);}             
    }
    
    return true;
    
}

@end
//Fin clase CampoDeGuerra

