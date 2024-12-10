//
//  LoginView.swift
//  Login
//

import SwiftUI

struct LoginView: View {
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var showForm = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Iniciar Sesión")
                .font(.largeTitle)
                .bold()
            
            
            TextField("Correo electrónico", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            
            SecureField("Contraseña", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            HStack{
                Button(action: login)
                {
                    Text("Iniciar Sesión")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                Button(action: {
                  showForm = true
                }) {
                    Text("Registrarse")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }.sheet(isPresented: $showForm ) {
                    RegistrationView()
                }
            }
            Spacer()
        }
    }
    
    func login() {
        guard LoginValidator.authenticateUser(email, password) else{
           print("Autenticacion fallo")
           return
        }
        
        print("Autenticacion Exitosa")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
