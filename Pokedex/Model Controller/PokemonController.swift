//
//  PokemonController.swift
//  Pokedex
//
//  Created by Taylor Lyles on 9/6/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

enum HTTPMethod: String {
	case get = "GET"
	case put = "PUT"
	case post = "POST"
	case delete = "DELETE"
}

enum NetworkError: Error {
	case encodingError
	case responseError
	case otherError
	case noData
	case noDecode
	case signUpError
}

class PokemonController {
	
	var pokemon: [Pokemon] = []
	
	private let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon")!
	
	func searchForPokemon(for pokemon: String, completion: @escaping (Result<Pokemon, NetworkError>) -> Void) {
		let searchURL = baseURL.appendingPathComponent(pokemon)
		
		var request = URLRequest(url: searchURL)
		request.httpMethod = HTTPMethod.get.rawValue
		
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let response = response as? HTTPURLResponse,
				response.statusCode != 200 {
				completion(.failure(.responseError))
				return
			}
			
			if let error = error {
				completion(.failure(.otherError))
				return
			}
			
			guard let data = data else {
				completion(.failure(.noData))
				return
			}
			
			let decoder = JSONDecoder()
			
			do {
				let search = try decoder.decode(Pokemon.self, from: data)
				completion(.success(search))
			} catch {
				NSLog("Decoding error: \(error)")
				completion(.failure(.noDecode))
				return
			}
		}.resume()
	}
	
	func getImage(at urlString: String, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
		let imageURL = URL(string: urlString)!
		
		var request = URLRequest(url: imageURL)
		request.httpMethod = HTTPMethod.get.rawValue
		
		URLSession.shared.dataTask(with: request) { (data, _, error) in
			if let error = error {
				completion(.failure(.otherError))
				return
			}
			
			guard let data = data else {
				completion(.failure(.noData))
				return
			}
			
			let image = UIImage(data: data)!
			completion(.success(image))
		}.resume()
	}
	
	
	
}
