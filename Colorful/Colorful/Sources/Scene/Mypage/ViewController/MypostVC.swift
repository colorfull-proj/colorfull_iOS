//
//  MypostVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/10.
//

import UIKit

class MypostVC: UIViewController {
    static let identifier = "MypostVC"
    
    // MARK: - UI
    @IBOutlet weak var postCollectionView: UICollectionView! {
        didSet {
            if let layout = postCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
                layout.minimumLineSpacing = 10
                layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 15*2, height: 70)
                layout.scrollDirection = .vertical
            }
        }
    }
    
    // MARK: - Init
    private func setDelegate() {
        postCollectionView.dataSource = self
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setDelegate()
    }
}

extension MypostVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let postCell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.identifier,
                                                                for: indexPath) as? PostCell else { return UICollectionViewCell() }
        postCell.bind(PostCellDTO(title: "d아아아ㅏ아아아아아아앚마엊마",
                                  likeCount: 10,
                                  commentCount: 6))
        return postCell
    }
}

extension MypostVC: UICollectionViewDelegate {
}

extension MypostVC: CategoryVCAble {
    var _view: UIView {
        return self.view
    }
}
