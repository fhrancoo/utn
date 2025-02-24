# Introducción a MongoDB y sus Tipos de Datos

MongoDB es un sistema de gestión de bases de datos NoSQL orientado a documentos, lo que significa que almacena los datos en formato BSON (Binary JSON), una estructura flexible similar a JSON. Es ampliamente utilizado en aplicaciones web, análisis de datos y almacenamiento de grandes volúmenes de información debido a su escalabilidad y rendimiento.

### Tipos de Datos en MongoDB
MongoDB soporta una variedad de tipos de datos que permiten almacenar información de manera eficiente y flexible:

#### 1. Tipos de Datos Básicos
- **String**: Almacena texto en formato UTF-8.
- **Number (Int, Long, Double, Decimal128)**: Representa valores numéricos de diferentes precisiones.
- **Boolean**: Almacena valores `true` o `false`.
- **Null**: Representa un valor nulo.

*Ejemplo:*
```json
{
    "nombre": "Producto A",
    "precio": 19.99,
    "disponible": true
}
```

#### 2. Tipos de Datos Compuestos
- **Array**: Almacena una lista de valores.
- **Object (Documento anidado)**: Permite almacenar estructuras JSON dentro de un documento.

*Ejemplo:*
```json
{
    "nombre": "Juan Pérez",
    "direcciones": [
        {"ciudad": "Buenos Aires", "pais": "Argentina"},
        {"ciudad": "Madrid", "pais": "España"}
    ]
}
```

#### 3. Tipos de Datos Especiales
- **ObjectId**: Identificador único generado automáticamente.
- **Date**: Representa fechas y tiempos.
- **Timestamp**: Marca de tiempo interna para control de cambios.
- **Binary Data (BinData)**: Almacena datos binarios como imágenes o archivos.
- **Regular Expression (Regex)**: Permite almacenar patrones de búsqueda.

*Ejemplo:*
```json
{
    "_id": ObjectId("507f1f77bcf86cd799439011"),
    "fecha_creacion": ISODate("2023-01-01T12:00:00Z"),
    "archivo": BinData(0, "...datos binarios...")
}
```

#### 4. Tipos de Datos Geoespaciales
- **Point, LineString, Polygon**: Representan datos geoespaciales para ubicaciones y mapas.

*Ejemplo:*
```json
{
    "nombre": "Ubicación A",
    "coordenadas": { "type": "Point", "coordinates": [-74.006, 40.7128] }
}
```

### Conclusión
MongoDB ofrece una estructura flexible que permite modelar datos de diversas formas. Su capacidad de manejar documentos anidados, arrays y datos geoespaciales lo convierte en una opción poderosa para aplicaciones modernas y escalables.

