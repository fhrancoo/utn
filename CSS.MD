# Introducción a CSS (Cascading Style Sheets)

CSS (Cascading Style Sheets) es un lenguaje utilizado para describir cómo se deben mostrar los documentos HTML en la pantalla. Mientras que HTML se encarga de la estructura de la página web, CSS se encarga de su presentación: colores, fuentes, márgenes, disposición y mucho más.

### ¿Por qué usar CSS?
CSS permite separar el contenido (HTML) de la presentación (estilos). Esto hace que sea mucho más fácil modificar el aspecto de una página web sin tener que alterar el contenido. Además, facilita la reutilización de estilos en diferentes páginas de un sitio web.

### Sintaxis Básica de CSS

La sintaxis básica de CSS consiste en reglas que se aplican a elementos HTML específicos. Una regla CSS tiene dos partes principales: **selector** y **declaración**.

```css
selector {
    propiedad: valor;
}
```

- **Selector**: Es el elemento HTML al que se le aplican los estilos.
- **Propiedad**: Es el aspecto que queremos cambiar (como el color, el tamaño de la fuente, el margen, etc.).
- **Valor**: Es el valor que le damos a la propiedad (como un color, un número o una medida).

[NOTE: CSS es un lenguaje de programación que se utiliza para definir la apariencia de los elementos HTML en la página web. CSS se utiliza para aplicar estilos a los elementos HTML, como el color, el tamaño de fuente, la posición y otros atributos.]

### Ejemplo básico de CSS

```css
h1 {
    color: blue;
    font-size: 24px;
}

p {
    color: red;
    line-height: 1.5;
}
```

### Explicación:
- El selector `h1` se refiere a todos los elementos `<h1>` (encabezados de nivel 1) en el documento HTML.
- La propiedad `color` establece el color del texto (en este caso, azul para los `<h1>`).
- La propiedad `font-size` define el tamaño de la fuente (24 píxeles en este caso).
- El selector `p` se refiere a todos los elementos `<p>` (párrafos).
- La propiedad `line-height` ajusta la altura de la línea del texto, haciendo que el párrafo sea más espacioso.

### Cómo agregar CSS a un documento HTML

Existen tres formas principales de agregar CSS a un documento HTML:

#### 1. **CSS en línea** (Inline CSS)
El CSS se coloca directamente dentro de la etiqueta HTML usando el atributo `style`.

```html
<h1 style="color: blue; font-size: 24px;">Este es un encabezado</h1>
```

#### 2. **CSS Interno** (Internal CSS)
El CSS se coloca dentro de una etiqueta `<style>` dentro de la sección `<head>` del HTML.

```html
<head>
    <style>
        h1 {
            color: blue;
            font-size: 24px;
        }
    </style>
</head>
```

#### 3. **CSS Externo** (External CSS)
El CSS se guarda en un archivo separado y se vincula al documento HTML usando la etiqueta `<link>`.

```html
<head>
    <link rel="stylesheet" href="estilos.css">
</head>
```

El archivo **estilos.css** podría verse así:

```css
h1 {
    color: blue;
    font-size: 24px;
}
```

### Propiedades Comunes de CSS

1. **Color y fondo**:
   - `color`: Cambia el color del texto.
   - `background-color`: Establece el color de fondo de un elemento.
   - `background-image`: Permite establecer una imagen como fondo.

2. **Fuente**:
   - `font-family`: Define la fuente que se utiliza en el texto.
   - `font-size`: Establece el tamaño de la fuente.
   - `font-weight`: Controla el grosor de la fuente (normal, negrita).

3. **Márgenes y rellenos**:
   - `margin`: Define el espacio exterior alrededor de un elemento (fuera del borde).
   - `padding`: Define el espacio interior entre el borde de un elemento y su contenido.

4. **Bordes**:
   - `border`: Establece el borde de un elemento. Se puede configurar el grosor, estilo y color del borde.

5. **Tamaño y disposición**:
   - `width` y `height`: Establecen el tamaño de un elemento.
   - `display`: Controla el comportamiento de los elementos (por ejemplo, `block`, `inline`, `flex`, etc.).
   - `position`: Define la posición de un elemento (por ejemplo, `relative`, `absolute`).

6. **Texto**:
   - `text-align`: Alinea el texto dentro de un elemento (por ejemplo, `left`, `center`, `right`).
   - `line-height`: Ajusta la altura de las líneas de texto.

### Modelo de Caja (Box Model)

El **Modelo de Caja** en CSS es fundamental para entender cómo se estructura un elemento en una página web. Cada elemento tiene cuatro áreas:
1. **Contenido**: El contenido real del elemento (por ejemplo, texto o imágenes).
2. **Relleno (padding)**: El espacio entre el contenido y el borde del elemento.
3. **Borde (border)**: El borde alrededor del relleno.
4. **Margen (margin)**: El espacio exterior alrededor del borde.

### Ejemplo del Modelo de Caja:
```css
div {
    margin: 20px;
    border: 5px solid black;
    padding: 15px;
    width: 200px;
    height: 100px;
}
```

Este código crea un `div` con un margen de 20px, un borde de 5px de grosor, un relleno de 15px y un tamaño de 200x100 píxeles.

### Conclusión

CSS es la herramienta que te permite darle estilo a tus páginas web. Con CSS puedes cambiar colores, tamaños, posiciones y más, permitiéndote crear diseños atractivos y funcionales. A medida que avances, aprenderás técnicas más avanzadas como **Flexbox** y **Grid Layout** para crear diseños responsivos que se adapten a diferentes tamaños de pantalla.


## Recursos adicionales

- [Documentación de CSS MDN](https://developer.mozilla.org/es/docs/Web/CSS)
- [Tutoriales de CSS en W3Schools](https://www.w3schools.com/css/default.asp)
- [Wikipedia: CSS](https://es.wikipedia.org/wiki/CSS)
- [CSS Animations](https://css-tricks.com/almanac/properties/a/animation/)



- [CSS Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
    - [CSS Flexbox Generator](https://cssflex-generator.netlify.app/)
    - [CSS game for learning flexbox](https://flexboxfroggy.com/#es)
- [CSS Grid](https://css-tricks.com/snippets/css/complete-guide-grid/)
    - [CSS Grid Generator](https://cssgrid-generator.netlify.app/)
    - [CSS game for learning grid](https://cssgridgarden.com/#es)
