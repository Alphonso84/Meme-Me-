//
//  SentMemes.swift
//  imagePicker
//
//  Created by user on 10/4/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

class SentMemes: UIViewController {

    var memeData: [Meme]!
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        memeData = appDelegate.memes
    }
    
   
        
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return memeData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            cell?.textLabel?.text = memeData[indexPath.row].topText
            cell?.imageView?.image = memeData[indexPath.row].originalImage
            return cell!
        }
        
        
    }



