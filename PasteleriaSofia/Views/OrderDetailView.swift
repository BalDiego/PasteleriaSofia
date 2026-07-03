//
//  OrderDetailView.swift
//  PasteleriaSofia
//
//  Created by Diego Baltodano on 10/6/26.
//

import SwiftUI

struct OrderDetailView: View {

    @EnvironmentObject var orderStore: OrderStore
    @Environment(\.dismiss) private var dismiss

    let order: Order

    let pastelPink = Color(
        red: 1.0,
        green: 0.78,
        blue: 0.86
    )

    var body: some View {

        Form {

            Section("Cliente") {

                DetailRow(
                    title: "Nombre",
                    value: order.customerName
                )

                DetailRow(
                    title: "Teléfono",
                    value: order.customerPhone
                )

                DetailRow(
                    title: "Cédula",
                    value: order.customerId
                )
            }

            Section("Información del Encargo") {

                DetailRow(
                    title: "Nombre del Encargo",
                    value: order.orderName
                )

                DetailRow(
                    title: "Tipo",
                    value: order.orderType
                )

                DetailRow(
                    title: "Cantidad",
                    value: "\(order.quantity)"
                )

                DetailRow(
                    title: "Fecha de Registro",
                    value: order.registrationDate.formatted()
                )

                DetailRow(
                    title: "Fecha de Entrega",
                    value: order.deliveryDate.formatted()
                )
            }

            Section("Especificaciones") {

                DetailRow(
                    title: "Sabor de Bizcocho",
                    value: order.cakeFlavor
                )

                DetailRow(
                    title: "Relleno",
                    value: order.filling
                )

                DetailRow(
                    title: "Empaquetado",
                    value: order.packaging
                )

                DetailRow(
                    title: "Decoración",
                    value: order.decoration
                )

                DetailRow(
                    title: "Topper",
                    value: order.topper
                )

                DetailRow(
                    title: "Confitura",
                    value: order.jam
                )

                DetailRow(
                    title: "Tipo de Baño",
                    value: order.frostingType
                )

                DetailRow(
                    title: "Dedicatoria",
                    value: order.dedication
                )

                DetailRow(
                    title: "Notas Adicionales",
                    value: order.additionalNotes
                )

                DetailRow(
                    title: "Velas",
                    value: order.candles ? "Sí" : "No"
                )
            }

            Section("Entrega") {

                DetailRow(
                    title: "Entrega a Domicilio",
                    value: order.deliveryRequired ? "Sí" : "No"
                )

                if order.deliveryRequired {

                    DetailRow(
                        title: "Dirección",
                        value: order.deliveryAddress
                    )
                }
            }

            Section("Facturación") {

                DetailRow(
                    title: "Total",
                    value: order.totalAmount.formatted(
                        .currency(code: "NIO")
                    )
                )

                DetailRow(
                    title: "Adelanto",
                    value: order.advancePayment.formatted(
                        .currency(code: "NIO")
                    )
                )

                DetailRow(
                    title: "Saldo Pendiente",
                    value: order.remainingPayment.formatted(
                        .currency(code: "NIO")
                    )
                )
            }

            Section("Estado") {

                HStack {

                    Text(order.status)
                        .fontWeight(.bold)

                    Spacer()

                    Circle()
                        .fill(
                            order.status == "Entregado"
                            ? Color.green
                            : Color.orange
                        )
                        .frame(width: 12, height: 12)
                }
            }

            Section("Acciones") {

                if order.status == "Pendiente" {

                    Button {

                        orderStore.markAsDelivered(order)

                        dismiss()

                    } label: {

                        Label(
                            "Marcar como Entregado",
                            systemImage: "checkmark.circle.fill"
                        )
                    }
                }

                Button(
                    role: .destructive
                ) {

                    orderStore.deleteOrder(order)

                    dismiss()

                } label: {

                    Label(
                        "Eliminar Encargo",
                        systemImage: "trash.fill"
                    )
                }
            }
        }
        .navigationTitle("Detalle")
    }
}

struct DetailRow: View {

    let title: String
    let value: String

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 4
        ) {

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(value)
        }
    }
}

#Preview {

    OrderDetailView(
        order: sampleOrders[0]
    )
    .environmentObject(OrderStore())
}
