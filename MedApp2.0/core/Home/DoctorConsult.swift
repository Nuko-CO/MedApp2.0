import SwiftUI

struct DoctorConsult: View {
    @State private var message: String = ""
    @FocusState private var isInputActive: Bool
    @Environment(\.dismiss) var dismiss // Для возврата на предыдущий экран
    
    var body: some View {
        VStack {
            headerView
            consultationStartView
            messagesView
            inputMessageView
        }
        .navigationBarHidden(true) // Скрыть системную навигацию
        .onTapGesture {
            isInputActive = false // Скрыть клавиатуру при нажатии вне поля ввода
        }
    }
    
    // MARK: Header View с кастомной стрелкой "Назад"
    var headerView: some View {
        HStack {
            Button(action: {
                dismiss() // Возвращает на предыдущий экран
            }) {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left") // Иконка стрелки
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.blue)
                    Text("Back") // Текст "Back"
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.blue)
                }
                
            }
            Spacer()
            Text("AI Consultant")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "ellipsis") // Иконка для дополнительных действий
                .font(.system(size: 20))
                .foregroundColor(.gray)
        }
        
        .padding(.horizontal)
        .padding(.top, 10)
    }
    
    // MARK:  Consultation Start View
    var consultationStartView: some View {
        VStack {
            Text("Consultation Start")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.teal)
            Text("You can consult your problem to the doctor")
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal)
    }
    
    // MARK:  Messages View
    var messagesView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ChatBubble(isFromUser: false, message: "Hello, How can I help you?")
                ChatBubble(isFromUser: true, message: "I have suffering from headache and cold for 3 days, I took 2 tablets of dolo, but still pain")
                ChatBubble(isFromUser: false, message: "Ok, Do you have fever? is the headache severe")
                ChatBubble(isFromUser: true, message: "I don't have any fever, but headache is painful")
                HStack(alignment: .bottom) {
                    Text("Ok, you need go to ")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                    NavigationLink(destination: DoctorDetailView()) {
                        Text("virusolog")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.teal)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
                .frame(maxWidth: 250, alignment: .leading)
            }
            .padding()
        }
    }
    
    // MARK:  Input Message View
    var inputMessageView: some View {
        HStack {
            TextField("Type message ...", text: $message)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(25)
                .focused($isInputActive)
            
            Button(action: {
                sendMessage()
            }) {
                Text("Send")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.teal)
                    .cornerRadius(25)
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    // MARK:  Send Message Function
    func sendMessage() {
        print("Message sent: \(message)")
        message = ""
        isInputActive = false
    }
}

// MARK:  ChatBubble Component
struct ChatBubble: View {
    var isFromUser: Bool
    var message: String
    
    var body: some View {
        HStack {
            if isFromUser { Spacer() }
            Text(message)
                .font(.system(size: 14))
                .foregroundColor(isFromUser ? .white : .black)
                .padding()
                .background(isFromUser ? Color.teal : Color.gray.opacity(0.2))
                .cornerRadius(12)
                .frame(maxWidth: 250, alignment: isFromUser ? .trailing : .leading)
            if !isFromUser { Spacer() }
        }
    }
}

// MARK:  VirusologView


// MARK: Preview
struct DoctorConsult_Previews: PreviewProvider {
    static var previews: some View {
        DoctorConsult()
    }
}
