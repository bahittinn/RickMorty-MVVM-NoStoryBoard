//
//  CharacterCell.swift
//  RMorty
//
//  Created by Bahittin on 11.09.2023.
//

import UIKit

final class CharacterCell: UICollectionViewCell {
    static let reuseID = "CharacterCell"
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "bell")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Rick Sanchez"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Alive"
        label.textColor = .secondaryLabel
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.text = "Human"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureImageView()
        configureNameLabel()
        configureStatusLabel()
        configureSpeciesLabel()
    }
    
    
    
    private func configureCell() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        addSubview(characterImageView)
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: CGFloat.dWidth / 2)
        ])
    }
    
    func configureNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor,constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureStatusLabel() {
        addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor ,constant: 10),
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureSpeciesLabel() {
        addSubview(speciesLabel)
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor ,constant: 10),
            speciesLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
