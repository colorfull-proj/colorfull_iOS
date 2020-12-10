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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setNewList()
        writingCollectionView.delegate = self
        writingCollectionView.dataSource = self
        
        // setPageList()
        pictureCollectionView.delegate = self
        pictureCollectionView.dataSource = self
        
//        homepostData()
        
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


extension MainVC:UICollectionViewDelegate{}

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

