//
//  WritingVC.swift
//  Colorful
//
//  Created by 박주연 on 2020/12/06.
//

import UIKit

class WritingVC: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    struct Worry {
        var title : String
        var content : String
        var heart : Int
        var qa: Int
    }
    
    private var worryInfo : [Worry] = []
    
    @IBOutlet weak var worryTableView: UITableView!
    
    @IBOutlet var categoryBtn: [UIButton]!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var indicatorCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var sortBtn: UIButton!
    
    
    var selectedIndex: Int = 0 {
        didSet {
            categoryBtn[selectedIndex].setTitleColor(.white, for: .normal)
            indicatorCenterConstraint.isActive = false
            indicatorCenterConstraint = indicatorView.centerXAnchor.constraint(equalTo: categoryBtn[selectedIndex].centerXAnchor)
            indicatorCenterConstraint.isActive = true
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                self.indicatorView.transform = CGAffineTransform(scaleX: 1.4, y: 1)
            }, completion: { isCompletion in
                UIView.animate(withDuration: 0.3) {
                    self.indicatorView.transform = .identity
                }
            })
            
            categoryBtn.filter({ $0 !== categoryBtn[selectedIndex] })
                .forEach {_ in
                    
//MARK: - 버튼 텍스트 컬러 어떻게 주지,,,
//                     UIColor(red: 161/255, green: 161/255, blue: 161/255, alpha: 1.0)

                }
            
//            worryTableView.contentOffset = .zero
            worryTableView.reloadData()
        }
    }
    
    @IBAction func categorySelected(_ sender: Any) {
        
        guard let btn = sender as? UIButton else { return }
        if btn === categoryBtn[0] {
            selectedIndex = 0
        } else if btn == categoryBtn[1] {
            selectedIndex = 1
        } else {
            selectedIndex = 2
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setworryInfo()
        
        worryTableView.delegate = self
        worryTableView.dataSource = self
    }
        
    
    private func setworryInfo() {

        let worry1 = Worry(title: "돈이 가장 중요할까요?", content: "이 중에 부자가 되기 위해 다른 걸 포기하는 길을 선택한 분이 계신가요? 그렇다면 왜 부자가 되기를 선택했나요?", heart: 20, qa: 15)
        let worry2  = Worry(title: "번아웃이 온 나", content: "아무것도 하기 싫어요. 잠만 자고 싶어요.", heart: 17, qa: 13)
        let worry3  = Worry(title: "미래가 막막해요", content: "미래가 막막한데 아무것도 하기 싫어요. 그냥 무기력해지고 우울해지네요.", heart: 13, qa: 10)
        let worry4  = Worry(title: "부자가 되고 싶어요", content: "돈 많은 백수도 가끔씩 심심하겠죠? 저도 심심함을 누려보고 싶네요. ", heart: 10, qa: 8)
        let worry5  = Worry(title: "행복일까 돈일까", content: "돈과 행복 중에 무엇이 나를 행복하게 해줄까요,,,", heart: 10, qa: 6)
        let worry6  = Worry(title: "청춘은 아파요", content: "아프니까 청춘이다라는 말이 한때 유행이었는데, 그냥 아픈거에요.", heart: 9, qa: 6)
        let worry7  = Worry(title: "타인과 나", content: "타인은 타인일뿐이고 나는 나입니다. 나에게 집중하세요.", heart: 5, qa: 5)
        let worry8  = Worry(title: "행복을 회상하며", content: "행복이 있었기에 하루하루를 버티는 것 같아요", heart: 2, qa: 4)

        worryInfo = [worry1, worry2, worry3, worry4, worry5, worry6, worry7, worry8]

    }
    
}

extension WritingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worryInfo.count
        
        // 여기에 WorryCell의 setWorryInformation 정보 추가하기 !!!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let worryCell = tableView.dequeueReusableCell(withIdentifier: WorryCell.identifier, for: indexPath) as? WorryCell else { return UITableViewCell() }
        
        //MARK: 카테코리별 분기 처리
        
        return worryCell
    }
}

extension WritingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 181
    }
}
