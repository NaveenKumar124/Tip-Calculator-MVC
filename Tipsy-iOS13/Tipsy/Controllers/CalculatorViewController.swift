//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipsyBrain = TipsyBrain()
    
    var temp = 0
    
    var numberOfSplits = 1
    
    var totalBillAmount: Double = 0.0
    
    var billEachPerson: Double = 0.0
    
    var tipPerc: Double = 0.0
    
    var billEach = ""

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if zeroPctButton.isTouchInside{
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            temp = 1
        }
        else if tenPctButton.isTouchInside{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            temp = 2
        }
        else if twentyPctButton.isTouchInside{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            temp = 3
        }
        billTextField.endEditing(true)
    }
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(stepper.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if temp == 1{
            tipPerc = 0.0
            //print("0.0")
        }
        else if temp == 2{
            tipPerc = 0.10
            //print("0.10")
        }
        else if temp == 3{
            tipPerc = 0.20
            //print("0.20")
        }
        numberOfSplits = (Int(stepper.value))
        totalBillAmount = (Double(billTextField.text!) ?? 0)
        //print(tipPerc)
//        billEachPerson = ((totalBillAmount + (totalBillAmount * tipPerc)) / Double(numberOfSplits))
//        billEach = String(format: "$%.2f", billEachPerson)
//        print(billEach)
//        print(numberOfSplits)
//        print(totalBillAmount)
        
        tipsyBrain.calculateBill(total: totalBillAmount, splits: Double(numberOfSplits), percTip: tipPerc)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tenPctButton.isSelected = false
        splitNumberLabel.text = String(numberOfSplits)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bill = tipsyBrain.getTotalBill()
            destinationVC.split = tipsyBrain.getTotalSplit()
            destinationVC.tip = tipsyBrain.getTotalTip()
        }
    }


}

