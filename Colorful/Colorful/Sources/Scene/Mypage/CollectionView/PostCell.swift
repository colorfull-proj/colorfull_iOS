//
//  PostCell.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/10.
//

import UIKit

struct PostCellDTO {
    let title: String
    var likeCount: Int
    var commentCount: Int
}

class PostCell: UICollectionViewCell {
    static let identifier = "PostCell"
    
    // MARK: - UI
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    // MARK: - Init
    func bind(_ dto: WorryDTO) {
        titleLabel.text = dto.title
        likeCountLabel.text = "\(dto.heart)"
        commentCountLabel.text = "\(dto.qa)"
    }
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        likeCountLabel.text = nil
        commentCountLabel.text = nil
    }
}
