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
    
    // MARK: - Init
    func bind(_ dto: PostCellDTO) {
        titleLabel.text = dto.title
        likeCountLabel.text = "\(dto.likeCount)"
        commentCountLabel.text = "\(dto.commentCount)"
    }
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        likeCountLabel.text = nil
        commentCountLabel.text = nil
    }
}
