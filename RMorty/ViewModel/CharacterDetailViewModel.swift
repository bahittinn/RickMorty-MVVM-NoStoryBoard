//
//  CharacterDetailViewModel.swift
//  RMorty
//
//  Created by Bahittin on 17.09.2023.
//

import Foundation

protocol CharacterDetailViewModelInterface: AnyObject {
    var view: CharacterDetailControllerInterface? { get set}
    func viewDidLoad()
}

final class CharacterDetailViewModel {
   weak var view: CharacterDetailControllerInterface?
    
    var characters: [CharacterResult] = []
}

extension CharacterDetailViewModel: CharacterDetailViewModelInterface {
    func viewDidLoad() {
        print("DEBUG:")
        view?.configureUI()
    }
}
