## Preguntas teóricas

### Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

R: 
-  El primer llamado indica parte del concepto abstracto además de indicar los argumentos polimorficos
- El segundo llamado completa el concepto abstracto

<br>

### Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

R: 
- En el initialize de la clase
- Por que de esa manera se centraliza la logica en un solo lugar antes de instanciar el objeto
- Delegando la responsabilidad de instanciar el objeto a las subclases correspondientes

<br>

### Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

R:
- Que las funcionalidades sean similares

<br>

### Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

R:
- Para que cada subclase tenga la responsabilidad de saber responder ese mensaje
- Para que en el caso de que no se haya implementado el mensaje en alguna de las subclases levante un error

<br>

### No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

R:
- Por que al romper el encapsulamiento perdemos el control del mantenimiento de las clases
    - En caso de realizar una alteracion/mantenimiento en una clase y que algun mensaje o estado `privado` se este usando fuera, rompiendo el encapsulamiento, podria generar complicaciones inesperadas 