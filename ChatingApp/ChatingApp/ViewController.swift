//
//  ViewController.swift
//  ChatingApp
//
//  Created by 재영신 on 2021/11/04.
//

import UIKit

class ViewController: UIViewController {

    var chatData = [String]()
    @IBOutlet weak var inputTextViewHeightConstrint: NSLayoutConstraint!
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var chatTableView: UITableView!{
        didSet{
            chatTableView.delegate = self
            chatTableView.dataSource = self
        }
    }
    @IBOutlet weak var inputTextView: UITextView!{
        didSet{
            inputTextView.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell")
        chatTableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "yourCell")
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    @IBAction func sendString(_ sender: Any) {
        if inputTextView.text.count > 0 {
            chatData.append(inputTextView.text)
           // chatTableView.reloadData()
            
            inputTextView.text = ""
            let lastIndexPath = IndexPath(row: chatData.count - 1, section: 0)
            chatTableView.insertRows(at: [lastIndexPath], with: .automatic)
            chatTableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
        }
        
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
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
            cell.textView.text = chatData[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "yourCell", for: indexPath) as! YourCell
            cell.textView.text = chatData[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
    }
}

extension ViewController : UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height <= 40{
            inputTextViewHeightConstrint.constant = 40
        }else if textView.contentSize.height >= 100{
            inputTextViewHeightConstrint.constant = 100
        }else{
            inputTextViewHeightConstrint.constant = textView.contentSize.height
        }
    }
}
