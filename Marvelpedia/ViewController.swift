//
//  ViewController.swift
//  Marvelpedia
//
//  Created by Renan Diniz on 24/02/20.
//  Copyright © 2020 RMD Goup. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet private var tableViewCharacters: UITableView!
    
    private var characters: [Character] = []
    private let placeHolderImage = UIImage(named: "Marvel-PlaceHolder")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MarvelService.getCharacters { characters in
            
            guard let characters = characters else {
                return
            }
            self.characters = characters
            self.tableViewCharacters.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let character = self.characters[indexPath.row]
        
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell") else {
            return UITableViewCell()
        }
        
        let fullPath = (character.thumbnail?.path ?? "") + "/portrait_xlarge." + (character.thumbnail?.imageExtension ?? "")
        
        cell.textLabel?.text = character.name
        cell.detailTextLabel?.text = character.description
        
        if let imageUrl = URL(string: fullPath) {
            cell.imageView?.sd_setImage(with: imageUrl, placeholderImage: self.placeHolderImage)
        } else {
            cell.imageView?.image = nil
        }
        return cell
    }
    
    
}
