//
//  SignupVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/14.
//

import UIKit

class SignupVC: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - UI
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var pwView: UIView!
    @IBOutlet weak var nameView: UIView!
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    @IBOutlet weak var nametextfield: UITextField!
    
    @IBOutlet weak var signupBtn: UIButton!
    
    // MARK: - Action
    @IBAction func signup(_ sender: Any) {
        guard let email = emailTextfield.text,
              let pw = pwTextfield.text,
              let name = nametextfield.text else { return }
        
        SignupService.shared.requestSignup(SignupParameter(id: email, password: pw, name: name)) { result in
            switch result {
            case .success(let data):
                print(data)
                guard let tabbar = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "TabbarVC") as? UITabBarController else { return }
                UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController = tabbar
            case .requestErr(let err):
                print(err)
            default:
                print("default")
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signupBtn.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.barTintColor = .black
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signupBtn.layer.cornerRadius = signupBtn.bounds.width / 35
        emailView.layer.cornerRadius = emailView.bounds.width / 20
        pwView.layer.cornerRadius = pwView.bounds.width / 20
        nameView.layer.cornerRadius = nameView.bounds.width / 20
    }
}
