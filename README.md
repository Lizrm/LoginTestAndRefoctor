# LoginTestAndRefoctor
Extract Method 
  Se extajo a metodos mas peque;os los mas grandes para que fueran mas legibles, asi como poder reutilizar funciones base
Extract Class:
  Se extrajo a una clase la funcion de enviar email EmailService.swift
  Tambien la funcion de validad si un usuario esta registrado o no LoginValidator.swift
  Tambien la funcionalidad de validar los datos ingresados para crear un nuevo registro UserValidator.swift
  Se creo una clase para conectar la interaccion con la Base de datos UserRepository
  Se crea la clase BD Database.swift
Renaming Variables and Methods:
  A los metodos se les renombra a las variables con  _variable: tipo para no tener que escribir la etiqueta al llamarlos
Reorganizing Code:
  Se reorganizan las clases y los objetos asi como la jerarquia para que haya individualida y legibilidad, tambien para poder ser reutilizados sin duplicidad de codigo
Introduce Parameter Object: 
  Se crea la estructura de datos UserRegistrationDetails.swift para pasar un solo parametro con todos los datos de registro
