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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setWorryInformation(title: String, content: String, heart: Int, qa: Int){
        titleLabel.text = title
        contentLabel.text = content
//MARK: - 인트형은 어떻게 하는지 모르겠음...ㅎ
    }

}
