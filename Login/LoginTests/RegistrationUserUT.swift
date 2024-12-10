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
    
    
    func testRegisterUSerValidData() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "Lisbeth", lastName: "Garcia", email: "Lisbeth812@gmail.com", age: 21, password: "Lisbeth812gmail")
        
        XCTAssertTrue(userValidator.registerUser(details))
    }
    
    func testRegisterUSerInvalidEmail() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "Lisbeth", lastName: "Garcia", email: "Lisbeth812mail.com", age: 21, password: "Lisbeth812gmail")
        
        XCTAssertFalse(userValidator.registerUser(details))
    
    }
    
    func testRegisterUSerInvalidAge() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "Lisbeth", lastName: "Garcia", email: "Lisbeth812mail.com", age: 21, password: "Lisbeth812gmail")
        
        XCTAssertFalse(userValidator.registerUser(details))
    
    }
    
    func testRegisterUSerInvalidPassword() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "Lisbeth", lastName: "Garcia", email: "Lisbeth812mail.com", age: 21, password: "Lis")
        
        XCTAssertFalse(userValidator.registerUser(details))
    
    }
    
    func testRegisterUSerEmptyFirtsName() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "", lastName: "Garcia", email: "Lisbeth812mail.com", age: 21, password: "Lis")
        
        XCTAssertFalse(userValidator.registerUser(details))
    
    }
    
    func testRegisterUSerEmptyLastName() {
        var details: UserRegistrationDetails
        details = UserRegistrationDetails(firstName: "Lisbeth", lastName: "", email: "Lisbeth812mail.com", age: 21, password: "Lis")
        
        XCTAssertFalse(userValidator.registerUser(details))
    
    }
    
}
