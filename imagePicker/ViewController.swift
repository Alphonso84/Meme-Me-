//
//  ViewController.swift
//  imagePicker
//
//  Created by user on 8/25/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var textFieldTop: UITextField!
    
    @IBOutlet weak var textFieldBottom: UITextField!
    
    
    // Dictionary to setup TextField Attributes
    let memeTextAttributes:[String:Any] = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 30)!,
        NSStrokeWidthAttributeName: -3.0
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldTop.text = "TOP"
        textFieldBottom.text = "BOTTOM"
        
        textFieldTop.defaultTextAttributes = memeTextAttributes
        textFieldBottom.defaultTextAttributes = memeTextAttributes
        
        
       
        
        }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
         cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        textFieldTop.textAlignment = NSTextAlignment.center
        textFieldBottom.textAlignment = NSTextAlignment.center
        
    }
    
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

