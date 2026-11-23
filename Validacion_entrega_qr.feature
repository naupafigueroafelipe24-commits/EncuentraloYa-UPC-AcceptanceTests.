# language: es
Característica: Validación de propiedad y entrega con código QR
  Como estudiante y personal de custodia
  Quiero validar la propiedad y registrar la entrega con código QR
  Para entregar cada objeto únicamente a su dueño legítimo sin cuadernos físicos


  # US05
  Escenario: Envío de reclamo con preguntas de validación
    Dado que el estudiante ve el objeto "OBJ-001" y presiona "Reclamar"
    Cuando responde las preguntas de validación:
      | pregunta                       | respuesta     |
      | ¿De qué color es la funda?     | Negra         |
      | ¿Qué sticker tiene en la tapa? | Logo de Linux |
      | ¿Qué marca es el objeto?       | Lenovo        |
    Entonces la solicitud queda enviada a revisión del personal de custodia


  # US06
  Esquema del escenario: Aprobación o rechazo de solicitud por custodia
    Dado que existe una solicitud de reclamo pendiente de revisión
    Cuando el personal de custodia revisa las respuestas y la <decision>
    Entonces el sistema <resultado>


    Ejemplos:
      | decision | resultado                                    |
      | aprueba  | genera el código de recojo para el estudiante |
      | rechaza  | registra el rechazo y notifica al estudiante |


  # US07
  Esquema del escenario: Confirmación de entrega escaneando código QR
    Dado que el estudiante muestra el código QR "<qr>"
    Cuando el personal de custodia escanea el código con la plataforma
    Entonces <resultado>


    Ejemplos:
      | qr                      | resultado                                                      |
      | QR de reclamo aprobado  | se confirma la entrega y el estado pasa a "Cerrado y Devuelto" |
      | QR ya utilizado         | el sistema rechaza el código y muestra "Código ya utilizado"   |
      | QR de reclamo rechazado | el sistema no permite la entrega
