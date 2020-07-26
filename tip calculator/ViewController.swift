//
//  ViewController.swift
//  tip calculator
//
//  Created by Benjamin Garcia on 7/25/20.
//  Copyright © 2020 Benjamin Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let billAmount = Double(billField.text!) ?? 0
        // Calculate the tip and total
        let tipPercent = round(Double(tipPercentSlider.value))
        let tipAmount = billAmount * (tipPercent / 100)
        let total = billAmount + tipAmount
        // Update the tip and total labels
        tipPercentageLabel.text = String(format: "%.0f%%", tipPercent)
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
}

