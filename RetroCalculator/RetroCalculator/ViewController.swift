//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Christopher Combes on 4/27/16.
//  Copyright © 2016 Christopher Combes. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValueString = ""
    var rightValueString = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    let valueZero = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "blip", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOf: soundUrl)
            buttonSound.prepareToPlay()
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberPressed(_ button: UIButton!) {
        playSound()

        if runningNumber == valueZero {
            runningNumber = "\(button.tag)"
        } else {
        runningNumber += "\(button.tag)"
        }
        
        outputLabel.text = runningNumber
    }
    
    @IBAction func onDividePressed(_ sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(_ sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(_ sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(_ sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualsPressed(_ sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    @IBAction func onClearPressed(_ sender: AnyObject) {
        playSound()
        runningNumber = valueZero
        outputLabel.text = runningNumber
        result = ""
        currentOperation = Operation.Empty
    }
    
    func processOperation(_ operation: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            // Run some math
            if (runningNumber != "") {
                rightValueString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValueString)! * Double(rightValueString)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValueString)! / Double(rightValueString)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValueString)! - Double(rightValueString)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValueString)! + Double(rightValueString)!)"
                }
                
                leftValueString = result
                outputLabel.text = result
            }
            
            currentOperation = operation
            
        } else {
            // This is the first time an operator has been pressed
            leftValueString = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    func playSound() {
        if buttonSound.isPlaying {
            buttonSound.stop()
        }
        
        buttonSound.play()
    }
}

