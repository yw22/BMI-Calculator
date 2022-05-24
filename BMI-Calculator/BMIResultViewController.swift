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
        
        setting()
        
        resultLabel.text = String(format: "%.2f", calculator(height, weight))
    }
    
    func calculator(_ height: String?, _ weight: String?) -> Double {
        guard let weight = weight, let height = height else { return 0 }
        guard let w = Double(weight), let h = Double(height) else { return 0 }
        
        resultString.text = resultStr( w / (h * h) * 10000 )
        
        return w / (h * h) * 10000
    }
    
    func resultStr(_ num : Double) -> String? {
        switch num{
        case ...18.5:
            resultLabel.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            return "\"저체중\"입니다."
        case 18.6 ... 22.9:
            resultLabel.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            return "\"정상\"입니다."
        case 23.0 ... 24.9:
            resultLabel.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            return "\"과체중\"입니다"
        case 25.0...29.9:
            resultLabel.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
            resultLabel.textColor = .white
            return "\"중도 비만\"입니다"
        case 30.0...:
            resultLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            resultLabel.textColor = .white
            return "\"고도 비만\"입니다"
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
        self.dismiss(animated: true, completion: nil)
    }
    
}
