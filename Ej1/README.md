# ejercicios-2022-2c
Ejercicios para entregar - 2022, 2do cuatrimestre




## Preguntas

1. ¿Qué crítica le harías al protocolo de #estaHerido y #noEstaHerido? (en vez de tener solo el mensaje #estaHerido y hacer “#estaHerido not” para saber la negación)

    - Actualmente la diferencia entre los dos mensajes mencionados es irrelevante a corto plazo, y no cumple con el objetivo de tener mensajes innecesarios, pero a medio o largo plazo podria tener más relevancia al derivar la responsabilidad a esos mensajes por separado.

<br>

2. ¿Qué opinan de que para algunas funcionalidades tenemos 3 tests para el mismo comportamiento pero aplicando a cada uno de los combatientes (Arthas, Mankrik y Olgra)

    - Ayudan a darnos cuenta que los comportamientos/mensajes son codigo repetido y se podria refactorizar, eso no quita el echo de que los 3 test inicialmente ayudan a llegar a ese razonamiento.
    - De todas formas lo que cambiaria es el codigo refactorizado pero los 3 test que verifican el correcto funcionamiento en los 3 combatientes deberia seguir en las pruebas

<br>

3. ¿Cómo modelaron el resultado de haber desarrollado un combate? ¿qué opciones consideraron y por qué se quedaron con la que entregaron y por qué descartaron a las otras?

    - Primero consideramos devolver numeros negativos, cero o positivos dependiendo del resultado del combate. Luego vimos que también hacia falta saber en que ronda termino por lo que notamos la necesidad de crear el concepto de Resultado y que el mismo contenga esa informacion, como el nombre del equipo que gano o si fue indeterminado y la cantidad de rondas que pasaron hasta terminar el combate. De esa manera el Resultado sabe quien gano y en que ronda termino.
        - Consideramos unicamente el devolver un numero para resultado al finalizar el combate, pero no era viable y descartamos esa opcion quedandonos con la de crear el concepto de Resultado y que así contenga toda la informacio necesaria al mismo tiempo que los mensajes