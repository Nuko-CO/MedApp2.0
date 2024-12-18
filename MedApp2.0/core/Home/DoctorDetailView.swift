//
//  DoctorDetailView.swift
//  MedApp2.0
//
//  Created by Nurdaulet Darmenov on 12/18/24.
//

import SwiftUI

struct DoctorDetailView: View {
    @State private var selectedDate = "Wed 23"
    @State private var selectedTime = "10:00 AM"
    @State private var navigateToAppointment = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Doctor Detail")
                    .font(.title)
                    .bold()
                
                Text("Dr. Darmenov\nCardiologist")
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Даты
                HStack(spacing: 10) {
                    ForEach(["Mon 21", "Tue 22", "Wed 23", "Thu 24", "Fri 25"], id: \.self) { day in
                        Button(action: {
                            selectedDate = day
                        }) {
                            Text(day)
                                .padding()
                                .background(day == selectedDate ? Color.green : Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
                
                // Времена
                HStack(spacing: 10) {
                    ForEach(["10:00 AM", "11:00 AM", "02:00 PM"], id: \.self) { time in
                        Button(action: {
                            selectedTime = time
                        }) {
                            Text(time)
                                .padding()
                                .background(time == selectedTime ? Color.green : Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
                
                Spacer()
                
                // Кнопка перехода
                Button(action: {
                    navigateToAppointment = true
                }) {
                    Text("Book Appointment")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(12)
                }
                .padding()
            }
            .navigationDestination(isPresented: $navigateToAppointment) {
                AppointmentView(
                    appointment: Appointment(date: selectedDate, time: selectedTime, reason: "Chest Pain")
                )
            }
        }
    }
}

#Preview {
    DoctorDetailView()
}
