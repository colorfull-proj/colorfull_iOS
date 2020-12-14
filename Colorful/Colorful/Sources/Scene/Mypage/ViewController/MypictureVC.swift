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
            let tabHeight = tabBarController!.tabBar.frame.height
            pictureCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabHeight + 30, right: 0)
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
    
    // MARK: - Data
    private var pictureDatas: [PictureCellDTO] = [
        PictureCellDTO(backImage: UIImage(named: "image5"), title: "밤이 내려오면..", nickname: "somsoming", like: 4, comment: 2),
        PictureCellDTO(backImage: UIImage(named: "image6"), title: "황혼", nickname: "somsoming", like: 2, comment: 4),
        PictureCellDTO(backImage: UIImage(named: "image7"), title: "푸르른 바다를 봐요", nickname: "somsoming", like: 0, comment: 0),
        PictureCellDTO(backImage: UIImage(named: "image8"), title: "돈이 가장 중요할까요?", nickname: "somsoming", like: 2, comment: 2),
        PictureCellDTO(backImage: UIImage(named: "image9"), title: "여러가지 가치가 있어요..", nickname: "somsoming", like: 1, comment: 0)
    ]
    
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
        return pictureDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let pictureCell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCell.identifier, for: indexPath) as? PictureCell else { return UICollectionViewCell() }
        
        pictureCell.bind(pictureDatas[indexPath.row])
        
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
