//
//  CalendarView.swift
//  PasteleriaSofia
//
//  Created by Diego Baltodano on 10/6/26.
//

import SwiftUI

struct CalendarView: View {

    @EnvironmentObject var orderStore: OrderStore

    @State private var selectedDate = Date()

    var ordersForSelectedDate: [Order] {

        orderStore.orders.filter {

            Calendar.current.isDate(
                $0.deliveryDate,
                inSameDayAs: selectedDate
            )
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

                DatePicker(
                    "Selecciona una fecha",
                    selection: $selectedDate,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .padding()

                if ordersForSelectedDate.isEmpty {

                    ContentUnavailableView(
                        "Sin encargos",
                        systemImage: "calendar",
                        description: Text(
                            "No existen entregas para esta fecha."
                        )
                    )

                } else {

                    List(ordersForSelectedDate) { order in

                        NavigationLink {

                            OrderDetailView(order: order)

                        } label: {

                            VStack(
                                alignment: .leading,
                                spacing: 6
                            ) {

                                Text(order.orderName)
                                    .font(.headline)

                                Text(order.customerName)
                                    .foregroundStyle(.secondary)

                                Text(
                                    order.deliveryDate.formatted(
                                        date: .omitted,
                                        time: .shortened
                                    )
                                )
                                .font(.caption)

                                Text(
                                    order.remainingPayment.formatted(
                                        .currency(code: "NIO")
                                    )
                                )
                                .font(.caption)
                                .fontWeight(.semibold)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Calendario")
        }
        .tint(pastelPink)
    }
}

#Preview {
    CalendarView()
        .environmentObject(OrderStore())
}
