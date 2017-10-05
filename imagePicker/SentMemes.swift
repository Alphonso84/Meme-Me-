//
//  SentMemes.swift
//  imagePicker
//
//  Created by user on 10/4/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

class SentMemes: UITableView {

        //var memeData: [Meme]!
        
    @IBOutlet weak var tableView: UITableView!
    
        
    var memes : [Meme] {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.memes
        } else {
            return [Meme]()
        }
    }
        
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return memes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            
            return cell!
        }
        
        
    }



