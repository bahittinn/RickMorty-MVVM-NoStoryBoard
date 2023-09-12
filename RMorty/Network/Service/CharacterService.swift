//
//  CharacterService.swift
//  RMorty
//
//  Created by Bahittin on 12.09.2023.
//

import Foundation

final class CharacterService {
    
    
    func downloadCharacters(page: Int,completion: @escaping ([CharacterResult]?) -> ()) {
        NetworkManager.shared.download(url: APIURL) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
                break
            }
        }
    }
    
    func handleWithData(_ data: Data) -> [CharacterResult]? {
        do {
            let character = try JSONDecoder().decode(Character.self, from: data)
            return character.results
            
        } catch {
            print("DEBUG: error \(error.localizedDescription)")
            return nil
        }
    }
    
    func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
}
