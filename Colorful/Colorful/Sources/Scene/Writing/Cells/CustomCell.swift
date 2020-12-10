//
//  CustomCell.swift
//  Colorful
//
//  Created by 박주연 on 2020/12/10.
//

import UIKit


protocol PageIndexDelegate {
    func SelectMenuItem(pageIndex: Int)
    
}

class CustomCell: UICollectionViewCell {
    
    var delegate: PageIndexDelegate?
    
    
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var menuBarView: UIView!
    @IBOutlet weak var boundView: UIView!
    
    var collectionView: UICollectionView?
    static let identifier: String = "CustomCell"
    
    
   
    
    override var isHighlighted: Bool {
        didSet {
            menuLabel.font = isHighlighted ? .boldSystemFont(ofSize: 16) : .boldSystemFont(ofSize: 16)
            
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                self.menuBarView.layoutIfNeeded()
                self.menuBarView.tintColor = self.isSelected ? .orange  : .gray
                
            }, completion: nil)
        }
    }
    
    
    override var isSelected: Bool {
        didSet {
            menuLabel.font = isSelected ? .boldSystemFont(ofSize: 16) : .boldSystemFont(ofSize: 16)
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.menuBarView.layoutIfNeeded()
                self.menuBarView.tintColor = self.isSelected ? .orange : .gray
            }, completion: nil)
        }
    }
}
