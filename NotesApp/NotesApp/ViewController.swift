//
//  ViewController.swift
//  NotesApp
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
    
    @IBOutlet weak var notelist: UITableView!
    
    @objc func logOut(){                                                                                          //Notificationbar add btn
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "detailViewController") as? DetailsViewController else{
            print("ViewController not found")
            return
        }
        self.navigationController?.pushViewController(detailVC, animated: true)
        
               
         
     }
   
    @objc func addTapped(){                                                                                          //Notificationbar add btn
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "detailViewController") as? DetailsViewController else{
            print("ViewController not found")
            return
        }
        self.navigationController?.pushViewController(detailVC, animated: true)
        
               
         
     }
    
    @IBAction func btnClick(_ sender: Any) {
       //UserDefaults.standard.set(textField.text, forKey: "Key")
        a = textField.text
        data.append(a)
        notelist.reloadData()
        textField.text = ""
        
        if let values = a{
            save(note: values)
            fetchdata()
        }
        
    }
    
    /*func link(){
        // Obtain Reference to Shared Session
            let sharedSession = URLSession.shared

            if let url = URL(string: "https://goo.gl/wV9G4I") {
                // Create Request
                let request = URLRequest(url: url)

                // Create Data Task
                let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                           // self.imageView.image = image
                        }
                    }
                })

                dataTask.resume()
            }
    }*/
    
    override func viewWillAppear(_ animated: Bool) {
        //UserDefaults.standard.string(forKey: "Key")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notelist.delegate = self
        notelist.dataSource = self
       // print(NSHomeDirectory())
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "LogOut", style: .plain, target: self, action: #selector(logOut))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    func save(note: String) {
      
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
      
    
        let managedContext = appDelegate.persistentContainer.viewContext
    
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: managedContext)!
      
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
      
    
        person.setValue(note, forKeyPath: "noteitem")
      
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
          
          
          let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entity")
          
         
          do {
            people = try managedContext.fetch(fetchRequest)
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
          }
    }

}

