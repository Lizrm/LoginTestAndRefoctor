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
    
    
    func testNotRegisterUSerAndInvalidEmail() {
     
        let email =  "Lisbeth12@gmail.com"
        let password =  "Lisbeth812gmail"
        XCTAssertFalse(LoginValidator.authenticateUser(email, password))
    }
    
    func testValidUSerRegister() {
  
        let email =  "Lisbeth812@gmail.com"
        let password =  "Lisbeth812gmail"
        XCTAssertTrue(LoginValidator.authenticateUser(email, password))
    }
    
    func testInvalidPassword() {
  
        let email =  "Lisbeth812@gmail.com"
        let password =  "Lisbeth812ail"
        XCTAssertFalse(LoginValidator.authenticateUser(email, password))
    }
    
}
