//
//  MypictureVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/10.
//

import UIKit

class MypictureVC: UIViewController {
    static let identifier = "MypictureVC"
    
    // MARK: - UI
    @IBOutlet weak var pictureCollectionView: UICollectionView! {
        didSet {
            if let layout = pictureCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let width = (UIScreen.main.bounds.width - 15*2 - 20)/2
                let height = width * 1.58
                layout.itemSize = CGSize(width: width, height: height)
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 20
                layout.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
            }
        }
    }
    
    // MARK: - Init
    private func setDelegate() {
        pictureCollectionView.dataSource = self
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDelegate()
    }
}

extension MypictureVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let pictureCell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCell.identifier, for: indexPath) as? PictureCell else { return UICollectionViewCell() }
        
        pictureCell.bind(PictureCellDTO(backImage: nil,
                                        title: "돈이 가장 중요할까요?",
                                        nickname: "somsoming",
                                        like: 10,
                                        comment: 10))
        
        pictureCell.contentView.layer.cornerRadius = (self.view.bounds.width - 20 - 15*2)/2/20
        
        return pictureCell
    }
}

extension MypictureVC: CategoryVCAble {
    var _view: UIView {
        return self.view
    }
    
    func calContentHeight() -> CGFloat {
        return 10
    }
}
