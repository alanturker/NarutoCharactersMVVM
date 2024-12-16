//
//  NarutoCharacters.swift
//  NarutoCharacters
//
//  Created by Turker Alan on 13.11.2024.
//

import Foundation


struct Welcome: Decodable {
    let characters: [NarutoCharacters]
}

struct NarutoCharacters: Decodable {
    let id: Int
    let name: String?
}
