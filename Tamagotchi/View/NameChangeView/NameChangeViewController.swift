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
        
        configureView()
        configureNavigationBar()
    }

    
    func configureView() {
        backView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        ownerNameTextField.text = UserDefaults.standard.string(forKey: "ownerName") ?? "대장님"
        ownerNameTextField.placeholder = "대장님 이름을 알려주세요!"
        ownerNameTextField.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
    func configureNavigationBar() {
        title = "대장님 이름 정하기"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(changeButtonClicked))
        
    }
    
    @objc func changeButtonClicked(_ sender: UIButton) {
        // UserDefaults Owner 이름 변경
        if !ownerNameTextField.hasText {
            let alert = UIAlertController(title: "변경할 이름을 입력하세요", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
        } else {
            UserDefaults.standard.set(ownerNameTextField.text!, forKey: "ownerName")
            navigationController?.popViewController(animated: true)
        }
    }
    
}
