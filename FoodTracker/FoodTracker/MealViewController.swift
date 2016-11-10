//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Christopher Combes on 10/29/16.
//  Copyright © 2016 Christopher Combes. All rights reserved.
//

import UIKit
import Photos

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // This value is either passed by MealTableViewController in prepareForSeque
    // or constructed as part of adding a new meal.
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil);
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary contains multiple representations of the image,
        // and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil);
    }
    
    // MARK: Navigation
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let button = sender as? UIBarButtonItem, saveButton == button {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            // Set the meal to be passed to MealTableViewController after the unwind seque.
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        // Dismiss keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick
        // media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        // MAke sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        let status = PHPhotoLibrary.authorizationStatus()
        
        if status == .notDetermined || status == .authorized {
            // Present the image picker controller to the user
            present(imagePickerController, animated: true, completion: nil);
        } else {
            debugPrint("Photo access denied")
        }
    }
}

