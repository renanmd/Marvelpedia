//
//  FirstViewController.swift
//  Marvelpedia
//
//  Created by Renan Diniz on 24/02/20.
//  Copyright © 2020 RMD Goup. All rights reserved.
//

import UIKit
import SDWebImage
import os.log

var myImageData  = URL(string: "")
var imageUrl = URL(string: "")
class FirstViewController: UIViewController {
    
    @IBOutlet private var tableViewCharacters: UITableView!
    @IBAction func passData(_ sender: Any) {
        myImageData = imageUrl
    }
    
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

extension FirstViewController: UITableViewDelegate {
    
}

extension FirstViewController: UITableViewDataSource {
    
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
        
        if imageUrl == URL(string: fullPath) {
            cell.imageView?.sd_setImage(with: imageUrl, placeholderImage: self.placeHolderImage)
        } else {
            cell.imageView?.image = nil
        }
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//        //Configure the destination view controller only when the characterCell is presses.
//        guard let characterCell = sender as? UITableViewCell, characterCell === characterCell else {
//            os_log("The characterCell was not pressed, cancelling.", log: OSLog.default, type: .debug)
//            return
//        }
//        
//        
//    }
}
