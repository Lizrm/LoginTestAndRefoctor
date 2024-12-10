//
//  Database.swift
//  Login
//
// Database.swift

import Foundation

class Database {
    private static var users: [User] = []

    static func saveUser(_ user: User) {
        users.append(user)
    }

    static func getUserByEmail(_ email: String) -> User? {
        return users.first { $0.email == email }
    }
}

