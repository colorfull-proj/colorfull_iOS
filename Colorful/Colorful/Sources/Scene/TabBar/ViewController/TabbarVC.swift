//
//  TabbarVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/11.
//

import UIKit

class TabbarVC: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
    }
}

extension TabbarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PostVC {
            guard let postVC = UIStoryboard(name: "Post", bundle: nil).instantiateViewController(withIdentifier: PostVC.identifier) as? PostVC else { return false }
            self.present(postVC, animated: true, completion: nil)
            return false
        }
        return true
    }
}
