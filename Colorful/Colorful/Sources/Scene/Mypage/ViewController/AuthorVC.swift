//
//  AuthorVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/10.
//

import UIKit

class AuthorVC: UIViewController {
    static let identifier = "AuthorVC"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension AuthorVC: CategoryVCAble {
    var _view: UIView {
        return self.view
    }
    
    func calContentHeight() -> CGFloat {
        return 10
    }
}
