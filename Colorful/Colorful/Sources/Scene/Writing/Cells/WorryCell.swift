//
//  WorryCell.swift
//  Colorful
//
//  Created by 박주연 on 2020/12/14.
//

import UIKit

class WorryCell: UITableViewCell {
    
    static let identifier: String = "WorryCell"

    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var cliplmg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var heartImg: UIImageView!
    @IBOutlet weak var heartCount: UILabel!
    @IBOutlet weak var qaImg: UIImageView!
    @IBOutlet weak var qaCount: UILabel!
    @IBOutlet weak var nickname: UILabel!
    
    func bind(_ worry: WorryDTO) {
        titleLabel.text = worry.title
        contentLabel.text = worry.content
        heartCount.text = "\(worry.heart)"
        qaCount.text = "\(worry.qa)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
