# Preguntas para después de hacer el ejercicio

A continuación les planteamos algunas cuestiones para pensar y contestar.
Las preguntas van a ser evaluadas también.

## Sobre implementar funcionalidad

Los tests 01, 02 y 03 demuestran la funcionalidad de cómo se incrementa la cantidad de huevos de avispas a medida que los van dejando. Cuando los implementaste, ¿esos tests pasaron (los tres) de una?
¿podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03? ¿se te ocurre cómo?
Y si lograste hacerlo, ¿qué pensás de implementar esa funcionalidad de esa forma?

RTA:
No, no pasaron los 3 de una. Al correr y hacer pasar la prueba 3, se rompieron la primera y la segunda y debimos retroceder para arreglarlas.

Sí, podríamos haber implementado esta funcionalidad de a partes: añadir más orugas que las necesarias para que pasar la prueba 2.
Creeos que implementar esa funcionalidad de esa forma es una manera fácil de avanzar y comprobar que funciona el método y que la solución del problema va orientada por ese lado.



## Sobre código repetido

¿les quedó código repetido? ¿dónde? ¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)?
Responsabilidad de dejar un huevo consumiendo otro insecto
¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat?
¿por qué? ¿por qué tendría sentido que fuera de la otra forma? ¿con cuál nos quedamos?

RTA:

Sí, nos quedó código repetido principalmente en los métodos de control de huevos necesarios para poner un huevo u obtener la cantidad de ellos para una determina firma genética.

En nuestro modelo el responsable de ver si hay suficientes polillas u orugas es el hábitat. Sin embargo, al leer esta pregunta, vemos que algo más correcto sería que el hábitat devuelva la cantidad de orugas o polillas con 'cantidadDePolillas y 'CantidadDeOrugas' pero la comprobación de si hay suficientes o no para reproducirse la hiciese cada avispa por su cuenta. 
En nuestro caso, deberíamos hacer que los mensajes 'HayOrugas' y 'HayPolillas' los responda la avispa que corresponda 
(Oriana orugas, Lara polillas) y no el hábitat.
De esta manera, el habitat te devuelve información sobre si mismo (cuantas polillas u orugas tiene) y las avispas corroboran si pueden reproducirse o no con dichas cantidades puesto que es algo que las concierne a ellas y no al hábitat en el cual viven.


## Sobre código repetido 2

Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código?
Sobre la implementación
¿cómo resolvieron guardar los huevos?
¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban?
Pero la pregunta más importante:
¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba?

En nuestro caso creamos un objeto para cada avispa puesto que cada una de ellas se reproducía de manera distinta. Con lo visto el jueves, una mejora podría ser crear la clase 'Avispa' y cada una de nuestras avispas sería una instancia de esa clase.
En cuanto a la implementación utilizamos un diccionario para guardar los huevos e indexábamos con el nombre de la firma genética a la que pertenecían.
Sí, se podría haber hecho menos y todo andaba pero creemos que la implementación del diccionario facilita la lectura y comprensión del código al permitir una mejor organización de los datos.
