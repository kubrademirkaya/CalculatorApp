//
//  CalculatorViewController.swift
//  CalculatorApp
//
//  Created by Kübra Demirkaya on 30.03.2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonTouchUpInsideOutsideCancel(_ sender: UIButton) {
        print("button finished: \(sender.tag)")
    }
    
    @IBAction func buttonTouchDownAction(_ sender: UIButton) {
        
        print("button pressed: \(sender.tag)")
    }
    
    
}
