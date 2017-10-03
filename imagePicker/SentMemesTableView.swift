//
//  SentMemesTableView.swift
//  imagePicker
//
//  Created by user on 10/3/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

class SentMemesTableView: AppDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        
        return cell!
    }

   
   

}
