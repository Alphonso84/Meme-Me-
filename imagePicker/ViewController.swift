//
//  ViewController.swift
//  imagePicker
//
//  Created by user on 8/25/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var textFieldTop: UITextField!
    
    @IBOutlet weak var textFieldBottom: UITextField!
    
    

    

    
    // Dictionary to setup TextField Attributes
    let memeTextAttributes:[String:Any] = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 37)!,
        NSStrokeWidthAttributeName: -3.0
    ]

    // VIEW CONTROLS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldTop.delegate = self
        textFieldBottom.delegate = self
        textFieldTop.text = "TOP"
        textFieldBottom.text = "BOTTOM"
        
        
        
        textFieldTop.defaultTextAttributes = memeTextAttributes
        textFieldBottom.defaultTextAttributes = memeTextAttributes
        
        textFieldShouldReturn(textFieldTop)
        textFieldShouldReturn(textFieldBottom)

        textFieldTop.clearsOnBeginEditing = true
        textFieldBottom.clearsOnBeginEditing = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        textFieldTop.textAlignment = NSTextAlignment.center
        textFieldBottom.textAlignment = NSTextAlignment.center
        subscribeToKeyboardNotifications()
        
        
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubcribeToKeyboardNotifications()
        
    }
    
    //NOTIFICATIONS
    
    func bringViewBackDownNotification() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubcribeToKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
    }

    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification: )), name: .UIKeyboardWillShow, object: nil)
    }

    //TEXTFIELD CONTROLS
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        
       return false
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.clearsOnBeginEditing = false
        
        
            }
    
    
    //KEYBOARD CONTROLS
    
    func keyboardWillShow(notification: NSNotification) {
        
        view.frame.origin.y -= getKeyboardHeight(notification: notification)
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y += getKeyboardHeight(notification: notification)
    }
    
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }

    
    // IMAGE PICKER CONTROLS
    
    @IBOutlet weak var selectedImage: UIImageView!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!

    @IBAction func pickImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        }
    
    @IBAction func imageFromCamera(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
       
        selectedImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        
        dismiss(animated: true, completion: nil)
    
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
        
    }

    

}

