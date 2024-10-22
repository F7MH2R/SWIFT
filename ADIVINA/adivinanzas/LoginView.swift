import SwiftUI

struct LoginView: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var users: [User]
    @Binding var loggedInUser: User?
    @Binding var showRegister: Bool
    @State private var showAlert: Bool = false
    @State private var errorMessage: String = ""

    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 20)
            
            Text("Correo Electronico")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            TextField("Ingresa tu nombre de usuario", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Text("Contraseña")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            SecureField("Ingresa tu contraseña", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: login) {
                Text("Iniciar Sesion")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
            
            Button(action: {
                showRegister = true
            }) {
                Text("Registrarse")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.brown)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showRegister) {
                RegisterView(users: $users)
            }
            
            // Navegación a la pantalla de inicio si el usuario ha iniciado sesión
            NavigationLink(value: loggedInUser) {
                EmptyView() // Navegación condicional sin label visible
            }
        }
        .padding()
        .navigationDestination(for: User?.self) { user in
            WelcomeView(user: user!, users: users, onLogout: {
                loggedInUser = nil  // Esta es la acción que ocurre al cerrar sesión
            })
        }

    }

    // Lógica de login
    func login() {
        if let user = users.first(where: { $0.username == username && $0.password == password }) {
            loggedInUser = user
        } else {
            errorMessage = "Usuario o contraseña incorrectos"
            showAlert = true
        }
    }
}
