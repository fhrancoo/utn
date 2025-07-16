# Introducción a JavaScript

JavaScript es un lenguaje de programación utilizado principalmente para crear interactividad en las páginas web. Es uno de los tres lenguajes fundamentales de la web junto con HTML y CSS.

## 1. ¿Qué es JavaScript?

JavaScript (abreviado comúnmente JS) es un lenguaje de programación interpretado. Se define como orientado a objetos,​ basado en prototipos, imperativo, débilmente tipado y dinámico.
No solo interpreta el código, sino que también puede ser compilado a código máquina para mejorar el rendimiento.
Los motores modernos de JavaScript, como V8 (usado en Chrome y Node.js), emplean técnicas de just-in-time compilation (JIT). Esto significa que el código se convierte parcialmente en código máquina mientras se ejecuta para optimizar el rendimiento. Por lo tanto, aunque es un lenguaje interpretado, en la práctica se compila dinámicamente a medida que se ejecuta.


## 2. ¿Dónde se usa JavaScript?

JavaScript se utiliza en:

- **Front-end:** Para crear interactividad en las páginas web.
- **Back-end:** Usando Node.js, se puede ejecutar JavaScript en el servidor.

## 3. Sintaxis básica de JavaScript

### Variables

En JavaScript, puedes declarar variables utilizando `let` y `const`

```js
let nombre = "Juan"; // Variable que puede cambiar
const edad = 25;     // Variable constante (no puede cambiar)
```

### Tipos de datos

En JavaScript, los tipos de datos se dividen en **primitivos** y **no primitivos** (también conocidos como objetos o tipos de referencia). Aquí tienes una lista de ambos:

#### Tipos de datos primitivos:
Los tipos primitivos son inmutables y se almacenan directamente en la ubicación de memoria a la que accede la variable.

1. **`number`**: Representa números, tanto enteros como de punto flotante.
   ```javascript
   let edad = 25;
   let precio = 99.99;
   ```

2. **`string`**: Representa una secuencia de caracteres, utilizada para texto.
   ```javascript
   let nombre = "Juan";
   let mensaje = 'Hola, mundo!';
   ```

3. **`boolean`**: Representa un valor lógico, puede ser `true` o `false`.
   ```javascript
   let esMayor = true;
   let esMenor = false;
   ```

4. **`undefined`**: Representa una variable que no ha sido asignada o no tiene valor.
   ```javascript
   let x;
   console.log(x); // undefined
   ```

5. **`null`**: Representa la ausencia intencional de un valor.
   ```javascript
   let y = null;
   ```

6. **`bigint`**: Representa números enteros de tamaño arbitrario.
   ```javascript
   let grande = 1234567890123456789012345678901234567890n;
   ```

7. **`symbol`**: Representa un valor único e inmutable, utilizado como identificador de propiedades de objetos.
   ```javascript
   let id = Symbol("id");
   ```



#### Tipos de datos no primitivos (objetos o tipos de referencia):
Los tipos no primitivos son mutables y se almacenan como referencias a una ubicación de memoria.

1. **`object`**: Representa una colección de propiedades (pares clave-valor).
   ```javascript
   let persona = { nombre: "Juan", edad: 25 };
   ```

2. **`array`**: Es un tipo especial de objeto que almacena una lista ordenada de valores.
   ```javascript
   let numeros = [1, 2, 3, 4, 5];
   ```

3. **`function`**: Las funciones son objetos que pueden ser invocados.
   ```javascript
   function saludar() {
       console.log("Hola!");
   }
   ```

4. **`date`**: Representa una fecha y hora.
   ```javascript
   let hoy = new Date();
   ```

5. **`regexp`**: Representa una expresión regular para hacer coincidir patrones en cadenas.
   ```javascript
   let regex = /ab+c/;
   ```

6. **Otros objetos incorporados**: Como `Map`, `Set`, `Promise`, etc.
   ```javascript
   let mapa = new Map();
   let conjunto = new Set();
   ```

### Diferencias clave:
- **Primitivos**: Son inmutables, se copian por valor y ocupan menos memoria.
- **No primitivos**: Son mutables, se copian por referencia y pueden contener múltiples valores o funcionalidades.

Si tienes más preguntas, ¡no dudes en preguntar! 😊

### Operadores

JavaScript tiene operadores aritméticos, lógicos, de comparación y otros:

```js
let suma = 5 + 3;  // 8
let esMayor = 5 > 3;  // true
let y = true && false;  // false
```

## 4. Estructuras de control

### Condicionales

Las estructuras condicionales permiten ejecutar código dependiendo de si se cumple una condición.

```js
let edad = 20;

if (edad >= 18) {
    console.log("Eres mayor de edad");
} else {
    console.log("Eres menor de edad");
}
```

### Bucles

Los bucles repiten una acción varias veces.

- **For loop:**

```js
for (let i = 0; i < 5; i++) {
    console.log(i);
}
```

- **While loop:**

```js
let i = 0;
while (i < 5) {
    console.log(i);
    i++;
}
```

## 5. Funciones

Las funciones permiten agrupar un conjunto de instrucciones bajo un nombre y luego ejecutarlas cuando sea necesario.

```js
function saludar(nombre) {
    return "Hola, " + nombre;
}

console.log(saludar("Juan"));
```

## 6. DOM (Document Object Model)

El DOM permite manipular los elementos de una página web con JavaScript. Con él, puedes cambiar el contenido, el estilo y la estructura de la página.

### Ejemplo: Cambiar el contenido de un elemento

```js
document.getElementById("miElemento").innerHTML = "Nuevo contenido";
```

### Ejemplo: Cambiar el estilo de un elemento

```js
document.getElementById("miElemento").style.color = "red";
```

## 7. Eventos

Los eventos permiten ejecutar código cuando ocurren ciertas acciones, como hacer clic en un botón o mover el ratón.

```js
document.getElementById("miBoton").onclick = function() {
    alert("¡Has hecho clic!");
};
```

## 8. Conclusión

JavaScript es un lenguaje muy poderoso que te permite crear experiencias interactivas y dinámicas en la web. Con estos conceptos básicos, ya puedes empezar a escribir tu propio código.

¡Sigue practicando y explorando más sobre JavaScript!

## Recursos adicionales

- [Documentación de JavaScript MDN](https://developer.mozilla.org/es/docs/Web/JavaScript)
- [Tutoriales de JavaScript en W3Schools](https://www.w3schools.com/js/)
- [Curso de JavaScript gratis](https://www.aprendejavascript.dev/)
