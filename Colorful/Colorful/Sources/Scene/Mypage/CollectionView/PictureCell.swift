//
//  PictureCell.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/11.
//

import UIKit

struct PictureCellDTO {
    let backImage: UIImage?
    let title: String
    let nickname: String
    var like: Int
    var comment: Int
}

class PictureCell: UICollectionViewCell {
    static let identifier = "PictureCell"
    
    // MARK: - UI
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    // MARK: - Init
    func bind(_ dto: PictureCellDTO) {
        backImageView.image = dto.backImage
        titleLabel.text = dto.title
        nicknameLabel.text = "by " + dto.nickname
        likeLabel.text = "\(dto.like)"
        commentLabel.text = "\(dto.comment)"
    }
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
