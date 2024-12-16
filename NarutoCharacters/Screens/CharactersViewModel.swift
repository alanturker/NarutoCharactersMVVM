//
//  CharactersViewModel.swift
//  NarutoCharacters
//
//  Created by Turker Alan on 13.11.2024.
//

import Foundation
protocol CharactersViewModelProtocol: AnyObject {
    var characters: [NarutoCharacters] { get set }    
    func getCharacters()
    var delegate: CharactersDelegate? { get set }
}
protocol CharactersDelegate: AnyObject {
    func notify(_ output: CharacterViewModelOutput)
}
enum CharacterViewModelOutput {
    case success
    case fail
}

class CharactersViewModel: CharactersViewModelProtocol {
    var characters: [NarutoCharacters] = []
    private let webService = NarutoWebService()
    
    weak var delegate: CharactersDelegate?
    
    func getCharacters() {
        webService.getCharacters { characters, error in
            guard error == nil else {
                return
            }
            if let characters {
                self.characters = characters
                self.delegate?.notify(.success)
            }
        }
    }
}
