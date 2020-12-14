//
//  ContentVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/11.
//

import UIKit

struct ContentDTO {
    let image: UIImage?
    let title: String
    let nickname: String
    let likeCount: Int
    let commentCount: Int
}

class ContentVC: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - UI
    @IBOutlet var categoryLabels: [UILabel]!
    @IBOutlet var categoryButtons: [UIButton]!
    @IBOutlet var categoryViews: [UIView]!
    @IBOutlet weak var indicatorView: UIView!
    
    @IBOutlet weak var indicatorCenterConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var carouselFlowLayout: CarouselLayout = CarouselLayout()
    
    // MARK: - Data
    var selectedIndex: Int = 0 {
        didSet {
            categoryLabels[selectedIndex].font = UIFont.boldSystemFont(ofSize: 20)
            categoryLabels[selectedIndex].textColor = .white
            indicatorCenterConstraint.isActive = false
            indicatorCenterConstraint = indicatorView.centerXAnchor.constraint(equalTo: categoryViews[selectedIndex].centerXAnchor)
            indicatorCenterConstraint.isActive = true
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                self.indicatorView.transform = CGAffineTransform(scaleX: 1.4, y: 1)
            }, completion: { isCompletion in
                UIView.animate(withDuration: 0.3) {
                    self.indicatorView.transform = .identity
                }
            })
            
            categoryLabels.filter({ $0 !== categoryLabels[selectedIndex] })
                .forEach {
                    $0.font = UIFont.systemFont(ofSize: 20)
                    $0.textColor = UIColor(red: 161/255, green: 161/255, blue: 161/255, alpha: 1.0)

                }
            
            collectionView.contentOffset = .zero
            collectionView.reloadData()
        }
    }
    
    var recentDTOs: [ContentDTO] = [
        ContentDTO(image: UIImage(named: "image1"), title: "하늘을 봐요..", nickname: "somsomming", likeCount: 4, commentCount: 1),
        ContentDTO(image: UIImage(named: "image2"), title: "저 푸르른 들판", nickname: "junyup", likeCount: 4, commentCount: 0),
        ContentDTO(image: UIImage(named: "image3"), title: "다르게 쳐다봐요", nickname: "yeonblue", likeCount: 3, commentCount: 0),
        ContentDTO(image: UIImage(named: "image4"), title: "이게 최선은아니에요", nickname: "dongmin_eee", likeCount: 5, commentCount: 1),
        ContentDTO(image: UIImage(named: "image5"), title: "황혼", nickname: "aa_ww", likeCount: 1, commentCount: 0),
        ContentDTO(image: UIImage(named: "image9"), title: "이런 방법도 있어요", nickname: "hyun_xx", likeCount: 3, commentCount: 1),
        ContentDTO(image: UIImage(named: "image8"), title: "돈이 가장 중요할까요?", nickname: "hye_xx", likeCount: 1, commentCount: 0),
        ContentDTO(image: UIImage(named: "image7"), title: "이것도 좋아요", nickname: "aa_qq", likeCount: 2, commentCount: 0)
    ]
    
    var popularDTOs: [ContentDTO] = [
        ContentDTO(image: UIImage(named: "image4"), title: "이게 최선은아니에요", nickname: "dongmin_eee", likeCount: 5, commentCount: 1),
        ContentDTO(image: UIImage(named: "image3"), title: "다르게 쳐다봐요", nickname: "yeonblue", likeCount: 3, commentCount: 0),
        ContentDTO(image: UIImage(named: "image1"), title: "하늘을 봐요..", nickname: "somsomming", likeCount: 4, commentCount: 1),
        ContentDTO(image: UIImage(named: "image5"), title: "황혼", nickname: "aa_ww", likeCount: 1, commentCount: 0),
        ContentDTO(image: UIImage(named: "image8"), title: "돈이 가장 중요할까요?", nickname: "hye_xx", likeCount: 1, commentCount: 0),
        ContentDTO(image: UIImage(named: "image7"), title: "이것도 좋아요", nickname: "aa_qq", likeCount: 2, commentCount: 0),
        ContentDTO(image: UIImage(named: "image2"), title: "저 푸르른 들판", nickname: "junyup", likeCount: 4, commentCount: 0),
        ContentDTO(image: UIImage(named: "image9"), title: "이런 방법도 있어요", nickname: "hyun_xx", likeCount: 3, commentCount: 1),
    ]
    
    // MARK: - Action
    @IBAction func clickedCategory(_ sender: Any) {
        guard let btn = sender as? UIButton else { return }
        if btn === categoryButtons[0] {
            if selectedIndex == 0 { return }
            selectedIndex = 0
        } else {
            if selectedIndex == 1 { return }
            selectedIndex = 1
        }
    }
    
    // MARK: - Init
    private func initView() {
        selectedIndex = 0
        collectionView.setCollectionViewLayout(carouselFlowLayout, animated: true)
    }
    
    private func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension ContentVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedIndex == 0 {
            return recentDTOs.count
        } else {
            return popularDTOs.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCell.identifier, for: indexPath) as? ContentCell else { return UICollectionViewCell() }
        
        if selectedIndex == 0 {
            contentCell.bind(recentDTOs[indexPath.row])
        } else {
            contentCell.bind(popularDTOs[indexPath.row])
        }
        
        return contentCell
    }
}

extension ContentVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let contentdetailVC = UIStoryboard(name: "ContentDetail", bundle: nil).instantiateViewController(withIdentifier: ContentDetailVC.identifier) as? ContentDetailVC else { return }
//        self.navigationController?.pushViewController(contentdetailVC, animated: true)
    }
}
