//
//  PokemonController.swift
//  Pokedex
//
//  Created by Taylor Lyles on 9/6/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import Foundation

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
	
	private let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon")!
	
}
