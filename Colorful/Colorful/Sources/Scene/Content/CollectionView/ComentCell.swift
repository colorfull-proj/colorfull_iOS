//
//  ComentCell.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/14.
//

import UIKit

struct CommentDTO {
    let nickname: String
    let content: String
    let timestamp: String
    let likeCount: Int
}

class ComentCell: UICollectionViewCell {
    static let identifier = "comentcell"
    
    // MARK: - UI
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    // MARK: - Init
    func bind(_ dto: CommentDTO) {
        nicknameLabel.text = dto.nickname
        contentLabel.text = dto.content
        timestampLabel.text = dto.timestamp
        likeLabel.text = "\(dto.likeCount)"
    }
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = .scaleAspectFit
        widthConstraint.constant = UIScreen.main.bounds.width - 15*2 - 15*2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
