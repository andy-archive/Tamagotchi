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
    @IBOutlet weak var nameLabelBackView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabelBackView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        nameLabelBackView.layer.borderColor = CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        nameLabelBackView.layer.borderWidth = 0.5
        nameLabelBackView.layer.cornerRadius = 5
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 13)
        nameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
    
    func configureCell(row: VirtualPet) {
        profileImageView.image = UIImage(named: row.profileImage)
        nameLabel.text = row.name
    }
    
}
