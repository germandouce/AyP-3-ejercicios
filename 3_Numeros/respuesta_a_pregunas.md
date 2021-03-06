# Números

## Preguntas teóricas

### Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

RTA:
1 + 1/2
a 1 sumale 1/2 (nos da info sobre que tipo de dato es el 1/2)
1/2 sumate a 1 (nos da info sobre que tipo de dato es 1)

El primer llamado aporta información acerca de que clase el segundo objeto de DD y el segundo llamado nos informa de la clase del 
primer objeto involucrado en el DD.


### Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? 
¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

RTA:
Lo mejor es tener la lógica de instanciado en el método más "profundo" que es necesario llamar. De esta manera uno le pide a los objetos que 
directamente hagan "cosas" o devuelvan el valor u objeto que necesitamos.
Para crearlo de diferentes lugares o formas, crearíamos el objeto que queremos devolver, sin valor, en el primer llamado del DD y lo pasaríamos
como "colaborador" en el segundo llamado que se encargará de asignarle valor (actúa como una especie de "setter"). Finalmente, el primer 
llamado devolverá ese objeto con el valor correspondiente.

### Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

RTA:
Venimos categorizando los métodos según a quien le corresponde la responsabilidad de utilizarlos. Sin embargo, hemos combinado ese criterio con otro
que nos permite ocultar aquellos que son puramente "internos" colocándolos en una categoría de privados.

### Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? 
¿para qué sirve?

RTA:
Ponemos “self subclassResponsibility” para delegar la responsabilidad de utilizar ese método en sus hijos, ya que el propósito en ellos es el mismo 
pero el cómo lo hacen es distinto.

### No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

RTA:
Como el encapsulamiento busca ocultar los métodos de un objeto, al romperlo, estos comienzan o pueden comenzar a depender de otros objetos. Esto podría
producir errores en todo el programa en caso de tener que modificar dichos métodos ya que ahora dependen de todo el programa.
