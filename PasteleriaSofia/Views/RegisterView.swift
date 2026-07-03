//
//  RegisterView.swift
//  PasteleriaSofia
//
//  Created by Diego Baltodano on 9/6/26.
//

import SwiftUI

struct RegisterView: View {

    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var selectedRole = "Administrador"

    let roles = ["Administrador", "Empleado"]

    let pastelPink = Color(
        red: 1.0,
        green: 0.78,
        blue: 0.86
    )

    var body: some View {

        VStack(spacing: 20) {

            Spacer()

            Text("Pastelería Sofía")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(pastelPink)

            Image(systemName: "birthday.cake")
                .font(.system(size: 80))
                .foregroundStyle(pastelPink)

            Text("Registro de Usuario")
                .font(.title2)
                .fontWeight(.semibold)

            TextField("Nombre de usuario", text: $username)
                .textFieldStyle(.roundedBorder)

            SecureField("Contraseña", text: $password)
                .textFieldStyle(.roundedBorder)

            SecureField("Confirmar contraseña", text: $confirmPassword)
                .textFieldStyle(.roundedBorder)

            Picker("Rol", selection: $selectedRole) {
                ForEach(roles, id: \.self) { role in
                    Text(role)
                }
            }
            .pickerStyle(.menu)

            Button("Registrarse") {

            }
            .buttonStyle(.borderedProminent)
            .tint(pastelPink)

            Button("Volver al Login") {

            }
            .foregroundStyle(pastelPink)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    RegisterView()
}
