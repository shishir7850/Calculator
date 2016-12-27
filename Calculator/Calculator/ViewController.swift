//
//  ViewController.swift
//  Calculator
//
//  Created by Shishir Lakkadi on 26/12/16.
//  Copyright © 2016 Shishir Lakkadi. All rights reserved.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var firstNumberText = ""
    var firstpoint = false
    var secondNumberText = ""
    var secondpoint = false
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Onclick(sender:UIButton) {
        let value = sender.tag;
        switch value {
            case 10:
                if (isFirstNumber == true && firstpoint == false) {
                    firstNumberText = firstNumberText + "."
                    resultLabel.text = firstNumberText
                    firstpoint = true
                } else if (isFirstNumber == false && secondpoint == false) {
                    secondNumberText = secondNumberText + "."
                    secondpoint = false
                    resultLabel.text = secondNumberText
                }
                break
            case 11:
                if secondNumberText == "" {
                    return
                }
                let result = calculate()
                resultLabel.text = "\(result)"
                firstNumberText = ""
                secondNumberText = ""
                op = ""
                isFirstNumber = true
                hasOp =  false
                firstpoint = false
                secondpoint = false
                break
            case 12:
                if hasOp == true {
                    return
                }
                hasOp = true
                isFirstNumber = false
                op = "+"
                break
            case 13:
                if hasOp == true {
                    return
                }
                hasOp = true
                isFirstNumber = false
                op = "-"
                break
            case 14:
                if hasOp == true {
                    return
                }
                hasOp = true
                isFirstNumber = false
                op = "*"
                break
            case 15:
                if hasOp == true {
                    return
                }
                hasOp = true
                isFirstNumber = false
                op = "/"
                break
            case 16:
                resultLabel.text = "0"
                firstNumberText = ""
                firstpoint = false
                secondNumberText = ""
                secondpoint = false
                op = ""
                isFirstNumber = true
                hasOp = false
                break
            default:
                if isFirstNumber == true {
                    firstNumberText = firstNumberText + "\(sender.tag)"
                    resultLabel.text = firstNumberText
                } else {
                    secondNumberText = secondNumberText + "\(sender.tag)"
                    resultLabel.text = secondNumberText
                }
        }
    }
    
    func calculate() -> Double {
        let first = Double(firstNumberText)
        let second = Double(secondNumberText)
        var result:Double = 0.0
        
        switch op {
            case "+":
                result = first! + second!
                break
            case "-":
                result = first! - second!
                break
            case "x":
                result = first! * second!
                break
            case "/":
                result = first! / second!
                break
            default:
                break
        }
        return result
    }
}

