//
//  NameChangeViewController.swift
//  Tamagotchi
//
//  Created by Taekwon Lee on 2023/08/07.
//

import UIKit

class NameChangeViewController: UIViewController {

    static let identifier = "NameChangeViewController"
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var ownerNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "대장님 이름 정하기"
        
        backView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        ownerNameTextField.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }

}
