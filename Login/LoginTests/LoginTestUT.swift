// MyAppTests/ToDoViewModelTests.swift
import XCTest
@testable import Login

class LoginTestUT: XCTestCase {
    
    var userValidator: UserValidator!
    
    override func setUp() {
        super.setUp()
       
        userValidator = UserValidator()
        
        /**
         El siguiente bloque de Codigo
         Se utiliza para agregar un usuario a la BD
         Y poder hacer las pruebas de cuando un usuario esta registrado
         */
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "Lisbeth", lastName: "Garcia", email: "Lisbeth812@gmail.com", age: 21, password: "Lisbeth812gmail")
        
        _ = userValidator.registerUser(details)
        
    }
    
    override func tearDown() {
        userValidator = nil
        super.tearDown()
    }
    
    /// Valida que el usuaio No se encuentra Registrado
    /// - Given details: Datos de usuairo invalidos
    /// - AssertFalse: Bool false  que el usuario no esta registrado
    func testNotRegisterUSerAndInvalidEmail() {
     
        let email =  "Lisbeth12@gmail.com"
        let password =  "Lisbeth812gmail"
        XCTAssertFalse(LoginValidator.authenticateUser(email, password))
    }
    /// Valida que el password y usuario(email) sean los correctos
    /// - Given details: email correcto, password correcto
    /// - AssertTrue: Bool True el usuario se encuentra registrado y el password es correcto
    func testValidUSerRegister() {
  
        let email =  "Lisbeth812@gmail.com"
        let password =  "Lisbeth812gmail"
        XCTAssertTrue(LoginValidator.authenticateUser(email, password))
    }
    /// Valida que el password y usuario(email) sean los correctos
    /// - Given details: email correcto, password incorrecto
    /// - AssertFalse: Bool false el password es incorrecto
    func testInvalidPassword() {
  
        let email =  "Lisbeth812@gmail.com"
        let password =  "Lisbeth812ail"
        XCTAssertFalse(LoginValidator.authenticateUser(email, password))
    }
    /// Valida que el password y usuario(email) sean los correctos
    /// - Given details: email vacio, password vacio
    /// - AssertFalse: Bool data para login vacio
    func testEmptyData() {
  
        let email =  ""
        let password =  ""
        XCTAssertFalse(LoginValidator.authenticateUser(email, password))
    }
    
}
