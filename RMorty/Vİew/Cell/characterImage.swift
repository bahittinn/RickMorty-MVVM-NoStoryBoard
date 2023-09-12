//
//  characterImage.swift
//  RMorty
//
//  Created by Bahittin on 12.09.2023.
//

import UIKit

final class characterImage: UIImageView {
    
    private var dataTask: URLSessionDataTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(character: CharacterResult) {
        guard let url = URL(string: character.image!) else { return }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        })
        
        dataTask?.resume()
    }
    
}

