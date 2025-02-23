# Introducción basica a HTML

HTML (Hypertext Markup Language) es el lenguaje fundamental para crear páginas web. Se basa en etiquetas que indican cómo debe estructurarse y presentarse el contenido en una página web.

### Estructura Básica de un Documento HTML

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Página Web</title>
</head>
<body>
    <h1>Encabezado Principal</h1>
    <p>Este es un párrafo de texto en HTML.</p>
    
    <!-- Lista no ordenada -->
    <ul>
        <li>Elemento de lista 1</li>
        <li>Elemento de lista 2</li>
    </ul>
    
    <!-- Lista ordenada -->
    <ol>
        <li>Primer elemento</li>
        <li>Segundo elemento</li>
    </ol>
    
    <!-- Enlace -->
    <a href="https://www.example.com">Ir a Example</a>

    <!-- Imagen -->
    <img src="imagen.jpg" alt="Descripción de la imagen" />

    <!-- Tabla -->
    <table>
        <tr>
            <th>Encabezado 1</th>
            <th>Encabezado 2</th>
        </tr>
        <tr>
            <td>Fila 1, Columna 1</td>
            <td>Fila 1, Columna 2</td>
        </tr>
    </table>

    <!-- Formulario -->
    <form action="/submit" method="post">
        <label for="name">Nombre:</label>
        <input type="text" id="name" name="name">
        <input type="submit" value="Enviar">
    </form>

    <!-- Divs para estructura -->
    <div>
        <h2>Subtítulo dentro de un div</h2>
        <p>Este es un párrafo dentro de un div.</p>
    </div>

    <!-- Sección -->
    <section>
        <h3>Sección de la Página</h3>
        <p>Texto de la sección.</p>
    </section>

    <!-- Pie de página -->
    <footer>
        <p>Derechos reservados © 2025</p>
    </footer>
</body>
</html>
```

### Descripción de las Etiquetas:

1. **`<h1>`, `<h2>`, `<h3>`, ...**: Estas son las etiquetas de encabezado. Se usan para organizar el contenido jerárquicamente. `<h1>` es el título principal, mientras que `<h2>` a `<h6>` representan subtítulos en diferentes niveles.
   
2. **`<p>`**: Define un párrafo. El texto dentro de esta etiqueta se muestra como un bloque de texto con un espacio antes y después.

3. **`<ul>`** y **`<ol>`**: Estas son etiquetas para listas. La etiqueta `<ul>` crea una lista no ordenada (con viñetas), mientras que `<ol>` crea una lista ordenada (numerada). Los elementos de las listas se colocan dentro de las etiquetas `<li>`.

4. **`<a>`**: Define un enlace. El atributo `href` especifica la URL a la que lleva el enlace. Por ejemplo, `<a href="https://www.example.com">Ir a Example</a>`.

5. **`<img>`**: Inserta una imagen en la página. El atributo `src` define la ubicación de la imagen y `alt` proporciona una descripción de la imagen para los motores de búsqueda o accesibilidad.

6. **`<table>`**, **`<tr>`**, **`<th>`**, **`<td>`**: Estas etiquetas se usan para crear tablas. 
   - `<table>` define la tabla.
   - `<tr>` define una fila de la tabla.
   - `<th>` define una celda de encabezado (generalmente en negrita y centrada).
   - `<td>` define una celda de datos.

7. **`<form>`**, **`<label>`**, **`<input>`**: Se utilizan para crear formularios. 
   - `<form>` es el contenedor principal del formulario.
   - `<label>` se usa para proporcionar una etiqueta a los controles del formulario.
   - `<input>` se usa para crear campos de entrada, como cuadros de texto, botones de opción, y más.

8. **`<div>`**: Es un contenedor genérico utilizado para agrupar contenido y estructurar la página. Se usa para organizar el diseño y aplicar estilos.

9. **`<section>`**: Se utiliza para agrupar contenido temáticamente. Puede contener títulos, párrafos, imágenes y otros elementos relacionados.

10. **`<footer>`**: Define el pie de página de la página web, generalmente usado para incluir información de derechos de autor, enlaces o detalles de contacto.

### Otros Elementos Útiles:
- **`<strong>`**: Define texto en negrita, pero con énfasis semántico (importante).
- **`<em>`**: Define texto en cursiva, con énfasis semántico (énfasis en el contenido).
- **`<br>`**: Salto de línea.
- **`<hr>`**: Línea horizontal, comúnmente usada para separar contenido visualmente.

---

### Conclusión

HTML es la columna vertebral de cualquier página web. Las etiquetas que hemos cubierto son solo una introducción. A medida que avances, aprenderás a usar atributos más específicos, así como cómo integrar HTML con CSS y JavaScript para crear páginas más dinámicas e interactivas.

---

## Recursos adicionales

- [Documentación de JavaScript MDN](https://developer.mozilla.org/es/docs/Web/HTML)
- [Tutoriales de HTML en W3Schools](https://www.w3schools.com/html/)
- [Wikipedia: HTML](https://es.wikipedia.org/wiki/HTML)