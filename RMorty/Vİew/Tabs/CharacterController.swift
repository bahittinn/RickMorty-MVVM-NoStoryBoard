//
//  CharacterController.swift
//  RMorty
//
//  Created by Bahittin on 11.09.2023.
//

import UIKit

class CharacterController: UIViewController {

    private var collectionView: UICollectionView!
    
    private var padding: CGFloat = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        configureCollectionView()
        
        NetworkManager.shared.download(url:  URL(string: "https://rickandmortyapi.com/api/character")!) { response in
            print(response)
        }
    }
    
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
}

extension CharacterController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as! CharacterCell
        return cell
    }
}
