//
//  ContentDetailVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/14.
//

import UIKit

struct CommentsDTO {
    let nickname: String
    let content: String
    let image: UIImage?
}

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
    
    // MARK: - Data
    var postTitle: String?
    var content: String?
    var like: Int?
    var comment: Int?
    
    var commentsDTOs: [CommentsDTO] = [
        CommentsDTO(nickname: "somsoming", content: "돈만을 위한 삶이 아니라 나에게 휴식과 안정을 가져다주는 길이 나만의 행복이 아닐까요?", image: UIImage(named: "image1")),
        CommentsDTO(nickname: "junyup", content: "이렇게 살아보는 것도 좋은거고 그렇게 사는 것도 좋은 것 같아요.", image: UIImage(named: "image3")),
        CommentsDTO(nickname: "immmah", content: "본인이 느끼는대로 하는 것이 가장 좋을 것 같아요", image: UIImage(named: "image7")),
        CommentsDTO(nickname: "yeon_blue", content: "이런 방식도 맞고 저런 방식도 맞는데 가장 중요한 것은 어떻게 생각하냐인 것 같아요.", image: UIImage(named: "image4")),
        CommentsDTO(nickname: "ttub_nni", content: "항상 힘냈으면 좋겠어요!", image: UIImage(named: "image5")),
        CommentsDTO(nickname: "dongmin_eee", content: "한번씩 밖으로 나가서 산책도 가보아요..!!", image: UIImage(named: "image6")),
        CommentsDTO(nickname: "hyun_eee", content: "많이 힘들어도 다시 한 번 생각해보세요", image: UIImage(named: "image9")),
    ]
    
    // MARK: - Init
    private func setDelegate() {
        commentCollectionView.dataSource = self
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        commentsDTOs.shuffle()
        commentView.clipsToBounds = true
        
        
        titleLabel.text = postTitle
        nicknameLabel.text = "by 비공개"
        contentLabel.text = content
        likeLabel.text = "\(like!)"
        comentLabel.text = "\(comment!)"
        setDelegate()
//        titleLabel.text = "돈이 가장 중요할까요?"
//        nicknameLabel.text = "by 비공개"
//        contentLabel.text = "이 중에 부자가 되기 위해\n다른 걸 포기하는 길을 선택한 분이 계신가요?\n그렇다면 왜 부자가 되기를 선택했나요?"
//        likeLabel.text = "10"
//        comentLabel.text = "12"
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
        return comment!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let comentCell = collectionView.dequeueReusableCell(withReuseIdentifier: ComentCell.identifier, for: indexPath) as? ComentCell else { return UICollectionViewCell() }
        
        let curCTO = commentsDTOs[indexPath.row]
        
        let timestamp = "14:" + "\((1...59).randomElement()!)"
        
        comentCell.bind(CommentDTO(nickname: curCTO.nickname,
                                   content: curCTO.content,
                                   timestamp: timestamp,
                                   likeCount: (1...11).randomElement()!))
        if indexPath.row % 2 == 0 {
            comentCell.imageView.isHidden = false
            comentCell.imageView.image = commentsDTOs[indexPath.row].image
        } else {
            comentCell.imageView.isHidden = true
            comentCell.imageView.image = nil
        }
        
        return comentCell
    }
}
