//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Patrik Cesnek on 12/04/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var numberOfPeople: Int?
    var total: Double?
    var tip: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        totalLabel.text = String(format: "%.2f", total!)
        let tipPercent = tip! * 100
        let roundedTip = String(format: "%.0f", tipPercent)
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(roundedTip)% tip."
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
