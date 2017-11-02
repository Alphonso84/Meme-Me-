//
//  SentMemesCollectionView.swift
//  imagePicker
//
//  Created by user on 10/11/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

class SentMemesCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var memes = [Meme]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
         super.viewDidLoad()
        
        let itemSize = UIScreen.main.bounds.width/3 - 3
    
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
    
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
    
        collectionView.collectionViewLayout = layout
   
    
    }
    
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
        
    memes = (UIApplication.shared.delegate as! AppDelegate).memes
        
    collectionView.reloadData()
    
    }
    

    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    return memes.count
    }
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let meme = memes[indexPath.row]
        cell.myImageView.image = meme.memedImage
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = memes[indexPath.row]
        
        navigationController?.show(detailController, sender: collectionView)
        //THESE ARE DIFFERENT IMPLEMENTATIONS OF PRESENTING THE DETAILVIEWCONTROLLER
        //present(detailController, animated: true, completion: nil)
        //pushViewController(detailController, animated: true)
        print(indexPath.row)
        present(detailController, animated: true, completion: nil)

        
            }
        }
        

    
    
   


   


