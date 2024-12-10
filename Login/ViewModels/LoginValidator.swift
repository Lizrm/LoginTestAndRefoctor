//
//  LoginValidator.swift
//  Login
//
//
import Foundation
class LoginValidator: ObservableObject {
    
    
   static func authenticateUser( _ email: String, _ password: String) -> Bool {
       
       /// Valida si el usuario esta registrado
       /// - Parameter User: estructura con los datos del usuario
       /// - Returns: bool con el resultado de la busqueda
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
