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
        unsubcribeToKeyboardNotifications()
        
        
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubcribeToKeyboardNotifications()
       
        
    }
    
    
    //TEXTFIELD CONTROLS
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
       
        
       return false
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.clearsOnBeginEditing = false
        
        
            }
    //NOTIFICATIONS
    
    //In the below function, I added observer on KeyBoardWillHide to Unsubscribe notification. Not sure what the purpose of removing observer does so It is commented out.
    func unsubcribeToKeyboardNotifications() {
        //NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification: )), name: .UIKeyboardWillShow, object: nil)
    }

    
    
    //KEYBOARD CONTROLS
    
    func keyboardWillShow(notification: NSNotification) {
        view.frame.origin.y -= getKeyboardHeight(notification: notification)
        
    }
    //Decided to use a fixed value as not to increment positions
    func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
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
        //Added removeObserver to the pickImage func as I was noticing the spacing was duplicated when an image was chosen but not when no image was selected. I believe the image picker was duplicating the keyboard height or calling it a second time.
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
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

