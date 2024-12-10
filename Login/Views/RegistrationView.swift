//
//  RegistrationView.swift
//  Login
//
import SwiftUI

struct RegistrationView: View {
    @StateObject private var userValidator =  UserValidator()
    @Environment(\.dismiss) var dismiss
    @State private var details: UserRegistrationDetails = UserRegistrationDetails(firstName: "", lastName: "", email: "", age: 0, password: "")
    var body: some View {
        VStack(spacing: 20) {
            Text("Crear Cuenta")
                .font(.largeTitle)
                .bold()

            TextField("Nombre", text: $details.firstName)
                .autocapitalization(.words)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            TextField("Apellido", text: $details.lastName)
                .autocapitalization(.words)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)

            TextField("Correo electrónico", text: $details.email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)

            SecureField("Contraseña", text: $details.password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)

            
            Button(action: register) {
                Text("Registrarse")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }

            Spacer()
        }
        .padding()
    }
    
    
    func register() {
        _ = userValidator.registerUser(details)
        dismiss()
    }

}
