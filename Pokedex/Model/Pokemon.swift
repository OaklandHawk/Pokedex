//
//  Pokemon.swift
//  Pokedex
//
//  Created by Taylor Lyles on 9/6/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
	let name: String
	let id: Int
	let abilities: [String]
	let types: [String]
	let sprites: Sprites
}

struct Sprites: Codable {
	let frontDefault: String
	
	enum CodingKeys: String, CodingKey {
		case frontDefault = "front_default"
	}
}
