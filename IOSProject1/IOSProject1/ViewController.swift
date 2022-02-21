//
//  ViewController.swift
//  IOSProject1
//
//  Created by user214277 on 2/2/22.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var textDisplay: UILabel!
    
    @IBOutlet weak var inputText: UITextField!
    
    @IBOutlet weak var submit:
        UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputText.delegate = self
        textDisplay.text = ""
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func BtnClick(_ sender: Any) {
    }
    
}

