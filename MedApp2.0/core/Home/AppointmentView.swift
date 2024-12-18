//
//  AppointmentView.swift
//  MedApp2.0
//
//  Created by Nurdaulet Darmenov on 12/18/24.
//


import SwiftUI

// Модель данных Appointment


// Основная структура AppointmentView
struct AppointmentView: View {
    var appointment: Appointment  // Параметр для передачи данных
    @State private var navigateToChatDoctor = false

    var body: some View {
        NavigationStack {
            VStack {
                // Заголовок
                Text("Appointment")
                    .font(.title)
                    .bold()
                    .padding(.top, 20)

                // Информация о встрече
                VStack(alignment: .leading, spacing: 10) {
                    Text("Date: \(appointment.date)")
                        .font(.headline)
                    Text("Time: \(appointment.time)")
                        .font(.headline)
                    Text("Reason: \(appointment.reason)")
                        .font(.headline)
                }
                .navigationBarBackButtonHidden(true)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                .padding()

                Spacer()

                // Кнопка "Chat Doctor"
                Button(action: {
                    navigateToChatDoctor = true
                }) {
                    Text("Chat Doctor")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .navigationBarBackButtonHidden(true)
                .padding()
            }
            .navigationDestination(isPresented: $navigateToChatDoctor) {
                ChatView()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

// Страница чата с доктором

// Превью для SwiftUI Canvas
#Preview {
    AppointmentView(
        appointment: Appointment(
            date: "Wed 23",
            time: "10:00 AM",
            reason: "Chest pain"
        )
    )
}
