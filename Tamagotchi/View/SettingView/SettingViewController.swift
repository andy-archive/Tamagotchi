//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by Taekwon Lee on 2023/08/07.
//

import UIKit

class SettingViewController: UIViewController {
    
    static let identifier = "SettingViewController"
    
    var setting = SettingInfo()
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "설정"
        
        configureView()
        configureTableView()
    }
    
    func configureView() {
        backView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        settingTableView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
}

// MARK: Table View

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTableView() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.rowHeight = 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setting.list.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        let row = setting.list[indexPath.row]
        
        if indexPath.row == 0 {
            cell.placeholderLabel.text = UserDefaults.standard.string(forKey: "ownerName")
        } else {
            cell.placeholderLabel.text = ""
        }
        
        cell.configureCell(row: row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if row == 0 {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: NameChangeViewController.identifier) as? NameChangeViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
        } else if row == 1 {
            
        } else {
            
        }
    }
}
