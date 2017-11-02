//
//  SentMemes.swift
//  imagePicker
//
//  Created by user on 10/4/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

class SentMemes: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var memes: [Meme] { return (UIApplication.shared.delegate as! AppDelegate).memes }
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        
        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
            
        return 1
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        _ = memes[indexPath.row]
           cell?.textLabel?.text = memes[indexPath.row].topText + memes[indexPath.row].bottomText
           cell?.imageView?.image = memes[indexPath.row].memedImage
            return cell!
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = memes[indexPath.row]
        navigationController?.show(detailController, sender: tableView)
        //.show is the proper implementation for this UI. present and push cause crash
        //pushViewController(detailController, animated: true)
        //present(detailController, animated: true, completion: nil)
    }
        
        
    }



