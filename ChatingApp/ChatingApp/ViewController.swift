//
//  ViewController.swift
//  ChatingApp
//
//  Created by 재영신 on 2021/11/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var inputTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell")
        chatTableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "yourCell")
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    @IBAction func sendString(_ sender: Any) {
    }
}
extension ViewController{
    @objc func keyboardWillShow(noti : Notification){
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
            self.view.layoutIfNeeded()
        }
    }
    @objc func keyboardDidHide(noti : Notification){
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}

