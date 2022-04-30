# Preguntas

## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

RTA:
Creamos un cronometro que tiene la responsabilidad de guardar los tiempos de inicio y fin del proceso de agregar un cliente.


## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

RTA:
Para representar entes de la realidad en smalltalk podemos ultilizar objetos, principalmente "dos tipos": las clases y sus instancias. Una clase representa una idea, un concepto, un modelo de determinado objeto y define el comportamiento de las instancias de esa clase. Estas últimas, son un caso específico, una particularización de la idea.

## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

RTA:
Sacar código repetido creando abstracciones permite una representar mas facilmente la realidad en un modelo y entender mejor el código al momento de tenerlo que modificar. Sin embargo, esto implica un costo a nivel temporal ya que es necesario leer y comprender el modelo de la teoria planteado incialmente por otros programadores para luego modificarlo.