//
//  LoginView.swift
//  MedApp
//
//  Created by Nurdaulet Darmenov on 12/11/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Image("KazMed")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding(.vertical)
                
            //form fields
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder:"name@example.com")
                        .autocapitalization(.none)

                    InputView(text: $password, title: "Password", placeholder: "Enter your password",inSecureField: true)
                        .autocapitalization(.none)
                }
                .padding(.horizontal)
                .padding(.bottom,30)
                
            //sign in buttom
                Button(action: {
                    Task {
                        do {
                            try await viewModel.signIn(withEmail: email, password: password)
                        } catch {
                            print("Error signing in: \(error.localizedDescription)")
                        }
                    }
                }) {
                    Text("Sign In")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .disabled(!formisValid) // Неактивна, если форма невалидна
                        .opacity(formisValid ? 1 : 0.5)
                }

                Spacer()
//sign up button
                NavigationLink {
                    RegistrationView()
                        
                }label: {
                    HStack (spacing: 3){
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .foregroundColor(Color.blue)
                            .fontWeight(.bold)
                    }
                }
            }
            
        }
    }
}
//MARK: AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol {
    var formisValid: Bool {
        return !email.isEmpty &&
               email.contains("@") &&
               !password.isEmpty &&
               password.count >= 5
    }
}

#Preview {
    LoginView()
}
