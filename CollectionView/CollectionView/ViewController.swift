//
//  ViewController.swift
//  CollectionView
//
//  Created by user214277 on 2/7/22.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{
    
    let reuseIdentifier = "cell"
    var items = ["Amey","Shivam","Pratik","Rutvik","Abhijeet","Deepak","Rudra","Manav","Mrunali","Omkar"]

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        cell.myLabel.text = self.items[indexPath.row]
        cell.myLabel.textColor = UIColor.white
        cell.backgroundColor = UIColor.blue
       // print(NSHomeDirectory())
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item+1)!")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

