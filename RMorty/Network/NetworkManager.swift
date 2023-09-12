//
//  Service.swift
//  RMorty
//
//  Created by Bahittin on 11.09.2023.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    func download(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: error is \(error.localizedDescription)")
                completion(.failure(error))
            }
            
            guard let data = data else { return }
            print("DEBUG: data is \(data)")
            completion(.success(data))
            
        }.resume()
    }
}
