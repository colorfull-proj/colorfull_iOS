//
//  LikeVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/10.
//

import UIKit

class LikeVC: UIViewController {
    static let identifier = "LikeVC"

    // MARK: - UI
    @IBOutlet weak var likeCollectionView: UICollectionView! {
        didSet {
            if let layout = likeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let width = (UIScreen.main.bounds.width - 15*2 - 20)/2
                let height = width * 1.58
                layout.itemSize = CGSize(width: width, height: height)
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 20
                layout.sectionInset = UIEdgeInsets(top: 16, left: 15, bottom: 16, right: 15)
            }
        }
    }
    
    // MARK: - Init
    private func setDelegate() {
        likeCollectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDelegate()
    }
}

extension LikeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let likeCell = collectionView.dequeueReusableCell(withReuseIdentifier: LikeCell.identifier,
                                                                for: indexPath) as? LikeCell
        else { return UICollectionViewCell() }
        
        likeCell.bind(LikeCellDTO(profileImage: nil,
                                  nickname: "돈이 가장 중요할까요?",
                                  introduce: "somsoming"))
        
        likeCell.contentView.layer.cornerRadius = (self.view.bounds.width-15*2-20)/2/20
        
        return likeCell
    }
}

extension LikeVC: CategoryVCAble {
    var _view: UIView {
        return self.view
    }
    
    func calContentHeight() -> CGFloat {
        return 10
    }
}
