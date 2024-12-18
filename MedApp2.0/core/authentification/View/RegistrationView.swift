//
//  RegistrationView.swift
//  MedApp
//
//  Created by Nurdaulet Darmenov on 12/11/24.
//

import SwiftUI

struct RegistrationView: View {
      @State private var email = ""
      @State private var fullName = ""
      @State private var password = ""
      @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
 
    var body: some View {
        VStack(spacing: 24) {
            InputView(text: $email, title: "Email Address", placeholder:"name@example.com")
                .autocapitalization(.none)
            InputView(text: $fullName, title: "Full Name", placeholder:"Enter Your Full Name")
            
            
            InputView(text: $password, title: "Password", placeholder: "Enter your password",inSecureField: true)
            

//            ZStack(alignment: .trailing) {
                InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Enter your password", inSecureField: true)
                
                if !password.isEmpty && !confirmPassword.isEmpty {
                    HStack(spacing: 4) {
                        Spacer() // Добавляет пространство между полем и текстом
                        
                        if password != confirmPassword {
                            Text("Passwords do not match")
                                .font(.caption) // Уменьшенный размер шрифта
                                .foregroundColor(.red) // Красный цвет для сообщения
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.medium)
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.medium)
                                .foregroundColor(.green)
                        }
                    }
                    .padding(.trailing, 8) // Отступ справа
                }
//            }
            
            
            Button(action: {Task {
                
                do {
                    try await viewModel.createUser(withEmail: email, password: password, fullName: fullName)
                    
                }
            }}) {
                Text("Sign Up")
                
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .disabled(!formisValid)
                    .opacity(formisValid ? 1 : 0.5)
            }
            
        }
        .padding(.horizontal)
        .padding(.bottom,30)
        
        Button{
            dismiss()
        } label: {
            HStack (spacing: 3){
                Text("Already have an account?")
                Text("Sign In")
                    .foregroundColor(Color.blue)
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
        }
        
       
    }
}
//MARK: AuthenticationFormProtocol
extension RegistrationView: AuthenticationFormProtocol {
    var formisValid: Bool {
        return !email.isEmpty &&
               email.contains("@") &&
               !password.isEmpty &&
               password.count >= 5 &&
               !fullName.isEmpty &&
               confirmPassword == password
    }
}
#Preview {
    RegistrationView()
}
