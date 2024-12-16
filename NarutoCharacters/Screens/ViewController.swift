//
//  ViewController.swift
//  NarutoCharacters
//
//  Created by Turker Alan on 13.11.2024.
//

import UIKit

class ViewController: UIViewController {
    private let collectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    private var collectionViewDataSource: CharactersCollectionViewSource?
    
    private var viewModel: CharactersViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CharactersViewModel()
        viewModel?.delegate = self
        viewModel?.getCharacters()
        collectionViewDataSource = CharactersCollectionViewSource(viewModel: viewModel)
        configureCollectionView()
    }

    private func configureCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        collectionView.center = self.view.center
        
        collectionView.backgroundColor = .green
        collectionView.delegate = collectionViewDataSource
        collectionView.dataSource = collectionViewDataSource
        
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.reuseIdentifier)
    }

    
    
}
//MARK: - ViewModel Delegate Methods
extension ViewController: CharactersDelegate {
    func notify(_ output: CharacterViewModelOutput) {
        switch output {
        case .success:
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        case .fail:
            print("show alert error")
            //show alert
        }
    }
}
