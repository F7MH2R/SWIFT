
import SwiftUI


struct ContentView: View {
    @State private var showRegister = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loggedInUser: User? = nil
    @State private var users = [
                User(username: "F7M", email: "f7m@mail.com", password: "123", score: 25),
                User(username: "CHM", email: "chm@mail.com", password: "Pass2", score: 22),
                User(username: "ROD", email: "rod@mail.com", password: "Pass3", score: 20),
                User(username: "JAKE", email: "jake@mail.com", password: "Pass4", score: 18),
                User(username: "LIZ", email: "liz@mail.com", password: "Pass5", score: 100),
                User(username: "FER", email: "fiz@mail.com", password: "Pass5", score: 100)
    ]
    
    var body: some View {
        NavigationStack {
            if let user = loggedInUser {
                WelcomeView(user: user, users: users, onLogout: {
                    loggedInUser = nil
                })  // Pasamos la función para cerrar sesión
            } else {
                LoginView(username: $username, password: $password, users: $users, loggedInUser: $loggedInUser, showRegister: $showRegister)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
