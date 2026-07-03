//
//  Order.swift
//  PasteleriaSofia
//
//  Created by Diego Baltodano on 10/6/26.
//

import Foundation

struct Order: Identifiable {

    let id: String

    // Cliente
    let customerName: String
    let customerPhone: String
    let customerId: String

    // Encargo
    let orderName: String
    let orderType: String

    // Fechas
    let registrationDate: Date
    let deliveryDate: Date

    // Detalles
    let quantity: Int
    let cakeFlavor: String
    let filling: String

    let packaging: String
    let decoration: String
    let topper: String

    let candles: Bool

    let jam: String

    let frostingType: String

    let dedication: String
    let additionalNotes: String

    // Entrega
    let deliveryRequired: Bool
    let deliveryAddress: String

    // Facturación
    let totalAmount: Double
    let advancePayment: Double
    let remainingPayment: Double

    // Estado
    var status: String
}
