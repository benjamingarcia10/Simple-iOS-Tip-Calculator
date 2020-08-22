//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Benjamin Garcia on 7/26/20.
//  Copyright © 2020 Benjamin Garcia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateTipPercentLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateTipPercentLabel()
    }
    
    @IBAction func decreaseDefaultTipPercent(_ sender: Any) {
        var currentDefault = defaults.float(forKey: "defaultTipPercentage")
        currentDefault -= 1
        
        if currentDefault <= 0 {
            currentDefault = 0
            decreaseButton.isEnabled = false
        }
        if currentDefault < 100 && increaseButton.isEnabled == false {
            increaseButton.isEnabled = true
        }
        
        defaults.set(currentDefault, forKey: "defaultTipPercentage")
        updateTipPercentLabel()
    }
    
    @IBAction func increaseDefaultTipPercent(_ sender: Any) {
        var currentDefault = defaults.float(forKey: "defaultTipPercentage")
        currentDefault += 1
        
        if currentDefault >= 100 {
            currentDefault = 100
            increaseButton.isEnabled = false
        }
        if currentDefault > 0 && decreaseButton.isEnabled == false {
            decreaseButton.isEnabled = true
        }
        
        defaults.set(currentDefault, forKey: "defaultTipPercentage")
        updateTipPercentLabel()
    }
    
    func updateTipPercentLabel() {
        tipPercentLabel.text = String(format: "%.0f%%", defaults.float(forKey: "defaultTipPercentage"))
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
