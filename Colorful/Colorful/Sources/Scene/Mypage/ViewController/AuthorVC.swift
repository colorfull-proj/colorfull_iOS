//
//  AuthorVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/10.
//

import UIKit

class AuthorVC: UIViewController {
    static let identifier = "AuthorVC"
    // MARK: - UI
    @IBOutlet weak var authorCollectionView: UICollectionView! {
        didSet {
            if let layout = authorCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20*2, height: 70)
                layout.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
                layout.minimumLineSpacing = 10
            }
        }
    }
    
    // MARK: - Init
    private func setDelegate() {
        authorCollectionView.dataSource = self
    }
    
    // MARK: - Data
    private var authorDatas: [AuthorCellDTO] = [
        AuthorCellDTO(profileImage: nil, nickname: "hongjunyup", introduce: "저는 새로운 것에 도전하는 것을 좋아해요 🤛"),
        AuthorCellDTO(profileImage: nil, nickname: "dongmin_ee", introduce: "새로운 감성을 찾아 돌아다녀요 🤗"),
        AuthorCellDTO(profileImage: nil, nickname: "yeonblue", introduce: "늘 내일을 걱정하고 오늘을 열심히 살아요 ☺️"),
        AuthorCellDTO(profileImage: nil, nickname: "anwwo", introduce: "타인의 감정에 잘 공감해요~ 🙏")
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDelegate()
    }
}

extension AuthorVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return authorDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let authorCell = collectionView.dequeueReusableCell(withReuseIdentifier: AuthorCell.identifier, for: indexPath) as? AuthorCell else { return UICollectionViewCell() }
        
        authorCell.bind(authorDatas[indexPath.row])
        
        authorCell.contentView.layer.cornerRadius = (self.view.bounds.width - 20*2)/23
        
        return authorCell
    }
}

extension AuthorVC: CategoryVCAble {
    var _view: UIView {
        return self.view
    }
    
    func calContentHeight() -> CGFloat {
        return 10
    }
}
