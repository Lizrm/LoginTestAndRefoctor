//
//  Database.swift
//  Login
//
// Database.swift

import Foundation

class Database {
    private static var users: [User] = []

    /// Guarda un usuario en el arreglo
    /// - Parameter User: estructura con los datos del usuario
    /// - Returns: No retorna
    static func saveUser(_ user: User) {
        users.append(user)
    }
    
    /// Busca un usuario que se haya registrado
    /// - Parameter email: email a buscar
    /// - Returns: User que cumpla
    static func getUserByEmail(_ email: String) -> User? {
        return users.first { $0.email == email }
    }
}

