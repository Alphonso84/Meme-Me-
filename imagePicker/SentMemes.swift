//
//  SentMemes.swift
//  imagePicker
//
//  Created by user on 10/4/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

class SentMemes: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var memes = [Meme]()
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        //let memes = (UIApplication.shared.delegate as! AppDelegate).memes
       // memes = appDelegate.memes
        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        memes = (UIApplication.shared.delegate as! AppDelegate).memes
        tableView.reloadData()
    }
    
//    func viewDidAppear() {
//        tableView.reloadData()
//    }
        
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



