//
//  ServiceManager.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://casestudy-definex.herokuapp.com/"

    private init() {}

    /// The request process that will enable us to connect with the service for login processes.
    /// - Parameters:
    ///   - type: We choose the endpoint type for the operation to be done.
    ///   - email: The e-mail we received from the user on the login screen
    ///   - password: The password we received from the user on the login screen
    ///   - completion: The function we will call when the function is complete
    func loginRequest(with type: RequestType, email: String, password: String, completion: @escaping (Result<[String: Any], CustomError>) -> Void) {
        let parameters = ["email": email, "password": password]

        guard let url = URL(string: type.endPoint) else {
            completion(.failure(.urlError))
            return
        }

        let session = URLSession.shared

        var request = URLRequest(url: url)
        request.httpMethod = type.httpMethod.rawValue // set http method as POST

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: ["email": email, "password": password], options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            completion(.failure(.dataError))
        }

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = session.dataTask(with: request, completionHandler: { data, _, error in

            guard error == nil else {
                completion(.failure(.decodingError))
                return
            }

            guard let data = data else {
                completion(.failure(.noDataError))
                return
            }

            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(.failure(.invalidTypeJsonError))
                    return
                }
                completion(.success(json))
            } catch let error {
                print(error.localizedDescription)
                completion(.failure(.responseError))
            }
        })

        task.resume()
    }

    /// The function we use to call our products on the homepage from the service
    /// - Parameters:
    ///   - type: We choose an endpoint according to our product type on the homepage.
    ///   - completion: The function we will call when the function is complete
    func fetchProducts<T: Decodable>(with type: RequestType, completion: @escaping (Result<T, CustomError>) -> Void) {
        guard let url = URL(string: type.endPoint) else {
            completion(.failure(.urlError))
            return
        }
        Logger.log(text: type.endPoint)

        var request = URLRequest(url: url)
        request.httpMethod = type.httpMethod.rawValue

        let session = URLSession.shared
        session.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            data.printAsJSON()

            let decoder = JSONDecoder()

            do {
                let decodedResponse = try decoder.decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch let error {
                completion(.failure(.decodingError))
                Logger.log(type: .error, text: error.localizedDescription)
            }
        }.resume()
    }
}
