//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by Taekwon Lee on 2023/08/05.
//

import UIKit

class MainViewController: UIViewController {

    static let identifier = "MainViewController"

    var petNumber = 0
    let userDefaults = UserDefaults.standard

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

    let randomMessage = ["대장님 오늘 과제 하셨어요?", "깃허브 푸시 하셨어요?", "배고파요 :(", "목말라요 ㅠㅠ", "밥 주세요 :)", "기분이 좋은 하루에요 XD"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "대장님의 다마고치"

        guard let virtualPet else { return }

        let settingImage = UIImage(systemName: "person.circle")

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: settingImage, style: .plain, target: self, action: #selector(settingButtonClicked))

        configureView(virtualPet: virtualPet)
    }

    @IBAction func riceGrainTapped(_ sender: UIButton) {
        guard let riceGrainText = riceGrainTextField.text else { return }
        
        let currentValue = userDefaults.integer(forKey: "\(petNumber) riceGrainCount")
        var resultNum = 0

        if riceGrainTextField.text! == "" {
            resultNum = currentValue + 1
        } else {
            guard let riceGrainCount = Int(riceGrainText) else { return }
            
            if riceGrainCount >= 100 {
                messageLabel.text = "밥이 너무 많아요 ㅠㅠ"
                return
            } else {
                resultNum = currentValue + (Int(riceGrainText) ?? 0)
                riceGrainTextField.text = ""
            }
        }

        userDefaults.set(resultNum, forKey: "\(petNumber) riceGrainCount")
        updateView()
    }

    @IBAction func waterDropTapped(_ sender: UIButton) {
        guard let waterDropText = waterDropTextField.text else { return }

        let currentValue = userDefaults.integer(forKey: "\(petNumber) waterDropCount")
        var resultNum = 0

        if waterDropTextField.text! == "" {
            resultNum = currentValue + 1
        } else {
            guard let waterDropCount = Int(waterDropText) else { return }
            
            if waterDropCount >= 50 {
                messageLabel.text = "물이 너무 많아요 ㅠㅠ"
                return
            } else {
                resultNum = currentValue + (Int(waterDropText) ?? 0)
                waterDropTextField.text = ""
            }
        }
    
        userDefaults.set(resultNum, forKey: "\(petNumber) waterDropCount")
        updateView()
    }

    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @objc func settingButtonClicked(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: SettingViewController.identifier) as? SettingViewController else { return }

        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: updateView

extension MainViewController {
    func updateView() {
        levelCheck()
        virtualPetImageView.image = UIImage(named: "\(petNumber)-\(userDefaults.integer(forKey: "\(petNumber) image"))")
        statLabel.text = "Lv.\(userDefaults.integer(forKey: "\(petNumber) level")) | 밥알 \(userDefaults.integer(forKey: "\(petNumber) riceGrainCount"))개 | 물방울 \(userDefaults.integer(forKey: "\(petNumber) waterDropCount"))개"
        messageLabel.text = randomMessage.randomElement() ?? "안녕하세요"
    }

    func levelCheck() {
        let riceGrainPoint = Double(userDefaults.integer(forKey: "\(petNumber) riceGrainCount")) / 5
        let waterDropPoint = Double(userDefaults.integer(forKey: "\(petNumber) waterDropCount")) / 2
        let totalPoint = riceGrainPoint + waterDropPoint

        switch totalPoint {
        case 0..<10:
            userDefaults.set(1, forKey: "\(petNumber) level")
            userDefaults.set(1, forKey: "\(petNumber) image")
        case 10..<20:
            userDefaults.set(1, forKey: "\(petNumber) level")
            userDefaults.set(1, forKey: "\(petNumber) image")
        case 20..<30:
            userDefaults.set(2, forKey: "\(petNumber) level")
            userDefaults.set(2, forKey: "\(petNumber) image")
        case 30..<40:
            userDefaults.set(3, forKey: "\(petNumber) level")
            userDefaults.set(3, forKey: "\(petNumber) image")
        case 40..<50:
            userDefaults.set(4, forKey: "\(petNumber) level")
            userDefaults.set(4, forKey: "\(petNumber) image")
        case 50..<60:
            userDefaults.set(5, forKey: "\(petNumber) level")
            userDefaults.set(5, forKey: "\(petNumber) image")
        case 60..<70:
            userDefaults.set(6, forKey: "\(petNumber) level")
            userDefaults.set(6, forKey: "\(petNumber) image")
        case 70..<80:
            userDefaults.set(7, forKey: "\(petNumber) level")
            userDefaults.set(7, forKey: "\(petNumber) image")
        case 80..<90:
            userDefaults.set(8, forKey: "\(petNumber) level")
            userDefaults.set(8, forKey: "\(petNumber) image")
        case 90...100:
            userDefaults.set(9, forKey: "\(petNumber) level")
            userDefaults.set(9, forKey: "\(petNumber) image")
        case 100...:
            userDefaults.set(10, forKey: "\(petNumber) level")
            userDefaults.set(9, forKey: "\(petNumber) image")
        default:
            break
        }
    }
}

// MARK: configureView

extension MainViewController {
    func configureView(virtualPet: VirtualPet) {
        messageLabel.text = randomMessage.randomElement() ?? "안녕하세요"
        messageBubbleImageView.image = UIImage(named: "bubble")
        virtualPetImageView.image = UIImage(named: virtualPet.presentImage)
        nameLabel.text = virtualPet.name
        statLabel.text = "Lv.\(userDefaults.integer(forKey: "\(petNumber) level")) | 밥알 \(userDefaults.integer(forKey: "\(petNumber) riceGrainCount"))개 | 물방울 \(userDefaults.integer(forKey: "\(petNumber) waterDropCount"))개"
        riceGrainTextField.placeholder = "밥 줘"
        waterDropTextField.placeholder = "물 줘"

        backView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)

        messageBackView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)

        messageLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        messageLabel.numberOfLines = 0

        nameLabelBackView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        nameLabelBackView.layer.borderColor = CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        nameLabelBackView.layer.borderWidth = 0.5
        nameLabelBackView.layer.cornerRadius = 5

        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        nameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)

        statLabel.font = UIFont.boldSystemFont(ofSize: 13)
        statLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)

        riceGrainTextField.textAlignment = .center
        riceGrainTextField.keyboardType = .numberPad
        riceGrainTextField.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)

        waterDropTextField.textAlignment = .center
        waterDropTextField.keyboardType = .numberPad
        waterDropTextField.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)

        riceGrainButton.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        waterDropButton.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
}
