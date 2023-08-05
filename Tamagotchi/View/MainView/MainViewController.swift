//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by Taekwon Lee on 2023/08/05.
//

import UIKit

class MainViewController: UIViewController {
    
    static let identifier = "MainViewController"
    
    @IBOutlet var backView: UIView!
    
    @IBOutlet weak var messageBackView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageBubbleImageView: UIImageView!
    
    @IBOutlet weak var virtualPetImageView: UIImageView!
    
    @IBOutlet weak var nameLabelBackView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statLabel: UILabel!
    
    @IBOutlet weak var riceGrainTextField: UITextField!
    @IBOutlet weak var waterDropTextField: UITextField!
    
    @IBOutlet weak var riceGrainButton: UIButton!
    @IBOutlet weak var waterDropButton: UIButton!
    
    var virtualPet: VirtualPet?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let virtualPet else { return }
        
        title = "대장님의 다마고치"
        
        configureView(virtualPet: virtualPet)
    }
    
    func configureView(virtualPet: VirtualPet) {
        messageBubbleImageView.image = UIImage(named: "bubble")
        virtualPetImageView.image = UIImage(named: virtualPet.presentImage)
        nameLabel.text = virtualPet.name
        statLabel.text = "Lv.\(String(virtualPet.level)) | 밥알 \(String(virtualPet.riceGrain))개 | 물방울 \(String(virtualPet.waterDrop))개"
        riceGrainTextField.placeholder = "밥 줘"
        waterDropTextField.placeholder = "물 줘"
        
        backView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        messageBackView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        messageLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        nameLabelBackView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        nameLabelBackView.layer.borderColor = CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        nameLabelBackView.layer.borderWidth = 0.5
        nameLabelBackView.layer.cornerRadius = 5
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        nameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        statLabel.font = UIFont.boldSystemFont(ofSize: 13)
        statLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        riceGrainTextField.textAlignment = .center
        riceGrainTextField.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        waterDropTextField.textAlignment = .center
        waterDropTextField.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        riceGrainButton.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        waterDropButton.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
}
