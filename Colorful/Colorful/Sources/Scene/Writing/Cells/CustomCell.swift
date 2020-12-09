//
//  CustomCell.swift
//  Colorful
//
//  Created by 박주연 on 2020/12/10.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
   
    @IBOutlet weak var menu1Tabel: UILabel!
    
    override var isSelected: Bool {
        didSet{
            print("Changed")
            self.menu1Tabel.textColor = isSelected ? .orange: .gray
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(menu1Tabel)
        menu1Tabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        menu1Tabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
