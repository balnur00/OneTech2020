//
//  ViewController.swift
//  MyCalculator
//
//  Created by Balnur Sakhybekova on 7/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    var history = ""
    var firstNumber = 0
    var secondNumber = 0
    var currentOperand: Operation?
    
    var currentArray: [String] = []
    
//    public var completionHandler: ((String?) -> Void)?
    
    enum Operation {
        case add, subtract, multiply, divide, sqrt
    }
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica Light", size: 80)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapOnLabel = UITapGestureRecognizer(target: self, action: #selector(showHistory))
        resultLabel.isUserInteractionEnabled = true
        resultLabel.addGestureRecognizer(tapOnLabel)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupNumbers()
    }
    
    @objc
    func showHistory(sender:UITapGestureRecognizer) {
        let vc = HistoryViewController()
        self.present(vc, animated: true, completion: nil)
        vc.historyArray = self.currentArray
    }
    
    private func setupNumbers(){
        let buttonSize = view.frame.size.width/4
        let zeroButton = UIButton(frame: CGRect(x: 0, y: mainView.frame.size.height-buttonSize, width: buttonSize*3, height: buttonSize))
        zeroButton.setTitleColor(.white, for: .normal)
        zeroButton.setTitle("0", for: .normal)
        zeroButton.titleLabel?.font = UIFont(name: "Helvetica", size: 35)
        zeroButton.layer.cornerRadius = 50
        zeroButton.layer.borderWidth = 10
        zeroButton.backgroundColor = UIColor(white: 1, alpha: 0.1)
        zeroButton.tag = 1
        zeroButton.addTarget(self, action: #selector(zeroPressed(_:)), for: .touchUpInside)
        mainView.addSubview(zeroButton)
        
        for x in 0..<3 {
            let row1 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: mainView.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
            row1.backgroundColor = UIColor(white: 1, alpha: 0.1)
            row1.setTitleColor(.white, for: .normal)
            row1.setTitle("\(x+1)", for: .normal)
            row1.layer.cornerRadius = 50
            row1.layer.borderWidth = 10
            row1.titleLabel?.font = UIFont(name: "Helvetica", size: 35)
            row1.tag = x+2
            row1.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            mainView.addSubview(row1)
        }
        for x in 0..<3 {
            let row2 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: mainView.frame.size.height-(buttonSize*3), width: buttonSize, height: buttonSize))
            row2.backgroundColor = UIColor(white: 1, alpha: 0.1)
            row2.setTitleColor(.white, for: .normal)
            row2.setTitle("\(x+4)", for: .normal)
            row2.layer.cornerRadius = 50
            row2.layer.borderWidth = 10
            row2.titleLabel?.font = UIFont(name: "Helvetica", size: 35)
            row2.tag = x+5
            row2.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            mainView.addSubview(row2)
        }
        for x in 0..<3 {
            let row3 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: mainView.frame.size.height-(buttonSize*4), width: buttonSize, height: buttonSize))
            row3.backgroundColor = UIColor(white: 1, alpha: 0.1)
            row3.setTitleColor(.white, for: .normal)
            row3.setTitle("\(x+7)", for: .normal)
            row3.layer.cornerRadius = 50
            row3.layer.borderWidth = 10
            row3.titleLabel?.font = UIFont(name: "Helvetica", size: 35)
            row3.tag = x+8
            row3.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            mainView.addSubview(row3)
        }
        
        let clearButton = UIButton(frame: CGRect(x: 0, y: mainView.frame.size.height-(buttonSize*5), width: mainView.frame.size.width - (buttonSize*2), height: buttonSize))
        clearButton.backgroundColor = .systemGray
        clearButton.setTitleColor(.white, for: .normal)
        clearButton.setTitle("AC", for: .normal)
        clearButton.layer.cornerRadius = 50
        clearButton.layer.borderWidth = 10
        clearButton.titleLabel?.font = UIFont(name: "Helvetica", size: 35)
        mainView.addSubview(clearButton)
        
        let sqrtButton = UIButton(frame: CGRect(x: buttonSize*2, y: mainView.frame.size.height-(buttonSize*5), width: buttonSize, height: buttonSize))
        sqrtButton.backgroundColor = .systemGray
        sqrtButton.setTitleColor(.white, for: .normal)
        sqrtButton.setTitle("√", for: .normal)
        sqrtButton.layer.cornerRadius = 50
        sqrtButton.layer.borderWidth = 10
        sqrtButton.titleLabel?.font = UIFont(name: "Helvetica", size: 35)
        sqrtButton.tag = 6
        sqrtButton.addTarget(self, action: #selector(operandPressed(_:)), for: .touchUpInside)
        mainView.addSubview(sqrtButton)
        
        let operations = ["=", "+", "-", "x", "/", "√"]
        
        for x in 0..<5 {
            let column4 = UIButton(frame: CGRect(x: buttonSize*3, y: mainView.frame.size.height-(buttonSize*CGFloat(x+1)), width: buttonSize, height: buttonSize))
            column4.backgroundColor = .systemOrange
            column4.setTitleColor(.white, for: .normal)
            column4.setTitle(operations[x], for: .normal)
            column4.layer.cornerRadius = 50
            column4.layer.borderWidth = 10
            column4.titleLabel?.font = UIFont(name: "Helvetica", size: 35)
            mainView.addSubview(column4)
            column4.tag = x+1
            column4.addTarget(self, action: #selector(operandPressed(_:)), for: .touchUpInside)
        }
        
        resultLabel.frame = CGRect(x:20, y:clearButton.frame.origin.y - 110.0, width: view.frame.size.width - 40, height: 100.0)
        mainView.addSubview(resultLabel)


        // Actions
        clearButton.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        
    }

    @objc func clearResult(){
        resultLabel.text = "0"
        currentOperand = nil
        firstNumber = 0
    }
    
    @objc func numberPressed(_ sender: UIButton){
        let tag = sender.tag - 1
        
        if resultLabel.text == "0" {
            resultLabel.text = "\(tag)"
        }else if let text = resultLabel.text {
            resultLabel.text = "\(text)\(tag)"
        }
//        currentArray.append(resultLabel.text ?? "")
    }
    
    @objc func zeroPressed(_ sender: UIButton){
        if resultLabel.text != "0" {
            if let text = resultLabel.text {
                resultLabel.text = "\(text)\(0)"
            }
        }
    }
    
    @objc func operandPressed(_ sender: UIButton){
        let tag = sender.tag
        
        if let text = resultLabel.text, let value = Int(text), firstNumber == 0 {
            firstNumber = value
            resultLabel.text = "0"
        }
        
        
        /// Equal tapped
        if tag == 1 {
            if let operation = currentOperand {
                var secondNumber = 0
                if let text = resultLabel.text, let value = Int(text){
                    secondNumber = value
                }
                var oper = ""
                switch operation {
                case .add:
                    let result = firstNumber + secondNumber
                    resultLabel.text = "\(result)"
                    oper = "+"
                    currentArray.append("\(firstNumber) \(oper) \(secondNumber) = \(result)")
                    break
                case .subtract:
                    let result = firstNumber - secondNumber
                    resultLabel.text = "\(result)"
                    oper = "-"
                    currentArray.append("\(firstNumber) \(oper) \(secondNumber) = \(result)")
                    break
                case .multiply:
                    let result = firstNumber * secondNumber
                    resultLabel.text = "\(result)"
                    oper = "x"
                    currentArray.append("\(firstNumber) \(oper) \(secondNumber) = \(result)")
                    break
                case .divide:
                    let result = firstNumber / secondNumber
                    resultLabel.text = "\(result)"
                    oper = "/"
                    currentArray.append("\(firstNumber) \(oper) \(secondNumber) = \(result)")
                    break
                case .sqrt:
//                    let result = Int(Double(firstNumber).squareRoot())
                    let result = sqrt(Double(firstNumber))
                    resultLabel.text = "\(result)"
                    currentArray.append("√ \(firstNumber)")
                    break
                }
//                completionHandler?(history)
//                print(history)
            }
        }
        else if tag == 2 {
            currentOperand = .add
        }
        else if tag == 3 {
            currentOperand = .subtract
        }
        else if tag == 4 {
            currentOperand = .multiply
        }
        else if tag == 5 {
            currentOperand = .divide
        }
        else if tag == 6 {
            currentOperand = .sqrt
        }
    }
}

