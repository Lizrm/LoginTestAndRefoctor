// MyAppTests/ToDoViewModelTests.swift
import XCTest
@testable import Login

class RegistrationUserUT: XCTestCase {
    
    /**
     Se prueba la clase que se encarga de validar los datos del usuario el registrarse
     y guardarlos en BD
     */
    var userValidator: UserValidator!
    
    override func setUp() {
        super.setUp()
        userValidator = UserValidator()

    }
    
    override func tearDown() {
        userValidator = nil
        super.tearDown()
    }
    
    /// Valida que el usuaio sea creado
    /// - Given details: datos de usuaio correctos
    /// - Assert: Bool true que el usuario fue creado
    func testRegisterUSerValidData() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "Lisbeth", lastName: "Garcia", email: "Lisbeth812@gmail.com", age: 21, password: "Lisbeth812gmail")
        
        XCTAssertTrue(userValidator.registerUser(details))
    }
    
    /// Valida que el usuaio No fue  creado
    /// - Given details: Dato de email incorrecto
    /// - AssertFalse: Bool false que el usuario NO fue creado
    func testRegisterUSerInvalidEmail() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "Lisbeth", lastName: "Garcia", email: "Lisbeth812mail.com", age: 21, password: "Lisbeth812gmail")
        
        XCTAssertFalse(userValidator.registerUser(details))
    
    }
    /// Valida que el usuaio No fue  creado
    /// - Given details: Dato de age invalido  menor a 18
    /// - AssertFalse: Bool false que el usuario NO fue creado
    func testRegisterUSerInvalidAge() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "Lisbeth", lastName: "Garcia", email: "Lisbeth812@gmail.com", age: 9, password: "Lisbeth812gmail")
        
        XCTAssertFalse(userValidator.registerUser(details))
    
    }
    /// Valida que el usuaio No fue  creado
    /// - Given details: Dato de password incorrecto  menos de 6 caracteres
    /// - AssertFalse: Bool false que el usuario NO fue creado
    func testRegisterUSerInvalidPassword() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "Lisbeth", lastName: "Garcia", email: "Lisbeth812@gmail.com", age: 21, password: "Lis")
        
        XCTAssertFalse(userValidator.registerUser(details))
    
    }
    /// Valida que el usuaio No fue  creado
    /// - Given details: Dato de firstName vacio
    /// - AssertFalse: Bool false que el usuario NO fue creado
    func testRegisterUSerEmptyFirtsName() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "", lastName: "Garcia", email: "Lisbeth812@gmail.com", age: 21, password: "Lisbeth812gmail")
        
        XCTAssertFalse(userValidator.registerUser(details))
    
    }
    /// Valida que el usuaio No fue  creado
    /// - Given details: Dato de lastName vacio
    /// - AssertFalse: Bool false que el usuario NO fue creado
    func testRegisterUSerEmptyLastName() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "Lisbeth", lastName: "", email: "Lisbeth812@gmail.com", age: 21, password: "Lisbeth812gmail")
        
        XCTAssertFalse(userValidator.registerUser(details))
    
    }
    /// Valida que el usuaio No fue  creado
    /// - Given details: Datos de usuairo vacios
    /// - AssertFalse: Bool false que el usuario NO fue creado
    func testRegisterUSerEmptyData() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "", lastName: "", email: "", age: 0, password: "")
        
        XCTAssertFalse(userValidator.registerUser(details))
    
    }
}
