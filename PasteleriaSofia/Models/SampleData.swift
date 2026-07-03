//
//  SampleData.swift
//  PasteleriaSofia
//
//  Created by Diego Baltodano on 10/6/26.
//
import Foundation

let sampleOrders: [Order] = [

    Order(
        id: UUID().uuidString,

        customerName: "María López",
        customerPhone: "8888-1111",
        customerId: "001-010101-0001A",

        orderName: "Pastel Spiderman",
        orderType: "Pastel",

        registrationDate: Date(),
        deliveryDate: Date(),

        quantity: 1,

        cakeFlavor: "Chocolate",
        filling: "Nutella",

        packaging: "Caja Premium",
        decoration: "Fondant",
        topper: "Spiderman",

        candles: true,

        jam: "Fresa",

        frostingType: "Merengue",

        dedication: "Feliz Cumpleaños",

        additionalNotes: "Sin nueces",

        deliveryRequired: true,

        deliveryAddress: "Managua",

        totalAmount: 1200,

        advancePayment: 600,

        remainingPayment: 600,

        status: "Pendiente"
    ),

    Order(
        id: UUID().uuidString,

        customerName: "Ana Pérez",
        customerPhone: "8888-2222",
        customerId: "001-020202-0002B",

        orderName: "Cupcakes Baby Shower",
        orderType: "Cupcakes",

        registrationDate: Date(),
        deliveryDate: Date(),

        quantity: 24,

        cakeFlavor: "Vainilla",
        filling: "Crema Pastelera",

        packaging: "Caja",
        decoration: "Rosado",
        topper: "Baby",

        candles: false,

        jam: "Ninguna",

        frostingType: "Crema Batida",

        dedication: "",

        additionalNotes: "",

        deliveryRequired: false,

        deliveryAddress: "",

        totalAmount: 800,

        advancePayment: 400,

        remainingPayment: 400,

        status: "Pendiente"
    ),

    Order(
        id: UUID().uuidString,

        customerName: "Carlos Ruiz",
        customerPhone: "8888-3333",
        customerId: "001-030303-0003C",

        orderName: "Pastel Graduación",
        orderType: "Pastel",

        registrationDate: Date(),
        deliveryDate: Date(),

        quantity: 1,

        cakeFlavor: "Red Velvet",
        filling: "Queso Crema",

        packaging: "Caja Premium",
        decoration: "Graduación",
        topper: "2026",

        candles: false,

        jam: "",

        frostingType: "Merengue",

        dedication: "Felicidades",

        additionalNotes: "",

        deliveryRequired: true,

        deliveryAddress: "Masaya",

        totalAmount: 1500,

        advancePayment: 750,

        remainingPayment: 750,

        status: "Entregado"
    )
]
