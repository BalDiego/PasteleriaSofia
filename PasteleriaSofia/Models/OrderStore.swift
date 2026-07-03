//
//  OrderStore.swift
//  PasteleriaSofia
//
//  Created by Diego Baltodano on 16/6/26.
//

import Foundation
import SwiftUI
import Combine

class OrderStore: ObservableObject {

    @Published var orders: [Order] = sampleOrders

    func deleteOrder(_ order: Order) {
        orders.removeAll { $0.id == order.id }
    }

    func markAsDelivered(_ order: Order) {

        if let index = orders.firstIndex(where: {
            $0.id == order.id
        }) {

            orders[index].status = "Entregado"
        }
    }
}
