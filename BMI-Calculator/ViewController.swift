//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by 김영욱 on 2022/05/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        setting()
        setupToolbar()
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    
    func setting(){
        heightTextField.layer.cornerRadius = 12
        heightTextField.layer.masksToBounds  = true
        heightTextField.placeholder = "cm단위로 입력해주세요"
        heightTextField.keyboardType = .numberPad
        
        
        
        weightTextField.layer.cornerRadius = 12
        weightTextField.layer.masksToBounds  = true
        weightTextField.placeholder = "kg단위로 입력해주세요"
        weightTextField.keyboardType = .numberPad
        
        
        
        resultButton.layer.cornerRadius = 12
        resultButton.layer.masksToBounds  = true
        
    }
    
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
    
    func setupToolbar(){
        //Create a toolbar
        let bar = UIToolbar()
        //Create a done button with an action to trigger our function to dismiss the keyboard
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMyKeyboard))
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
        present(BMIResult, animated: true, completion: nil)
        weightTextField.text = nil
        heightTextField.text = nil
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
}
