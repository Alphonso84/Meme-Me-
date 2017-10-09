//
//  SentMemes.swift
//  imagePicker
//
//  Created by user on 10/4/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

class SentMemes: UIViewController {

    var memes: [Meme]!
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        tableView.reloadData()
        
    }
    
    func viewWillAppear() {
        
    }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return memes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
           cell?.textLabel?.text = memes[indexPath.row].topText
           cell?.imageView?.image = memes[indexPath.row].originalImage
            return cell!
        }
        
        
    }



