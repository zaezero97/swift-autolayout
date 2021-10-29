//
//  CustomKeyboard.swift
//  Custom_keyboard
//
//  Created by 재영신 on 2021/10/29.
//

import UIKit

protocol KeyboardDelegate : AnyObject{
    func KeyboardTapped(str : String)
}
class CustomKeyboard: UIView {
    var delegate : KeyboardDelegate?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.KeyboardTapped(str: sender.titleLabel!.text!)
    }
}
