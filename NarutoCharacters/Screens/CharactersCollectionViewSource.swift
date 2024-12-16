//
//  CharactersCollectionViewSource.swift
//  NarutoCharacters
//
//  Created by Turker Alan on 13.11.2024.
//

import UIKit

class CharactersCollectionViewSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private let viewModel: CharactersViewModelProtocol?
    
    init(viewModel: CharactersViewModelProtocol?) {
        self.viewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.characters.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  CharactersCollectionViewCell.reuseIdentifier, for: indexPath) as? CharactersCollectionViewCell else { return UICollectionViewCell() }
        
        if let characters = viewModel?.characters {
            cell.updateCell(model: characters[indexPath.row])
        }
        
        return cell
    }
}
