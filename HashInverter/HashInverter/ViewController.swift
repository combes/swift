//
//  ViewController.swift
//  HashInverter
//
//  Created by Christopher Combes on 12/27/15.
//  Copyright © 2015 Christopher Combes. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var showHashButton: UIButton!
    @IBOutlet weak var showInverseButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var owlImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set design
        self.view.backgroundColor = UIColor(red: 0, green: 122.0 / 255.0, blue: 193.0 / 255.0, alpha: 1.0)
        
        // Set the placeholder to the hash alphabet to clue user in
        textField.placeholder = HashConverter.alphabet
        
        // Listen for UITextField delegate callbacks (e.g. user taps "Done")
        textField.delegate = self
        
        // Add listener for text changes so we can enable/disable the buttons
        textField.addTarget(self, action: #selector(ViewController.didChangeText(_:)), for: .editingChanged)
        self.didChangeText(textField)
        
        // Prompt user to enter text by showing keyboard
        textField.becomeFirstResponder()
        
        // No errors to start with
        errorLabel.text = ""
        
        // Set version
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        versionLabel.text = versionNumber
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Helper Methods
    func updateOwlImage(_ faceLeft: Bool) {
        let image = UIImage(named: "owl")
        
        if faceLeft == true {
            self.owlImage.image = image
        } else {
            self.owlImage.image = UIImage(cgImage: image!.cgImage!, scale: 1.0, orientation: .upMirrored)
        }
    }
    
    // MARK: Outlet Methods
    @IBAction func showHashButtonTapped(_ sender: UIButton) {
        let hashConverter = HashConverter()
        
        self.updateOwlImage(true)
        
        // Hash is limited in length
        if textField.text?.characters.count > HashConverter.maxStringLength {
            // Trim the string and warn the user
            let text = textField.text!
            textField.text = text[text.startIndex..<text.characters.index(text.startIndex, offsetBy: HashConverter.maxStringLength)]
            errorLabel.text = "Hash limited to \(HashConverter.maxStringLength) letters."
            return
        }

        do {
            try self.textField.text = String(hashConverter.hashValue(self.textField.text!))
            errorLabel.text = ""
        } catch HashError.invalidCharacter(let text) {
            errorLabel.text = "Character '\(text)' is invalid."
        } catch HashError.overFlowOccurred {
            errorLabel.text = "Overflow occurred."
        } catch {
            errorLabel.text = "Unknown error."
        }
    }
    
    @IBAction func showInverseButtonTapped(_ sender: UIButton) {
        
        self.updateOwlImage(false)
        
        do {
            try self.textField.text = HashConverter().invertHash(self.textField.text!)
            errorLabel.text = ""
        } catch HashError.outOfRange {
            errorLabel.text = "Value out of range."
        } catch HashError.invalidHash {
            errorLabel.text = "Hash is invalid."
        } catch HashError.digitsRequired {
            errorLabel.text = "Only digits allowed."
        } catch {
            errorLabel.text = "Unknown error."
        }
    }
    
    // MARK: Helper Methods
    func didChangeText(_ textField:UITextField) {
        self.showHashButton.isEnabled = textField.hasText
        self.showHashButton.alpha = textField.hasText ? 1.0 : 0.5
        self.showInverseButton.isEnabled = textField.hasText
        self.showInverseButton.alpha = textField.hasText ? 1.0 : 0.5
    }
    
    // MARK: UITextFieldDelegate Methods
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        errorLabel.text = ""
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

