//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Navi Malhotra on 2023-05-02.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bill:Double?
    
    var split:Double?
    
    var tip:Double?
    
    var tips = ""

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if tip == 0.0{
            tips = "0"
        }
        else if tip == 0.1{
            tips = "10"
        }
        else if tip == 0.2{
            tips = "20"
        }
        
        totalLabel.text = String(format: "$%.2f", bill ?? 0.0)
        settingsLabel.text = "Split between \(split ?? 0) people,with \(tips)% tip."
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
