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
    let userDefaults = UserDefaults.standard
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureView()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        settingTableView.reloadData()
    }
    
    func configureNavigationBar() {
        self.title = "설정"
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    func configureView() {
        backView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        settingTableView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
    func configureTableView() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.rowHeight = 50
    }
}

// MARK: Table View

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
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
            guard let vc = storyboard?.instantiateViewController(withIdentifier: SelectionViewController.identifier) as? SelectionViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
        } else if row == 2 {
            // MARK: 초기화
            let alert = UIAlertController(title: "정말로 초기화 하겠습니까?", message: "저장한 데이터를 다시 복구할 수 없습니다.", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            let reset = UIAlertAction(title: "초기화", style: .destructive) { [self] action in
                for key in UserDefaults.standard.dictionaryRepresentation().keys {
                    UserDefaults.standard.removeObject(forKey: key.description)
                }
                let sb = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = sb.instantiateViewController(withIdentifier: SelectionViewController.identifier) as? SelectionViewController else { return }
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                present(nav, animated: false)
            }
            
            alert.addAction(cancel)
            alert.addAction(reset)
            
            present(alert, animated: true)
        } else {
            return
        }
    }
}
