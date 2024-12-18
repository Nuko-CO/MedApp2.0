//
//  DoctorCard.swift
//  MedApp2.0
//
//  Created by Nurdaulet Darmenov on 12/17/24.
//

import SwiftUI

//// Компонент карточки доктора
struct DoctorCard: View {
    let name: String
    let specialty: String
    let rating: String
    let distance: String

    

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                // Placeholder for Doctor Image
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 80)
                    .overlay(
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .foregroundColor(.gray)
                    )
                
                // Doctor's Name
                Text(name)
                    .font(.headline)
                    .foregroundColor(.black)
                
                // Specialty
                Text(specialty)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                // Rating and Distance
                HStack {
                    Label(rating, systemImage: "star.fill")
                        .foregroundColor(.teal)
                        .font(.footnote)
                    Spacer()
                    Label(distance, systemImage: "mappin.and.ellipse")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            }
            .padding()
            .frame(width: 160, height: 220)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
        }
    }


