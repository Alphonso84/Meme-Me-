//
//  ViewController.swift
//  imagePicker
//
//  Created by user on 8/25/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var shareMemeButton: UIBarButtonItem!
    
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
    
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        
        
        self.popoverPresentationController?.barButtonItem = self.shareMemeButton.self
        
        self.present( self, animated: true, completion: nil)
        

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
        if textFieldBottom.isFirstResponder {
            view.frame.origin.y -= getKeyboardHeight(notification: notification)
        }
        
    }
    //Decided to use a fixed value as not to increment positions
    func keyboardWillHide(notification: NSNotification) {
        if textFieldBottom.isFirstResponder {
            view.frame.origin.y = 0
        }
    }
    
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }

    
    //MEME GENERATOR
    struct Meme {
        var topText: String
        var bottomText: String
        var originalImage: UIImage
        var memedImage: UIImage
    }
    
    func saveMeme() {
        let meme = Meme(topText: textFieldTop.text!, bottomText: textFieldBottom.text!, originalImage: selectedImage.image!, memedImage: generateMemedImage())
            }
    
    
    func generateMemedImage() -> UIImage {
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        return memedImage
        
    }
    
    
    //SHARING
    @IBAction func shareMeme(_ sender: Any) {
        
        generateMemedImage()
        let meme = UIImage()
        let controller = UIActivityViewController(activityItems: [meme], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
        //The below code presents as Popover and allows share button to work on iPads
        controller.popoverPresentationController?.barButtonItem = (sender as! UIBarButtonItem)
        
    }
    
    
    
    
    
    // IMAGE PICKER CONTROLS
    
    @IBOutlet weak var selectedImage: UIImageView!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!

    @IBAction func pickImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        // below i Added removeObserver to the pickImageFromAlbum func as I was noticing the spacing was duplicated when an image was chosen but not when no image was selected. I believe the image picker was duplicating the keyboard height or calling it a second time.
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        }
    
    @IBAction func imageFromCamera(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        // below i Added removeObserver to the pickImageFromAlbum func as I was noticing the spacing was duplicated when an image was chosen but not when no image was selected. I believe the image picker was duplicating the keyboard height or calling it a second time.
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
    }
    
    
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
       
        selectedImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        
        dismiss(animated: true, completion: nil)
    
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
        
    }

    

}

