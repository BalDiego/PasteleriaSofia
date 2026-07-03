//
//  OrdersView.swift
//  PasteleriaSofia
//
//  Created by Diego Baltodano on 10/6/26.
//

import SwiftUI

struct OrdersView: View {

    @EnvironmentObject var orderStore: OrderStore

    @State private var selectedFilter = "Pendientes"

    private let filters = [
        "Pendientes",
        "Entregados"
    ]

    var filteredOrders: [Order] {

        orderStore.orders.filter {

            if selectedFilter == "Pendientes" {
                return $0.status == "Pendiente"
            }

            return $0.status == "Entregado"
        }
    }

    let pastelPink = Color(
        red: 1.0,
        green: 0.78,
        blue: 0.86
    )

    var body: some View {

        NavigationStack {

            VStack {

                Picker(
                    "Filtro",
                    selection: $selectedFilter
                ) {

                    ForEach(filters, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                if filteredOrders.isEmpty {

                    ContentUnavailableView(
                        "Sin encargos",
                        systemImage: "birthday.cake",
                        description: Text(
                            "No existen encargos en esta categoría."
                        )
                    )

                } else {

                    List(filteredOrders) { order in

                        NavigationLink {

                            OrderDetailView(order: order)

                        } label: {

                            VStack(
                                alignment: .leading,
                                spacing: 6
                            ) {

                                HStack {

                                    Text(order.customerName)
                                        .font(.headline)

                                    Spacer()

                                    Text(order.status)
                                        .font(.caption)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(
                                            order.status == "Pendiente"
                                            ? Color.orange.opacity(0.2)
                                            : Color.green.opacity(0.2)
                                        )
                                        .clipShape(Capsule())
                                }

                                Text(order.orderName)
                                    .foregroundStyle(.secondary)

                                HStack {

                                    Label(
                                        order.deliveryDate.formatted(
                                            date: .abbreviated,
                                            time: .shortened
                                        ),
                                        systemImage: "calendar"
                                    )
                                    .font(.caption)

                                    Spacer()

                                    Text(
                                        order.totalAmount.formatted(
                                            .currency(code: "NIO")
                                        )
                                    )
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Encargos")
        }
        .tint(pastelPink)
    }
}

#Preview {
    OrdersView()
        .environmentObject(OrderStore())
}
