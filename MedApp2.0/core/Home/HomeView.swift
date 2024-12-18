//
//  HomeView.swift
//  MedApp
//
//  Created by Nurdaulet Darmenov on 12/11/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 25) {
                        
                        // Заголовок и уведомление
                        HStack {
                            Text("Find your desire\nhealth solution")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "bell")
                                .font(.system(size: 22, weight: .medium))
                                .foregroundColor(.gray)
                        }
                        .navigationBarHidden(true)
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        // Поле поиска
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search doctor, drugs, articles...", text: .constant(""))
                                .font(.system(size: 14))
                        }
                        .navigationBarHidden(true)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        // Категории с NavigationLink
                        HStack(spacing: 36) {
                            NavigationLink(destination: FindDoctorsView()) {
                                CategoryIcon(icon: "stethoscope", label: "Doctor")
                            }
                            NavigationLink(destination: Text("Pharmacy Page")) {
                                CategoryIcon(icon: "pills", label: "Pharmacy")
                            }
                            NavigationLink(destination: Text("Hospital Page")) {
                                CategoryIcon(icon: "building.2", label: "Hospital")
                            }
                            NavigationLink(destination: Text("Ambulance Page")) {
                                CategoryIcon(icon: "cross.case", label: "Ambulance")
                            }
                        }
                        .padding(.horizontal)
                        
                        // Блок Early Protection
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Early protection for your family health")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                            Button(action: {}) {
                                Text("Learn more")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.teal)
                                    .cornerRadius(8)
                            }
                            .padding(.top, 10) // Кнопка ниже
                        }
                        .padding()
                        .background(Color.teal.opacity(0.1))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        // Our Doctors
                        HStack {
                            Text("Our Doctors")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.black)
                            Spacer()
                            NavigationLink(destination: Text("See All Doctors")) {
                                Text("See all")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.green)
                            }
                        }
                        .navigationBarHidden(true)
                        .padding(.horizontal)
                        
                        // Горизонтальный скролл для докторов
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                DoctorCard(name: "Dr. Maria Elena", specialty: "Cardiologist", rating: "4.7", distance: "800m away")
                                DoctorCard(name: "Dr. Darmenov Y.", specialty: "Psychologist", rating: "4.9", distance: "1.5km away")
                                DoctorCard(name: "Dr. Maria E.", specialty: "Orthopedist", rating: "4.8", distance: "2km away")
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
                
                // Нижняя навигация
                HStack {
                    
                    BottomNavItem(icon: "house.fill", label: "Home", isActive: true)
                    BottomNavItem(icon: "envelope", label: "Messages")
                    BottomNavItem(icon: "calendar", label: "Schedule")
                    NavigationLink(destination: ProfileView()) {
                        BottomNavItem(icon: "person", label: "Profile")
                    }
                    
                }
                .navigationBarBackButtonHidden(true)
                .padding()
                .background(Color.white.shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
            
        }
        .navigationBarHidden(true)
    }
}




// Нижняя навигация
struct BottomNavItem: View {
    var icon: String
    var label: String
    var isActive: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(isActive ? .teal : .gray)
            Text(label)
                .font(.system(size: 12))
                .foregroundColor(isActive ? .teal : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
