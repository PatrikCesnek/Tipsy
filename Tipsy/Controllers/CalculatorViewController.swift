//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var billTotal = 0.0
    var tip = 0.10
    var numberOfPeople = 2
    var result = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
//        MY SOLUTION - NOT COMPLETELY STUPIT, BUT UNNESSESARY LONG
//        if sender == zeroPctButton {
//            sender.isSelected = true
//            tenPctButton.isSelected = false
//            twentyPctButton.isSelected = false
//        } else if sender == tenPctButton {
//            sender.isSelected = true
//            zeroPctButton.isSelected = false
//            twentyPctButton.isSelected = false
//        } else if sender == twentyPctButton {
//            sender.isSelected = true
//            tenPctButton.isSelected = false
//            zeroPctButton.isSelected = false
//        } else {
//            zeroPctButton.isSelected = false
//            tenPctButton.isSelected = false
//            twentyPctButton.isSelected = false
//        }
//        let billString = billTextField.text ?? "0"
//
//        bill = Double(billString) ?? 0.0
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
//        Old code I made
//        var result = 0.0
//        var addedPercentage = 0.0
//
//        var doubleNumOfPeople = Double(numberOfPeople)
//
//        if zeroPctButton.isSelected {
//            print(0.0)
//            result = bill / doubleNumOfPeople
//        } else if tenPctButton.isSelected {
//            print(0.1)
//            tip = bill * 0.1
//            result = (bill + tip) / doubleNumOfPeople
//        } else {
//            print(0.2)
//            addedPercentage = Double(bill) * 0.2
//            result = (bill + addedPercentage) / doubleNumOfPeople
//        }
//        print(splitNumberLabel.text ?? "0")
//        print("Price with tip is \(result) devided between \(numberOfPeople) people")
//    }
        
        
        let bill = billTextField.text ?? "0"
        
        if bill != "" {
            billTotal = Double(bill) ?? 0
            
            result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            let roundedResult = String(format: "%.2f", result)
            
            print(roundedResult)
            
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.total = result
            destinationVC.tip = tip
        }
    }
}

