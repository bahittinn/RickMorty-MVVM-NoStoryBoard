//
//  CharacterViewModel.swift
//  RMorty
//
//  Created by Bahittin on 12.09.2023.
//

import Foundation

protocol CharacterViewModelInterface {
    var view: CharacterControllerInterface? { get set}
    func viewDidLoad()
    func fetchCharacters()
}

final class CharacterViewModel {
    
    var page: Int = 1
    
    weak var view: CharacterControllerInterface?

    var characters: [CharacterResult] = []
    private let service = CharacterService()
    
}

extension CharacterViewModel: CharacterViewModelInterface {
    func viewDidLoad() {
        view?.configureUI()
        view?.configureCollectionView()
        view?.configureSearchController()
        fetchCharacters()
    }
    
    func fetchCharacters() {
        service.downloadCharacters(page: page) { [weak self] returnedCharacters in
            guard let self = self else { return }
            guard let returnedCharacters = returnedCharacters else { return}
            
            self.characters.append(contentsOf: returnedCharacters)
            
            self.view?.reloadCollectionView()
            self.page += 1
        }
    }
    
    func searchCharacters(searchText: String) {

        service.downloadCharacters(searchText: searchText) { [weak self] returnedCharacters in
            guard let self = self else { return }
            guard let returnedCharacters = returnedCharacters else { return}
            
            self.characters = []
            self.characters.append(contentsOf: returnedCharacters)
            
            self.view?.reloadCollectionView()
            //self.page += 1
        }
    }
}
