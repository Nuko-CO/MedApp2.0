//
//  CategoryIcon.swift
//  MedApp2.0
//
//  Created by Nurdaulet Darmenov on 12/18/24.
//

import SwiftUI

struct CategoryIcon: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(.teal)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 2)
            Text(label)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
        }
    }
}
#Preview {
    CategoryIcon(icon: "stethoscope", label: "Doctor")
}
