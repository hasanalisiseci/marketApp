//
//  MarketApp_SwiftUIApp.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 18.11.2022.
//

import SwiftUI

@main
struct MarketApp_SwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            if NetworkMonitor.shared.isConnected {
                NavigationView {
                    TabbarView(letters: "DX")
                    //LoginView()
                }
            } else {
                CheckNetworkScene()
            }
        }
    }
}
