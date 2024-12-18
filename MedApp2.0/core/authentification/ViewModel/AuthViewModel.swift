
//  AuthViewModel.swift
//  MedApp2.0
//
//  Created by Nurdaulet Darmenov on 12/16/24.


import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

protocol AuthenticationFormProtocol{
    var formisValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentuser: User?
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            print("DEBUG: Trying to sign in with email: \(email)") // Для отладки
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            
            DispatchQueue.main.async {
                self.userSession = result.user
            }
            
            print("DEBUG: Sign-in successful for user: \(result.user.email ?? "Unknown")")
            await fetchedUser()
        } catch {
            print("DEBUG: Failed to sign in \(error.localizedDescription)")
        }
    }


    init(userSession: FirebaseAuth.User? = nil, Currentuser: User? = nil) {
        self.userSession = Auth.auth().currentUser
        Task  {
            await fetchedUser()
        }
    }
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            
            // Вызов fetchedUser для обновления currentuser
            await fetchedUser()
        } catch {
            print("DEBUG: Failed to create user \(error.localizedDescription)")
        }
    }

    func singOut(){
        do {
            try  Auth.auth().signOut()
            self.userSession = nil
            self.currentuser = nil
            
        }catch {
            print("DEBUG:Failed to sign out \(error.localizedDescription)")
        }
    }
    func deleteAccount(){

    }
    func fetchedUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return}
        self.currentuser = try? snapshot.data(as:User.self)
        
        print("Debug: Current user is \(self.currentuser)")
    }
}
