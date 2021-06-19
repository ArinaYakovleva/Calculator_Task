//
//  CalculatorViewController.swift
//  Course2Week3Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    //MARK: -> Elements
    @IBOutlet weak var firstOperandLabel: UILabel!
    @IBOutlet weak var firstOperandNumber: UILabel!
    @IBOutlet weak var secodOperandLabel: UILabel!
    @IBOutlet weak var secodOperandNumber: UILabel!
    @IBOutlet weak var firstOperandStepper: UIStepper!
    @IBOutlet weak var secondOperandSlider: UISlider!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = "1"
        firstOperandStepper.stepValue = 0.5
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 4
        firstOperandNumber.text = "1.0000"
        secodOperandNumber.text = "1.0000"
        
        resultLabel.backgroundColor = UIColor(red: 238, green: 238, blue: 238, alpha: 1)
        resultLabel.frame = CGRect(x: 16, y: 32, width: self.view.frame.size.width - 32, height: 60)
        resultLabel.textAlignment = .right
        resultLabel.font = UIFont.systemFont(ofSize: 30)
        
        let labelWidth = (self.view.frame.size.width - 32) - 100
        
        firstOperandLabel.frame = CGRect(x: 16, y: 124, width: labelWidth, height: 32)
        firstOperandLabel.font = UIFont.systemFont(ofSize: CGFloat(17.0))
        firstOperandNumber.frame = CGRect(x: 16, y: 172, width: labelWidth, height: 32)
        firstOperandNumber.font = UIFont.systemFont(ofSize: CGFloat(17.0))
        
        firstOperandStepper.frame = CGRect(x: self.view.frame.size.width - 110, y: 170, width: 100, height: 32)

        firstOperandStepper.setDecrementImage(firstOperandStepper.decrementImage(for: .normal), for: .normal)
        firstOperandStepper.setIncrementImage(firstOperandStepper.incrementImage(for: .normal), for: .normal)
        
        secodOperandLabel.frame = CGRect(x: 16, y: 236, width: labelWidth, height: 32)
        secodOperandLabel.font = UIFont.systemFont(ofSize: CGFloat(17.0))
        secodOperandNumber.frame = CGRect(x: 16, y: 284, width: labelWidth, height: 32)
        secodOperandNumber.font = UIFont.systemFont(ofSize: CGFloat(17.0))
        secondOperandSlider.frame = CGRect(x: self.view.frame.size.width - 115, y: 284, width: 100, height: 32)
        secondOperandSlider.maximumTrackTintColor = UIColor(red: 236, green: 113, blue: 73, alpha: 1)
        
        calculateButton.frame = CGRect(x: 16, y: Int(self.view.frame.size.height) - 76, width: Int(self.view.frame.size.width) - 32, height: 60)
        calculateButton.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1), for: .normal)
    }
    
    //MARK: -> Actions
    @IBAction func onStepperChanged(_ sender: UIStepper) {
        firstOperandNumber.text = String(format: "%0.04f",sender.value)
    }
    @IBAction func onSliderChanged(_ sender: UISlider) {
        secodOperandNumber.text = String(format: "%0.04f",sender.value)
    }
    @IBAction func onCalculateClick(_ sender: UIButton) {
        if let firstOper = Double(firstOperandNumber.text ?? "0"), let secondOper =  Double(secodOperandNumber.text ?? "0"){
            let productNumber = numberFormatter.string(from: NSNumber(value: firstOper * secondOper))
            resultLabel.text = productNumber
        }
    }
}
