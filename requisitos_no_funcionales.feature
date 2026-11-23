# language: es
Característica: Requisitos no funcionales de la plataforma
  Como usuario de EncuéntraloYa UPC
  Quiero que la plataforma sea segura, privada, rápida y fácil de usar
  Para confiar en ella y usarla durante mi jornada en el campus


  # US08 (Seguridad)
  Esquema del escenario: Acceso solo con correo institucional
    Dado que el usuario está en la pantalla de inicio de sesión
    Cuando ingresa con el correo "<correo>"
    Entonces el sistema <resultado>


    Ejemplos:
      | correo                | resultado                                               |
      | u202412345@upc.edu.pe | permite el acceso a la plataforma                       |
      | estudiante@gmail.com  | rechaza el acceso y muestra "Usa tu correo @upc.edu.pe" |
      | docente@upc.edu.pe    | permite el acceso a la plataforma                       |


  # NF01 (Privacidad)
  Escenario: Ficha pública sin datos sensibles
    Dado que el estudiante abre la ficha pública de un objeto hallado
    Cuando revisa la información mostrada
    Entonces la ficha muestra únicamente los siguientes campos:
      | campo                                | visible |
      | Fecha del hallazgo                   | Sí      |
      | Lugar del hallazgo                   | Sí      |
      | Foto parcial                         | Sí      |
      | Características de validación        | No      |
      | Datos del personal de custodia       | No      |


  # NF02 (Rendimiento)
  Esquema del escenario: Tiempo de respuesta del catálogo
    Dado que existen <cantidad> objetos registrados en el catálogo
    Cuando el estudiante aplica filtros de sede, categoría y fecha
    Entonces los resultados se muestran en menos de <tiempo_maximo> segundos


    Ejemplos:
      | cantidad | tiempo_maximo |
      | 100      | 3             |
      | 500      | 3             |
      | 1000     | 3             |


  # NF03 (Usabilidad)
  Escenario: Registro de hallazgo en tres pasos desde el celular
    Dado que el personal de custodia usa la plataforma desde un celular
    Cuando registra un hallazgo siguiendo estos pasos:
      | paso | contenido                    |
      | 1    | Foto del objeto              |
      | 2    | Categoría y descripción      |
      | 3    | Sede y lugar donde se halló  |
    Entonces completa el registro en un máximo de 3 pasos
    Y la pantalla se adapta al tamaño del dispositivo
