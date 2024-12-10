//
//  LoginValidator.swift
//  Login
//
//
import Foundation
class LoginValidator: ObservableObject {
    
    
   static func authenticateUser( _ email: String, _ password: String) -> Bool {
        
       let user =  UserRepository.getUser(email)
        guard user != nil else {
           return false
       }
       guard user?.password == password else{
           return false
       }
       return true
    }
}
