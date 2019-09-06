//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Taylor Lyles on 9/6/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
	
	var pokemonController: PokemonController?
	var pokemon: Pokemon?

	@IBOutlet weak var pokemonSearchBar: UISearchBar!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var pokemonImageView: UIImageView!
	@IBOutlet weak var pokemonIdLabel: UILabel!
	@IBOutlet weak var pokemonTypeLabel: UILabel!
	@IBOutlet weak var pokemonAbilitiesLabel: UILabel!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	func searchBarButtonClicked(_ searchBar: UISearchBar) {
		
	}
    
	@IBAction func savePokemonButton(_ sender: Any) {
	}
	
}
