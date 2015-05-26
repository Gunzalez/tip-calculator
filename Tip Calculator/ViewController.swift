//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Segun Konibire on 04/04/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var billAmountLable: UILabel!
    @IBOutlet var customTiplLabel1: UILabel!
    @IBOutlet var customTipPercentageSlider: UISlider!
    @IBOutlet var customTipLabel2: UILabel!
    @IBOutlet var tip15Label: UILabel!
    @IBOutlet var total15Label: UILabel!
    @IBOutlet var tipCustomLabel: UILabel!
    @IBOutlet var totalCustomLabel: UILabel!
    @IBOutlet var inputTextField: UITextField!
    
    let decimal100 = NSDecimalNumber(string: "100");
    let decimal15Percent = NSDecimalNumber(string: "0.15");
    
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        //println("Look at what I did!")
        
        let inputString = inputTextField.text;
        
        let sliderValue = NSDecimalNumber(integer: Int(customTipPercentageSlider.value));
        
        let customPercent = sliderValue / decimal100;
        
        if (sender is UISlider){
            
            customTiplLabel1.text = NSNumberFormatter.localizedStringFromNumber(customPercent, numberStyle: NSNumberFormatterStyle.PercentStyle);
            
            customTipLabel2.text = customTiplLabel1.text;
            
        }
        
        if (!inputString.isEmpty){
            
            let billAmount = NSDecimalNumber(string: inputString) / decimal100;
            
            if (sender is UITextField) {
                
                billAmountLable.text = " " + formatAsCurrency(billAmount);
                
                let fifteenTip = billAmount * decimal15Percent;
                
                tip15Label.text = formatAsCurrency(fifteenTip);
                
                total15Label.text = formatAsCurrency(billAmount + fifteenTip);
                
            }
            
            let customTip = billAmount * customPercent;
            
            tipCustomLabel.text = formatAsCurrency(customTip);
            
            totalCustomLabel.text = formatAsCurrency(billAmount + customTip);
            
        } else {
            
            billAmountLable.text = "";
            tip15Label.text = "";
            total15Label.text = "";
            
            
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inputTextField.becomeFirstResponder();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

func formatAsCurrency(decimalNumber: NSDecimalNumber) -> String {
    
    return NSNumberFormatter.localizedStringFromNumber(decimalNumber, numberStyle: NSNumberFormatterStyle.CurrencyStyle);
}

func /(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    
    return left.decimalNumberByDividingBy(right);
    
}

func *(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    
    return left.decimalNumberByMultiplyingBy(right);
    
}

func -(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    
    return left.decimalNumberBySubtracting(right);
    
}

func +(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    
    return left.decimalNumberByAdding(right);
    
}

