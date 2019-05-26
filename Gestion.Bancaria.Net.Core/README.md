# Desarrollador por:

[![N|Solid](https://www.cmceledon.com/Recursos/assets/img/vegas-logo.png)](https://www.cmceledon.com/)

----
# Carlos Mario Celedón Rodelo

```sh
- Desarrollador Senior de Software - www.cmceledon.com
- Bogotá, Cundinamarca
- carlos@cmceledon.com
- 3004559711
. 
- Prueba técnica de desarrollo para: 
- NECOMPLUS
- http://necomplus.com/
```

---

### La aplicación consistirá en la gestión de entidades bancarias. Las opciones que se implementaron son:

  - Crear la base de datos relacional de las entidades descritas.
  - Modelar el contexto de datos de estas tablas en Entity Framework Core 2.2.
  -  Crear una API básica que tenga las siguientes operaciones: 
  -  - Listado de entidades, con al menos dos filtros opcionales y ordenación por **Id**.
  -  - Inserción de nueva entidad
  -  -  Crear un frontend en Vue (preferentemente, u otro front javascript) que muestre
el listado de entidades como una tabla donde se muestre las entidades junto con
el nombre de su grupo y un modal para insertar una nueva entidad.
  -  --
### Notas importante:
- Todas las consultas a la base de datos se realizarán en LINQ evitando escribir
consultas RAW SQL.
- Se valorará muy positivamente tests unitarios como mínimo en backend pero
también en frontend.
- Valorable Implementar seguridad JWT mediante un token estático sin fecha de
caducidad.
- No es tan importante la maquetación de la prueba pero sí valorable.

# Paquetes instalados en la solución: 

```sh
PM> Install-Package Microsoft.EntityFrameworkCore.SqlServer 
PM> Install-Package Microsoft.EntityFrameworkCore.SqlServer.Design
PM> Install-Package Microsoft.EntityFrameworkCore.Tools
PM> Install-Package NLog
PM> Install-Package NLog.Web.AspNetCore 
PM> 
```