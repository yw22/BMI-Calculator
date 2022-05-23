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
    
    var weight: String?
    var height: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = String(format: "%.2f", calculator(weight, height))
        
        setting()
    }
    
    func calculator(_ : String?, _ : String?) -> Double {
        guard let weight = weight, let height = height else { return 0 }
        let x = Double(Int(height)!) / 100
        resultString.text = resultStr(Double(Int(weight)!) / (x * x))
        
        return Double(Int(weight)!) / (x * x)
    }
    
    func resultStr(_ num : Double) -> String? {
        switch num{
        case ...20:
            return "\"저체중\"입니다."
        case 21...24:
            return "\"정상\"입니다."
        case 25...29:
            return "\"과체중\"입니다"
        case 30...:
            return "\"비만\"입니다"
        default:
            return nil
        }
        
    }
    
    func setting(){
        restartButton.layer.cornerRadius = 12
        restartButton.layer.masksToBounds  = true

        resultLabel.layer.cornerRadius = 12
        resultLabel.layer.masksToBounds  = true
        
        resultLabel.backgroundColor = .white
    }

    

    @IBAction func restartButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
