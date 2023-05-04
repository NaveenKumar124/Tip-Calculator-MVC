//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Navi Malhotra on 2023-05-04.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    
    var tip: TIP?
    
    func getTotalBill() -> Double{
        //let billTo2DecimalPlace = String(format: "$%.2f", tip?.totalBillEach ?? 0.0)
        return tip?.totalBillEach ?? 0.0
    }
    
    func getTotalSplit() -> Double{
        return tip?.splitsNumber ?? 0
    }
    
    func getTotalTip() -> Double{
        return tip?.totalTip ?? 0.0
    }
    
    mutating func calculateBill(total:Double, splits:Double, percTip:Double){
        let bill = (total + (total * percTip)) / splits
        
        tip = TIP(totalBillEach: bill, totalTip: percTip, splitsNumber: splits)
    }
}
