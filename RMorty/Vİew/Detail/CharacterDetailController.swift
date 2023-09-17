//
//  CharacterDetailController.swift
//  RMorty
//
//  Created by Bahittin on 17.09.2023.
//

import UIKit

protocol CharacterDetailControllerInterface: AnyObject {
    func configureUI()
    func configureImageView()
    func configureTitleLabel()
}

class CharacterDetailController: UIViewController {
    
    let viewModel = CharacterDetailViewModel()
    
    let characterImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGray
        return iv
    }()
    
    let characterTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "deneme"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension CharacterDetailController: CharacterDetailControllerInterface {
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureImageView()
        configureTitleLabel()
    }
    func configureImageView() {
        view.addSubview(characterImageView)
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterImageView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            characterImageView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            characterImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    func configureTitleLabel() {
        view.addSubview(characterTitleLabel)
        characterTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterTitleLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor),
            characterTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
