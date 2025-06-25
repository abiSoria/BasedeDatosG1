# 📘 Diccionario de Datos – Vehiculos
**Tabla Cliente**


| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del cliente               |
| `Nombre`        | VARCHAR      | 100    | ❌  | ❌  | ❌   | ❌     | Solo letras A-Z, longitud >= 3             | -                                | Nombre completo del cliente             |
| `Apellido1`          | INT          | -      | ❌  | ❌  | ❌   | ❌     | CHECK (Edad >= 18 AND Edad <= 120)         | -                                | Edad del cliente                        |
| `Apellido2`        | VARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     | Apellido 2 del cliente                  | 
-    
| `Apellido2`        | INT      | -    | ❌  | ❌  | ❌   | ❌     | Apellido 2 del cliente 

