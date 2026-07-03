//
//  HomeView.swift
//  PasteleriaSofia
//
//  Created by Diego Baltodano on 9/6/26.
//
import SwiftUI

struct HomeView: View {

    let username: String

    let pastelPink = Color(
        red: 1.0,
        green: 0.78,
        blue: 0.86
    )

    var body: some View {

        TabView {

            // INICIO
            NavigationStack {

                VStack(spacing: 25) {

                    Spacer()

                    Image(systemName: "birthday.cake")
                        .font(.system(size: 100))
                        .foregroundStyle(pastelPink)

                    Text("Bienvenido")
                        .font(.title)

                    Text(username)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(pastelPink)

                    VStack(spacing: 15) {

                        HomeCard(
                            title: "Nuevo Encargo",
                            icon: "plus.circle.fill",
                            color: pastelPink
                        )

                        HomeCard(
                            title: "Calendario",
                            icon: "calendar",
                            color: pastelPink
                        )

                        HomeCard(
                            title: "Ver Encargos",
                            icon: "list.bullet.rectangle",
                            color: pastelPink
                        )
                    }

                    Spacer()
                }
                .padding()
                .navigationTitle("Inicio")
            }
            .tabItem {
                Label("Inicio", systemImage: "house.fill")
            }

            // NUEVO ENCARGO
            NewOrderView()
                .tabItem {
                    Label("Encargo", systemImage: "plus.circle.fill")
                }

            // CALENDARIO
            CalendarView()
                .tabItem {
                    Label("Calendario", systemImage: "calendar")
                }

            // ENCARGOS
            OrdersView()
                .tabItem {
                    Label("Encargos", systemImage: "list.bullet")
                }
        }
        .tint(pastelPink)
    }
}

struct HomeCard: View {

    let title: String
    let icon: String
    let color: Color

    var body: some View {

        HStack {

            Image(systemName: icon)
                .font(.title2)

            Text(title)
                .fontWeight(.semibold)

            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .foregroundStyle(color)
    }
}

#Preview {
    HomeView(username: "Sofía")
}
