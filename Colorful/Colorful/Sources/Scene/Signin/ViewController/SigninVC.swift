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
    
    // MARK: - Action
    @IBAction func signin(_ sender: Any) {
        guard let email = emailTextfield.text,
              let pw = pwTextfield.text else { return }
        
        SigninService.shared.requestSignin(SigninParameter(id: email, password: pw)) { result in
            switch result {
            case .success(let data):
                print(data)
            case .requestErr(let err):
                print(err)
            default:
                print("defaul")
            }
        }
    }
    
    @IBAction func signup(_ sender: Any) {
        guard let sugnupVC = UIStoryboard(name: "Signup", bundle: nil).instantiateViewController(withIdentifier: "SignupVC") as? SignupVC else { return }
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.pushViewController(sugnupVC, animated: true)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailView.clipsToBounds = true
        pwView.clipsToBounds = true
        loginBtn.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        emailView.layer.cornerRadius = emailView.bounds.width / 20
        pwView.layer.cornerRadius = pwView.bounds.width / 20
        loginBtn.layer.cornerRadius = loginBtn.bounds.width / 35
    }
}
