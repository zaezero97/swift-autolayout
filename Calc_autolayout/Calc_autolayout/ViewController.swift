//
//  ViewController.swift
//  Calc_autolayout
//
//  Created by 재영신 on 2021/10/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var parentStackView: UIStackView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.layer.cornerRadius = 50
        resultLabel.layer.masksToBounds = true
        //resultLabel.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for view in parentStackView.arrangedSubviews{
            if let stackView = view as? UIStackView
            {
                for btn in stackView.arrangedSubviews
                {
                    if let button = btn as? UIButton
                    {
                        button.layer.cornerRadius = button.bounds.height / 2
                    }
                }
            }
        }
    }
}

