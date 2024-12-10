//
//  UserRepository.swift
//  Login
//
//  Created by BPIMA_ALW1090 on 9/12/24.
//
import Foundation

class UserRepository: ObservableObject
{
    
    static func getUser(_ email: String) -> User?
    {
        guard let user = Database.getUserByEmail(email) else {return nil}
        return user
        
    }
    
    static func saveUserBase(_ user: User)
    {
        Database.saveUser(user)
    }
}
