//
//  CharacterController.swift
//  RMorty
//
//  Created by Bahittin on 11.09.2023.
//

import UIKit

protocol CharacterControllerInterface: AnyObject {
    func configureUI()
    func configureCollectionView()
    func reloadCollectionView()
    func configureSearchController()
}

final class CharacterController: UIViewController {
    
    private var collectionView: UICollectionView!
    
    private var padding: CGFloat = 16
    
    var viewModel = CharacterViewModel()
    let detailView = CharacterDetailController()
    
    var sText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY >= contentHeight - (2 * height) {
            viewModel.fetchCharacters()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailView.viewModel.characterResult = viewModel.characters[indexPath.row]
        navigationController?.pushViewController(detailView, animated: true)
    }
}

extension CharacterController: UISearchControllerDelegate, UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        sText = searchText
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if sText != "" {
            viewModel.searchCharacters(searchText: sText)
        }
    }
}

extension CharacterController: CharacterControllerInterface {
    
    func configureUI() {
        title = "Characters"
        view.backgroundColor = .systemBackground
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
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func configureSearchController() {
        
        let searchContoller = UISearchController(searchResultsController: nil)
        
        searchContoller.delegate = self
        searchContoller.searchBar.delegate = self
        
        self.navigationItem.searchController = searchContoller
    }
 
}
