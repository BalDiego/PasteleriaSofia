//
//  PasteleriaSofiaApp.swift
//  PasteleriaSofia
//
//  Created by Diego Baltodano on 9/6/26.
//

import SwiftUI

@main
struct PasteleriaSofiaApp: App {

    @StateObject private var orderStore = OrderStore()

    var body: some Scene {

        WindowGroup {

            LoginView()
                .environmentObject(orderStore)
        }
    }
}
