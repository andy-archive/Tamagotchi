//
//  SelectionViewController.swift
//  Tamagotchi
//
//  Created by Taekwon Lee on 2023/08/04.
//

import UIKit

class SelectionViewController: UIViewController {
    
    static let identifier = "SelectionViewController"
    
    var virtualPetInfo = VirtualPetInfo()
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var virtualPetCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "다마고치 선택하기"
        backView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        configureVirtualPetCollectionView()
        configureVirtualPetCollectionViewLayout()
    }
    
    func configureVirtualPetCollectionView() {
        virtualPetCollectionView.delegate = self
        virtualPetCollectionView.dataSource = self
        
        virtualPetCollectionView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        let nib = UINib(nibName: VirtualPetCollectionViewCell.identifier, bundle: nil)
        
        virtualPetCollectionView.register(nib, forCellWithReuseIdentifier: VirtualPetCollectionViewCell.identifier)
    }
    
    func configureVirtualPetCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - spacing * 4
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = spacing
        virtualPetCollectionView.collectionViewLayout = layout
    }
}

// MARK: SelectionCollectionView

extension SelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        virtualPetInfo.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VirtualPetCollectionViewCell.identifier, for: indexPath) as? VirtualPetCollectionViewCell else { return UICollectionViewCell() }
        let row = virtualPetInfo.list[indexPath.row]
        
        cell.configureCell(row: row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: DetailPopupViewController.identifier) as? DetailPopupViewController else { return }
        
        vc.virtualPet = virtualPetInfo.list[indexPath.row]
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .custom
        
        present(nav, animated: true)
    }
    
    
}
