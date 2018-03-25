#include <bsd/stdlib.h>
#import <stdlib.h>
#import <Foundation/Foundation.h>
#import <unistd.h>
#import <cabezeras.h>
#import <stdio.h>



//Variable global de tipo CampoDeGuerra
CampoDeGuerra *campo;

//Funcion principal
int main( )
{
   //Se inicializa el pool
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];    
      
   //Se inicializa el campo de guerra
   CampoDeGuerra * campo = [[CampoDeGuerra alloc] init];
   
   //Se inicializan los int necesarios
   int cantidadSoldados,cantidadAtaques,cantidadPiedra,cantidadTijera,cantidadPapel,contador, estado, temporal;
   //Se piden la cantidad de objetos y ataques
   printf("Ingrese la cantidad de objetos\n");  
   estado = scanf("%d", &cantidadSoldados);
	while(estado!=1 || cantidadSoldados<1){
		while((temporal=getchar()) != EOF && temporal != '\n');
		if(cantidadSoldados<1){
			printf("Ingrese la cantidad de objetos (Debe ser un entero positivo):\n");		
		}
		estado = scanf("%d", &cantidadSoldados);
	}

	printf("Ingrese la cantidad de ataques\n");  
	
	estado = scanf("%d", &cantidadAtaques);
	while(estado!=1 || cantidadAtaques<1){
		while((temporal=getchar()) != EOF && temporal != '\n');
		if(cantidadAtaques<1){
			printf("Ingrese la cantidad de ataques (Debe ser un entero positivo):\n");		
		}
		estado = scanf("%d", &cantidadAtaques);
	}

   //Se inicializa el contador
   contador=0;
   //Se llenan las legiones con los soldados
   while(contador<cantidadSoldados){
      [campo.piedra.grupo addObject:[[Soldado alloc]init]];
   	  [campo.tijera.grupo addObject:[[Soldado alloc]init]];
      [campo.papel.grupo addObject:[[Soldado alloc]init]];
	  contador++;
   }
   
   //Reinicia el contador
   contador=0;
   //Se realizan los ataques
   while(contador<cantidadAtaques && [campo atacando]){  	
		contador++;
   }


   //Se obtiene la cantidad de soldados restantes de cada legion
   cantidadPiedra = [campo.piedra.grupo count];
   cantidadPapel = [campo.papel.grupo count];
   cantidadTijera = [campo.tijera.grupo count];
   //Se imprime la cantidad de soldados restantes
	printf("Soldados restantes de piedra:%d\n",cantidadPiedra);
	printf("Soldados restantes de papel:%d\n",cantidadPapel);
	printf("Soldados restantes de tijera:%d\n",cantidadTijera);
	
	//Se determina el ganador y se muestra en pantalla
	if(cantidadPiedra>cantidadPapel && cantidadPiedra>cantidadTijera){printf("La piedra ha ganado!\n");}
	else if(cantidadPapel>cantidadPiedra && cantidadPapel>cantidadTijera){printf("El papel ha ganado!\n");}	
	else if(cantidadTijera>cantidadPapel && cantidadTijera>cantidadPiedra){printf("La tijera ha ganado!\n");}	
	else if(cantidadPapel==cantidadPiedra && cantidadPiedra==cantidadTijera){printf("Ha sido un triple empate!\n");}
	else if(cantidadPapel==cantidadPiedra ){printf("Ha sido un empate entre la piedra y el papel!\n");}
	else if(cantidadPapel==cantidadTijera ){printf("Ha sido un empate entre el papel y la tijera!\n");}
	else if(cantidadPiedra==cantidadTijera ){printf("Ha sido un empate entre la piedra y la tijera!\n");}	
	
	//Se libera el pool
   [pool drain];
   return 0;
}
