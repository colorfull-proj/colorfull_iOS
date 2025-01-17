//
//  SigninVC.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/14.
//

import UIKit

class SigninVC: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
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
                guard let tabbar = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "TabbarVC") as? UITabBarController else { return }
                UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController = tabbar
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func upKeyboard(_ notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight+80)
        }
    }

    @objc func downKeyboard() {
        UIView.animate(withDuration: 0.3) {
            self.view.transform = .identity
        }
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailView.clipsToBounds = true
        pwView.clipsToBounds = true
        loginBtn.clipsToBounds = true
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(upKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(downKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        emailView.layer.cornerRadius = emailView.bounds.width / 20
        pwView.layer.cornerRadius = pwView.bounds.width / 20
        loginBtn.layer.cornerRadius = loginBtn.bounds.width / 35
    }
}
