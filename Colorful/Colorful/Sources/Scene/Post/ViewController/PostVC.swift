//
//  PostVC.swift
//  Colorful
//
//  Created by 박주연 on 2020/12/10.
//

import UIKit

extension Notification.Name {
    static let post = Notification.Name(rawValue: "post")
}

class PostVC: UIViewController {
    static let identifier = "PostVC"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var uploadBtn: UIButton!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var ContentTextView: UITextView!
    
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var anonyLabel: UILabel!
    
    
    var isChecked: Int = 0
    var leftClicked: Int = 0
    var rightClicked: Int = 0
    
    @IBAction func deleteSelected(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func uploadSelected(_ sender: Any) {
        
        uploadBtn.setTitleColor(.orange, for: .normal)
        NotificationCenter.default.post(name: .post, object: nil, userInfo: ["title": titleTextField.text!, "content": ContentTextView.text!])
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func checkBtnSelected(_ sender: UIButton) {
        
        if isChecked == 0 {
            isChecked = 1
            checkBtn.setImage(UIImage(named:"anonymityIc"), for: .normal)
            anonyLabel.textColor = UIColor.orange
        }
        else{
            isChecked = 0
            checkBtn.setImage(UIImage(named:"anonygray"), for: .normal)
            anonyLabel.textColor = UIColor.gray_label
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContentTextView.delegate = self
        titleTextField.delegate = self
        textViewSetupView()
//        textFieldSetupView()
    
    }
    
    
    func textViewSetupView() {
        ContentTextView.text = "내용을 입력하세요"
        ContentTextView.textColor = UIColor.gray_label
        
    }
    
//    func textFieldSetupView(){
//
//        titleTextField.text = "입력하세요"
//        titleTextField.textColor = UIColor.gray_label
//
//    }
}
    
    
    // 검색 클릭시 키보드 생성 + background 클릭시 키보드 제거
    extension PostVC:UITextFieldDelegate,UITextViewDelegate {
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if ContentTextView.textColor == UIColor.gray_label{
                ContentTextView.text = nil
                ContentTextView.textColor = UIColor.white
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if ContentTextView.text.isEmpty {
                textViewSetupView()
            }
        }
        
//        func textFieldDidBeginEditing(_ textField: UITextField) {
//
//            if titleTextField.textColor == UIColor.gray_label{
//                titleTextField.text = nil
//                titleTextField.textColor = UIColor.white
//            }
//        }
//
//        func textFieldDidEndEditing(_ textField: UITextField) {
//            if ((titleTextField.text?.isEmpty) == nil) {
//                textFieldSetupView()
//            }
//        }
        
        
        func textView(_ textView: UITextView, shouldChangeTextIn rnage: NSRange, replacementText text: String) -> Bool {
            if text == "\n"{
                textView.resignFirstResponder()
            }
            
            return true
        }
        
        private func addKeyboardObserver() {
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        private func closeKeyboardObserver(){
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        @objc func keyboardWillShow(_ notification: Notification) {
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.titleTextField!.transform = .init(translationX: 0, y: -150)
                self.ContentTextView!.transform = .init(translationX: 0, y: -150)
            })
        }
        
        @objc func keyboardWillHide(_ notification: Notification) {
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.titleTextField!.transform = .identity
                self.ContentTextView!.transform = .identity
            })
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
        
    }

//MARK: - 서버 연결
extension PostVC {
    
    func completeUpload() {
        
    }
    
}

