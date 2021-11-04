//
//  ViewController.swift
//  Popup_Complex
//
//  Created by 재영신 on 2021/11/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showPopup(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "PopupViewController", bundle: nil)
        let popVC = storyboard.instantiateViewController(withIdentifier: "popupVC")
        
        popVC.modalPresentationStyle = .overCurrentContext
        self.present(popVC, animated: true, completion: nil)
    }
}

