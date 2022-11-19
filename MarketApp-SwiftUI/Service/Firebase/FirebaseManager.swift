//
//  FirebaseManager.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import Foundation

import FirebaseAnalytics
import FirebaseRemoteConfig
import Foundation

class FirebaseManager {
    static let shared = FirebaseManager()

    private let remoteConfig = RemoteConfig.remoteConfig()
    private var titleText = ""

    private init() {
    }

    public func fetchRCValues(remoteConfigForKey: String, completed: @escaping (Result<String, Error>) -> Void) {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings

        remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success, error == nil {
                self.remoteConfig.activate { _, error in
                    guard error == nil else {
                        return
                    }

                    self.titleText = self.remoteConfig.configValue(forKey: remoteConfigForKey).stringValue ?? ""

                    completed(.success(self.titleText))
                }
            } else {
                completed(.failure(error!))
            }
        }
    }

    public func logProductDetail(title: String, discount: String) {
        Analytics.logEvent("\(title.replacingOccurrences(of: " ", with: "_"))", parameters: ["discount": discount])
    }
}
