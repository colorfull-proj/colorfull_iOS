//
//  LikeVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/10.
//

import UIKit

class LikeVC: UIViewController {
    static let identifier = "LikeVC"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LikeVC: CategoryVCAble {
    var _view: UIView {
        return self.view
    }
}
