//
//  ViewController.swift
//  TipPro
//
//  Created by Vyacheslav Horbach on 21/06/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountFld: UITextField!
    @IBOutlet weak var tipAmountFld: UITextField!
    @IBOutlet weak var totalFld: UITextField!
    
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onCalculatePressed(sender: AnyObject) {
        guard let billAmount = Double(billAmountFld.text!) else {
            billAmountFld.text = ""
            tipAmountFld.text = ""
            totalFld.text = ""
            return
        }
    
        var tipPercentage = 0.0
    
        switch tipSelector.selectedSegmentIndex {
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
        }
    
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
    
        if (!billAmountFld.editing) {
            billAmountFld.text = String(format: "%.2f", roundedBillAmount)
        }
        tipAmountFld.text = String(format: "%.2f", roundedTipAmount)
        
        totalFld.text = String(format: "%.2f", totalAmount)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}


