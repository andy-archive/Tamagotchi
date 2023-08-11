//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by Taekwon Lee on 2023/08/07.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    static let identifier = "SettingTableViewCell"
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var settingTitleLabel: UILabel!
    @IBOutlet weak var placeholderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        settingTitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        settingTitleLabel.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        placeholderLabel.font = UIFont.boldSystemFont(ofSize: 15)
        placeholderLabel.textColor = .systemGray4
    }

    func configureCell(row: Setting) {
        settingImageView.image = UIImage(systemName: row.image)
        settingTitleLabel.text = row.title
    }    
}
