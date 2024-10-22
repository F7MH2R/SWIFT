import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var newUsername: String = ""
    @State private var newEmail: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @Binding var users: [User]

    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 20)
            
            Text("Registrar Usuario")
                .font(.title)
                .padding(.bottom, 20)
            
            TextField("Nombre de Usuario", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Correo Electronico", text: $newEmail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Contraseña", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Repite tu contraseña", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: registerUser) {
                Text("Registrarse")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.brown)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    func registerUser() {
        if newPassword == confirmPassword && !newUsername.isEmpty && !newEmail.isEmpty {
            let newUser = User(username: newUsername, email: newEmail, password: newPassword, score: 0)
            users.append(newUser)
            presentationMode.wrappedValue.dismiss()
        }
    }
}

