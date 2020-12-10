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
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDelegate()
    }
}

extension AuthorVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let authorCell = collectionView.dequeueReusableCell(withReuseIdentifier: AuthorCell.identifier, for: indexPath) as? AuthorCell else { return UICollectionViewCell() }
        
        authorCell.bind(AuthorCellDTO(profileImage: nil,
                                      nickname: "somsoming",
                                      introduce: "외로운 걸 즐기는 낭만주의자"))
        
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
