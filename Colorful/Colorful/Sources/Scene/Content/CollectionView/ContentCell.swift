//
//  ContentCell.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/11.
//

import UIKit

class ContentCell: UICollectionViewCell {
    static let identifier = "ContentCell"
    
    // MARK: - UI
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    // MARK: - Init
    func bind(_ dto: ContentDTO) {
        titleLabel.text = dto.title
        nicknameLabel.text = "by " + dto.nickname
        likeLabel.text = "\(dto.likeCount)"
        commentLabel.text = "\(dto.commentCount)"
    }
    
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = self.bounds.width/20
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
