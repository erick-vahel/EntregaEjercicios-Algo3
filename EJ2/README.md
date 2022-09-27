# Preguntas

## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

R1:
- Un mensaje para calcular lo necesario en la verificacion del tiempo que demora una accion en el libro de clientes 


## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

R:
- Conceptos/Objetos/Entidades/Colaboradores
    - Conceptos/Clases para lo abstracto en nuestro programa como un semaforo, orco, humano, etc.
    - Objectos/Colaboradores para algo explicito y hasta incluso informacion basica 
- También mensajes, closure donde extraemos acciones de la realidad en el programa
    
## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

R:
- Que una de las areas escenciales del concimiento de un programador es que debe poder relacionar el mundo con el programa en cada parte del codigo del mismo, al extraer el codigo repetido creando abstracciones evitamos perder esa capacidad de explicar el algoritmo creado.
- Además también de que al extraer el codigo repetido permitimos que el programa sea más resistente a futuros cambios sin haber alterado el resultado final del programa en ese momento (refactorizar/modularizar)