//
//  MemeDetailViewController.swift
//  imagePicker
//
//  Created by user on 10/12/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
 
    @IBOutlet var memeImage: UIImageView!
     var meme: Meme?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //memes = (UIApplication.shared.delegate as! AppDelegate).memes
        if let meme = meme {
        memeImage?.image = meme.memedImage
       }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
       
    }

}
