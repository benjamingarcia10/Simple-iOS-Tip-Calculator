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
    @IBOutlet weak var tipPercentSlider: UISlider!
    
    @IBOutlet weak var onePersonLabel: UILabel!
    @IBOutlet weak var twoPersonLabel: UILabel!
    @IBOutlet weak var threePersonLabel: UILabel!
    @IBOutlet weak var fourPersonLabel: UILabel!
    
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDefaultTip()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateDefaultTip()
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
        
        onePersonLabel.text = String(format: "$%.2f", total)
        twoPersonLabel.text = String(format: "$%.2f", total / 2)
        threePersonLabel.text = String(format: "$%.2f", total / 3)
        fourPersonLabel.text = String(format: "$%.2f", total / 4)
    }
    
    func updateDefaultTip() {
        print("UPDATING")
        let currentDefault = defaults.float(forKey: "defaultTipPercentage")
        tipPercentSlider.value = currentDefault
        tipPercentageLabel.text = String(format: "%.0f%%", currentDefault)
        calculateTip(UIButton())
    }
    
}

