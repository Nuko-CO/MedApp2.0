//
//  SettingsRowView.swift
//  MedApp2.0
//
//  Created by Nurdaulet Darmenov on 12/16/24.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title2)
                .foregroundColor(tintColor)

            Text(title)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(
            imageName: "gear",
            title: "Version",
            tintColor: Color(.systemGray)
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
