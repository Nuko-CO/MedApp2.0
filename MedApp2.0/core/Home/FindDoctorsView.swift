//
//  FindDoctorsView.swift
//  MedApp2.0
//
//  Created by Nurdaulet Darmenov on 12/17/24.
//

import SwiftUI

struct FindDoctorsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        //        NavigationView {
        ScrollView { // Вертикальный скролл для всей страницы
            VStack(alignment: .leading, spacing: 16) {
                
                // Header Section с кнопкой назад
                HStack {
//                    Button(action: { presentationMode.wrappedValue.dismiss() }){
//                        Image(systemName: "chevron.left")
//                            .foregroundColor(.black)
//                            .font(.title2)
//                        }
                    NavigationLink(destination: HomeView()) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                    Spacer()
                    Text("Find Doctors")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 8)
                .navigationBarBackButtonHidden(true)
                
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Find a doctor", text: .constant(""))
                        .font(.body)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Category Section
                Text("Category")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()], spacing: 16) {
                    NavigationLink(destination: DoctorConsult()) {
                        CategoryIcon(icon: "stethoscope", label: "General")
                    }
                    NavigationLink(destination: Text("Lungs Spec")) {
                        CategoryIcon(icon: "lungs", label: "Lungs ")
                    }
                    NavigationLink(destination: Text("Dentist")) {
                        CategoryIcon(icon: "heart.text.square", label: "Dentist")
                    }
                    NavigationLink(destination: Text("Psychiatrist")) {
                        CategoryIcon(icon: "brain", label: "Psychiatrist")
                    }
                    NavigationLink(destination: Text("Covid-19")) {
                        CategoryIcon(icon: "cross.case.fill", label: "Covid-19")
                    }
                    NavigationLink(destination: Text("Surgeon")) {
                        CategoryIcon(icon: "bandage", label: "Surgeon")
                    }
                    NavigationLink(destination: Text("Diagnostics")) {
                        CategoryIcon(icon: "doc.text.magnifyingglass", label: "Diagnostics")
                    }
                }
                .navigationBarBackButtonHidden(true)
                .padding(.horizontal)
                
                // Recommended Doctors
                Text("Recommended Doctors")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
                VStack(spacing: 16) {
                    DoctorCard(name: "Dr. Darmenov", specialty: "Cardiologist", rating: "4.7", distance: "800m away")
                }
                .padding(.horizontal)
                
                // Recent Doctors Section
                Text("Your Recent Doctors")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        DoctorCard(name: "Dr. Maria Elena", specialty: "Cardiologist", rating: "4.7", distance: "800m away")
                        DoctorCard(name: "Dr. Maria Elena", specialty: "Psychologist", rating: "4.9", distance: "1.5km away")
                        DoctorCard(name: "Dr. Maria Elena", specialty: "Orthopedist", rating: "4.8", distance: "2km away")
                        DoctorCard(name: "Dr. Maria Elena", specialty: "Cardiologist", rating: "4.7", distance: "800m away")
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding(.top)
        }
        .navigationBarHidden(true) // Скрыть верхний бар
//        }
    }
}




struct FindDoctorsView_Previews: PreviewProvider {
    static var previews: some View {
        FindDoctorsView()
    }
}
