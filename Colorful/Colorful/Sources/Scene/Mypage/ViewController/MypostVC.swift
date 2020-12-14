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
            let tabHeight = tabBarController!.tabBar.frame.height
            postCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabHeight, right: 0)
            if let layout = postCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.sectionInset = UIEdgeInsets(top: 16, left: 15, bottom: 16, right: 15)
                layout.minimumLineSpacing = 10
                layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 70)
                layout.scrollDirection = .vertical
            }
        }
    }
    
    // MARK: - Data
    private var postDatas: [PostCellDTO] = [
        PostCellDTO(title: "저는 요즘 고민이 많아요... 취업 걱정 부터 여러가지로 잠이 잘 오질 않아요 저의 이런 복잡한 마음을 누가 이해해줄 수 있을까요?", likeCount: 10, commentCount: 2),
        PostCellDTO(title: "어제는 여자친구랑 싸웠어요... 제 생각에는 열심히 이해해주려 했는데 잘안됐나봐요", likeCount: 2, commentCount: 3),
        PostCellDTO(title: "요즘 잠이 잘 오질 않아요.. 왜 그럴까요? 코로나로 우울한 것 같기도하고 잘 모르겠어요..", likeCount: 4, commentCount: 1)
    ]
    
    // MARK: - Init
    private func initView() {
    }
    
    private func setDelegate() {
        postCollectionView.dataSource = self
        postCollectionView.delegate = self
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
        setDelegate()
        
        NotificationCenter.default.addObserver(self, selector: #selector(post(_:)), name: .post, object: nil)
    }
    
    @objc
    func post(_ notification: NSNotification) {
        let title = notification.userInfo?["title"] as? String
        let content = notification.userInfo?["content"] as? String
        
        print(title)
        let newData = PostCellDTO(title: content!, likeCount: 0, commentCount: 0)
        postDatas.append(newData)
        postCollectionView.reloadData()
    }
}

extension MypostVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let postCell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.identifier,
                                                                for: indexPath) as? PostCell else { return UICollectionViewCell() }
        
        postCell.bind(postDatas[indexPath.row])
        postCell.widthConstraint.constant = self.view.bounds.width - 15*2
        postCell.contentView.layer.cornerRadius = self.view.bounds.width / 25
        postCell.layoutIfNeeded()
        return postCell
    }
}

extension MypostVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailVC = UIStoryboard(name: "ContentDetail", bundle: nil).instantiateViewController(withIdentifier: ContentDetailVC.identifier)
                as? ContentDetailVC else { return }
        detailVC.content = postDatas[indexPath.row].title
        detailVC.postTitle = "\(postDatas[indexPath.row])"
        detailVC.like = postDatas[indexPath.row].likeCount
        detailVC.comment = postDatas[indexPath.row].commentCount
        
        self.parent?.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension MypostVC: CategoryVCAble {
    var _view: UIView {
        return self.view
    }
    
    func calContentHeight() -> CGFloat {
        return postCollectionView.contentSize.height
    }
}
