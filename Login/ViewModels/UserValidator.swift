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
        }else
        {
            print("Los datos son incorrectos")
        }
        return isValid // se retorna para que los test puedan ser verificados
    }
    
    
    /// Valida que el email tenga el formato correcto
    /// - Parameter email: String a validar
    /// - Returns: Boleano con el resultado
    fileprivate func validateEmail(_ email: String){
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        guard  emailTest.evaluate(with: email) else{
            isValid = false
            return

        }
    }
    
    /// Valida que el password no sea vacio y tenga mas de 6 caracteres
    /// - Parameter password: String a validar
    /// - Returns: Boleano con el resultado
    fileprivate func validatePassword(_ password: String) {
        if password.count < 6 || password.isEmpty {
            isValid = false
            return
        }
    }
    
    /// Valida que la edad ingresada sea mayor a 18
    /// - Returns: Boleano con el resultado
    fileprivate func validateAge(_ age: Int) {
        if age < 18 {
            isValid = false
            return
        }
    }
    
    /// Valida que el nombre y apellido no sean vacio
    /// - Parameter details: estructura con los datos a validar
    /// - Returns: Boleano con el resultado
    fileprivate func validateDataEmpty(_ details: UserRegistrationDetails) {
        if details.firstName.isEmpty || details.lastName.isEmpty {
            isValid = false
            return
        }
    }
    
    /// Crea y guarda un usuario nuevo en la BD
    /// - Parameter details: estructura con los datos del usuario
    /// - Returns: no retorna
    func crearUser(_ details: UserRegistrationDetails) {
        let user = User(firstName: details.firstName, lastName: details.lastName,
                        email: details.email, password: details.password, age: details.age)
        UserRepository.saveUserBase(user)
    }
    
    /// Envia un email
    /// - Parameter email: direccion de email para enviar el correo
    /// - Returns: no retorna
    fileprivate func sendEmail(_ email: String) {
            EmailService.sendWelcomeEmail(email: email)
    }
    
}
