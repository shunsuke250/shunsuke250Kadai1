//
//  ViewController.swift
//  kadai1
//
//  Created by 副山俊輔 on 2022/03/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var textField3: UITextField!
    @IBOutlet private weak var textField4: UITextField!
    @IBOutlet private weak var textField5: UITextField!
    @IBOutlet private weak var sumButton: UIButton!
    @IBOutlet private weak var answerLabel: UILabel!

    @IBAction func sumButtonAction(_ sender: Any) {

        let num1 = Int(textField1.text ?? "") ?? 0
        let num2 = Int(textField2.text ?? "") ?? 0
        let num3 = Int(textField3.text ?? "") ?? 0
        let num4 = Int(textField4.text ?? "") ?? 0
        let num5 = Int(textField5.text ?? "") ?? 0

        let sum = num1 + num2 + num3 + num4 + num5
        answerLabel.text = String(sum)
    }

}
