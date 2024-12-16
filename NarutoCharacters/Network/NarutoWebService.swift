//
//  NarutoWebService.swift
//  NarutoCharacters
//
//  Created by Turker Alan on 13.11.2024.
//

import Foundation

protocol NarutoWebServiceProtocol {
    var urlString: String { get }
    typealias NarutoResponse = ([NarutoCharacters]?, Error?) -> Void
    func getCharacters(completion: @escaping NarutoResponse)
        
}

class NarutoWebService: NarutoWebServiceProtocol {
    
    let urlString = "https://dattebayo-api.onrender.com/characters"

    func getCharacters(completion: @escaping NarutoResponse) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                //handle error
                return
            }
            
            if let data,
               let decodedData = try? JSONDecoder().decode(Welcome.self, from: data) {
                completion(decodedData.characters, nil)
            }
        }
        
        dataTask.resume()
    }
}
