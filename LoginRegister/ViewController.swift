//
//  ViewController.swift
//  LoginRegister
//
//  Created by omrobbie on 15/08/18.
//  Copyright © 2018 omrobbie. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtFullname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context:NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.context = appDelegate.persistentContainer.viewContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func doRegister(_ sender: Any) {
        let fullname = txtFullname.text
        let email = txtEmail.text
        let password = txtPassword.text
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context!)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(fullname, forKey: "fullname")
        newUser.setValue(email, forKey: "email")
        newUser.setValue(password, forKey: "password")
        
        do {
            try context?.save()
            print("Data saved")
        } catch {
            print("Couldn't save data")
        }
    }
    
}

