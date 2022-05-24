//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by 김영욱 on 2022/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        setting()
        setupToolbar()
        
    }
    
    
    func setting(){
        heightTextField.layer.cornerRadius = 12
        heightTextField.layer.masksToBounds  = true
        heightTextField.placeholder = "cm단위로 입력해주세요"
        heightTextField.keyboardType = .default
        
        
        
        weightTextField.layer.cornerRadius = 12
        weightTextField.layer.masksToBounds  = true
        weightTextField.placeholder = "kg단위로 입력해주세요"
        weightTextField.keyboardType = .default
        
        
        
        resultButton.layer.cornerRadius = 12
        resultButton.layer.masksToBounds  = true
        
    }
    
    
    
    func setupToolbar(){
        //Create a toolbar
        let bar = UIToolbar()
        //Create a done button with an action to trigger our function to dismiss the keyboard
        let doneBtn = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(dismissMyKeyboard))
        //Create a felxible space item so that we can add it around in toolbar to position our done button
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        //Add the created button items in the toobar
        bar.items = [flexSpace, flexSpace, doneBtn]
        bar.sizeToFit()
        //Add the toolbar to our textfield
        heightTextField.inputAccessoryView = bar
        weightTextField.inputAccessoryView = bar
    }
    
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        guard let BMIResult = storyboard?.instantiateViewController(withIdentifier: "BMIResult") as? BMIResultViewController else { return }
        BMIResult.modalPresentationStyle = .fullScreen
        BMIResult.weight = weightTextField.text
        BMIResult.height = heightTextField.text
        if heightTextField.text == "" || weightTextField.text == ""{
            mainLabel.text = "키와 몸무게를 입력해주세요"
            mainLabel.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        } else {
            present(BMIResult, animated: true, completion: nil)
            weightTextField.text = nil
            heightTextField.text = nil
        }
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""
        
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        // make sure the result is under 16 characters
        return updatedText.count <= 3
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
