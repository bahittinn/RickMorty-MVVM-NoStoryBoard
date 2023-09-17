//
//  CharacterDetailController.swift
//  RMorty
//
//  Created by Bahittin on 17.09.2023.
//

import UIKit

protocol CharacterDetailControllerInterface: AnyObject {
    func configureUI()
}

class CharacterDetailController: UIViewController {
    
    let viewModel = CharacterDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension CharacterDetailController: CharacterDetailControllerInterface {
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
}
