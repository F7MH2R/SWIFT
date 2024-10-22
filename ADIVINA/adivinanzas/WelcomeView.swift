import SwiftUI

struct WelcomeView: View {
    var user: User
    var users: [User]
    var onLogout: () -> Void  // Callback para cerrar sesión

    var body: some View {
        VStack {
            Text("Bienvenido a MagicTXT")
                .font(.largeTitle)
                .padding()
            
            Text("Usuario: \(user.username)")
                .font(.title2)
                .padding()
            
            Text("Puntaje: \(user.score)")
                .font(.headline)
                .padding(.bottom, 20)
            
            // Tablero de Reyes
            Text("Tablero de Reyes")
                .font(.headline)
                .padding()

            // Lista de los top 5 usuarios ordenados por puntaje
            List {
                ForEach(topFiveUsers(), id: \.id) { topUser in
                    HStack {
                        Text(topUser.username)
                        Spacer()
                        Text("\(topUser.score)")
                    }
                }
            }
            .frame(height: 250) // Ajustamos el tamaño de la lista
            
            Button(action: {
                // Acción para iniciar el juego
            }) {
                Text("Iniciar Juego")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.top, 20)

            // Botón de Cerrar Sesión
            Button(action: {
                onLogout()  // Llamamos la función de cierre de sesión
            }) {
                Text("Cerrar Sesión")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding(.top, 20)
            }
        }
        .padding()
    }
    
    // Función para obtener el top 5 usuarios con mejores puntajes
    func topFiveUsers() -> [User] {
        return users.sorted(by: { $0.score > $1.score }).prefix(5).map { $0 }
    }
}
