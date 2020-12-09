//
//  PageCell.swift
//  Colorful
//
//  Created by 박주연 on 2020/12/10.
//

import UIKit

class PageCell: UICollectionViewCell {

    var label: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(label)
        self.backgroundColor = .green
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
