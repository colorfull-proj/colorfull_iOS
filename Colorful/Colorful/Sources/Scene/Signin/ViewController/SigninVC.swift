//
//  SigninVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/14.
//

import UIKit

class SigninVC: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var pwView: UIView!
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailView.clipsToBounds = true
        pwView.clipsToBounds = true
        loginBtn.clipsToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        emailView.layer.cornerRadius = emailView.bounds.width / 20
        pwView.layer.cornerRadius = pwView.bounds.width / 20
        loginBtn.layer.cornerRadius = loginBtn.bounds.width / 35
    }
}
