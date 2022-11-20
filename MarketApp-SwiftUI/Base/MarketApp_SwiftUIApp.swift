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
    @State var splahTitle = ""
    @State var sceneStatus: AppBaseSelection = .splash

    var body: some Scene {
        WindowGroup {
            if NetworkMonitor.shared.isConnected {
                NavigationView {
                    switch sceneStatus {
                    case .splash:
                        SplashScene(title: splahTitle)
                    case .login:
                        LoginView()
                    }
                }.onAppear {
                    fetchSplashTitle()
                }
            } else {
                CheckNetworkScene()
            }
        }
    }

    func fetchSplashTitle() {
        FirebaseManager.shared.fetchRCValues(remoteConfigForKey: "splashTitle") { result in
            switch result {
            case let .success(success):
                splahTitle = success
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    sceneStatus = .login
                }
            case let .failure(failure):
                fatalError(failure.localizedDescription)
            }
        }
    }
}

enum AppBaseSelection {
    case splash
    case login
}
