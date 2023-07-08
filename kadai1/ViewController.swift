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

    override func viewDidLoad() {
        super.viewDidLoad()
        sumCalculateButton.setTitle("合計値を計算する", for: .normal)
        sumAnswerLabel.text = "数値を入力して合計値を計算します"
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self

        let defaultValue = "0"
        textField1.text = defaultValue
        textField2.text = defaultValue
        textField3.text = defaultValue
        textField4.text = defaultValue
        textField5.text = defaultValue
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func calculateSumValue(_ sender: UIButton) {
        var sum = 0
        let textFields = [textField1, textField2, textField3, textField4, textField5]

        for textField in textFields {
            if let text = textField?.text, let num = Int(text) {
                sum += num            }
        }
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
