# language: es
Característica: Catálogo de objetos hallados y registro en custodia
  Como miembro de la comunidad UPC o personal de custodia
  Quiero consultar y registrar objetos hallados con inventario actualizado
  Para ubicar pertenencias de forma rápida y ordenada


  Antecedentes:
    Dado que existen los siguientes objetos hallados en el catálogo:
      | codigo  | objeto          | categoria  | sede       | fecha_hallazgo | estado      |
      | OBJ-001 | Laptop Lenovo   | Tecnología | Monterrico | Hace 2 días    | En custodia |
      | OBJ-002 | DNI             | Documentos | San Isidro | Hoy            | En custodia |
      | OBJ-003 | Mochila negra   | Accesorios | Villa      | Hace 20 días   | En custodia |
      | OBJ-004 | Audífonos Sony  | Tecnología | Monterrico | Hace 5 días    | En custodia |


  # US01+
  Esquema del escenario: Búsqueda por sede, categoría y fecha
    Dado que el estudiante está en el catálogo de objetos hallados
    Cuando selecciona la sede "<sede>", la categoría "<categoria>" y el rango de fechas "<rango>"
    Entonces se muestran solo los objetos "<resultados>"


    Ejemplos:
      | sede       | categoria  | rango           | resultados            |
      | Monterrico | Tecnología | Últimos 7 días  | OBJ-001 y OBJ-004     |
      | San Isidro | Documentos | Hoy             | OBJ-002               |
      | Villa      | Accesorios | Últimos 30 días | OBJ-003               |


  # US01
  Escenario: Búsqueda sin resultados
    Dado que el estudiante está en el catálogo de objetos hallados
    Cuando filtra por la sede "San Miguel" y la categoría "Documentos"
    Entonces el sistema muestra el mensaje "No se encontraron objetos con esos filtros"
    Y ofrece la opción de limpiar los filtros


  # US02
  Escenario: Consulta de ficha pública del objeto
    Dado que el estudiante visualiza el catálogo
    Cuando hace clic sobre el objeto "OBJ-001"
    Entonces el sistema muestra la ficha con los siguientes datos:
      | dato               | valor                |
      | Fecha del hallazgo | Hace 2 días          |
      | Lugar del hallazgo | Monterrico           |
      | Foto               | Parcial del artículo |++


  # US03
  Escenario: Registro ágil de hallazgo con foto y ubicación
    Dado que el personal de custodia ingresa al formulario de registro de hallazgos
    Cuando completa el formulario con los siguientes datos:
      | campo       | valor                     |
      | Foto        | mochila.jpg               |
      | Categoría   | Accesorios                |
      | Descripción | Mochila azul con llavero  |
      | Sede        | San Isidro                |
      | Lugar       | Pabellón A, piso 2        |
    Y presiona "Guardar hallazgo"
    Entonces el objeto queda registrado y disponible en el catálogo digital


  # US03
  Esquema del escenario: Registro con campos obligatorios incompletos
    Dado que el personal de custodia está en el formulario de registro de hallazgos
    Cuando intenta guardar dejando vacío el campo "<campo_vacio>"
    Entonces el sistema no guarda el registro y muestra "<mensaje>"


    Ejemplos:
      | campo_vacio | mensaje                         |
      | Foto        | Sube una foto del objeto        |
      | Categoría   | Selecciona una categoría        |
      | Sede        | Selecciona la sede              |
      | Lugar       | Indica dónde se halló el objeto |


  # US04
  Esquema del escenario: Cambio de estado del objeto
    Dado que el objeto "<codigo>" está registrado en el sistema
    Cuando el personal de custodia cambia su estado a "<nuevo_estado>"
    Entonces el inventario se actualiza y <resultado_publico>


    Ejemplos:
      | codigo  | nuevo_estado | resultado_publico                                 |
      | OBJ-001 | Devuelto     | el objeto se retira de la vista pública           |
      | OBJ-003 | En almacén   | el objeto sigue visible solo para custodia        |
