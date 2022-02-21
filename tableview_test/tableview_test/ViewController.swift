//
//  ViewController.swift
//  tableview_test
//
//  Created by user214277 on 2/3/22.
//

import UIKit
import CoreData
class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
  
    var data : [String?] = []
    var people: [NSManagedObject] = []
    var a : String?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var btn_submit: UIButton!
    
    @IBOutlet weak var namelist: UITableView!
    
    @IBAction func btnClick(_ sender: Any) {
        a = textField.text
        data.append(a)
        namelist.reloadData()
        textField.text = ""
        
        if let values = a{
            save(name: values)
            fetchdata()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchdata()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namelist.delegate = self
        namelist.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    func save(name: String) {
      
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
      
    
        let managedContext = appDelegate.persistentContainer.viewContext
    
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: managedContext)!
      
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
      
    
        person.setValue(name, forKeyPath: "name")
      
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchdata(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
              return
          }
          
          let managedContext = appDelegate.persistentContainer.viewContext
          
          //2
          let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entity")
          
          //3
          do {
            people = try managedContext.fetch(fetchRequest)
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
          }
    }

}

