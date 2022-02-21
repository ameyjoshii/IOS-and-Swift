//
//  DetailsViewController.swift
//  NotesApp
//
//  Created by user214277 on 2/4/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    var alertController = UIAlertController(title: "Title", message: "Any message", preferredStyle: .actionSheet)
    var error = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
                        UIAlertAction in
                        NSLog("Wrong Credentials")
                    }
    
    @IBAction func onLoginClick(_ sender: Any) {
        
        if(username.text == "admin" && password.text == "1234"){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let detailVC = storyboard.instantiateViewController(withIdentifier: "veiwcontroller") as? ViewController else{
                print("ViewController not found")
                return
            }
            self.navigationController?.pushViewController(detailVC, animated: true)
            
        }
        else{
          print("Wrong Credentials")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image: UIImage = UIImage(named: "/Users/user214277/Desktop/NotesApp/login.png")!
        self.img.image = image

        // Do any additional setup after loading the view.
    }
    /*
     queue = NSOperationQueue()

         queue.addOperationWithBlock { () -> Void in
             
             let img1 = Downloader.downloadImageWithURL(imageURLs[0])

             NSOperationQueue.mainQueue().addOperationWithBlock({
                 self.imageView1.image = img1
             })
         }
     
     */
     

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
