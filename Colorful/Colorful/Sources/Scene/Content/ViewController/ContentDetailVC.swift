//
//  ContentDetailVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/14.
//

import UIKit

class ContentDetailVC: UIViewController {
    static let identifier = "ContentDetailVC"
    
    // MARK: - UI
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var comentLabel: UILabel!
    
    @IBOutlet weak var commentCollectionView: UICollectionView! {
        didSet {
            if let layout = commentCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width-15*2,
                                                  height: 200)
                layout.minimumLineSpacing = 10
                layout.sectionInset = .zero
            }
        }
    }
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var commentView: UIView!
    
    // MARK: - Init
    private func setDelegate() {
        commentCollectionView.dataSource = self
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        commentView.clipsToBounds = true
        setDelegate()
        
        titleLabel.text = "돈이 가장 중요할까요?"
        nicknameLabel.text = "by 비공개"
        contentLabel.text = "이 중에 부자가 되기 위해\n다른 걸 포기하는 길을 선택한 분이 계신가요?\n그렇다면 왜 부자가 되기를 선택했나요?"
        likeLabel.text = "10"
        comentLabel.text = "12"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .black
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionViewHeightConstraint.constant = commentCollectionView.collectionViewLayout.collectionViewContentSize.height
        commentView.layer.cornerRadius = commentView.bounds.width / 25
    }
}

extension ContentDetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let comentCell = collectionView.dequeueReusableCell(withReuseIdentifier: ComentCell.identifier, for: indexPath) as? ComentCell else { return UICollectionViewCell() }
        
        comentCell.bind(CommentDTO(nickname: "somsoming",
                                   content: "돈만을 위한 삶이 아니라 나에게 휴식과 안정을 가져다주는 길이 나만의 행복이 아닐까요?",
                                   timestamp: "14:18",
                                   likeCount: 10))
        
        return comentCell
    }
}
