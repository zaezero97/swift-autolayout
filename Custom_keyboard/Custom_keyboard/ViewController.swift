//
//  ViewController.swift
//  Custom_keyboard
//
//  Created by 재영신 on 2021/10/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: self, options: nil)
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        myKeyboardView.delegate = self
        firstTextField.inputView = myKeyboardView
        
    }
}
extension ViewController : KeyboardDelegate{
    func KeyboardTapped(str: String) {
        var oldNumber : Int?
        if let text = firstTextField.text{
            oldNumber = Int(text.replacingOccurrences(of: ",", with: ""))
        }
        var newNumber = Int(str)
        
        
        if str == "00" ,oldNumber != nil{
            newNumber = oldNumber! * 100
        }else  if str == "000" ,oldNumber != nil{
            newNumber = oldNumber! * 1000
        }
        
        if let hasNumber = newNumber {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            if let formatted = numberFormatter.string(from: NSNumber(value: hasNumber))
            {
                firstTextField.text = formatted
            }
        }
    }
}
