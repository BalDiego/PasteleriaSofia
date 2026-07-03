//
//  ContentView.swift
//  PasteleriaSofia
//
//  Created by Diego Baltodano on 9/6/26.
//
import SwiftUI

struct LoginView: View {

    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false

    let pastelPink = Color(
        red: 1.0,
        green: 0.78,
        blue: 0.86
    )

    var body: some View {

        NavigationStack {

            VStack(spacing: 20) {

                Spacer()

                Text("Pastelería Sofía")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(pastelPink)

                Image(systemName: "birthday.cake")
                    .font(.system(size: 80))
                    .foregroundStyle(pastelPink)

                TextField("Nombre de usuario", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()

                SecureField("Contraseña", text: $password)
                    .textFieldStyle(.roundedBorder)

                Button("Iniciar Sesión") {
                    isLoggedIn = true
                }
                .buttonStyle(.borderedProminent)
                .tint(pastelPink)

                NavigationLink(destination: RegisterView()) {

                    Text("Registrarse")
                        .foregroundStyle(pastelPink)
                        .fontWeight(.medium)
                }

                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView(username: username.isEmpty ? "Usuario" : username)
            }
        }
    }
}

#Preview {
    LoginView()
}
