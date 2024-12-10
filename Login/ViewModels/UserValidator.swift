//
//  UserValidator.swift
//  Login
//
//
import Foundation

class UserValidator: ObservableObject {
    
    private var isValid: Bool = true
    
    func registerUser( _ details: UserRegistrationDetails) -> Bool{
        validateDataEmpty(details) //nombre y apellido
        validateEmail(details.email)
        validatePassword(details.password)
        validateAge(details.age)
        if isValid{
            crearUser(details)
            sendEmail(details.email)
        }
        return isValid // se retorna para que los test puedan ser verificados
    }
    
    
    
    fileprivate func validateEmail(_ email: String){
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        guard  emailTest.evaluate(with: email) else{
            isValid = false
            return

        }
    }
    
    fileprivate func validatePassword(_ password: String) {
        if password.count < 6 || password.isEmpty {
            isValid = false
            return
        }
    }
    
    fileprivate func validateAge(_ age: Int) {
        if age < 18 {
            isValid = false
            return
        }
    }
    
    fileprivate func validateDataEmpty(_ details: UserRegistrationDetails) {
        if details.firstName.isEmpty || details.lastName.isEmpty {
            isValid = false
            return
        }
    }
    
    func crearUser(_ details: UserRegistrationDetails) {
        let user = User(firstName: details.firstName, lastName: details.lastName,
                        email: details.email, password: details.password, age: details.age)
        UserRepository.saveUserBase(user)
    }
    fileprivate func sendEmail(_ email: String) {
            EmailService.sendWelcomeEmail(email: email)
    }
    
}
