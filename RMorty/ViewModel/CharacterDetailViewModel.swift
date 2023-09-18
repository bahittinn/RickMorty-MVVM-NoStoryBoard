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
    var characterResult: CharacterResult!
    weak var view: CharacterDetailControllerInterface?
    
    
}

extension CharacterDetailViewModel: CharacterDetailViewModelInterface {
    func viewDidLoad() {
        view?.configureUI()
    }
}
