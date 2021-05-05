//
//  HTTPClient.swift
//  SentiaCodeChallenge
//
//  Created by Clayton on 5/5/21.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

enum ShiftType: String {
    case start
    case end
}

class HTTPClient {
    
    func getProperties(completion: @escaping (Result<Properties, NetworkError>) -> Void) {
        
        guard let url = URL.getProperties() else{
            return completion(.failure(.badURL))
        }
        
        print (url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        URLSession.shared.dataTask(with: request){ data, response, error in
            
            let str = String(decoding: data!, as: UTF8.self)
            print(str)
            
            guard let data = data, error == nil else{
                return completion(.failure(.noData))
            }
     
            guard let detail = try? decoder.decode(Properties.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            return completion(.success(detail))
            
            
        }.resume()
    }
    
}
