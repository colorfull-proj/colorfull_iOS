//
//  AuthorCell.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/11.
//

import UIKit

struct AuthorCellDTO {
    let profileImage: UIImage?
    let nickname: String
    let introduce: String
}

class AuthorCell: UICollectionViewCell {
    static let identifier = "AuthorCell"
    
    // MARK: - UI
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    
    // MARK: - Init
    func bind(_ dto: AuthorCellDTO) {
        if dto.profileImage != nil { profileImageView.image = dto.profileImage }
        nicknameLabel.text = dto.nickname
        introduceLabel.text = dto.introduce
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
