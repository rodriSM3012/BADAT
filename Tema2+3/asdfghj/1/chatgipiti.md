Aquí tienes un ejercicio basado en la estructura y el nivel de exigencia del material proporcionado.

---

### **Ejercicio: Gestión de Objetos en Base de Datos**

#### **Objetivo:**

Aplicar los conceptos de creación, modificación y eliminación de objetos en una base de datos, asegurando integridad referencial y optimización de consultas.

---

#### **Parte 1: Creación de Base de Datos y Tablas**

1. **Crea una base de datos llamada "Hospital".**
2. **Crea las siguientes tablas con sus respectivos atributos y restricciones:**
   - **PACIENTES**
     - idPaciente (NUMBER, clave primaria)
     - nombre (VARCHAR2(50), NOT NULL)
     - apellido (VARCHAR2(50), NOT NULL)
     - fechaNacimiento (DATE, CHECK (fechaNacimiento < SYSDATE))
   - **DOCTORES**
     - idDoctor (NUMBER, clave primaria)
     - nombre (VARCHAR2(50), NOT NULL)
     - especialidad (VARCHAR2(50), NOT NULL)
   - **CITAS**
     - idCita (NUMBER, clave primaria)
     - idPaciente (NUMBER, clave foránea a PACIENTES con borrado en cascada)
     - idDoctor (NUMBER, clave foránea a DOCTORES)
     - fechaCita (DATE, NOT NULL, CHECK (fechaCita >= SYSDATE))

---

#### **Parte 2: Inserción de Datos**

3. **Inserta los siguientes datos en las tablas:**
   - PACIENTES
     - (1, 'Luis', 'Gómez', '1985-07-12')
     - (2, 'Ana', 'Martínez', '1992-05-20')
   - DOCTORES
     - (101, 'Carlos', 'Pediatría')
     - (102, 'María', 'Cardiología')
   - CITAS
     - (1001, 1, 101, '2025-03-10')
     - (1002, 2, 102, '2025-04-05')

---

#### **Parte 3: Modificaciones y Consultas**

4. **Añade una nueva columna "telefono" a la tabla PACIENTES (VARCHAR2(15), opcional).**
5. **Modifica la tabla DOCTORES para que el campo "especialidad" tenga una longitud de 100 caracteres.**
6. **Cambia el nombre de la tabla CITAS a "CONSULTAS".**
7. **Elimina la columna "telefono" de PACIENTES.**
8. **Crea una vista "CITAS_PACIENTES" que muestre idCita, nombre del paciente y especialidad del doctor.**
9. **Crea un índice sobre el campo "nombre" de PACIENTES para optimizar las búsquedas.**

---

#### **Parte 4: Eliminación y Restricciones**

10. **Elimina el paciente con idPaciente = 1 y verifica que también se eliminan sus citas (por la clave foránea con cascada).**
11. **Visualiza las restricciones de integridad definidas en la base de datos.**

---

Este ejercicio refuerza la creación, manipulación y eliminación de objetos en la base de datos, además de la gestión de restricciones e integridad referencial.
