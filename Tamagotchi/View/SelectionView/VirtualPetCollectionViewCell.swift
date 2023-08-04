//
//  VirtualPetCollectionViewCell.swift
//  Tamagotchi
//
//  Created by Taekwon Lee on 2023/08/04.
//

import UIKit

class VirtualPetCollectionViewCell: UICollectionViewCell {

    static let identifier = "VirtualPetCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    func configureCell(row: VirtualPet) {
        profileImageView.image = UIImage(named: row.profileImage)
        nameLabel.text = row.name
    }
    
}
