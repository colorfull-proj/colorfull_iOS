//
//  MyPageVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/10.
//

import UIKit

protocol CategoryVCAble {
    var _view: UIView { get }
    func calContentHeight() -> CGFloat
}

enum SelectCategory: Int, CaseIterable {
    case mypost = 0, mypicture, like, author
    
    func deciseTitle() -> String {
        switch self {
        case .mypost: return "나의 글"
        case .mypicture: return "나의 그림"
        case .like: return "좋아요"
        case .author: return "선호작가"
        }
    }
    
    func makeVC() -> CategoryVCAble {
        switch self {
        case .mypost:
            return UIStoryboard(name: "Mypost", bundle: nil)
                .instantiateViewController(withIdentifier: MypostVC.identifier) as! CategoryVCAble
        case .mypicture:
            return UIStoryboard(name: "Mypicture", bundle: nil)
                .instantiateViewController(withIdentifier: MypictureVC.identifier) as! CategoryVCAble
        case .like:
            return UIStoryboard(name: "Like", bundle: nil)
                .instantiateViewController(withIdentifier: LikeVC.identifier) as! CategoryVCAble
        case .author:
            return UIStoryboard(name: "Author", bundle: nil)
                .instantiateViewController(withIdentifier: AuthorVC.identifier) as! CategoryVCAble
        }
    }
}

class MyPageVC: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - UI
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var nickStateLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet var categoryLabels: [UILabel]! {
        didSet {
            var order: Int = 0
            categoryLabels.forEach {
                guard let cat = SelectCategory(rawValue: order) else { return }
                $0.text = cat.deciseTitle()
                order += 1
            }
        }
    }
    
    @IBOutlet var countLabels: [UILabel]!
    @IBOutlet var segmentButtons: [UIButton]!
    
    @IBOutlet weak var mypostCountLabel: UILabel!
    @IBOutlet weak var mypictureCountLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var authorCountLabel: UILabel!
    
    @IBOutlet weak var segmentLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var containerView: UIView!

    private var childVCs: [CategoryVCAble] = []
    
    // MARK: - Data
    var curSelect: Int = 0 {
        didSet {
            let proportion = UIScreen.main.bounds.width / 4
            segmentLeadingConstraint.constant = proportion * CGFloat(curSelect)
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            
            categoryLabels[curSelect].textColor = .white
            countLabels[curSelect].textColor = .white
            
            categoryLabels.filter { $0 !== categoryLabels[curSelect] }
                .forEach {
                    $0.textColor = UIColor(red: 161/255, green: 161/255, blue: 161/255, alpha: 1.0)
                }
            
            countLabels.filter { $0 !== countLabels[curSelect] }
                .forEach {
                    $0.textColor = UIColor(red: 161/255, green: 161/255, blue: 161/255, alpha: 1.0)
                }
            
            if childVCs.isEmpty { return }
            childVCs[curSelect]._view.isHidden = false
            
            childVCs.map({ $0 as! UIViewController })
                .filter({ $0 !== childVCs[curSelect] as! UIViewController })
                .forEach {
                    $0.view.isHidden = true
                }
        }
    }
    
    var mypostCount: Int = 2
    var mypictureCount: Int = 6
    var likeCount: Int = 0
    var authorCount: Int = 4
    
    // MARK: - Init
    private func initView() {
        curSelect = 0
        
        nicknameLabel.text = "somsoming"
        nickStateLabel.text = "의 방"
        introduceLabel.text = "외로운 걸 즐기는 낭만주의자"
        
        mypostCountLabel.text = "\(mypostCount)"
        mypictureCountLabel.text = "\(mypictureCount)"
        likeCountLabel.text = "\(likeCount)"
        authorCountLabel.text = "\(authorCount)"
    }
    
    private func initChildVCs() {
        SelectCategory.allCases.forEach {
            self.childVCs.append($0.makeVC())
        }
        
        childVCs.forEach {
            guard let childVC = $0 as? UIViewController else { return }
            self.addChild(childVC)
            childVC.didMove(toParent: self)
            childVC.view.frame = self.containerView.bounds
            self.containerView.addSubview(childVC.view)
            childVC.view.isHidden = true
        }
        
        childVCs[0]._view.isHidden = false
    }
    
    // MARK: - Action
    @IBAction func clickedSegment(_ sender: Any) {
        guard let btn = sender as? UIButton else { return }
        if btn === segmentButtons[0] {
            curSelect = 0
        } else if btn == segmentButtons[1] {
            curSelect = 1
        } else if btn == segmentButtons[2] {
            curSelect = 2
        } else {
            curSelect = 3
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initView()
        initChildVCs()
    }
    
}
