//
//  ViewController.swift
//  SignInLayout
//
//  Created by 재영신 on 2021/11/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var emailErrorHeightConstraint : NSLayoutConstraint!
    var pwdErrorHeightConstraint : NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        
        emailErrorHeightConstraint = emailErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        pwdErrorHeightConstraint = passwordErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        
    }
    
    @objc func textFieldEdited(textField : UITextField)
    {
        if textField == emailTextField{
            if isValidEmail(email: emailTextField.text){
                emailErrorHeightConstraint.isActive = true
            }else{
                emailErrorHeightConstraint.isActive = false
            }
        }else if textField == passwordTextField{
            if isValidPassword(password: passwordTextField.text){
                pwdErrorHeightConstraint.isActive = true
            }else{
                pwdErrorHeightConstraint.isActive = false
            }
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    func isValidEmail(email:String?)->Bool{
        guard email != nil else { return false}
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    func isValidPassword(password:String?)->Bool{
        if let hasPassword = password {
            if hasPassword.count < 8 {
                return false
            }
        }
        return true
    }
}

