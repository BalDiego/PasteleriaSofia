//
//  NewOrderView.swift
//  PasteleriaSofia
//
//  Created by Diego Baltodano on 10/6/26.
//
import SwiftUI

struct NewOrderView: View {

    @EnvironmentObject var orderStore: OrderStore

    @State private var showSuccessAlert = false

    // Cliente
    @State private var customerName = ""
    @State private var customerPhone = ""
    @State private var customerId = ""

    // Encargo
    @State private var orderName = ""
    @State private var deliveryDate = Date()
    @State private var orderType = "Pastel"

    // Detalles
    @State private var quantity = 1
    @State private var cakeFlavor = ""
    @State private var filling = ""

    @State private var packaging = ""
    @State private var decoration = ""
    @State private var topper = ""

    @State private var candles = false

    @State private var jam = ""

    @State private var frostingType = "Merengue"

    @State private var dedication = ""
    @State private var additionalNotes = ""

    // Entrega
    @State private var requiresDelivery = false
    @State private var deliveryAddress = ""

    // Facturación
    @State private var totalAmount = ""

    let orderTypes = [
        "Pastel",
        "Cupcakes",
        "Bocadillos",
        "Postre"
    ]

    let frostingTypes = [
        "Merengue",
        "Crema Batida"
    ]

    let pastelPink = Color(
        red: 1.0,
        green: 0.78,
        blue: 0.86
    )

    var totalValue: Double {
        Double(totalAmount) ?? 0
    }

    var body: some View {

        NavigationStack {

            Form {

                // INFORMACIÓN GENERAL
                Section("Información General") {

                    TextField(
                        "Nombre del cliente",
                        text: $customerName
                    )

                    TextField(
                        "Número telefónico",
                        text: $customerPhone
                    )
                    .keyboardType(.phonePad)

                    TextField(
                        "Cédula de identidad",
                        text: $customerId
                    )

                    TextField(
                        "Nombre del encargo",
                        text: $orderName
                    )

                    DatePicker(
                        "Fecha y hora de entrega",
                        selection: $deliveryDate
                    )

                    Picker(
                        "Tipo de encargo",
                        selection: $orderType
                    ) {
                        ForEach(orderTypes, id: \.self) {
                            Text($0)
                        }
                    }
                }

                // DETALLES
                Section("Detalles") {

                    Stepper(
                        "Cantidad: \(quantity)",
                        value: $quantity,
                        in: 1...100
                    )

                    TextField(
                        "Sabor de bizcocho",
                        text: $cakeFlavor
                    )

                    TextField(
                        "Relleno",
                        text: $filling
                    )

                    TextField(
                        "Empaquetado",
                        text: $packaging
                    )

                    TextField(
                        "Decoración",
                        text: $decoration
                    )

                    TextField(
                        "Topper",
                        text: $topper
                    )

                    Toggle(
                        "Incluir Velas",
                        isOn: $candles
                    )

                    TextField(
                        "Confitura",
                        text: $jam
                    )

                    Picker(
                        "Tipo de Baño",
                        selection: $frostingType
                    ) {
                        ForEach(frostingTypes, id: \.self) {
                            Text($0)
                        }
                    }

                    TextField(
                        "Dedicatoria",
                        text: $dedication
                    )

                    VStack(alignment: .leading) {

                        Text("Notas Adicionales")
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        TextEditor(
                            text: $additionalNotes
                        )
                        .frame(height: 100)
                    }
                }

                // ENTREGA
                Section("Entrega") {

                    Toggle(
                        "Requiere entrega",
                        isOn: $requiresDelivery
                    )

                    if requiresDelivery {

                        TextField(
                            "Dirección de entrega",
                            text: $deliveryAddress
                        )
                    }
                }

                // FACTURACIÓN
                Section("Facturación") {

                    TextField(
                        "Total",
                        text: $totalAmount
                    )
                    .keyboardType(.decimalPad)

                    if totalValue > 0 {

                        Text(
                            "Adelanto (50%): C$ \(totalValue * 0.5, specifier: "%.2f")"
                        )

                        Text(
                            "Restante (50%): C$ \(totalValue * 0.5, specifier: "%.2f")"
                        )
                    }
                }

                // BOTÓN
                Section {

                    Button {

                        let total = Double(totalAmount) ?? 0

                        let newOrder = Order(

                            id: UUID().uuidString,

                            customerName: customerName,
                            customerPhone: customerPhone,
                            customerId: customerId,

                            orderName: orderName,
                            orderType: orderType,

                            registrationDate: Date(),
                            deliveryDate: deliveryDate,

                            quantity: quantity,

                            cakeFlavor: cakeFlavor,
                            filling: filling,

                            packaging: packaging,
                            decoration: decoration,
                            topper: topper,

                            candles: candles,

                            jam: jam,

                            frostingType: frostingType,

                            dedication: dedication,
                            additionalNotes: additionalNotes,

                            deliveryRequired: requiresDelivery,
                            deliveryAddress: deliveryAddress,

                            totalAmount: total,
                            advancePayment: total * 0.5,
                            remainingPayment: total * 0.5,

                            status: "Pendiente"
                        )

                        orderStore.orders.append(newOrder)

                        // Limpiar formulario

                        customerName = ""
                        customerPhone = ""
                        customerId = ""

                        orderName = ""

                        deliveryDate = Date()

                        orderType = "Pastel"

                        quantity = 1

                        cakeFlavor = ""
                        filling = ""

                        packaging = ""
                        decoration = ""
                        topper = ""

                        candles = false

                        jam = ""

                        frostingType = "Merengue"

                        dedication = ""
                        additionalNotes = ""

                        requiresDelivery = false
                        deliveryAddress = ""

                        totalAmount = ""

                        showSuccessAlert = true

                    } label: {

                        Text("Registrar Encargo")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(pastelPink)
                            .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                }
            }
            .navigationTitle("Nuevo Encargo")
            .alert(
                "Encargo Registrado",
                isPresented: $showSuccessAlert
            ) {

                Button("Aceptar") { }

            } message: {

                Text("El encargo se guardó correctamente.")
            }
        }
    }
}

#Preview {
    NewOrderView()
        .environmentObject(OrderStore())
}
