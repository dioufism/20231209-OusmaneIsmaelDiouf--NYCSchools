//
//  NetworkingManager.swift
//  20231209-OusmaneIsmaelDiouf- NYCSchools
//
//  Created by ousmane diouf on 9/12/23.
//

import Foundation
/*
 key d8w1doo4qgvjexqlw654uc7ht
 key secret 1l1qbw2u9s4z18nrkro2hu2wv4wiq9grmgez7dwem9th0qz5gu 
 */
final class NetworkingManager {
    
    static let shared =  NetworkingManager()
    
    private init() {}
    
    func request<T: Codable>(_ absoluteUrl: String, type: T.Type, completion: @escaping (Result<T,Error>) -> Void) {
        
        guard let safeUrl = URL(string: absoluteUrl) else {
            completion(.failure(NetworkingError.invalidUrl))
            return
        }
        
        var request = URLRequest(url: safeUrl)
//        request.httpMethod = "GET"
//        request.addValue("1l1qbw2u9s4z18nrkro2hu2wv4wiq9grmgez7dwem9th0qz5gu", forHTTPHeaderField: "X-App-Token")
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkingError.customError(error: error)))
                return
            }
            
            guard let response =  response as?  HTTPURLResponse,
                  (200...300) ~= response.statusCode else {
                completion(.failure(NetworkingError.invalidStatusCode))
                return
            }
            
            guard let data =  data else {
                completion(.failure(NetworkingError.invalidData))
                return }
            
            do {
                let decoder =  JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(NetworkingError.failedToDecode(error: error)))
            }
        }
        
        dataTask.resume()
    }
}

extension NetworkingManager {
    enum NetworkingError: Error {
        case invalidUrl
        case invalidStatusCode
        case invalidData
        case failedToDecode(error: Error)
        case customError(error: Error)
        
        var errorDescription: String {
            switch self {
            case .invalidUrl:
                return "Invalid Url"
            case .failedToDecode:
                return "failed to decode object"
            case .invalidStatusCode:
                return "Invalid status code"
            case .failedToDecode(let error):
                return error.localizedDescription
            case .customError(let error):
                return error.localizedDescription
            case .invalidData:
                return "Invalid Data"
            }
        }
    }
}
