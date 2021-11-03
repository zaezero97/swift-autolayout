//
//  ViewController.swift
//  Switch_Custom
//
//  Created by 재영신 on 2021/11/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchBG: UIView!
    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var switchBtnCenterX: NSLayoutConstraint!
    var left = CGFloat.zero
    var right = CGFloat.zero
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        left = -((switchBG.frame.width / 2) - (switchBtn.frame.width / 2))
        right = (switchBG.frame.width / 2) - (switchBtn.frame.width / 2)
        
        switchBG.layer.cornerRadius = switchBG.frame.height / 2
        switchBtn.layer.cornerRadius = switchBtn.frame.width / 2
        switchBtnCenterX.constant = left
    }
    @IBAction func selectBtn(_ sender: Any) {
        if switchBtnCenterX.constant == left{
            switchBtnCenterX.constant = right
        }else{
            switchBtnCenterX.constant = left
        }
        
        UIView.animate(withDuration: 1) {
            self.switchBG.layoutSubviews()
        }
    }
    
}

