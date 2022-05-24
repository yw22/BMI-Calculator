//
//  BMIResultViewController.swift
//  BMI-Calculator
//
//  Created by 김영욱 on 2022/05/23.
//

import UIKit

class BMIResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultString: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting()
        
    }
    
    
    func setting(){
        
        restartButton.layer.cornerRadius = 12
        restartButton.layer.masksToBounds = true

        resultLabel.layer.cornerRadius = 12
        resultLabel.layer.masksToBounds = true
        
        guard let bmi = bmi else { return }
        
        resultLabel.text = String(format: "%.2f", bmi.value)
        resultLabel.backgroundColor = bmi.matchColor
        resultLabel.textColor = bmi.adviceColor
        
        resultString.text = bmi.advice
        
    }

    @IBAction func restartButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
