//
//  ProfileView.swift
//  MedApp2.0
//
//  Created by Nurdaulet Darmenov on 12/16/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var ViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 0) {
            // Gradient Header with User Profile Data
//            ZStack {
//                RoundedRectangle(cornerRadius: 20, style: .continuous)
//               
//                LinearGradient(gradient: Gradient(colors: [Color.teal, Color.cyan]),
//                               startPoint: .topLeading,
//                               endPoint: .bottomTrailing)
//                .edgesIgnoringSafeArea(.top)
//                
//                VStack {
//                    if let user = ViewModel.currentuser {
//                        HStack {
//                            // User Initials
//                            Text(user.initials)
//                                .font(.title)
//                                .fontWeight(.semibold)
//                                .foregroundColor(.white)
//                                .frame(width: 72, height: 72)
//                                .background(Color(.systemGray3))
//                                .clipShape(Circle())
//                            
//                            // User Information
//                            VStack(alignment: .leading, spacing: 4) {
//                                Text(user.fullname)
//                                    .font(.subheadline)
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.white)
//                                    .padding(.top, 4)
//                                
//                                Text(user.email)
//                                    .font(.footnote)
//                                    .foregroundColor(Color.white.opacity(0.8))
//                            }
//                            Spacer()
//                        }
//                        .padding(.horizontal)
//                        .padding(.top, 50)
//                    }
//                }
//                .padding(.bottom, 40)
//            }
//            .frame(height: 200)
//            .cornerRadius(25, corners: [.bottomLeft, .bottomRight])
            ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 32, style: .continuous)
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.blue]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                                .frame(height: 220) // Увеличена высота для более красивого подъема
                                
                            
                            // Информация пользователя (инициалы и имя)
                VStack(alignment: .leading, spacing: 8) {
                    if let user = ViewModel.currentuser{
                        HStack {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 70, height: 70) // Больше размер
                            .overlay(
                                Text(user.initials)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            )
                        VStack(alignment: .leading) {
                            Text(user.fullname)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.white.opacity(0.8))
                        }
                        
                    }
                        .padding(.leading, 16)
                }
                                
            }
                .padding(.top, 20) // Поднимает контент вверх
        }
        
            .frame(height: 200)
            .padding(.bottom, 16)
                       
            
            // Profile Options List
            VStack(spacing: 16) {
                ProfileRowView(icon: "heart.circle", title: "My Saved")
                ProfileRowView(icon: "calendar", title: "Appointment")
                ProfileRowView(icon: "creditcard", title: "Payment Method")
                ProfileRowView(icon: "questionmark.circle", title: "FAQs")
                Button(action: {ViewModel.singOut()}) {
                    ProfileRowView(icon: "exclamationmark.triangle.fill",
                                   title: "Logout",
                                   isDestructive: true)
                    
                }
                
            }
            .padding(.horizontal, 16)
            .padding(.top, 24)
            
            Spacer()
            
            // Bottom Navigation Bar
            HStack {
                
//                Button(action: { presentationMode.wrappedValue.dismiss() }){
//                    BottomTabItem(icon: "house", title: "Home")
//                    }
                NavigationLink(destination: HomeView()) {
                    BottomTabItem(icon: "house", title: "Home")
                }
                BottomTabItem(icon: "envelope", title: "Messages")
                BottomTabItem(icon: "calendar", title: "Schedule")
                BottomTabItem(icon: "person.fill", title: "Profile", isSelected: true)
            }
            .padding(.top, 16)
            .background(Color.white)
            .shadow(color: Color.gray.opacity(0.1), radius: 4, x: 0, y: -2)
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
        
    }
    
        
}
    
// MARK: Profile Row View
struct ProfileRowView: View {
    let icon: String
    let title: String
    var isDestructive: Bool = false

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(isDestructive ? .red : .teal)
                .frame(width: 28, height: 28)
            Text(title)
                .font(.body)
                .foregroundColor(isDestructive ? .red : .black)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

// Bottom Tab Item
struct BottomTabItem: View {
    let icon: String
    let title: String
    var isSelected: Bool = false

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(isSelected ? .teal : .gray)
            Text(title)
                .font(.caption)
                .foregroundColor(isSelected ? .teal : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
