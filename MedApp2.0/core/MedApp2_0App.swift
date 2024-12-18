//
//  MedApp2_0App.swift
//  MedApp2.0
//
//  Created by Nurdaulet Darmenov on 12/11/24.
//

import SwiftUI
import Firebase
import FirebaseAuth
@main
struct MedApp2_0App: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
