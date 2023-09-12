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
}

struct CharacterViewModel {
    weak var view: CharacterControllerInterface?
}

extension CharacterViewModel: CharacterViewModelInterface {
    func viewDidLoad() {
        print("viewdidload")
    }
}
