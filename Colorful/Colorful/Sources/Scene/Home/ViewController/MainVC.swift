//
//  MainVC.swift
//  Colorful
//
//  Created by 박주연 on 2020/12/05.
//

import UIKit

class MainVC: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var writingCollectionView: UICollectionView!
    
    @IBOutlet weak var pictureCollectionView: UICollectionView!
    
//    var HomePostDataSet = [HomePostData.HomePostDataClass]()
    
    private var worryInfo: [WorryDTO] = []
    private var imageDatas: [UIImage] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        //setNewList()
        writingCollectionView.delegate = self
        writingCollectionView.dataSource = self
        
        // setPageList()
        pictureCollectionView.delegate = self
        pictureCollectionView.dataSource = self
        
//        homepostData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func initData() {
        let worry1 = WorryDTO(title: "돈이 가장 중요할까요?", content: "이 중에 부자가 되기 위해 다른 걸 포기하는 길을 선택한 분이 계신가요? 그렇다면 왜 부자가 되기를 선택했나요?", heart: 20, qa: 1)
        let worry2  = WorryDTO(title: "번아웃이 온 나", content: "아무것도 하기 싫어요. 잠만 자고 싶어요.", heart: 17, qa: 0)
        let worry3  = WorryDTO(title: "미래가 막막해요", content: "미래가 막막한데 아무것도 하기 싫어요. 그냥 무기력해지고 우울해지네요.", heart: 13, qa: 2)
        let worry4  = WorryDTO(title: "부자가 되고 싶어요", content: "돈 많은 백수도 가끔씩 심심하겠죠? 저도 심심함을 누려보고 싶네요. ", heart: 10, qa: 7)
        let worry5  = WorryDTO(title: "행복일까 돈일까", content: "돈과 행복 중에 무엇이 나를 행복하게 해줄까요,,,", heart: 10, qa: 5)
        let worry6  = WorryDTO(title: "청춘은 아파요", content: "아프니까 청춘이다라는 말이 한때 유행이었는데, 그냥 아픈거에요.", heart: 9, qa: 3)
        let worry7  = WorryDTO(title: "타인과 나", content: "타인은 타인일뿐이고 나는 나입니다. 나에게 집중하세요.", heart: 5, qa: 4)
        let worry8  = WorryDTO(title: "행복을 회상하며", content: "행복이 있었기에 하루하루를 버티는 것 같아요", heart: 2, qa: 2)

        worryInfo = [worry1, worry2, worry3, worry4, worry5, worry6, worry7, worry8]
        
        let image1 = UIImage(named: "image1")!
        let image2 = UIImage(named: "image2")!
        let image3 = UIImage(named: "image3")!
        let image4 = UIImage(named: "image4")!
        let image5 = UIImage(named: "image5")!
        let image6 = UIImage(named: "image6")!
        let image7 = UIImage(named: "image7")!
        let image8 = UIImage(named: "image8")!
        
        imageDatas = [image1, image2, image3, image4, image5, image6, image7, image8]
    }

    
//    func  homepostData(){
//
//        HomePostService.shared.HomePost {
//
//            response in
//
//            switch response{
//            case . success(let data):
//                self.HomePostDataSet = []
//                self.HomePostDataSet = data as!
//                    [HomePostData.HomePostDataClass]
//
//                self.writingCollectionView.reloadData()
//                self.pictureCollectionView.reloadData()
//
//            // print("HomePostDataSet", self.HomePostDataSet)
//
//            case.networkFail:
//                print("error")
//
//            case .requestErr(_):
//                print("requestErr")
//            case .pathErr:
//                print("pathErr")
//            case .serverErr:
//                print("serverErr")
//            }
//
//        }
//    }
}


extension MainVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.writingCollectionView {
            guard let detailVC = UIStoryboard(name: "ContentDetail", bundle: nil).instantiateViewController(withIdentifier: ContentDetailVC.identifier) as? ContentDetailVC else { return }
            
            detailVC.postTitle = worryInfo[indexPath.row].title
            detailVC.content = worryInfo[indexPath.row].content
            detailVC.comment = worryInfo[indexPath.row].qa
            detailVC.like = worryInfo[indexPath.row].heart
            
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

extension MainVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // 각각의 collection view별로 분기 처리
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.writingCollectionView{
//            return HomePostDataSet.count
            return 4
            
        }
        else if collectionView == self.pictureCollectionView{
//            return HomePostDataSet.count
            return 4
            
        }
        
        return 4
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == writingCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WritingCVC",for:indexPath) as! WritingCVC
            
            cell.bind(worryInfo[indexPath.row])
//            let writingCell = HomePostDataSet[indexPath.row]
            
//            cell.titleLabel.text = writingCell.
//            cell.contentLabel.text = writingCell.
//            cell.nicknameLabel.text = writingCell.
//            cell.heartCountLabel.text = writingCell.
//            cell.commentCountLabel.text = writingCell.
            
            return cell
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCVC",for:indexPath) as! PictureCVC
            
//            let pictureCell = HomePostDataSet[indexPath.row]
            
//            let urlStr = pictureCell.
//
//            cell.pictureImg.kf.setImage(with: URL(string: urlStr))
            cell.pictureImg.image = imageDatas[indexPath.row]
            return cell
        }
        
    }
    
    
//    // collectionView Cell의 "위치" 조정
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        if collectionView == self.writingCollectionView{
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        }
//
//        else {
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        }
//    }


    // collectionVeiw Cell의 "크기" 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
                            indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.writingCollectionView{
            return CGSize(width: (collectionView.frame.width), height: (collectionView.frame.height))
        }
        
        else{
            return CGSize(width: (collectionView.frame.width / 2.5), height: (collectionView.frame.height))
        }
    }
}

