//
//  ViewController.swift
//  ExpandCell
//
//  Created by 재영신 on 2021/11/02.
//

import UIKit
struct ExpandDataModel {
    var description : String
    var isExpand : Bool
    
}
class ExpandCell : UITableViewCell{
    @IBOutlet weak var decriptionLabel: UILabel!
    
}

class ViewController: UIViewController {
    var dataModels = [ExpandDataModel]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textArray = ["short Text", "long long long long long long long long long long long long long long long long long long long long long long long long long long",
                         "short Text", "long long long long long long long long long long long long long long long long long long long long long long long long long long",
                         "short Text", "long long long long long long long long long long long long long long long long long long long long long long long long long long"]
        for (_,value) in textArray.enumerated(){
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
        }
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}


extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCell
        cell.decriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true{
            cell.decriptionLabel.numberOfLines = 0
        }else{
            cell.decriptionLabel.numberOfLines = 1
        }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
