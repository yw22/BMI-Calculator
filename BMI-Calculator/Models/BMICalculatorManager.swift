//
//  BMICalculatorManager.swift
//  BMI-Calculator
//
//  Created by 김영욱 on 2022/05/24.
//

import UIKit

class BMICalculator {
    var bmi: BMI?
    
    func calculator(_ height: String, _ weight: String){
        guard let h = Double(height), let w = Double(weight) else { return }
        let bmiNum = (w / (h * h) * 10000)
        
        switch bmiNum {
        case ..<18.6:
            let bmiResultLabel = "\"저체중\"입니다."
            let bmiResultLabelColor = UIColor.black
            let bmiResultNumBackgound = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: bmiResultNumBackgound, advice: bmiResultLabel, adviceColor: bmiResultLabelColor)
        case 18.6 ..< 23.0:
            let bmiResultLabel = "\"정상\"입니다."
            let bmiResultLabelColor = UIColor.black
            let bmiResultNumBackgound = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: bmiResultNumBackgound, advice: bmiResultLabel, adviceColor: bmiResultLabelColor)
        case 23.0 ..< 25.0:
            let bmiResultLabel = "\"과체중\"입니다"
            let bmiResultLabelColor = UIColor.black
            let bmiResultNumBackgound = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: bmiResultNumBackgound, advice: bmiResultLabel, adviceColor: bmiResultLabelColor)
        case 25.0..<30.0:
            let bmiResultLabel = "\"중도 비만\"입니다"
            let bmiResultLabelColor = UIColor.white
            let bmiResultNumBackgound = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: bmiResultNumBackgound, advice: bmiResultLabel, adviceColor: bmiResultLabelColor)
        case 30.0...:
            let bmiResultLabel = "\"고도 비만\"입니다"
            let bmiResultLabelColor = UIColor.white
            let bmiResultNumBackgound = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: bmiResultNumBackgound, advice: bmiResultLabel, adviceColor: bmiResultLabelColor)
        default:
            break
        }
        
    }
    
    func getBMIResult() -> BMI {
        return bmi ?? BMI(value: 0.0, matchColor: .clear, advice: "", adviceColor: .clear)
    }

}
