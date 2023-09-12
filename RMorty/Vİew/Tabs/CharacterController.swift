//
//  CharacterController.swift
//  RMorty
//
//  Created by Bahittin on 11.09.2023.
//

import UIKit

protocol CharacterControllerInterface: AnyObject {
    func configureCollectionView()
    func reloadCollectionView()
}

final class CharacterController: UIViewController {
    
    private var collectionView: UICollectionView!
    
    private var padding: CGFloat = 16
    
    var viewModel = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        configureCollectionView()
        
        viewModel.view = self
        viewModel.viewDidLoad()
        
        NetworkManager.shared.download(url:  URL(string: "https://rickandmortyapi.com/api/character")!) { response in
            print(response)
        }
    }
    
    
}

extension CharacterController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as! CharacterCell
        cell.setCell(character: viewModel.characters[indexPath.row])
        return cell
    }
}

extension CharacterController: CharacterControllerInterface {
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseID)
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.pintoEdgeCustom(view: view)
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
