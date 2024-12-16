//
//  CharactersCollectionViewCell.swift
//  NarutoCharacters
//
//  Created by Turker Alan on 13.11.2024.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "CharactersCollectionViewCell"
    
    let nameLabel = UILabel()
    let posterImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = true
        
        nameLabel.frame = contentView.frame
        nameLabel.center = contentView.center
        nameLabel.textColor = .black
    }
    
    func updateCell(model: NarutoCharacters) {
        nameLabel.text = model.name
    }
}
