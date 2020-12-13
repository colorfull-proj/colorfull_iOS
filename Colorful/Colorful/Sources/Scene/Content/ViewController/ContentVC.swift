//
//  ContentVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/11.
//

import UIKit

struct ContentDTO {
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
    
    var contentDTOs: [ContentDTO] = [
        ContentDTO(title: "안녕하세요", nickname: "somsoming", likeCount: 10, commentCount: 14),
        ContentDTO(title: "저기요", nickname: "somsss", likeCount: 9, commentCount: 4),
        ContentDTO(title: "아아아아아아아", nickname: "akstlsss", likeCount: 7, commentCount: 3),
        ContentDTO(title: "저는 고민이 있어요", nickname: "xmllllll", likeCount: 1, commentCount: 2)
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
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
        setDelegate()
    }
}

extension ContentVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentDTOs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCell.identifier, for: indexPath) as? ContentCell else { return UICollectionViewCell() }
        
        if selectedIndex == 0 {
            contentCell.imageView.image = UIImage(named: "homeImg1Img")
        } else {
            contentCell.imageView.image = UIImage(named: "homeImg2Img")
        }
        contentCell.bind(contentDTOs[indexPath.row])
        
        return contentCell
    }
}
