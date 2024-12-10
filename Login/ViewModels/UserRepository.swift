//
//  UserRepository.swift
//  Login
//
//  Created by BPIMA_ALW1090 on 9/12/24.
//
import Foundation

class UserRepository: ObservableObject // conecta las vista con la BD
{
    /// Guarda un usuario en el arreglo
    /// - Parameter User: estructura con los datos del usuario
    /// - Returns: Usuario encontrado o null si no lo encuentra
    static func getUser(_ email: String) -> User?
    {
        guard let user = Database.getUserByEmail(email) else {return nil}
        return user
        
    }
    
    /// Guarda en usurio en la "Base de Datos"
    /// - Parameter user: estructura con los datos del usuario
    static func saveUserBase(_ user: User)
    {
        Database.saveUser(user)
    }
}
