import SwiftUI

struct User: Identifiable, Hashable {  // Agregamos Hashable aquí
    let id = UUID()
    var username: String
    var email: String
    var password: String
    var score: Int
}
