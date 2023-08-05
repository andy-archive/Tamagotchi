//
//  DetailPopupViewController.swift
//  Tamagotchi
//
//  Created by Taekwon Lee on 2023/08/04.
//

import UIKit

class DetailPopupViewController: UIViewController {
    
    static let identifier = "DetailPopupViewController"
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var popupBackView: UIView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabelBackView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var introductionLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var beginButton: UIButton!
    
    var virtualPet: VirtualPet?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let virtualPet else { return }
        
        configureDetailPopupView(virtualPet: virtualPet)
    }
    
    func configureDetailPopupView(virtualPet: VirtualPet) {
        nameLabel.text = virtualPet.name
        introductionLabel.text = virtualPet.introduction
        profileImageView.image = UIImage(named: virtualPet.profileImage)

        backView.backgroundColor = UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.4)
        
        popupBackView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        nameLabelBackView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        nameLabelBackView.layer.borderColor = CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        nameLabelBackView.layer.borderWidth = 0.5
        nameLabelBackView.layer.cornerRadius = 5
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 13)
        nameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        introductionLabel.font = UIFont.systemFont(ofSize: 13)
        introductionLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        introductionLabel.numberOfLines = 0
        introductionLabel.textAlignment = .center
        
        cancelButton.titleLabel?.text = "취소"
        cancelButton.titleLabel?.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        cancelButton.layer.borderWidth = 0.5
        cancelButton.layer.borderColor = CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        beginButton.titleLabel?.text = "시작하기"
        beginButton.titleLabel?.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        beginButton.layer.borderWidth = 0.5
        beginButton.layer.borderColor = CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
