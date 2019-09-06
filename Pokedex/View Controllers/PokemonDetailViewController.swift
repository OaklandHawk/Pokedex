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
		guard let text = searchBar.text?.lowercased() else { return }
		guard let pokeController = pokemonController else { return }
		
		pokeController.searchForPokemon(for: text) { (result) in
			do {
				let thisPokemon = try result.get()
				DispatchQueue.main.async {
					self.updateView(with: thisPokemon)
				}
				pokeController.getImage(at: thisPokemon.sprites.frontDefault, completion: { (result) in
					do {
						let image = try result.get()
						DispatchQueue.main.async {
							self.pokemonImageView.image = image
						}
					} catch {
						NSLog("Could not load")
					}
				})
				self.pokemon = thisPokemon
			} catch {
				NSLog("Error")
			}
		}
	}

	func updateView(with searchedPokemon: Pokemon) {
		nameLabel.text = searchedPokemon.name
		pokemonIdLabel.text = String(searchedPokemon.id)
		pokemonTypeLabel.text = searchedPokemon.types[0]
		pokemonAbilitiesLabel.text = searchedPokemon.abilities[0]
		
	}
    
	@IBAction func savePokemonButton(_ sender: Any) {
	}
	
}

extension PokemonDetailViewController: UISearchBarDelegate {
	
}
