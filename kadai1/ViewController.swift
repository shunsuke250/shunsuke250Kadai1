//
//  ViewController.swift
//  kadai1
//
//  Created by 副山俊輔 on 2023/07/07.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var textField3: UITextField!
    @IBOutlet private weak var textField4: UITextField!
    @IBOutlet private weak var textField5: UITextField!
    @IBOutlet private weak var sumCalculateButton: UIButton!
    @IBOutlet private weak var sumAnswerLabel: UILabel!
    
    private var textFields: [UITextField] {
        [textField1, textField2, textField3, textField4, textField5]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumCalculateButton.setTitle("合計値を計算する", for: .normal)
        sumAnswerLabel.text = "数値を入力して合計値を計算します"
        
        textFields.forEach {
            $0.delegate = self
            $0.text = "0"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func calculateSumValue(_ sender: UIButton) {
        let sum = textFields
            .map { Int($0.text ?? "0") ?? 0 }
            .reduce(0, +)
        sumAnswerLabel.text = "合計：\(String(sum))"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newLength = text.count + string.count - range.length
        let maxLength = 10
        
        return newLength <= maxLength
    }
}
