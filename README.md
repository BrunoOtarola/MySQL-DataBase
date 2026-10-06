# Ayudantía: Base de Datos - Almacén Manolo

Repositorio de scripts y consultas SQL desarrollado para las sesiones prácticas de **Ayudantía de Base de Datos (Universidad Santo Tomás)**.

El objetivo de este proyecto es enseñar desde los conceptos básicos de manipulación y consulta de datos relacionales (`DQL`) hasta operaciones intermedias y avanzadas como joins condicionales, funciones de agregación y agrupamientos.

---

## ¿De qué trata el proyecto?

El proyecto modela el sistema transaccional de un minimarket ficticio llamado **Almacén Manolo**, permitiendo trabajar con un esquema relacional que simula el flujo de ventas real:
* Registro y administración de **clientes**.
* Catálogo e inventario de **productos**.
* Registro del equipo de **vendedores**.
* Emisión de **ventas** (boletas).
* Desglose línea a línea con **detalle de ventas** (ítems comprados, cantidades y subtotales).

---

## Motor de Base de Datos

* **MySQL** (compatible con MariaDB).
* Utiliza tipos de datos estándar y propios del motor como `AUTO_INCREMENT`, `ENUM`, funciones condicionales (`IF`), funciones de fecha (`DATEDIFF`, `CURDATE`), entre otras.

---

## Contenido y Estructura de Archivos

Los archivos están numerados en orden didáctico progresivo:

| Archivo | Tema Principal | Descripción |
| :--- | :--- | :--- |
| [`0.Almacen-Manolo-Install.sql`](0.Almacen-Manolo-Install.sql) | **Instalación y DDL/DML** | Crea la base de datos `AlmacenManolo`, sus 5 tablas relacionales con claves primarias/foráneas y puebla datos de prueba. |
| [`1.select.sql`](1.select.sql) | **SELECT & ORDER BY** | Proyección de columnas y ordenamiento ascendente/descendente de registros. |
| [`2.where.sql`](2.where.sql) | **Filtros WHERE** | Uso de operadores lógicos y relacionales (`IN`, `IS NULL`, `OR`, `<`). |
| [`4.like.sql`](4.like.sql) | **Búsqueda por Patrones** | Coincidencias de texto usando el operador `LIKE` y comodines `%`. |
| [`5.select_estructurado.sql`](5.select_estructurado.sql) | **Funciones de Texto y Fecha** | Uso de `CONCAT`, `UPPER`, `DATEDIFF`, `CURDATE()` y asignación de alias (`AS`). |
| [`6.uso_de_if.sql`](6.uso_de_if.sql) | **Condicionales** | Clasificación dinámica de registros con la función condicional `IF()`. |
| [`7.inner_join.sql`](7.inner_join.sql) | **INNER JOIN Múltiple** | Combinación de tablas `ventas`, `clientes` y `vendedores` para generar reportes completos. |
| [`8.cruce_tabla.sql`](8.cruce_tabla.sql) | **Cruce Maestro-Detalle** | Relación entre `detalle_ventas` y `productos` con cálculo aritmético de subtotales. |
| [`9.group_by.sql`](9.group_by.sql) | **Agrupación y Conteo** | Uso de `GROUP BY` y función agregada `COUNT()` para métricas por categoría o ciudad. |
| [`10.having.sql`](10.having.sql) | **Filtros Agregados (HAVING)** | Agrupamiento con `SUM()`, `AVG()`, `ROUND()` y filtrado post-agregación con `HAVING`. |

---

## Requisitos de Software

Para ejecutar este proyecto en tu entorno local se requiere:

1. **XAMPP (Recomendado):** Servidor local para levantar el servicio de **MySQL / MariaDB**.
   * Descarga: [https://www.apachefriends.org/](https://www.apachefriends.org/)
2. **DBeaver Community:** Gestor gráfico universal de bases de datos para escribir y ejecutar las sentencias SQL.
   * Descarga: [https://dbeaver.io/](https://dbeaver.io/)

---

## Guía de Instalación y Ejecución Local

### Paso 1: Iniciar el servicio de MySQL en XAMPP
1. Abre el **XAMPP Control Panel**.
2. En la fila de **MySQL**, haz clic en el botón **Start**.
3. Verifica que el módulo quede en verde y muestre el puerto (por defecto `3306`).

---

### Paso 2: Conectar DBeaver a MySQL
1. Abre **DBeaver**.
2. Dirígete a **Base de datos** > **Nueva conexión**.
3. Selecciona el driver **MySQL** y presiona **Siguiente**.
4. Completa los parámetros de conexión por defecto de XAMPP:
   * **Host:** `localhost`
   * **Puerto:** `3306`
   * **Base de datos:** *(puedes dejarlo en blanco inicialmente)*
   * **Usuario:** `root`
   * **Contraseña:** *(déjala vacía si no configuraste una contraseña en XAMPP)*
5. Haz clic en **Probar conexión** (si te solicita descargar el driver JDBC de MySQL, acepta la descarga automática).
6. Presiona **Finalizar**.

---

### Paso 3: Crear y poblar la Base de Datos
1. En DBeaver, ve al menú superior: **Archivo** > **Abrir archivo...** y selecciona:
   ```text
   0.Almacen-Manolo-Install.sql
   ```
2. Asegúrate de tener seleccionada tu conexión de MySQL en el editor.
3. Ejecuta todo el script presionando `Alt + X` (o el ícono *Ejecutar script SQL*).
4. Actualiza el explorador de conexiones (`F5`) y verás la base de datos `AlmacenManolo` creada con todas sus tablas y registros de prueba listos.

---

### Paso 4: Ejecutar las consultas de práctica
Abre los archivos de consultas secuencialmente (`1.select.sql` hasta `10.having.sql`) en DBeaver y ejecuta cada instrucción (`Ctrl + Enter` sobre la consulta deseada) para revisar los resultados y análisis.

