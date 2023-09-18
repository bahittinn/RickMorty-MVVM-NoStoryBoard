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
    func setVariables()
}

class CharacterDetailController: UIViewController {
    
    let viewModel = CharacterDetailViewModel()
    
    let tableView: UITableView = UITableView()
    
    let characterImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGray
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        return iv
    }()
    
    let characterTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let speciesLabel: UILabel = {
        let label = UILabel()
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
        configureStatusLabel()
        configureSpeciesLabel()
        setVariables()
        configureTableView()
        navigationItem.largeTitleDisplayMode = .never

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
            characterTitleLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor,constant: 10),
            characterTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureStatusLabel() {
        view.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: characterTitleLabel.bottomAnchor,constant: 10),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureSpeciesLabel() {
        view.addSubview(speciesLabel)
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 10),
            speciesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setVariables() {
        guard let url = URL(string: viewModel.characterResult.image!) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _ , error in
            if error != nil {
                print("DEBUG: error is \(error?.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                self.characterImageView.image = UIImage(data: data!)
                self.characterTitleLabel.text = self.viewModel.characterResult.name
                self.statusLabel.text = self.viewModel.characterResult.status
                self.speciesLabel.text = self.viewModel.characterResult.species
            }
        }.resume()
    }
}

extension CharacterDetailController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "deneme"
        return cell
    }
}
