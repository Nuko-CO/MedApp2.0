//
//  ChatView.swift
//  MedApp2.0
//
//  Created by Nurdaulet Darmenov on 12/18/24.
//

import SwiftUI

// Модель сообщения
struct ChatMessage: Identifiable {
    let id = UUID() // Уникальный идентификатор
    let sender: String
    let text: String
}

struct ChatView: View {
    @State private var message = ""
    @State private var chatMessages = [
        ChatMessage(sender: "Dr. Darmenov", text: "Hello, how can I help you?"),
        ChatMessage(sender: "You", text: "I have a headache and cold.")
    ]

    var body: some View {
        HStack {

            NavigationLink(destination: HomeView()) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .font(.title2)
            }
            Spacer()
            Text("Dr. Darmenov")
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 8)
        .navigationBarBackButtonHidden(true)
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(chatMessages) { message in
                        HStack {
                            if message.sender == "You" { Spacer() }
                            Text(message.text)
                                .padding()
                                .background(message.sender == "You" ? Color.green.opacity(0.2) : Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
            }

            HStack {
                TextField("Type message...", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") {
                    let newMessage = ChatMessage(sender: "You", text: message)
                    chatMessages.append(newMessage)
                    message = ""
                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ChatView()
}
