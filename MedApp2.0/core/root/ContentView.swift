//
//  ContentView.swift
//  MedApp
//
//  Created by Nurdaulet Darmenov on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                HomeView()

            } else {
                LoginView()
            }
        }
        
    }

    struct ContentView_Preview: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
